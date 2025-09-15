import BaseUtil from "@/BaseUtil";
export default class TimerDialogUtil {
    static _sl_cache = {};
    /**
     * 倒计时 计时器窗口
     * @param title
     * @param timeout
     * @param periodic 目前只能传false
     */
    static show(title, timeout, periodic = false) {
        let timer = CreateTimer();
        let timerDialog = CreateTimerDialog(timer);
        TimerDialogSetTitle(timerDialog, title);
        TimerDialogDisplay(timerDialog, true);
        TimerDialogUtil._sl_cache["_t" + GetHandleId(timer)] = timerDialog;
        TimerStart(timer, timeout, periodic, null);
        BaseUtil.runLater(timeout, () => {
            DestroyTimerDialog(timerDialog);
            DestroyTimer(timer);
        });
        return timerDialog;
    }
}
