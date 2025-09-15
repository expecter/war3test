import { EcsComponents } from "./EcsComponents";
import { System } from "./Ecs";
export default class TestSystem extends System {
    constructor() {
        super([
            EcsComponents.type
        ]);
    }
    update(time, delta, entity) {
        // let object3D = EcsComponents.oneFrom(entity).data;
        // Iterate through all the entities on the query
        DisplayTimedTextToPlayer(Player(0), 0, 0, 60, 'TestSystem_update()！！！time=+' + time + " delta=" + delta);
    }
}
