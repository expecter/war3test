/** @noSelfInFile **/
import { Handle } from "./handle";
/**
 * @deprecated 请尽量使用BaseUtil.runLater 中心计时器替代 以减少内存泄漏
 */
export class Timer extends Handle {
    constructor() {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateTimer());
        }
    }
    /**
     * 计时器经过的时间
     */
    get elapsed() {
        return TimerGetElapsed(this.handle);
    }
    /**
     * 计时器剩余时间
     */
    get remaining() {
        return TimerGetRemaining(this.handle);
    }
    /**
     * 计时器初始的时间
     */
    get timeout() {
        return TimerGetTimeout(this.handle);
    }
    /**
     * 删除计时器 [R]
     */
    destroy() {
        DestroyTimer(this.handle);
        return this;
    }
    /**
     * 暂停计时器 [R]
     */
    pause() {
        PauseTimer(this.handle);
        return this;
    }
    /**
     * 恢复计时器 [R]
     */
    resume() {
        ResumeTimer(this.handle);
        return this;
    }
    /**
     * 运行计时器 [C]
     * @deprecated 请尽量使用BaseUtil.runLater 中心计时器替代 以减少内存泄漏
     * (或者handlerFunc 使用命名函数 以减少内存泄漏)
     */
    start(timeout, periodic, handlerFunc) {
        TimerStart(this.handle, timeout, periodic, handlerFunc);
        return this;
    }
    /**
     * 事件响应 - 计时器期满
     */
    static fromExpired() {
        return this.fromHandle(GetExpiredTimer());
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
