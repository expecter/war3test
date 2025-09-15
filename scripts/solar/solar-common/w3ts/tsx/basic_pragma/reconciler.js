/** @noSelfInFile **/
import { adapter } from "./adapter";
import { isChild, processChildren } from "./element";
import { isLua, TEXT_ELEMENT } from "./common";
import { compact } from "./utils/arrays";
export const hooks = {
    // eslint-disable-next-line @typescript-eslint/no-unused-vars, @typescript-eslint/no-explicit-any
    beforeRender: (instance) => {
        /* do nothing */
    },
    // eslint-disable-next-line @typescript-eslint/no-unused-vars, @typescript-eslint/no-explicit-any
    beforeUnmount: (instance) => {
        /* do nothing */
    },
};
// eslint-disable-next-line @typescript-eslint/no-explicit-any
const containerMap = new WeakMap();
export function render(vnode, container) {
    const prevInstance = containerMap.get(container) ?? null;
    const nextInstance = reconcile(container, prevInstance, vnode);
    containerMap.set(containerMap, nextInstance);
}
export function reconcile(parentFrame, instance, vnode) {
    try {
        if (!instance) {
            // vnode is null if we're deleting something; we can't delete
            // something if there's no instance
            if (!vnode)
                return null;
            // Create instance
            return instantiate(vnode, parentFrame);
        }
        else if (!vnode) {
            // Remove instance
            cleanupFrames(instance);
            return null;
        }
        else if (instance.vnode.type !== vnode.type) {
            // Replace instance
            const newInstance = instantiate(vnode, parentFrame);
            cleanupFrames(instance);
            return newInstance;
        }
        else {
            // This assumes .type equality => Prop type equality
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            const instanceOfSameType = instance;
            // vnode for a host frame
            if (typeof vnode.type === "string") {
                // Update host vnode
                adapter.updateFrameProperties(instance.hostFrame, instance.vnode.props, vnode.props);
                instanceOfSameType.childInstances = reconcileChildren(instanceOfSameType, vnode);
                // vnode for a compositional frame (class/functional component)
            }
            else if (instanceOfSameType.component) {
                instanceOfSameType.component.props = vnode.props;
                try {
                    hooks.beforeRender(instanceOfSameType.component);
                }
                catch (err) {
                    print(err);
                    cleanupFrames(instance);
                    throw err;
                }
                const rendered = instanceOfSameType.component.render(vnode.props);
                const children = isChild(rendered)
                    ? rendered
                        ? [rendered]
                        : []
                    : rendered;
                instanceOfSameType.childInstances = reconcileChildren(instanceOfSameType, vnode, children);
            }
            instanceOfSameType.vnode = vnode;
            return instanceOfSameType;
        }
    }
    catch (err) {
        // TODO: log this error, but in a JavaScript/Lua general way...
        print(err);
        return null;
    }
}
// eslint-disable-next-line @typescript-eslint/no-explicit-any
function cleanupFrames(instance) {
    if (instance.component)
        hooks.beforeUnmount(instance.component);
    if (instance.childInstances)
        for (const child of instance.childInstances)
            if (child != null)
                cleanupFrames(child);
    if (instance.hostFrame)
        adapter.cleanupFrame(instance.hostFrame);
}
function reconcileChildren(
// eslint-disable-next-line @typescript-eslint/no-explicit-any
instance, vnode, children = vnode.props.children) {
    const hostFrame = instance.hostFrame;
    const childInstances = instance.childInstances;
    const nextChildElements = processChildren(children || []);
    const newChildInstances = [];
    const count = Math.max(childInstances.length, nextChildElements.length);
    // TODO: add support for keys
    for (let i = 0; i < count; i++) {
        const childInstance = childInstances[i];
        const childElement = nextChildElements[i];
        const newChildInstance = reconcile(hostFrame, childInstance, childElement);
        if (newChildInstance != null)
            newChildInstances.push(newChildInstance);
    }
    return newChildInstances;
}
function instantiate(vnode, parentFrame) {
    const { type, props } = vnode;
    if (typeof type === "string") {
        if (type === TEXT_ELEMENT)
            throw "Cannot create inline text, yet";
        // Instantiate host vnode
        const frame = adapter.createFrame(type, parentFrame, props);
        const childElements = processChildren(props.children || []);
        const childInstances = childElements.map((child) => instantiate(child, frame));
        const instance = {
            hostFrame: frame,
            vnode,
            childInstances,
        };
        // Apply props after instantiating children
        adapter.updateFrameProperties(frame, {}, props);
        return instance;
    }
    else {
        // Instantiate component vnode
        const instance = { vnode };
        instance.component = createPublicInstance(vnode, instance);
        try {
            hooks.beforeRender(instance.component);
        }
        catch (err) {
            print(err);
        }
        const rendered = instance.component.render(props) ?? [];
        const childElements = isChild(rendered) ? [rendered] : rendered;
        instance.childInstances = compact(childElements)
            .filter(
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        (child) => typeof child === "object")
            .map((child) => instantiate(child, parentFrame));
        return instance;
    }
}
const functionalComponentClasses = new WeakMap();
// eslint-disable-next-line @typescript-eslint/no-explicit-any
const isClass = (constructor) => {
    if (isLua)
        return typeof constructor !== "function";
    else
        return "prototype" in constructor;
};
function createPublicInstance(vnode, internalInstance) {
    const { type: ComponentType, props } = vnode;
    let constructor;
    if (typeof ComponentType === "string")
        throw "Tried createPublicInstance() with string";
    else if (isClass(ComponentType))
        // ComponentType.prototype && "render" in ComponentType.prototype)
        constructor = ComponentType;
    else {
        const renderFunc = ComponentType;
        const existingClass = functionalComponentClasses.get(renderFunc);
        if (existingClass)
            constructor = existingClass;
        else {
            // Wrap the dynamic class in an object to avoid all functional
            // components being ClassComponent
            constructor = class extends ClassComponent {
                // get displayName() {
                // 	return renderFunc.name;
                // }
                render(props) {
                    return renderFunc(props);
                }
            };
            functionalComponentClasses.set(renderFunc, constructor);
        }
    }
    const publicInstance = new constructor(props);
    publicInstance.instance = internalInstance;
    return publicInstance;
}
const instanceMap = new WeakMap();
const scheduledUpdates = new Set();
const scheduleUpdate = (instance) => {
    scheduledUpdates.add(instance);
    adapter.scheduleUpdate();
};
export class ClassComponent {
    props;
    state = {};
    constructor(props) {
        this.props = props;
    }
    setState(partialState) {
        this.state = { ...this.state, ...partialState };
        const instance = instanceMap.get(this);
        if (instance)
            scheduleUpdate(instance);
    }
    set instance(instance) {
        instanceMap.set(this, instance);
    }
}
function updateInstance(internalInstance) {
    const vnode = internalInstance.vnode;
    reconcile(null, internalInstance, vnode);
}
export const flushUpdates = () => {
    for (const instance of scheduledUpdates.values())
        updateInstance(instance);
    scheduledUpdates.clear();
};
export const test = { functionalComponentClasses };
