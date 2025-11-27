import UnitUtil from "@/UnitUtil";
import ActorTypeUtil from "@/util/ActorTypeUtil";
import { BaseSkill } from "../BaseSkill";
import Actor from "@/Actor";

export class 锤子 extends BaseSkill{
    constructor(){
        super()
        let actorType = ActorTypeUtil.getActorType("锤子")
        actorType.onAction = (actor, x, y, targetUnit)=>{
            //创建马甲执行技能
            this.quntifengbao(actor,x, y)
        }
    }

    private quntifengbao(actor:Actor,x:number, y:number){
        let dwz: group = CreateGroup() // 单位组
        let fw: number = 400 // 技能范围                                                                
        let cdw: unit = actor.unit // 技能单位 
        let xdw: unit;
            // 选取的单位
        let sh: number = GetHeroStr(cdw, true) // 单位力量，包括加成   GetHeroAgi (敏捷)   GetHeroInt (智力)                 
            
        ///local unit mj = CreateUnit(GetOwningPlayer(cdw), 'e000', GetUnitX(cdw), GetUnitY(cdw), GetUnitFacing(cdw))           // 马甲ID，手动修改 
        let mj :unit = CreateUnit(GetOwningPlayer(cdw), FourCC('h000'), GetUnitX(cdw), GetUnitY(cdw), GetUnitFacing(cdw)) 
            // 给马甲添加蝗虫技能,         手动在物编给马甲添加了蝗虫，毕竟触发是需要时间的，虽然是0.01，但是有时候boss技能是多段0.1秒的伤害，就会出现bug
        // UnitAddAbility(mj, FourCC('Aloc'))  
        // 添加马甲技能 风暴之锤
        UnitAddAbility(mj, FourCC('A001'))
        
        //call GroupEnumUnitsInRange(dwz, x, y, fw, null)             // 选取技能目标单位，添加到单位组
        GroupEnumUnitsInRange(dwz, x, y, fw, null) 
        
        // call SetUnitAnimation(cdw, "Spell")                      // 播放施法单位动作
        SetUnitAnimation(cdw, "Spell")  
        // 单位组循环
        while (true) {
            // 选取单位
            xdw = FirstOfGroup(dwz);
            // 单位组移除单位xdw
            GroupRemoveUnit(dwz, xdw);

            //判断单位组数量为0  就结束循环
            if (CountUnitsInGroup(dwz) == 0) {
                break;
                }

            // 判断 选取单位 ＝ 敌对单位，生命值大于0
            if (IsUnitEnemy(xdw, GetOwningPlayer(cdw)) == true && IsUnitAliveBJ(xdw) == true){  
                // DisplayTimedTextToPlayer(Player(0), 0, 0, 60, '触发2');                          
                // 发布释放锤子的命令
                IssueTargetOrder(mj, "thunderbolt", xdw)  
                // 造成力量属性伤害
                UnitDamageTarget(cdw, xdw, sh, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS) 
            
                }
            xdw = null;
            }
        DestroyGroup(dwz);
        // RemoveUnit(mj);
        mj = null;
        cdw = null;
        dwz = null;
        
    }
}