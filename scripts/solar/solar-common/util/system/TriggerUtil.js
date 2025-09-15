/** @noSelf **/
export default class TriggerUtil {
    static DamageEventTrigger = null;
    static DAMAGE_EVENT_SWAP_TIMEOUT = 60; //600  // 每隔这个时间(秒), DamageEventTrigger 会被移入销毁队列
    static DAMAGE_EVENT_SWAP_ENABLE = true; // 若为 false 则不启用销毁机制
    static DamageEventTriggerToDestory = null;
    static DamageEventQueue = [];
    static DamageEventNumber = 0;
    static AnyUnitDamagedFilterCondition = null;
    /**
     * 任意单位伤害事件系统
     * @param trg
     * @constructor
     */
    static SystemAnyUnitDamagedRegistTrigger(trg) {
        if (trg == null) {
            return;
        }
        if (TriggerUtil.DamageEventNumber == 0) {
            //
            TriggerUtil.AnyUnitDamagedFilterCondition = Condition(TriggerUtil.AnyUnitDamagedFilter);
            //
            TriggerUtil.DamageEventTrigger = CreateTrigger();
            TriggerAddAction(TriggerUtil.DamageEventTrigger, TriggerUtil.AnyUnitDamagedTriggerAction);
            TriggerUtil.AnyUnitDamagedEnumUnit();
            TriggerUtil.AnyUnitDamagedRegistTriggerUnitEnter();
            if (TriggerUtil.DAMAGE_EVENT_SWAP_ENABLE) {
                // 每隔 DAMAGE_EVENT_SWAP_TIMEOUT 秒, 将正在使用的 DamageEventTrigger 移入销毁队列
                TimerStart(CreateTimer(), TriggerUtil.DAMAGE_EVENT_SWAP_TIMEOUT, true, TriggerUtil.SyStemAnyUnitDamagedSwap);
            }
        }
        TriggerUtil.DamageEventQueue[TriggerUtil.DamageEventNumber] = trg;
        TriggerUtil.DamageEventNumber = TriggerUtil.DamageEventNumber + 1;
    }
    static AnyUnitDamagedTriggerAction() {
        let i = 0;
        while (i < TriggerUtil.DamageEventNumber) {
            if (TriggerUtil.DamageEventQueue[i] != null && IsTriggerEnabled(TriggerUtil.DamageEventQueue[i]) && TriggerEvaluate(TriggerUtil.DamageEventQueue[i])) {
                TriggerExecute(TriggerUtil.DamageEventQueue[i]);
            }
            i = i + 1;
        }
    }
    static AnyUnitDamagedFilter() {
        if (GetUnitAbilityLevel(GetFilterUnit(), FourCC('Aloc')) <= 0) {
            TriggerRegisterUnitEvent(TriggerUtil.DamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED);
        }
        return false;
    }
    static AnyUnitDamagedEnumUnit() {
        let g = CreateGroup();
        let i = 0;
        while (i < 16) {
            GroupEnumUnitsOfPlayer(g, Player(i), TriggerUtil.AnyUnitDamagedFilterCondition);
            i = i + 1;
        }
        DestroyGroup(g);
    }
    static AnyUnitDamagedRegistTriggerUnitEnter() {
        let t = CreateTrigger();
        let r = CreateRegion();
        let world = GetWorldBounds();
        RegionAddRect(r, world);
        TriggerRegisterEnterRegion(t, r, TriggerUtil.AnyUnitDamagedFilterCondition);
        RemoveRect(world);
    }
    // 将 DamageEventTrigger 移入销毁队列, 从而排泄触发器事件
    static SyStemAnyUnitDamagedSwap() {
        let isEnabled = IsTriggerEnabled(TriggerUtil.DamageEventTrigger);
        DisableTrigger(TriggerUtil.DamageEventTrigger);
        if (TriggerUtil.DamageEventTriggerToDestory != null) {
            DestroyTrigger(TriggerUtil.DamageEventTriggerToDestory);
        }
        TriggerUtil.DamageEventTriggerToDestory = TriggerUtil.DamageEventTrigger;
        TriggerUtil.DamageEventTrigger = CreateTrigger();
        if (!isEnabled) {
            DisableTrigger(TriggerUtil.DamageEventTrigger);
        }
        TriggerAddAction(TriggerUtil.DamageEventTrigger, TriggerUtil.AnyUnitDamagedTriggerAction);
        TriggerUtil.AnyUnitDamagedEnumUnit();
    }
}
