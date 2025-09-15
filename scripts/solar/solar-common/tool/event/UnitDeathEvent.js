/**
 * 单位施法事件 里的常用函数集合
 */
import UnitEvent from "./UnitEvent";
import DataBase from "../../common/DataBase";
import { Unit } from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";
export default class UnitDeathEvent extends UnitEvent {
    static instance = new UnitDeathEvent();
    constructor() {
        super();
    }
    /**
     * 是否有凶手单位
     * 触发杀死的单位 没有凶手单位
     */
    get hasKillingUnit() {
        return IsHandle(GetKillingUnit());
    }
    /**
     * 凶手单位是否是英雄
     */
    get isHeroUnitkiller() {
        let unitHandle = GetKillingUnit();
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
     * 凶手单位
     */
    get killingUnit() {
        return GetKillingUnit();
    }
    /**
     * 凶手单位名字
     */
    get killingUnitName() {
        return GetUnitName(GetKillingUnit());
    }
    /**
     * 凶手单位(包装对象)
     */
    get killingUnitObj() {
        return Unit.fromHandle(GetKillingUnit());
    }
    /**
     * 获得单位自定义值
     */
    get killingUnitSolarData() {
        return DataBase.getUnitSolarData(GetKillingUnit());
    }
    get killingUnitAttribute() {
        return AttributeUtil.getUnitAttribute(GetKillingUnit());
    }
    /**
     * 获得单位类型的自定义值
     */
    get killingUnitTypeSolarData() {
        return DataBase.getUnitTypeSolarData(id2string(GetUnitTypeId(GetKillingUnit())));
    }
    get killingUnitX() {
        return GetUnitX(GetKillingUnit());
    }
    get killingUnitY() {
        return GetUnitY(GetKillingUnit());
    }
    get killingUnitFacing() {
        return GetUnitFacing(GetKillingUnit());
    }
    /**
     * 凶手单位所属玩家
     */
    get killingUnitOwner() {
        return GetOwningPlayer(GetKillingUnit());
    }
    get killingUnitOwnerId() {
        return GetPlayerId(GetOwningPlayer(GetKillingUnit()));
    }
}
