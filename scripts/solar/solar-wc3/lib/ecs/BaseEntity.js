import { Entity } from "./Ecs";
import EntityDecayCom from "./EntityDecayCom";
export default class BaseEntity extends Entity {
    constructor(lifeTime) {
        super();
        if (lifeTime) {
            this.add(new EntityDecayCom({ lifeTime }));
        }
    }
}
