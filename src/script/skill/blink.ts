import UnitUtil from "@/UnitUtil";
import ActorTypeUtil from "@/util/ActorTypeUtil";

export default class blink{
    constructor(){
        let actorType = ActorTypeUtil.getActorType("闪现")
        actorType.onAction = (actor, x, y, targetUnit)=>{
            UnitUtil.transfer(actor.unit,x,y)
        }
    }
}