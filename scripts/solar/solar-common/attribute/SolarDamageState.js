import { Trigger } from "@/w3ts/handles/trigger";
import AttributeUtil from "@/util/system/AttributeUtil";
import MathUtil from "@/util/math/MathUtil";
import SingletonUtil from "../util/lang/SingletonUtil";
import DamageUtil from "../util/system/DamageUtil";
import UnitStateUtil from "@/UnitStateUtil";
/**
 * 太阳伤害系统
 * 可配置config.damageEventHandlers 以自行处理伤害事件
 */
const BaseRealMax = 8e+37;
export default class SolarDamageState {
    static config = {
        useBaseAttribute: true,
        physical_damage_increased_attack: true,
        damage_reduction_max: 0.99,
        firstDamageEventHandlers: [],
        damageEventHandlers: [],
        lastDamageEventHandlers: [],
    };
    /**
     * 添加伤害处理器 会比addEventHandler正常添加的先执行
     * 将固定数值 和百分比数值分开放处理器队列  可以获得
     * (比如法术强度加法的放到这里 法术增伤的放到正常处理 这样法术强度就能受到法术增伤加成)
     * @param eventHandler
     */
    static addEventHandlerFirst(eventHandler) {
        SolarDamageState.config.firstDamageEventHandlers.push(eventHandler);
    }
    /**
     * 添加伤害处理器
     * @param eventHandler
     */
    static addEventHandler(eventHandler) {
        SolarDamageState.config.damageEventHandlers.push(eventHandler);
    }
    /**
     * 添加伤害处理器 会比addEventHandler正常添加的后执行
     * @param eventHandler
     */
    static addEventHandlerLast(eventHandler) {
        SolarDamageState.config.lastDamageEventHandlers.push(eventHandler);
    }
    constructor(useBaseAttribute = SolarDamageState.config.useBaseAttribute) {
        if (SingletonUtil.notFirstTime(SolarDamageState)) {
            print("不能重复new SolarDamageState()");
            return;
        }
        SolarDamageState.config.useBaseAttribute = useBaseAttribute;
        if (useBaseAttribute) {
            //计算基础的属性伤害
            SolarDamageState.addEventHandler(SolarDamageState.calculateAttributeDamage);
        }
        isSolarDamageEnable = true;
        let trigger = new Trigger();
        trigger.registerAnyUnitDamagedEvent();
        trigger.addAction(() => {
            let eventDamage = GetEventDamage();
            let triggerUnit = GetTriggerUnit();
            //判断伤害值
            if (eventDamage <= 0) {
                return;
            }
            if (eventDamage > BaseRealMax && gv._sl_lastDamage && gv._sl_lastDamage > BaseRealMax) {
                eventDamage = gv._sl_lastDamage;
            }
            let event = this.damageDistributor(eventDamage, triggerUnit);
            //同步大生命值 当生命值超过80涧后 伤害系统走扣血+低伤害方式
            let realDamage = eventDamage;
            if (event?.resultDamage) {
                realDamage = event.resultDamage;
            }
            if (isBigAttributeMode && realDamage > 210000_0000) {
                let _SL_BA_max_life = AttributeUtil.getUnitAttribute(triggerUnit, false)?._SL_BA_max_life;
                if (_SL_BA_max_life && _SL_BA_max_life > BaseRealMax) {
                    UnitStateUtil.addLife(triggerUnit, -(realDamage - 210000_0000));
                    EXSetEventDamage(210000_0000);
                }
            }
        });
    }
    damageDistributor(eventDamage, unit0) {
        //设置变量
        let unit1 = GetEventDamageSource();
        //判断相关条件
        if (!IsHandle(unit1)) {
            return;
        }
        if (IsUnitAlly(unit0, GetOwningPlayer(unit1))) {
            return;
        }
        let isAttack = (0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK));
        if (isBigAttributeMode && isAttack) { //大属性模式下 走自己的伤害算法
            let u1Attack = GetUnitState(unit1, UnitStateDamageMax); //攻击力
            let u0Armor = GetUnitState(unit0, UnitStateArmor); //受到攻击者的 护甲
            let rr = Math.max(1 - MathUtil.armorReduction(u0Armor), 0.00001);
            eventDamage = u1Attack * rr;
            EXSetEventDamage(eventDamage);
            if (eventDamage <= 0) {
                return;
            }
        }
        if (!isSolarDamageEnable) { //防止重复死循环触发伤害事件 即在本伤害事件中造成的伤害 不再进入此触发
            return;
        }
        // 需要单位用户数据（全部为实数类型 1  = 100%）
        let u0sa = AttributeUtil.getUnitAttribute(unit0);
        let u1sa = AttributeUtil.getUnitAttribute(unit1);
        let resultDamage = eventDamage;
        /**计算护甲穿透*/
        if (SolarDamageState.config.useBaseAttribute && isAttack && u1sa != null) {
            if (u1sa.def_pierce_p || u1sa.def_pierce) {
                //计算穿甲比例后受害单位的护甲
                let armor = UnitStateUtil.getArmor(unit0) * (1 - (u1sa.def_pierce_p || 0));
                //计算最终受害单位生效的护甲,等于扣除了穿甲比例后,在扣除固定穿甲
                armor = armor - (u1sa.def_pierce || 0);
                //计算减伤因子
                let rd = MathUtil.armorReduction(armor);
                resultDamage = Math.max(resultDamage, UnitStateUtil.getDamageMax(unit1)) * (1 - rd);
            }
        }
        //封装太阳伤害事件
        let event = {
            baseDamage: eventDamage,
            damageType: EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE),
            weaponType: EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE),
            unit0: unit0,
            unit1: unit1,
            u0sa: u0sa,
            u1sa: u1sa,
            //
            isAttack: isAttack,
            isRanged: (0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED)),
            isPhysical: DamageUtil.isEventPhysicalDamageType(),
            isCritical: false,
            resultDamage: resultDamage,
        };
        //对太阳伤害事件 执行处理
        isSolarDamageEnable = false;
        for (let damageEventHandler of SolarDamageState.config.firstDamageEventHandlers) {
            damageEventHandler(event);
            if (event.consumed) { //已处理完毕 退出后续处理逻辑
                isSolarDamageEnable = true;
                // EXSetEventDamage(event.resultDamage);
                return event;
            }
        }
        for (let damageEventHandler of SolarDamageState.config.damageEventHandlers) {
            damageEventHandler(event);
            if (event.consumed) { //已处理完毕 退出后续处理逻辑
                isSolarDamageEnable = true;
                // EXSetEventDamage(event.resultDamage);
                return event;
            }
        }
        for (let damageEventHandler of SolarDamageState.config.lastDamageEventHandlers) {
            damageEventHandler(event);
            if (event.consumed) { //已处理完毕 退出后续处理逻辑
                isSolarDamageEnable = true;
                // EXSetEventDamage(event.resultDamage);
                return event;
            }
        }
        isSolarDamageEnable = true;
        // 设置伤害值
        EXSetEventDamage(event.resultDamage);
        return event;
    }
    /**
     * 计算太阳基础属性伤害
     * @param event
     */
    static calculateAttributeDamage(event) {
        // 判断伤害类型(计算物理法术增伤与暴击伤害)
        let u0sa = event.u0sa;
        let u1sa = event.u1sa;
        if (u0sa == null && u1sa == null) {
            return;
        }
        if (u0sa?.miss_p && GetRandomReal(0, 1) < u0sa.miss_p) {
            event.isMiss = true;
            event.resultDamage = 0;
            return;
        }
        let newResultDamage = event.resultDamage;
        if (event.isAttack && u1sa?.attack_damage_increased) {
            //攻击增伤
            newResultDamage *= (u1sa.attack_damage_increased + 1);
        }
        if (event.isPhysical) {
            //物理增伤
            if (SolarDamageState.config.physical_damage_increased_attack || event.isAttack == false) {
                newResultDamage *= ((u1sa?.physical_damage_increased ?? 0) + 1);
            }
            //物理暴击
            if ((GetRandomReal(0, 1) < (u1sa?.physical_critical_chance ?? 0))) {
                //Critical damage 暴击伤害  1 = 增加100%伤害
                newResultDamage = newResultDamage * ((u1sa?.physical_critical_damage ?? 0) + 1);
                event.isCritical = true;
            }
            //物理穿透与减免
            let physical_damage_pierce = (u1sa?.physical_damage_pierce || 0) - (u0sa?.physical_damage_reduction || 0);
            newResultDamage *= (1 + physical_damage_pierce);
        }
        else {
            // 法术强度
            newResultDamage += (u1sa?.magic_power ?? 0);
            // 法术增伤
            newResultDamage *= ((u1sa?.magic_damage_increased ?? 0) + 1);
            // 判断暴击
            if ((GetRandomReal(0, 1) < (u1sa?.magic_critical_chance ?? 0))) {
                //Critical damage 暴击伤害
                newResultDamage = newResultDamage * ((u1sa?.magic_critical_damage ?? 0) + 1);
                event.isCritical = true;
            }
            //法术穿透与减免
            let magic_damage_pierce = (u1sa?.magic_damage_pierce || 0) - (u0sa?.magic_damage_reduction || 0);
            newResultDamage *= (1 + magic_damage_pierce);
        }
        /**
         * 根据伤害类型 增伤
         */
        let damage_increased_dt_x = "damage_increased_dt_" + event.damageType;
        if (u1sa?.[damage_increased_dt_x]) {
            newResultDamage *= (1 + u1sa[damage_increased_dt_x]);
        }
        /**
         * 根据武器类型 增伤
         */
        let damage_increased_wt_x = "damage_increased_wt_" + event.weaponType;
        if (u1sa?.[damage_increased_wt_x]) {
            newResultDamage *= (1 + u1sa[damage_increased_wt_x]);
        }
        /**
         * 最终增伤
         */
        if (u1sa?.damage_increased) {
            newResultDamage *= (1 + u1sa.damage_increased);
        }
        /**
         *  计算 受到伤害的单位 的 属性 减免伤害 u0sa
         *  伤害减免Damage Reduction
         */
        if (u0sa?.damage_reduction) {
            newResultDamage *= (1 - Math.min(u0sa.damage_reduction, SolarDamageState.config.damage_reduction_max));
        }
        /**
         * 根据伤害类型 抗性 减伤
         */
        let damage_reduction_dt_x = "damage_reduction_dt_" + event.damageType;
        if (u0sa?.[damage_reduction_dt_x]) {
            newResultDamage *= (1 - u0sa[damage_reduction_dt_x]);
        }
        /**
         * 根据武器类型 抗性 减伤
         */
        let damage_reduction_wt_x = "damage_reduction_wt_" + event.weaponType;
        if (u0sa?.[damage_reduction_wt_x]) {
            newResultDamage *= (1 - u0sa[damage_reduction_wt_x]);
        }
        /**
         *  任意伤害吸血
         */
        if (u1sa?.blood_sucking) {
            let add_hp = newResultDamage * u1sa.blood_sucking;
            SetUnitState(event.unit1, UNIT_STATE_LIFE, Math.max(0, GetUnitState(event.unit1, UNIT_STATE_LIFE) + add_hp));
        }
        //
        event.resultDamage = newResultDamage;
    }
}
