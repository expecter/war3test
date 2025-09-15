/**
 * 单位施法事件 里的常用函数集合
 */
import UnitEvent from "./UnitEvent";
import { Unit } from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";
export default class UnitSpellEvent extends UnitEvent {
    static instance = new UnitSpellEvent();
    constructor() {
        super();
    }
    /**
     * 施法技能
     */
    get spellAbilityId() {
        return GetSpellAbilityId();
    }
    /**
     * 施法技能 字符串类型
     */
    get spellAbilityIdStr() {
        return id2string(GetSpellAbilityId());
    }
    /**
     * 施法目标(handle)
     */
    get spellTargetUnit() {
        return GetSpellTargetUnit();
    }
    /**
     * 施法目标单位名字
     */
    get spellTargetUnitName() {
        return GetUnitName(GetSpellTargetUnit());
    }
    /**
     * 施法点
     * 请使用变量保存 以便与清理
     */
    get spellTargetLoc() {
        return GetSpellTargetLoc();
    }
    /**
     * 施法点
     */
    get spellTargetX() {
        return GetSpellTargetX();
    }
    /**
     * 施法点
     */
    get spellTargetY() {
        return GetSpellTargetY();
    }
    /**
     * 施法目标(包装对象)
     */
    get spellTargetUnitObj() {
        return Unit.fromHandle(GetSpellTargetUnit());
    }
    get spellTargetUnitAttribute() {
        return AttributeUtil.getUnitAttribute(GetSpellTargetUnit());
    }
    get spellTargetUnitX() {
        return GetUnitX(GetSpellTargetUnit());
    }
    get spellTargetUnitY() {
        return GetUnitY(GetSpellTargetUnit());
    }
    get spellTargetUnitFacing() {
        return GetUnitFacing(GetSpellTargetUnit());
    }
    /**
     * 施法目标单位所属玩家
     */
    get spellTargetUnitOwner() {
        return GetOwningPlayer(GetSpellTargetUnit());
    }
    get spellTargetUnitOwnerId() {
        return GetPlayerId(GetOwningPlayer(GetSpellTargetUnit()));
    }
}
