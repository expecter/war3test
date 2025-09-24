import BaseUtil from "@/BaseUtil";
import RectUtil from "@/RectUtil";
import UnitStateUtil from "@/UnitStateUtil";
import ActorUnitUtil from "@/util/ActorUnitUtil";
import { l_进攻怪路线 } from "_sl_editor/l_进攻怪路线";
import 进攻怪演员, { d_进攻怪演员 } from "xlsx/敌人怪物/进攻怪演员";

 export default class SystemMonster{
    private pauseTime = 0
    private attackTime = 0
    private wave = 0
    constructor(){
        let waveTime = os.time()
        BaseUtil.onTimer(1,(count)=>{
            if(this.GetIsPause()){
                if(this.pauseTime>0){
                    this.pauseTime--
                }
            }else{
                if(this.attackTime>0){
                    this.attackTime--
                }else{
                    this.wave++
                    print("this.attackTime1",this.attackTime)
                    this.attackTime = 30
                    print("this.attackTime2",this.attackTime)
                    this.CreateMonsterUnit(this.wave)
                }
            }
            this.AttackNearUnit()

            return true
        })
        // 怪物进攻.Attack(l_进攻怪路线)
        //全图根据时间创建怪物，怪物出生在主角周围跟着主角
    }

    //进攻最近的玩家单位TODO
    private AttackNearUnit(){
        
    }
    private CreateMonsterUnit(wave:number){
        let element = d_进攻怪演员[wave]
        ActorUnitUtil.createActorUnit(Player(11),element.id,l_进攻怪路线[0].x,l_进攻怪路线[0].y,0,10,(actionUnit)=>{
            UnitStateUtil.orderAttackTarget(actionUnit.unit,sd(Player(0)).hero)
        })

    }

    public GetWave(){
        return this.wave
    }

    public GetIsPause(){
        return this.pauseTime > 0
    }

    //战斗暂停功能
    public PauseAttack(){
        if(this.pauseTime == 0){
            this.pauseTime = 120
        }
    }
 }