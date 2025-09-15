let NOW = function () {
    return ECS.WorldTime;
};
let SEQ_SYSTEM = 1;
let SEQ_ENTITY = 1;
let SEQ_COMPONENT = 1;
/**
 * Utility class for asynchronous access to a list
 */
export class Iterator {
    end = false;
    cache = [];
    next;
    constructor(next) {
        this.next = next;
    }
    /**
     * Allows iterate across all items
     *
     * @param cb
     */
    each(cb) {
        let index = 0;
        while (true) {
            let value;
            if (this.cache.length <= index) {
                if (this.end) {
                    break;
                }
                value = this.next(index++);
                if (value === undefined) {
                    this.end = true;
                    break;
                }
                // @ts-ignore
                this.cache.push(value);
            }
            else {
                value = this.cache[index++];
            }
            // @ts-ignore
            if (cb(value) === false) {
                break;
            }
        }
    }
    /**
     * returns the value of the first element that satisfies the provided testing function.
     *
     * @param test
     */
    find(test) {
        let out = undefined;
        this.each((item) => {
            if (test(item)) {
                out = item;
                // break
                return false;
            }
        });
        return out;
    }
    /**
     * creates a array with all elements that pass the test implemented by the provided function.
     *
     * @param test
     */
    filter(test) {
        let list = [];
        this.each((item) => {
            if (test(item)) {
                list.push(item);
            }
        });
        return list;
    }
    /**
     * creates a new array with the results of calling a provided function on every element in this iterator.
     *
     * @param cb
     */
    map(cb) {
        let list = [];
        this.each((item) => {
            list.push(cb(item));
        });
        return list;
    }
}
/**
 * Representation of an entity in ECS
 */
export class Entity {
    /**
     * Lista de interessados sobre a atualiação dos componentes
     */
    subscriptions = [];
    /**
     * Components by type
     */
    components = {};
    id;
    /**
     * Informs if the entity is active
     */
    active = true;
    constructor() {
        this.id = SEQ_ENTITY++;
    }
    /**
     * Allows interested parties to receive information when this entity's component list is updated
     *
     * @param handler
     */
    subscribe(handler) {
        this.subscriptions.push(handler);
        return () => {
            const idx = this.subscriptions.indexOf(handler);
            if (idx >= 0) {
                this.subscriptions.splice(idx, 1);
            }
            return this;
        };
    }
    /**
     * Add a component to this entity
     *
     * @param component
     */
    add(component) {
        const type = component.type;
        if (!this.components[type]) {
            this.components[type] = [];
        }
        if (this.components[type].indexOf(component) >= 0) {
            return;
        }
        this.components[type].push(component);
        // Informa aos interessados sobre a atualização
        this.subscriptions.forEach(cb => cb(this, component, undefined));
    }
    /**
     * set a component to this entity
     *
     * @param component
     */
    set(component) {
        const type = component.type;
        this.components[type] = [component];
        this.subscriptions.forEach(cb => cb(this, component, undefined));
    }
    /**
     * Removes a component's reference from this entity
     *
     * @param component
     */
    remove(component) {
        const type = component.type;
        if (!this.components[type]) {
            return;
        }
        const idx = this.components[type].indexOf(component);
        if (idx >= 0) {
            this.components[type].splice(idx, 1);
            if (this.components[type].length < 1) {
                delete this.components[type];
            }
            // Informa aos interessados sobre a atualização
            this.subscriptions.forEach(cb => cb(this, undefined, component));
        }
    }
}
/**
 * Representation of a component in ECS
 */
export class Component {
    /**
     * Register a new component class
     */
    static register() {
        const typeID = SEQ_COMPONENT++;
        class ComponentImpl extends Component {
            static type = typeID;
            static allFrom(entity) {
                let components = entity.components[typeID];
                return components || [];
            }
            static oneFrom(entity) {
                let components = ComponentImpl.allFrom(entity);
                if (components && components.length > 0) {
                    return components[0];
                }
            }
            /**
             * Create a new instance of this custom component
             *
             * @param data
             */
            constructor(data) {
                super(typeID, data);
            }
        }
        return ComponentImpl;
    }
    type;
    data;
    /**
     * A component can have attributes. Attributes are secondary values used to save miscellaneous data required by some
     * specialized systems.
     */
    attr = {};
    constructor(type, data) {
        this.type = type;
        this.data = data;
    }
}
/**
 * Represents the logic that transforms component data of an entity from its current state to its next state. A system
 * runs on entities that have a specific set of component types.
 */
export class System {
    /**
     * IDs of the types of components this system expects the entity to have before it can act on. If you want to
     * create a system that acts on all entities, enter [-1]
     */
    componentTypes = [];
    callbacks = {};
    /**
     * Unique identifier of an instance of this system
     */
    id;
    /**
     * The maximum times per second this system should be updated
     */
    frequence;
    /**
     * Reference to the world, changed at runtime during interactions.
     */
    world = undefined;
    /**
     * Allows to trigger any event. Systems interested in this event will be notified immediately
     *
     * Injected by ECS at runtime
     *
     * @param event
     * @param data
     */
    trigger = undefined;
    /**
     * @param componentTypes IDs of the types of components this system expects the entity to have before it can act on.
     * If you want to create a system that acts on all entities, enter [-1]
     * @param frequence The maximum times per second this system should be updated. Defaults 0
     */
    constructor(componentTypes, frequence = 0) {
        this.id = SEQ_SYSTEM++;
        this.componentTypes = componentTypes;
        this.frequence = frequence;
    }
    /**
     * Allows you to search in the world for all entities that have a specific set of components.
     *
     * @param componentTypes Enter [-1] to list all entities
     */
    query(componentTypes) {
        return this.world.query(componentTypes);
    }
    /**
     * Allows the system to listen for a specific event that occurred during any update.
     *
     * In callback, the system has access to the existing entities in the world that are processed by this system, in
     * the form of an Iterator, and the raw data sent by the event trigger.
     *
     * ATTENTION! The callback method will be invoked immediately after the event fires, avoid heavy processing.
     *
     * @param event
     * @param callback
     * @param once Allows you to perform the callback only once
     */
    listenTo(event, callback, once) {
        if (!this.callbacks.hasOwnProperty(event)) {
            this.callbacks[event] = [];
        }
        if (once) {
            let tmp = callback.bind(this);
            callback = (data, entities) => {
                tmp(data, entities);
                let idx = this.callbacks[event].indexOf(callback);
                if (idx >= 0) {
                    this.callbacks[event].splice(idx, 1);
                }
                if (this.callbacks[event].length === 0) {
                    delete this.callbacks[event];
                }
            };
        }
        this.callbacks[event].push(callback);
    }
}
/**
 * The very definition of the ECS. Also called Admin or Manager in other implementations.
 */
export default class ECS {
    static WorldTime = 0;
    static System = System;
    static Entity = Entity;
    static Component = Component;
    /**
     * All systems in this world
     */
    systems = [];
    /**
     * All entities in this world
     */
    entities = [];
    /**
     * Indexes the systems that must be run for each entity
     */
    entitySystems = {};
    /**
     * Records the last instant a system was run in this world for an entity, using real time
     */
    entitySystemLastUpdate = {};
    /**
     * Records the last instant a system was run in this world for an entity, using game time
     */
    entitySystemLastUpdateGame = {};
    /**
     * Saves subscriptions made to entities
     */
    entitySubscription = {};
    /**
     * Injection for the system trigger method
     *
     * @param event
     * @param data
     */
    systemTrigger = (event, data) => {
        this.systems.forEach(system => {
            let callbacks = system.callbacks;
            if (callbacks.hasOwnProperty(event) && callbacks[event].length > 0) {
                this.inject(system);
                let entitiesIterator = this.query(system.componentTypes);
                callbacks[event].forEach(callback => {
                    callback(data, entitiesIterator);
                });
            }
        });
    };
    /**
     * Allows you to apply slow motion effect on systems execution. When timeScale is 1, the timestamp and delta
     * parameters received by the systems are consistent with the actual timestamp. When timeScale is 0.5, the values
     * received by systems will be half of the actual value.
     *
     * ATTENTION! The systems continue to be invoked obeying their normal frequencies, what changes is only the values
     * received in the timestamp and delta parameters.
     */
    timeScale = 1;
    /**
     * Last execution of update method
     */
    lastUpdate = NOW();
    /**
     * The timestamp of the game, different from the real world, is updated according to timeScale. If at no time does
     * the timeScale change, the value is the same as the current timestamp.
     *
     * This value is sent to the systems update method.
     */
    gameTime = 0;
    constructor(systems) {
        if (systems) {
            systems.forEach(system => {
                this.addSystem(system);
            });
        }
    }
    /**
     * Remove all entities and systems
     */
    destroy() {
        this.entities.forEach((entity) => {
            this.removeEntity(entity);
        });
        this.systems.forEach(system => {
            this.removeSystem(system);
        });
    }
    /**
     * Get an entity by id
     *
     * @param id
     */
    getEntity(id) {
        return this.entities.find(entity => entity.id === id);
    }
    /**
     * Add an entity to this world
     *
     * @param entity
     */
    addEntity(entity) {
        if (!entity || this.entities.indexOf(entity) >= 0) {
            return;
        }
        this.entities.push(entity);
        this.entitySystemLastUpdate[entity.id] = {};
        this.entitySystemLastUpdateGame[entity.id] = {};
        // Remove subscription
        if (this.entitySubscription[entity.id]) {
            this.entitySubscription[entity.id]();
        }
        // Add new subscription
        this.entitySubscription[entity.id] = entity
            .subscribe((entity, added, removed) => {
            this.onEntityUpdate(entity, added, removed);
            this.indexEntity(entity);
        });
        this.indexEntity(entity);
    }
    /**
     * Remove an entity from this world
     *
     * @param idOrInstance
     */
    removeEntity(idOrInstance) {
        let entity = idOrInstance;
        if (typeof idOrInstance === 'number') {
            entity = this.getEntity(idOrInstance);
        }
        if (!entity) {
            return;
        }
        const idx = this.entities.indexOf(entity);
        if (idx >= 0) {
            this.entities.splice(idx, 1);
        }
        // Remove subscription, if any
        if (this.entitySubscription[entity.id]) {
            this.entitySubscription[entity.id]();
        }
        // Invoke system exit
        let systems = this.entitySystems[entity.id];
        if (systems) {
            systems.forEach(system => {
                if (system.exit) {
                    this.inject(system);
                    system.exit(entity);
                }
            });
        }
        // Remove associative indexes
        delete this.entitySystems[entity.id];
        delete this.entitySystemLastUpdate[entity.id];
        delete this.entitySystemLastUpdateGame[entity.id];
    }
    /**
     * Add a system in this world
     *
     * @param system
     */
    addSystem(system) {
        if (!system) {
            return;
        }
        if (this.systems.indexOf(system) >= 0) {
            return;
        }
        this.systems.push(system);
        // Indexes entities
        this.entities.forEach(entity => {
            this.indexEntity(entity, system);
        });
        // Invokes system enter
        this.entities.forEach(entity => {
            if (entity.active) {
                let systems = this.entitySystems[entity.id];
                if (systems && systems.indexOf(system) >= 0) {
                    if (system.enter) {
                        this.inject(system);
                        system.enter(entity);
                    }
                }
            }
        });
    }
    /**
     * Remove a system from this world
     *
     * @param system
     */
    removeSystem(system) {
        if (!system) {
            return;
        }
        const idx = this.systems.indexOf(system);
        if (idx >= 0) {
            // Invoke system exit
            this.entities.forEach(entity => {
                if (entity.active) {
                    let systems = this.entitySystems[entity.id];
                    if (systems && systems.indexOf(system) >= 0) {
                        if (system.exit) {
                            this.inject(system);
                            system.exit(entity);
                        }
                    }
                }
            });
            this.systems.splice(idx, 1);
            if (system.world === this) {
                system.world = undefined;
                system.trigger = undefined;
            }
            // Indexes entities
            this.entities.forEach(entity => {
                this.indexEntity(entity, system);
            });
        }
    }
    /**
     * Allows you to search for all entities that have a specific set of components.
     *
     * @param componentTypes Enter [-1] to list all entities
     */
    query(componentTypes) {
        let index = 0;
        let listAll = componentTypes.indexOf(-1) >= 0;
        return new Iterator(() => {
            // outside:
            for (let l = this.entities.length; index < l; index++) {
                let entity = this.entities[index];
                if (listAll) {
                    // Prevents unnecessary processing
                    return entity;
                }
                // -1 = All components. Allows to query for all entities in the world.
                const entityComponentIDs = [-1].concat(Object.keys(entity.components).map((v) => parseInt(v, 10)));
                for (let a = 0, j = componentTypes.length; a < j; a++) {
                    if (entityComponentIDs.indexOf(componentTypes[a]) < 0) {
                        continue;
                        // continue outside;
                    }
                }
                // Entity has all the components
                return entity;
            }
        });
    }
    /**
     * Invokes the "update" method of the systems in this world.
     */
    update() {
        let now = NOW();
        // adds scaledDelta
        this.gameTime += (now - this.lastUpdate) * this.timeScale;
        this.lastUpdate = now;
        let toCallAfterUpdateAll = {};
        this.entities.forEach(entity => {
            if (!entity.active) {
                // Entidade inativa
                return this.removeEntity(entity);
            }
            let systems = this.entitySystems[entity.id];
            if (!systems) {
                return;
            }
            const entityLastUpdates = this.entitySystemLastUpdate[entity.id];
            const entityLastUpdatesGame = this.entitySystemLastUpdateGame[entity.id];
            let elapsed, elapsedScaled, interval;
            systems.forEach(system => {
                if (system.update) {
                    this.inject(system);
                    elapsed = now - entityLastUpdates[system.id];
                    elapsedScaled = this.gameTime - entityLastUpdatesGame[system.id];
                    // Limit FPS
                    if (system.frequence > 0) {
                        interval = system.frequence;
                        if (elapsed < interval) {
                            return;
                        }
                        // adjust for fpsInterval not being a multiple of RAF's interval (16.7ms)
                        entityLastUpdates[system.id] = now - (elapsed % interval);
                        entityLastUpdatesGame[system.id] = this.gameTime;
                    }
                    else {
                        entityLastUpdates[system.id] = now;
                        entityLastUpdatesGame[system.id] = this.gameTime;
                    }
                    let id = `_` + system.id;
                    if (!toCallAfterUpdateAll[id]) {
                        // Call afterUpdateAll
                        if (system.beforeUpdateAll) {
                            system.beforeUpdateAll(this.gameTime);
                        }
                        // Save for afterUpdateAll
                        toCallAfterUpdateAll[id] = {
                            system: system,
                            entities: []
                        };
                    }
                    toCallAfterUpdateAll[id].entities.push(entity);
                    // Call update
                    system.update(this.gameTime, elapsedScaled, entity);
                }
            });
        });
        // Call afterUpdateAll
        for (let attr in toCallAfterUpdateAll) {
            if (!toCallAfterUpdateAll.hasOwnProperty(attr)) {
                continue;
            }
            let system = toCallAfterUpdateAll[attr].system;
            if (system.afterUpdateAll) {
                this.inject(system);
                system.afterUpdateAll(this.gameTime, toCallAfterUpdateAll[attr].entities);
            }
        }
        toCallAfterUpdateAll = {};
    }
    /**
     * Injects the execution context into the system.
     *
     * A system can exist on several worlds at the same time, ECS ensures that global methods will always reference the
     * currently running world.
     *
     * @param system
     */
    inject(system) {
        system.world = this;
        system.trigger = this.systemTrigger;
        return system;
    }
    /**
     * When an entity receives or loses components, invoking the change method of the systems
     *
     * @param entity
     */
    onEntityUpdate(entity, added, removed) {
        if (!this.entitySystems[entity.id]) {
            return;
        }
        const toNotify = this.entitySystems[entity.id].slice(0);
        // outside:
        for (let idx = toNotify.length - 1; idx >= 0; idx--) {
            let system = toNotify[idx];
            // System is listening to updates on entity?
            if (system.change) {
                let systemComponentTypes = system.componentTypes;
                // Listen to all component type
                if (systemComponentTypes.indexOf(-1) >= 0) {
                    continue;
                }
                if (added && systemComponentTypes.indexOf(added.type) >= 0) {
                    continue;
                    // continue outside;
                }
                if (removed && systemComponentTypes.indexOf(removed.type) >= 0) {
                    continue;
                    // continue outside;
                }
            }
            // dont match
            toNotify.splice(idx, 1);
        }
        // Notify systems
        toNotify.forEach(system => {
            system = this.inject(system);
            const systemComponentTypes = system.componentTypes;
            const all = systemComponentTypes.indexOf(-1) >= 0;
            system.change(entity, 
            // Send only the list of components this system expects
            all
                ? added
                : (added && systemComponentTypes.indexOf(added.type) >= 0
                    ? added
                    : undefined), all
                ? removed
                : (removed && systemComponentTypes.indexOf(removed.type) >= 0
                    ? removed
                    : undefined));
        });
    }
    indexEntitySystem = (entity, system) => {
        const idx = this.entitySystems[entity.id].indexOf(system);
        // Sistema não existe neste mundo, remove indexação
        if (this.systems.indexOf(system) < 0) {
            if (idx >= 0) {
                this.entitySystems[entity.id].splice(idx, 1);
                delete this.entitySystemLastUpdate[entity.id][system.id];
                delete this.entitySystemLastUpdateGame[entity.id][system.id];
            }
            return;
        }
        const systemComponentTypes = system.componentTypes;
        for (let a = 0, l = systemComponentTypes.length; a < l; a++) {
            // -1 = All components. Allows a system to receive updates from all entities in the world.
            let entityComponentIDs = [-1].concat(Object.keys(entity.components).map(v => parseInt(v, 10)));
            if (entityComponentIDs.indexOf(systemComponentTypes[a]) < 0) {
                // remove
                if (idx >= 0) {
                    // Informs the system of relationship removal
                    if (system.exit) {
                        this.inject(system);
                        system.exit(entity);
                    }
                    this.entitySystems[entity.id].splice(idx, 1);
                    delete this.entitySystemLastUpdate[entity.id][system.id];
                    delete this.entitySystemLastUpdateGame[entity.id][system.id];
                }
                return;
            }
        }
        // Entity has all the components this system needs
        if (idx < 0) {
            this.entitySystems[entity.id].push(system);
            this.entitySystemLastUpdate[entity.id][system.id] = NOW();
            this.entitySystemLastUpdateGame[entity.id][system.id] = this.gameTime;
            // Informs the system about the new relationship
            if (system.enter) {
                this.inject(system);
                system.enter(entity);
            }
        }
    };
    /**
     * Indexes an entity
     *
     * @param entity
     */
    indexEntity(entity, system) {
        if (!this.entitySystems[entity.id]) {
            this.entitySystems[entity.id] = [];
        }
        if (system) {
            // Index entity for a specific system
            this.indexEntitySystem(entity, system);
        }
        else {
            // Indexes the entire entity
            this.systems.forEach((system) => {
                this.indexEntitySystem(entity, system);
            });
        }
    }
}
