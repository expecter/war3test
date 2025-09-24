import DialogUtil from "@/DialogUtil";
import UnitEvent from "@/event/UnitEvent";
import Random from "@/Random";
import RandomUtil from "@/RandomUtil";
import ActorAbilityUtil from "@/util/ActorAbilityUtil";
import blink from "./blink";
import { d_技能演员 } from "xlsx/单位/技能演员";

export default class SystemSkill{
    /**
     * 单位和已经学习的技能列表
     */
    private tmUnitSkill:Map<number,Map<number,string>> = new Map()
    constructor(){
        //点击加点按钮，弹出技能选择列表，列表项根据当前角色的技能进行0筛选
        se.onHeroLevelUp((unitEvent)=>{
           
            this.SkillPanel( unitEvent)
        })
        new blink()
    }
    /**
     * 技能选择面板
     */
    SkillPanel(unitEvent:UnitEvent){
        // UnitAddAbility(unitEvent.trigUnit,"ab01")
        let buttonTexts = ["闪现"]
        let skillId = 0
        if(isAuto){

        }else{
            let unit = unitEvent.trigUnit
            let playerId = GetPlayerId(GetOwningPlayer(unit))
            DialogUtil.show(playerId, "选择技能", (i, text) => {
                this.LearnSkill(unit,buttonTexts[i])
            }, ...buttonTexts)
        }
    }
    //获取可学习的技能列表
    CanLearnSkillList(unit:unit){
        let playerId = GetPlayerId(GetOwningPlayer(unit))
        //判断是否已经学习了这个技能
        let tmSkill = this.tmUnitSkill.get(playerId)
        if(!tmSkill){
            tmSkill = new Map()
            this.tmUnitSkill.set(playerId,tmSkill)
        }
        let tlSkill:string[] = []
        //筛选可学习的技能，并随机
        d_技能演员.forEach((item)=>{
            //添加规则
            tlSkill.push(item.id)
        })
        print(tlSkill.length,"可学习的技能列表")
        let tl = RandomUtil.getRandomElementByObjArrays(4,"key",tlSkill)
        return tl
    }

    /**
     * 学习技能，参考技能学习到qwer配置
     */
     LearnSkill(unit:unit,skillId:string){
        let playerId = GetPlayerId(GetOwningPlayer(unit))
        //判断是否已经学习了这个技能
        let tmSkill = this.tmUnitSkill.get(playerId)
        if(!tmSkill){
            tmSkill = new Map()
            this.tmUnitSkill.set(playerId,tmSkill)
        }
        
        print(GetOwningPlayer(unit),skillId)
        // let res = UnitAddAbility(unit,("ab01"))
        // UnitAddAbility(unit,skillId)
        ActorAbilityUtil.createActorAbility(skillId,unit)
        // print("learn ability res",res)
    }

    AutoSelectSkill(){
        
    }
}