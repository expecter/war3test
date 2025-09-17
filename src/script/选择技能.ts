import DialogUtil from "@/DialogUtil";
import UnitEvent from "@/event/UnitEvent";
import 开局选择英雄角色 from "state/基础/开局选择英雄角色";

export default class 选择技能{
    constructor(){
        //点击加点按钮，弹出技能选择列表，列表项根据当前角色的技能进行筛选
        se.onHeroLevelUp((unitEvent)=>{
           
            this.SkillPanel( unitEvent)
        })
    }
    /**
     * 技能选择面板
     */
    SkillPanel(unitEvent:UnitEvent){
        let buttonTexts = ["test1","test2"]
        let skillId = 0
        if(isAuto){

        }else{
            DialogUtil.show(unitEvent.trigUnitOwnerId, "选择技能", (i, text) => {
                this.LearnSkill(unitEvent.trigUnit,skillId)
            }, ...buttonTexts)
        }
        
    }

    /**
     * 学习技能
     */
    LearnSkill(unit:unit,skillId:number){
        SelectHeroSkill(unit,skillId)
    }

    AutoSelectSkill(){
        
    }
}