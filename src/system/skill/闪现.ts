import UnitUtil from "@/UnitUtil";
import ActorTypeUtil from "@/util/ActorTypeUtil";

export default class 闪现{
    constructor(){
        // let actorType = ActorTypeUtil.getActorType("闪现")
        // actorType.onAction = (actor, x, y, targetUnit)=>{
        //     UnitUtil.transfer(actor.unit,x,y)
        // }
        let trigger = CreateTrigger()
        TriggerRegisterAnyUnitEventBJ(trigger,EVENT_PLAYER_UNIT_SPELL_EFFECT)
        TriggerAddCondition(trigger,Condition(()=>{
            if(id2string(GetSpellAbilityId())=="ANcl"){
                return true
            }
            return false
        }))
        TriggerAddAction(trigger,()=>{
            let loc = GetSpellTargetLoc()
            UnitUtil.transfer(GetTriggerUnit(),GetLocationX(loc),GetLocationY(loc))
        })
    }

    
}