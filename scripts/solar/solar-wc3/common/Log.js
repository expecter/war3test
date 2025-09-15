import ErrorMsgHelper from "@/ErrorMsgHelper";
const log = require('jass.log');
/** @noSelf **/
export default class Log {
    static enable = true;
    static enablePrint = true;
    static index = 1;
    get path() {
        return log.path;
    }
    set path(path) {
        // @ts-ignore
        log.path = path;
    }
    trace(...args) {
        if (Log.enablePrint) {
            print("Log.trace:", ...args);
        }
        if (Log.enable) {
            log.trace(...args);
        }
    }
    debug(...args) {
        if (Log.enablePrint) {
            print("Log.debug:", ...args);
        }
        if (Log.enable) {
            log.debug(...args);
        }
    }
    info(...args) {
        if (Log.enablePrint) {
            print("Log.info:", ...args);
        }
        if (Log.enable) {
            log.info(...args);
        }
    }
    warn(...args) {
        if (Log.enablePrint) {
            print("Log.warn:", ...args);
        }
        if (Log.enable) {
            log.warn(...args);
        }
    }
    error(...args) {
        if (Log.enablePrint) {
            print("Log.error:", ...args);
        }
        if (Log.enable) {
            log.error(...args);
        }
    }
    errorWithTraceBack(...args) {
        Log.index++;
        let tb = debug.traceback();
        if (Log.enablePrint) {
            if (args && args.length > 0) {
                DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30, tostring(args[0]));
            }
            print("Log.errorWithTraceBack:", ...args);
            print("===========Error TraceBack Start[No." + Log.index + "]===========");
            print(tb);
            print("===========Error TraceBack End[No." + Log.index + "]===========");
            if (args && args.length > 0) {
                ErrorMsgHelper.error_handle(args[0]);
            }
            else {
                ErrorMsgHelper.error_handle("");
            }
        }
        if (Log.enable) {
            log.error(...args);
            log.error("===========Error TraceBack Start[No." + Log.index + "]===========");
            log.error(tb);
            log.error("===========Error TraceBack End[No." + Log.index + "]===========");
        }
    }
    fatal(...args) {
        if (Log.enablePrint) {
            print("Log.fatal:", ...args);
        }
        if (Log.enable) {
            log.fatal(...args);
        }
    }
}
