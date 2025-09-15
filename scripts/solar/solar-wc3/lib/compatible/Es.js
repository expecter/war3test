import BaseUtil from "@/BaseUtil";
export default class Es {
    static init() {
        _G.setTimeout = function (handler, timeout, loopCount) {
            BaseUtil.runLater(timeout, handler, loopCount);
            return 0;
        };
        _G.setInterval = function (handler, timeout) {
            BaseUtil.onTimer(timeout, handler);
            return 0;
        };
    }
}
