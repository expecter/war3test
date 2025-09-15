/** @noSelfInFile */
import ArrayUtil from "@/ArrayUtil";
import ErrorMsgHelper from "@/ErrorMsgHelper";
let index = 0;
export default class SolarTrigger {
    static _sl_TriggeringSolarTrigger = null;
    /** uuid是异步的 可能ui函数也在注册SolarTrigger */
    uuid = "stri" + index++;
    enable = true;
    onDestroy = null;
    actionFuncs = [];
    solarTriggers = null;
    _sl_isDestroyed = false;
    /**
     *
     * @param actionFunc 触发时的回调函数
     * @param solarTriggers 触发器寄生的触发数组
     */
    constructor(actionFunc, solarTriggers) {
        this.addAction(actionFunc);
        this.solarTriggers = solarTriggers;
        this.solarTriggers.push(this);
    }
    addAction(actionFunc) {
        this.actionFuncs.push(actionFunc);
    }
    /**
     * 移除触发器动作
     */
    removeAction(actionFunc) {
        this.actionFuncs.splice(this.actionFuncs.indexOf(actionFunc), 1);
    }
    /**
     * 清空触发器动作
     */
    removeActions() {
        this.actionFuncs = [];
    }
    exec(data) {
        SolarTrigger._sl_TriggeringSolarTrigger = this;
        if (this._sl_isDestroyed) {
            return;
        }
        if (this.enable == false) {
            return;
        }
        //即使报错也不要影响后续的逻辑 以尽可能提高游戏体验
        xpcall(() => {
            for (let i = this.actionFuncs.length - 1; i >= 0; i--) {
                this.actionFuncs[i](this, data);
            }
        }, ErrorMsgHelper.error_handle);
        SolarTrigger._sl_TriggeringSolarTrigger = null;
    }
    destroy() {
        this._sl_isDestroyed = true;
        this.onDestroy?.(this);
        this.actionFuncs = null;
        ArrayUtil.removeElement(this.solarTriggers, this);
        this.solarTriggers = null;
    }
    /**
     * 在SolarTrigger动作事件中获得 当前的触发器
     */
    static getTriggeringSolarTrigger() {
        return SolarTrigger._sl_TriggeringSolarTrigger;
    }
}
