/** @noSelfInFile **/
import { Handle } from "./handle";
import TriggerUtil from "@/util/system/TriggerUtil";
export class Trigger extends Handle {
    constructor() {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateTrigger());
        }
    }
    set enabled(flag) {
        if (flag) {
            EnableTrigger(this.handle);
        }
        else {
            DisableTrigger(this.handle);
        }
    }
    /**
     * 触发器是否打开
     */
    get enabled() {
        return IsTriggerEnabled(this.handle);
    }
    get evalCount() {
        return GetTriggerEvalCount(this.handle);
    }
    static get eventId() {
        return GetTriggerEventId();
    }
    get execCount() {
        return GetTriggerExecCount(this.handle);
    }
    set waitOnSleeps(flag) {
        TriggerWaitOnSleeps(this.handle, flag);
    }
    get waitOnSleeps() {
        return IsTriggerWaitOnSleeps(this.handle);
    }
    /**
     * 添加触发器动作
     */
    addAction(actionFunc) {
        return TriggerAddAction(this.handle, actionFunc);
    }
    /**
     * Adds a new condition to the trigger.
     *
     * Adding more conditions later wil join them by AND (that means all conditions need to evaluate to `true`)
     *
     * @example
     * ```ts
     * const trg = new Trigger()
     * // trigger fires if a unit is attacked
     * trg.registerAnyUnitEvent(EVENT_PLAYER_UNIT_ATTACKED)
     * // but only if the unit name matches
     * trg.addCondition(Condition(() => Unit.fromHandle(GetAttacker()).name === 'Attacker Unit'))
     * trg.addAction(() => {
     *  //do something...
     * })
     * ```
     * @param condition the condition to add
     */
    /**
     * 添加触发器限制条件
     * @deprecated
     */
    addCondition(condition) {
        return TriggerAddCondition(this.handle, condition);
    }
    /**
     * 删除触发器 [R]
     */
    destroy() {
        DestroyTrigger(this.handle);
    }
    /**
     * 触发器条件成立
     */
    eval() {
        return TriggerEvaluate(this.handle);
    }
    /**
     * 运行触发器 (忽略条件)
     */
    exec() {
        return TriggerExecute(this.handle);
    }
    /**
     *任意单位伤害事件
     */
    registerAnyUnitDamagedEvent() {
        TriggerUtil.SystemAnyUnitDamagedRegistTrigger(this.handle);
    }
    /**
     *任意单位死亡事件
     */
    registerAnyUnitDeathEvent() {
        this.registerAnyUnitEvent(EVENT_PLAYER_UNIT_DEATH);
    }
    /**
     * 任意玩家单位事件
     */
    registerAnyUnitEvent(whichPlayerUnitEvent) {
        // return TriggerRegisterAnyUnitEventBJ(this.handle, whichPlayerUnitEvent);
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            TriggerRegisterPlayerUnitEvent(this.handle, Player(i), whichPlayerUnitEvent, null);
        }
    }
    // public registerCommandEvent(whichAbility: number, order: string) {
    //   return TriggerRegisterCommandEvent(this.handle, whichAbility, order);
    // }
    /**
     * 可毁坏物死亡
     */
    registerDeathEvent(whichWidget) {
        return TriggerRegisterDeathEvent(this.handle, whichWidget.handle);
    }
    /**
     * 对话框按钮被点击 [R]
     */
    registerDialogButtonEvent(whichButton) {
        return TriggerRegisterDialogButtonEvent(this.handle, whichButton.handle);
    }
    /**
     * 对话框事件
     */
    registerDialogEvent(whichDialog) {
        return TriggerRegisterDialogEvent(this.handle, whichDialog.handle);
    }
    /**
     * 单位进入区域[R]
     */
    registerEnterRect(whichRect) {
        let rectRegion = CreateRegion();
        RegionAddRect(rectRegion, whichRect);
        return TriggerRegisterEnterRegion(this.handle, rectRegion, null);
    }
    /**
     * 单位离开区域[R]
     */
    registerLeaveRect(whichRect) {
        let rectRegion = CreateRegion();
        RegionAddRect(rectRegion, whichRect);
        return TriggerRegisterLeaveRegion(this.handle, rectRegion, null);
    }
    /**
     * 单位进入不规则区域(指定条件) [R]
     */
    registerEnterRegion(whichRegion, filter) {
        return TriggerRegisterEnterRegion(this.handle, whichRegion, filter);
    }
    /**
     * 特定玩家事件
     */
    registerFilterUnitEvent(whichUnit, whichEvent, filter) {
        return TriggerRegisterFilterUnitEvent(this.handle, whichUnit, whichEvent, filter);
    }
    /**
     * 比赛游戏事件
     */
    registerGameEvent(whichGameEvent) {
        return TriggerRegisterGameEvent(this.handle, whichGameEvent);
    }
    /**
     * 游戏状态事件
     */
    registerGameStateEvent(whichState, opcode, limitval) {
        return TriggerRegisterGameStateEvent(this.handle, whichState, opcode, limitval);
    }
    /**
     * 单位离开不规则区域(指定条件) [R]
     */
    registerLeaveRegion(whichRegion, filter) {
        return TriggerRegisterLeaveRegion(this.handle, whichRegion, filter);
    }
    /**
     * 联盟状态改变(特殊)
     */
    registerPlayerAllianceChange(whichPlayer, whichAlliance) {
        return TriggerRegisterPlayerAllianceChange(this.handle, whichPlayer.handle, whichAlliance);
    }
    /**
     * 玩家输入聊天信息
     */
    registerPlayerChatEvent(whichPlayer, chatMessageToDetect, exactMatchOnly) {
        return TriggerRegisterPlayerChatEvent(this.handle, whichPlayer.handle, chatMessageToDetect, exactMatchOnly);
    }
    /**
     * 任意玩家输入聊天信息
     */
    registerAnyPlayerChatEvent(chatMessageToDetect, exactMatchOnly) {
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            TriggerRegisterPlayerChatEvent(this.handle, Player(i), chatMessageToDetect, exactMatchOnly);
        }
    }
    /**
     * 玩家事件
     */
    registerPlayerEvent(whichPlayer, whichPlayerEvent) {
        return TriggerRegisterPlayerEvent(this.handle, whichPlayer.handle, whichPlayerEvent);
    }
    /**
     * 任意玩家事件
     */
    registerAnyPlayerEvent(whichPlayerEvent) {
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            TriggerRegisterPlayerEvent(this.handle, Player(i), whichPlayerEvent);
        }
    }
    // public registerPlayerKeyEvent(whichPlayer: MapPlayer, whichKey: oskeytype, metaKey: number, fireOnKeyDown: boolean) {
    //   return BlzTriggerRegisterPlayerKeyEvent(this.handle, whichPlayer.handle, whichKey, metaKey, fireOnKeyDown);
    // }
    // public registerPlayerMouseEvent(whichPlayer: MapPlayer, whichMouseEvent: number) {
    //   return TriggerRegisterPlayerMouseEventBJ(this.handle, whichPlayer.handle, whichMouseEvent);
    // }
    /**
     * 属性
     */
    registerPlayerStateEvent(whichPlayer, whichState, opcode, limitval) {
        return TriggerRegisterPlayerStateEvent(this.handle, whichPlayer.handle, whichState, opcode, limitval);
    }
    // public registerPlayerSyncEvent(whichPlayer: MapPlayer, prefix: string, fromServer: boolean) {
    //   return BlzTriggerRegisterPlayerSyncEvent(this.handle, whichPlayer.handle, prefix, fromServer);
    // }
    /**
     * 玩家单位事件
     */
    registerPlayerUnitEvent(whichPlayer, whichPlayerUnitEvent, filter) {
        return TriggerRegisterPlayerUnitEvent(this.handle, whichPlayer.handle, whichPlayerUnitEvent, filter);
    }
    // Creates it's own timer and triggers when it expires
    /**
     * 注册计时器事件
     */
    registerTimerEvent(timeout, periodic) {
        return TriggerRegisterTimerEvent(this.handle, timeout, periodic);
    }
    // Triggers when the timer you tell it about expires
    /**
     *  计时器到期事件
     */
    registerTimerExpireEvent(t) {
        return TriggerRegisterTimerExpireEvent(this.handle, t);
    }
    /**
     * 鼠标点击可追踪物 [R]
     */
    registerTrackableHitEvent(whichTrackable) {
        return TriggerRegisterTrackableHitEvent(this.handle, whichTrackable);
    }
    /**
     * 鼠标移动到追踪对象 [R]
     */
    registerTrackableTrackEvent(whichTrackable) {
        return TriggerRegisterTrackableTrackEvent(this.handle, whichTrackable);
    }
    /**
     * 详细单位的事件
     */
    registerUnitEvent(whichUnit, whichEvent) {
        return TriggerRegisterUnitEvent(this.handle, whichUnit.handle, whichEvent);
    }
    /**
     * 范围内玩家事件
     */
    registerUnitInRage(whichUnit, range, filter) {
        return TriggerRegisterUnitInRange(this.handle, whichUnit, range, filter);
    }
    /**
     * 单位状态事件
     */
    registerUnitStateEvent(whichUnit, whichState, opcode, limitval) {
        return TriggerRegisterUnitStateEvent(this.handle, whichUnit.handle, whichState, opcode, limitval);
    }
    // public registerUpgradeCommandEvent(whichUpgrade: number) {
    //   return TriggerRegisterUpgradeCommandEvent(this.handle, whichUpgrade);
    // }
    /**
     *  变量的值
     */
    registerVariableEvent(varName, opcode, limitval) {
        return TriggerRegisterVariableEvent(this.handle, varName, opcode, limitval);
    }
    /**
     * 移除触发器动作
     */
    removeAction(whichAction) {
        return TriggerRemoveAction(this.handle, whichAction);
    }
    /**
     * 清空触发器动作
     */
    removeActions() {
        return TriggerClearActions(this.handle);
    }
    /**
     * 移除触发器限制条件
     */
    removeCondition(whichCondition) {
        return TriggerRemoveCondition(this.handle, whichCondition);
    }
    /**
     * 清空触发器限制条件
     */
    removeConditions() {
        return TriggerClearConditions(this.handle);
    }
    /**
     * 重置触发
     */
    reset() {
        ResetTrigger(this.handle);
    }
    // public triggerRegisterFrameEvent(frame: Frame, eventId: frameeventtype) {
    //   return BlzTriggerRegisterFrameEvent(this.handle, frame.handle, eventId);
    // }
    /**
     *
     */
    static fromEvent() {
        return this.fromHandle(GetTriggeringTrigger());
    }
    /**
     *
     */
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
