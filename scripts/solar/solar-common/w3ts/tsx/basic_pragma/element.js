import { TEXT_ELEMENT } from "./common";
import { compact, getLength } from "./utils/arrays";
export const isChild = (obj) => (typeof obj === "object" &&
    obj != null &&
    "type" in obj &&
    "props" in obj) ||
    typeof obj === "boolean" ||
    typeof obj === "string";
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const processChildren = (children) => compact(compact(children).flat())
    .filter((c) => typeof c !== "boolean" &&
    // filters out empty objects which are left because Array.flat() is not correct
    (typeof c === "string" || !!c.type))
    .map((c) => (typeof c === "string" ? createTextElement(c) : c));
const EMPTY_OBJECT = {};
export function createElement(type, 
// eslint-disable-next-line @typescript-eslint/no-explicit-any
config, ...children) {
    const { key = null, ...props } = { ...config };
    const flattenedChildren = processChildren(children && getLength(children) > 0 ? children : []);
    if (flattenedChildren.length > 0)
        props.children = flattenedChildren;
    else
        delete props.children;
    // IDK why this is mad, prop is LocalP - key + children, which should work...
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const vnode = { type, props };
    // Only set key if not nullish
    if (key != null)
        vnode.key = key;
    return vnode;
}
function createTextElement(value) {
    return createElement(TEXT_ELEMENT, { nodeValue: value });
}
export const Fragment = ({ children, }) => children ?? null;
