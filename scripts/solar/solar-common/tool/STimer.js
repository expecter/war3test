/**
 * 太阳计时器
 */
/** @noSelfInFile **/
import ErrorMsgHelper from "@/ErrorMsgHelper";
/** @noSelf **/
let index = 0;
export default class STimer {
    uuid = index++;
    _elapsed = 0;
    interval = 0;
    _callCount = 0;
    loopCount = 1;
    isPause = false;
    _timeout = 0;
    _isDestroy = false;
    periodic = false;
    lastUpdateTime = 0;
    handlerFunc = null;
    constructor() {
    }
    /**
     * 计时器经过的时间
     */
    get elapsed() {
        return this._elapsed;
    }
    /**
     * 计时器剩余时间
     */
    get remaining() {
        return this._timeout - this._elapsed;
    }
    setLoopCount(loopCount) {
        if (loopCount == 0) {
            log.errorWithTraceBack("不能设置循环次数为0!");
        }
        this.loopCount = loopCount;
    }
    //毫秒单位
    update() {
        if (this._isDestroy) {
            return;
        }
        if (this.isPause) {
            return;
        }
        let tpf = _g_time - this.lastUpdateTime;
        //秒单位
        this.interval += tpf;
        //计算间隔逻辑回调
        if (this.interval >= this._timeout) {
            this._callCount++;
            this.interval = 0;
            this._elapsed += this._timeout;
            if (!this.periodic && this._callCount >= this.loopCount) { //不是循环的自动销毁
                this.destroy();
            }
            else {
                //加入下一次系统回调
                STimer._sl_addSTimer2TimeCallBack(this._timeout, this);
            }
            //即使报错也不要影响后续的逻辑 以尽可能提高游戏体验
            xpcall(() => {
                this.handlerFunc(this);
            }, ErrorMsgHelper.error_handle);
        }
        this.lastUpdateTime = _g_time;
    }
    /**
     * 计时器
     */
    get timeout() {
        return this._timeout;
    }
    /**
     * 设置间隔 毫秒单位
     * (修改时 会在下次计时器到期时才能开始以 timeMS 的频率正常运行 即修改后的第一次运行可能会额外等0-1倍的之前的timeMS的延迟)
     * @param timeMS
     */
    set timeout(timeMS) {
        timeMS = Math.round(timeMS / 10) * 10;
        if (timeMS < 10) {
            log.errorWithTraceBack("计时器间隔不得低于0.01毫秒");
            this.destroy();
            return;
        }
        //重新设置上次更新时间 以保证下次更新时能 到期时间满足条件
        this.lastUpdateTime = -timeMS;
        this._timeout = timeMS;
    }
    isDestroy() {
        return this._isDestroy;
    }
    destroy() {
        this._isDestroy = true;
        return this;
    }
    /**
     * @deprecated 暂不支持
     */
    pause() {
        this.isPause = true;
        return this;
    }
    /**
     * @deprecated 暂不支持
     */
    resume() {
        this.isPause = false;
        this.reset();
        STimer._sl_addSTimer2TimeCallBack(this._timeout, this);
        return this;
    }
    /**
     * 重设计时器 以便可以再次start
     */
    reset() {
        this._elapsed = 0;
        this.interval = 0;
        this._callCount = 0;
        this.isPause = false;
        this._isDestroy = false;
        this.lastUpdateTime = 0;
    }
    /**
     * 启动计时器
     * @param timeoutS  （单位：秒 精度为小数点后2位 0.01）
     * @param handlerFunc
     * @param periodic
     */
    start(timeoutS, handlerFunc, periodic) {
        this.handlerFunc = handlerFunc;
        if (periodic != null) {
            this.periodic = periodic;
        }
        if (timeoutS == 0) {
            handlerFunc(this);
            return this;
        }
        // 0.024秒 设置为 20ms
        this._timeout = Math.round(timeoutS * 100) * 10;
        //
        STimer._sl_addSTimer2TimeCallBack(this._timeout, this);
        //
        return this;
    }
    /**
     * 全局静态
     * 注意这个数据是异步的
     */
    static timeCallBack = {};
    static _sl_getSTimerCount() {
        let count = 0;
        for (let timeCallBackKey in STimer.timeCallBack) {
            let callBackArray = STimer.timeCallBack[timeCallBackKey];
            if (callBackArray) {
                count += callBackArray.length;
            }
        }
        return count;
    }
    static _sl_addSTimer2TimeCallBack(timeout, sTimer) {
        let callBackTime = _g_time + timeout;
        let callBackArray = STimer.timeCallBack[callBackTime];
        if (callBackArray == null) {
            callBackArray = [];
            STimer.timeCallBack[callBackTime] = callBackArray;
        }
        callBackArray.push(sTimer);
    }
    static _sl_OnTime() {
        let callBackArray = STimer.timeCallBack[_g_time];
        if (callBackArray) {
            for (let callBackArrayElement of callBackArray) {
                callBackArrayElement.update();
            }
            //删除旧的
            STimer.timeCallBack[_g_time] = null;
        }
    }
}
