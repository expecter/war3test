import UnitUtil from "@/UnitUtil";
import ActorTypeUtil from "@/util/ActorTypeUtil";
import { BaseSkill } from "../BaseSkill";

export class 闪现 extends BaseSkill{
    constructor(){
        super()
        let actorType = ActorTypeUtil.getActorType("闪现")
        actorType.onAction = (actor, x, y, targetUnit)=>{
            UnitUtil.transfer(actor.unit,x,y)
        }
    }
}