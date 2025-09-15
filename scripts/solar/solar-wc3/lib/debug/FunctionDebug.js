export default class FunctionDebug {
    static is_init = false;
    static init() {
        if (FunctionDebug.is_init) {
            return;
        }
        FunctionDebug.is_init = true;
        //
        let oldTriggerSleepAction = TriggerSleepAction;
        _G.TriggerSleepAction = function (timeout) {
            if (require("jass.runtime").sleep != true) {
                log.errorWithTraceBack("TriggerSleepAction等待函数在lua中不受支持，请使用计时器替换执行逻辑!");
            }
            oldTriggerSleepAction(timeout);
        };
        let oldTriggerWaitForSound = TriggerWaitForSound;
        _G.TriggerWaitForSound = function (s, offset) {
            if (require("jass.runtime").sleep != true) {
                log.errorWithTraceBack("TriggerWaitForSound等待声音函数在lua中不受支持，请使用计时器替换执行逻辑!");
            }
            oldTriggerWaitForSound(s, offset);
        };
        let oldTriggerSyncReady = TriggerSyncReady;
        _G.TriggerSyncReady = function () {
            if (require("jass.runtime").sleep != true) {
                log.errorWithTraceBack("TriggerSyncReady等待函数在lua中不受支持，请使用计时器替换执行逻辑!");
            }
            oldTriggerSyncReady();
        };
        // SyncSelections
    }
}
