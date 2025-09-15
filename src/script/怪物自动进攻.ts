import BaseUtil from "@/BaseUtil";
import RectUtil from "@/RectUtil";
import UnitStateUtil from "@/UnitStateUtil";
import ActorUnitUtil from "@/util/ActorUnitUtil";
import { l_进攻怪路线 } from "_sl_editor/l_进攻怪路线";
import 进攻怪演员, { d_进攻怪演员 } from "xlsx/敌人怪物/进攻怪演员";

 export default class 怪物自动进攻{
    constructor(){
        BaseUtil.onTimer(10,(count)=>{
            let element = d_进攻怪演员[count]
            ActorUnitUtil.createActorUnit(Player(11),element.id,l_进攻怪路线[0].x,l_进攻怪路线[0].y,0,10)
            return true
        })
        怪物自动进攻.Attack(l_进攻怪路线)
    }
    static Attack(line:Vector[]){
        for(let i = 0;i<line.length;i++){
            let vector = line[i]
            let vector2 = line[i+1]
            let rect = RectUtil.createRect(vector.x,vector.y,1000,1000)
            if(vector2){
                se.onEnterRect(rect,e=>{
                    if(e.trigUnitOwnerId>9){
                        UnitStateUtil.orderAttack(e.trigUnit,vector2.x,vector2.y)
                    }
                })
            }
        }
    }
 }