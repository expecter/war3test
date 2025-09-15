/**
 * 单位施法事件 里的常用函数集合
 */
import UnitEvent from "./UnitEvent";
import DataBase from "../../common/DataBase";
import { Unit } from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";
export default class UnitDamagedEvent extends UnitEvent {
    static instance = new UnitDamagedEvent();
    constructor() {
        super();
    }
    /**
     * 伤害值
     */
    get damage() {
        return GetEventDamage();
    }
    /**
     * 是否有伤害来源单位
     */
    get hasDamageSource() {
        return IsHandle(GetEventDamageSource());
    }
    /**
     * 伤害来源单位
     */
    get damageSource() {
        return GetEventDamageSource();
    }
    /**
     * 伤害来源单位类型id str
     */
    get damageSourceTypeIdStr() {
        return id2string(GetUnitTypeId(GetEventDamageSource()));
    }
    /**
     * 伤害来源单位名字
     */
    get damageSourceName() {
        return GetUnitName(GetEventDamageSource());
    }
    /**
     * 伤害类型Id
     */
    get damageTypeId() {
        return EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE);
    }
    /**
     * 攻击类型Id
     */
    get attackTypeId() {
        return EXGetEventDamageData(EVENT_DAMAGE_DATA_ATTACK_TYPE);
    }
    /**
     * 武器类型Id
     */
    get weaponTypeId() {
        return EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE);
    }
    /**
     * 伤害来源单位(包装对象)
     */
    get damageSourceObj() {
        return Unit.fromHandle(GetEventDamageSource());
    }
    /**
     * 获得单位自定义值
     */
    get damageSourceSolarData() {
        return DataBase.getUnitSolarData(GetEventDamageSource());
    }
    /**
     * 获得单位属性
     */
    get damageSourceAttribute() {
        return AttributeUtil.getUnitAttribute(GetEventDamageSource());
    }
    /**
     * 获得单位类型的自定义值
     */
    get damageSourceTypeSolarData() {
        return DataBase.getUnitTypeSolarData(id2string(GetUnitTypeId(GetEventDamageSource())));
    }
    get damageSourceX() {
        return GetUnitX(GetEventDamageSource());
    }
    get damageSourceY() {
        return GetUnitY(GetEventDamageSource());
    }
    get damageSourceFacing() {
        return GetUnitFacing(GetEventDamageSource());
    }
    /**
     * 伤害来源所属玩家
     */
    get damageSourceOwner() {
        return GetOwningPlayer(GetEventDamageSource());
    }
    get damageSourceOwnerId() {
        return GetPlayerId(GetOwningPlayer(GetEventDamageSource()));
    }
}
