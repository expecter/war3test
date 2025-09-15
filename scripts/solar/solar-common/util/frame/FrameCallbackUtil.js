/** @noSelfInFile **/
import Cache from "@/tool/Cache";
export default class FrameCallbackUtil {
    static _sl_tempFps = 0;
    static _sl_lastFrameUpdateTime = 0;
    static cache = new Cache();
    /**
     * 获取FPS
     */
    static getFps() {
        if (isEmbedJapi) {
            return GetFps();
        }
        //手动计算fps
        FrameCallbackUtil.cache.get("getFps", () => {
            FrameCallbackUtil.addFrameSetUpdateCallback(() => {
                let nowTime = os.clock();
                let fpsGap = nowTime - FrameCallbackUtil._sl_lastFrameUpdateTime;
                FrameCallbackUtil._sl_tempFps = 1 / fpsGap;
                FrameCallbackUtil._sl_lastFrameUpdateTime = nowTime;
            });
            return true;
        });
        return FrameCallbackUtil._sl_tempFps;
    }
    /**
     * 添加一个帧回调监听
     * （ps：原生的只能设置最后一个有效）
     * @param frameUpdateCallback
     */
    static addFrameSetUpdateCallback(frameUpdateCallback) {
        let callbacks = FrameCallbackUtil.cache.get("AddFrameSetUpdateCallback", () => {
            let cbs = [];
            DzFrameSetUpdateCallbackByCode(() => {
                for (let cb of cbs) {
                    cb();
                }
            });
            //重写DzFrameSetUpdateCallbackByCode
            _G.DzFrameSetUpdateCallbackByCode = function (funcHandle) {
                FrameCallbackUtil.addFrameSetUpdateCallback(funcHandle);
            };
            return cbs;
        });
        callbacks.push(frameUpdateCallback);
    }
}
