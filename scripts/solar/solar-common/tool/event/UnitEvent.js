/**
 * 单位事件 里的常用函数集合
 */
import DataBase from "@/common/DataBase";
import { Unit } from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";
export default class UnitEvent {
    static instance = new UnitEvent();
    constructor() {
    }
    /**
     * 被贩卖单位
     */
    get soldUnit() {
        return GetSoldUnit();
    }
    /**
     * 被贩卖单位 id字符串
     */
    get soldUnitTypeIdStr() {
        return id2string(GetUnitTypeId(GetSoldUnit()));
    }
    /**
     * 获得触发单位(handle)
     */
    get trigUnit() {
        return GetTriggerUnit();
    }
    /**
     * 触发单位是否是英雄
     */
    get isHeroUnitTrig() {
        let unitHandle = GetTriggerUnit();
        if (IsUnitType(unitHandle, UNIT_TYPE_HERO)
            && !IsUnitType(unitHandle, UNIT_TYPE_PEON)
            && !IsUnitType(unitHandle, UNIT_TYPE_SUMMONED)
            && !IsUnitIllusion(unitHandle)
            && !IsUnitHidden(unitHandle)) {
            return true;
        }
        return false;
    }
    /**
     * 获得触发单位名字
     */
    get trigUnitName() {
        return GetUnitName(GetTriggerUnit());
    }
    /**
     * 获得触发单位(包装对象)
     */
    get trigUnitObj() {
        return Unit.fromHandle(GetTriggerUnit());
    }
    /**
     * 获得触发单位类型 id字符串
     */
    get trigUnitTypeIdStr() {
        return id2string(GetUnitTypeId(GetTriggerUnit()));
    }
    /**
     * 获得触发单位自定义值
     */
    get trigUnitSolarData() {
        return DataBase.getUnitSolarData(GetTriggerUnit());
    }
    get trigUnitAttribute() {
        return AttributeUtil.getUnitAttribute(GetTriggerUnit());
    }
    /**
     * 获得触发单位类型的自定义值
     */
    get trigUnitTypeSolarData() {
        return DataBase.getUnitTypeSolarData(id2string(GetUnitTypeId(GetTriggerUnit())));
    }
    get trigUnitX() {
        return GetUnitX(GetTriggerUnit());
    }
    get trigUnitY() {
        return GetUnitY(GetTriggerUnit());
    }
    get trigUnitFacing() {
        return GetUnitFacing(GetTriggerUnit());
    }
    /**
     * 触发单位所属玩家
     */
    get trigUnitOwner() {
        return GetOwningPlayer(GetTriggerUnit());
    }
    get trigUnitOwnerId() {
        return GetPlayerId(GetOwningPlayer(GetTriggerUnit()));
    }
}
