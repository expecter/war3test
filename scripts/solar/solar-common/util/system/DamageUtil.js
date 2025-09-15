import DamageType from "@/DamageType";
import MathUtil from "@/MathUtil";
import SelectUtil from "@/SelectUtil";
import WeaponType from "@/WeaponType";
import LangUtil from "@/LangUtil";
import UnitStateUtil from "@/UnitStateUtil";
export default class DamageUtil {
    static damageTypes = DamageUtil._sl_createDamageTypes();
    static weaponTypes = DamageUtil._sl_createWeaponTypes();
    static physicalDamageType = [DamageType.T4_NORMAL, DamageType.T5_ENHANCED, DamageType.T17_FORCE, DamageType.T21_DEFENSIVE, DamageType.T26_UNIVERSAL];
    /**
     * 对单个目标造成伤害
     * @param whichUnit 伤害来源
     * @param target 受害单位
     * @param damageOrFormula 伤害值 或 伤害值公式
     * @param damageTypeId 伤害类型
     * @param weaponTypeID 武器类型
     * @param ranged 是否远程
     * @param attack 是否攻击
     * @param attackType 攻击类型
     */
    static damage(whichUnit, target, damageOrFormula, damageTypeId = DamageType.T4_NORMAL, weaponTypeID = WeaponType.T0_WHOKNOWS, ranged = true, attack = false, attackType = ATTACK_TYPE_CHAOS) {
        let dt = DamageUtil.damageTypes[damageTypeId];
        let wt = DamageUtil.weaponTypes[weaponTypeID];
        let damage;
        if (LangUtil.isNumber(damageOrFormula)) {
            damage = damageOrFormula;
        }
        else {
            damage = UnitStateUtil.calculateStateFormula(damageOrFormula, whichUnit, target);
        }
        UnitDamageTarget(whichUnit, target, damage, attack, ranged, attackType, dt, wt);
        return damage;
    }
    /**
     * 此方法 在太阳伤害事件中造成的伤害 会继续走太阳伤害事件 请自行通过判断伤害类型等 防止死循环
     * @param whichUnit 伤害来源
     * @param target 受害单位
     * @param damageOrFormula 伤害值 或 伤害值公式
     * @param damageTypeId 伤害类型 DamageType.T4_NORMAL 普通伤害 会受到护甲减免 ; T14_MAGIC = 14, //魔法伤害
     * @param weaponTypeID 武器类型
     * @param ranged 是否远程
     * @param attack 是否攻击
     * @param attackType 攻击类型
     */
    static damageSL(whichUnit, target, damageOrFormula, damageTypeId = DamageType.T4_NORMAL, weaponTypeID = WeaponType.T0_WHOKNOWS, ranged = true, attack = false, attackType = ATTACK_TYPE_CHAOS) {
        let oldFlag = isSolarDamageEnable;
        isSolarDamageEnable = true;
        let dt = DamageUtil.damageTypes[damageTypeId];
        let wt = DamageUtil.weaponTypes[weaponTypeID];
        let damage;
        if (LangUtil.isNumber(damageOrFormula)) {
            damage = damageOrFormula;
        }
        else {
            damage = UnitStateUtil.calculateStateFormula(damageOrFormula, whichUnit, target);
        }
        UnitDamageTarget(whichUnit, target, damage, attack, ranged, attackType, dt, wt);
        isSolarDamageEnable = oldFlag;
        return damage;
    }
    /**
     * 伤害范围内的敌人
     * @param whichUnit 伤害来源
     * @param radius 范围半径
     * @param damageOrFormula 伤害值 或 伤害值公式
     * @param damageTypeId 伤害类型
     * @param x 范围中心点x 默认取伤害来源坐标x
     * @param y 范围中心点y 默认取伤害来源坐标y
     * @param weaponTypeID 武器类型
     * @param ranged 是否远程
     * @param attack 是否攻击
     * @param attackType 攻击类型
     */
    static damageEnemyUnitsInRange(whichUnit, radius, damageOrFormula, damageTypeId = DamageType.T4_NORMAL, x = GetUnitX(whichUnit), y = GetUnitY(whichUnit), weaponTypeId = WeaponType.T0_WHOKNOWS, ranged = true, attack = false, attackType = ATTACK_TYPE_CHAOS) {
        let dt = DamageUtil.damageTypes[damageTypeId];
        let wt = DamageUtil.weaponTypes[weaponTypeId];
        let damage;
        SelectUtil.forEnemyUnitsInRange(whichUnit, radius, (enemy) => {
            if (LangUtil.isNumber(damageOrFormula)) {
                damage = damageOrFormula;
            }
            else {
                damage = UnitStateUtil.calculateStateFormula(damageOrFormula, whichUnit, enemy);
            }
            UnitDamageTarget(whichUnit, enemy, damage, attack, ranged, attackType, dt, wt);
        }, x, y);
        return damage;
    }
    /**
     * 在太阳伤害事件里使用此伤害 会继续走太阳伤害 请自行通过判断 防止死循环
     * @param whichUnit
     * @param radius
     * @param damageOrFormula
     * @param damageTypeId DamageType.T4_NORMAL 普通伤害 会受到护甲减免 ; T14_MAGIC = 14, //魔法伤害
     * @param x
     * @param y
     * @param weaponTypeId
     * @param attackType
     * @param ranged
     * @param attack
     */
    static damageEnemyUnitsInRangeSL(whichUnit, radius, damageOrFormula, damageTypeId = DamageType.T4_NORMAL, x = GetUnitX(whichUnit), y = GetUnitY(whichUnit), weaponTypeId = WeaponType.T0_WHOKNOWS, ranged = true, attack = false, attackType = ATTACK_TYPE_CHAOS) {
        let dt = DamageUtil.damageTypes[damageTypeId];
        let wt = DamageUtil.weaponTypes[weaponTypeId];
        let oldFlag = isSolarDamageEnable;
        isSolarDamageEnable = true;
        let damage;
        SelectUtil.forEnemyUnitsInRange(whichUnit, radius, (enemy) => {
            if (LangUtil.isNumber(damageOrFormula)) {
                damage = damageOrFormula;
            }
            else {
                damage = UnitStateUtil.calculateStateFormula(damageOrFormula, whichUnit, enemy);
            }
            UnitDamageTarget(whichUnit, enemy, damage, attack, ranged, attackType, dt, wt);
        }, x, y);
        isSolarDamageEnable = oldFlag;
        return damage;
    }
    /**
     * @brief 对扇形范围内的所有敌对单位造成伤害
     * @param whichUnit
     * @param radius
     * @param damageOrFormula
     * @param angle
     * @param targetX
     * @param targetY
     * @param damageTypeId
     * @param weaponTypeId
     * @param ranged
     * @param attack
     * @param attackType
     */
    static damageEnemyUnitsInSector(whichUnit, radius, damageOrFormula, angle, targetX, targetY, damageTypeId = DamageType.T4_NORMAL, weaponTypeId = WeaponType.T0_WHOKNOWS, ranged = true, attack = false, attackType = ATTACK_TYPE_CHAOS) {
        let dt = DamageUtil.damageTypes[damageTypeId];
        let wt = DamageUtil.weaponTypes[weaponTypeId];
        let degree = MathUtil.angleBetweenCoords(GetUnitX(whichUnit), GetUnitY(whichUnit), targetX, targetY);
        SetUnitFacing(whichUnit, degree);
        let x = GetUnitX(whichUnit) + radius * CosBJ(degree);
        let y = GetUnitY(whichUnit) + radius * SinBJ(degree);
        let damage;
        SelectUtil.forEnemyUnitsInRange(whichUnit, radius, (unitHandle) => {
            let angle0 = MathUtil.angleBetweenCoords(GetUnitX(whichUnit), GetUnitY(whichUnit), GetUnitX(unitHandle), GetUnitY(unitHandle));
            let angle1 = MathUtil.angleBetweenCoords(GetUnitX(whichUnit), GetUnitY(whichUnit), targetX, targetY) - angle / 2.0;
            let angle2 = MathUtil.angleBetweenCoords(GetUnitX(whichUnit), GetUnitY(whichUnit), targetX, targetY) + angle / 2.0;
            if (angle0 >= angle1 && angle0 <= angle2) {
                if (LangUtil.isNumber(damageOrFormula)) {
                    damage = damageOrFormula;
                }
                else {
                    damage = UnitStateUtil.calculateStateFormula(damageOrFormula, whichUnit, unitHandle);
                }
                UnitDamageTarget(whichUnit, unitHandle, damage, attack, ranged, attackType, dt, wt);
            }
        }, x, y);
        return damage;
    }
    /**
     * @brief 对扇形范围内的所有敌对单位造成伤害
     * @param whichUnit
     * @param radius
     * @param damageOrFormula
     * @param angle
     * @param targetX
     * @param targetY
     * @param damageTypeId
     * @param weaponTypeId
     * @param ranged
     * @param attack
     * @param attackType
     */
    static damageEnemyUnitsInSectorSL(whichUnit, radius, damageOrFormula, angle, targetX, targetY, damageTypeId = DamageType.T4_NORMAL, weaponTypeId = WeaponType.T0_WHOKNOWS, ranged = true, attack = false, attackType = ATTACK_TYPE_CHAOS) {
        let oldFlag = isSolarDamageEnable;
        isSolarDamageEnable = true;
        let damage = DamageUtil.damageEnemyUnitsInSector(whichUnit, radius, damageOrFormula, angle, targetX, targetY, damageTypeId, weaponTypeId, ranged, attack, attackType);
        isSolarDamageEnable = oldFlag;
        return damage;
    }
    /**
     * 是否物理伤害
     * UnitDamageTarget 造成的伤害 都不是物理伤害
     */
    static isEventPhysicalDamage() {
        return 0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_PHYSICAL);
    }
    /**
     * 是否物理伤害类型
     * （根据伤害类型 判断是否物理伤害 ）
     * 默认为以下伤害类型 是物理伤害类型
     * DamageType.T4_NORMAL
     * DamageType.T5_ENHANCED
     * DamageType.T17_FORCE
     * DamageType.T21_DEFENSIVE
     * DamageType.T26_UNIVERSAL
     */
    static isEventPhysicalDamageType() {
        let damageTypeData = EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE);
        for (let i = 0; i < DamageUtil.physicalDamageType.length; i++) {
            if (damageTypeData == DamageUtil.physicalDamageType[i]) {
                return true;
            }
        }
        return false;
    }
    /**
     * 是否攻击伤害
     */
    static isEventAttackDamage() {
        return 0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK);
    }
    /**
     * 是否远程伤害
     */
    static isEventRangedDamage() {
        return 0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED);
    }
    /**
     * 是否某个伤害类型
     * @param damageType
     */
    static isEventDamageType(damageType) {
        return damageType == ConvertDamageType(EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE));
    }
    /**
     * 是否某个武器类型
     * @param weaponType
     */
    static isEventWeaponType(weaponType) {
        return weaponType == ConvertWeaponType(EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE));
    }
    /**
     * 是否某个攻击类型
     * @param attackType
     */
    static isEventAttackType(attackType) {
        return attackType == ConvertAttackType(EXGetEventDamageData(EVENT_DAMAGE_DATA_ATTACK_TYPE));
    }
    /**
     * @private
     */
    static _sl_createDamageTypes() {
        let ds = [];
        for (let i = 0; i < 32; i++) {
            ds[i] = ConvertDamageType(i);
        }
        return ds;
    }
    /**
     * @private
     */
    static _sl_createWeaponTypes() {
        let ws = [];
        for (let i = 0; i < 24; i++) {
            ws[i] = ConvertWeaponType(i);
        }
        return ws;
    }
}
