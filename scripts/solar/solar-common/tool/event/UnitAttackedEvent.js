/**
 * 单位施法事件 里的常用函数集合
 */
import UnitEvent from "./UnitEvent";
import DataBase from "../../common/DataBase";
import { Unit } from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";
export default class UnitAttackedEvent extends UnitEvent {
    static instance = new UnitAttackedEvent();
    constructor() {
        super();
    }
    /**
     * 攻击单位
     */
    get attacker() {
        return GetAttacker();
    }
    /**
     * 攻击单位名字
     */
    get attackerName() {
        return GetUnitName(GetAttacker());
    }
    /**
     * 攻击单位(包装对象)
     */
    get attackerObj() {
        return Unit.fromHandle(GetAttacker());
    }
    /**
     * 获得单位自定义值
     */
    get attackerSolarData() {
        return DataBase.getUnitSolarData(GetAttacker());
    }
    /**
     * 获得单位属性
     */
    get attackerAttribute() {
        return AttributeUtil.getUnitAttribute(GetAttacker());
    }
    /**
     * 获得单位类型的自定义值
     */
    get attackerTypeSolarData() {
        return DataBase.getUnitTypeSolarData(id2string(GetUnitTypeId(GetAttacker())));
    }
    get attackerX() {
        return GetUnitX(GetAttacker());
    }
    get attackerY() {
        return GetUnitY(GetAttacker());
    }
    get attackerFacing() {
        return GetUnitFacing(GetAttacker());
    }
    /**
     * 攻击者所属玩家
     */
    get attackerOwner() {
        return GetOwningPlayer(GetAttacker());
    }
    get attackerOwnerId() {
        return GetPlayerId(GetOwningPlayer(GetAttacker()));
    }
}
