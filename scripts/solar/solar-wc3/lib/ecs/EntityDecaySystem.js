import { System } from "./Ecs";
import EntityDecayCom from "./EntityDecayCom";
export default class EntityDecaySystem extends System {
    constructor() {
        super([
            EntityDecayCom.type
        ]);
    }
    update(time, delta, entity) {
        let entityDecayCom = EntityDecayCom.oneFrom(entity);
        entityDecayCom.data.lifeTime = entityDecayCom.data.lifeTime - delta;
        if (entityDecayCom.data.lifeTime <= 0) {
            this.world.removeEntity(entity);
        }
    }
}
