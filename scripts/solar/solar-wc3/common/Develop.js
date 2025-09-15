import Log from "@sl-wc3/Log";
import { Trigger } from "@/trigger";
import { MapPlayer } from "@/player";
import ClosureCounter from "@sl-wc3/lib/debug/ClosureCounter";
import BaseUtil from "@/BaseUtil";
import FrameDebug from "@sl-wc3/lib/debug/FrameDebug";
import HandleDebug from "@sl-wc3/lib/debug/HandleDebug";
import DebugGameUtil from "@/DebugGameUtil";
import FunctionDebug from "@sl-wc3/lib/debug/FunctionDebug";
let runtime = require('jass.runtime');
let jDebug = require('jass.debug');
let jass = require('jass.common');
export default class Develop {
    static debuggerPort = 4279;
    static isSocketDebug = false;
    /**
     * 启用太阳编辑器游戏插件库
     */
    static _sl_egp_enable = true;
    static open() {
        //test
        runtime.debugger = Develop.debuggerPort;
        runtime.console = true;
        isDebug = true;
        if (!DzTriggerRegisterSyncData) {
            print("本地开发环境DzApi不存在!请检查编辑器与相关辅助程序是否安装正确(请使用推荐的版本),加入QQ群941442872了解更多信息！");
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, '当前环境无完整Japi！');
        }
        try {
            require("_SLA_temp");
            let _SL_version_info = "编译版本号:" + _G['_SL_version_info'];
            print(_SL_version_info);
        }
        catch (e) {
        }
        //de 0
        if (isEmbedJapi) {
            let pv = tostring(GetPluginVersion());
            if (_G.CreateDoodad) {
                pv = pv + "_sp3";
            }
            else if (_G.DzGetPlayerSelectedHero) {
                pv = pv + "_sp2";
            }
            else if (_G.GetRealSelectItem) {
                pv = pv + "_sp1";
            }
            print("内置Japi版本=" + pv);
        }
        if (Develop.isSocketDebug) {
            pcall(function () {
                let dbg = require('debugger');
                dbg.io('listen:127.0.0.1:' + Develop.debuggerPort);
                dbg.start();
                print("启动Lua Socket调试 " + Develop.debuggerPort);
            });
        }
        //
        let _require = require;
        try {
            let RunConfigMainClass = _require("_sre._sl_egp.main.RunConfigMain").default;
            new RunConfigMainClass();
        }
        catch (e) {
            print(e);
            print("提示：更新此地图太阳TS框架可以启用编辑器调试工具插件!");
        }
        //加载太阳编辑器游戏插件 如果有的话
        BaseUtil.runLater(0.01, () => {
            if (Develop._sl_egp_enable) {
                try {
                    PACKAGE.path = tostring(local_map_dir_path || "") + 'scripts\\?.lua;' +
                        tostring(local_map_dir_path || "") + '\\?.lua;' +
                        PACKAGE.path + ';_sre\\?.lua;';
                    _require("_sl_egp._sl_egp");
                }
                catch (e) {
                    print("提示：更新此地图太阳TS框架可以启用编辑器调试工具插件!");
                }
            }
        });
        //
        let trigger = new Trigger();
        trigger.registerPlayerChatEvent(MapPlayer.fromIndex(0), "d", true);
        trigger.addAction(() => {
            Develop.showDebugInfo();
        });
        //
        let trigger2 = new Trigger();
        trigger2.registerPlayerChatEvent(MapPlayer.fromIndex(0), "stop", true);
        trigger2.addAction(() => {
            log.debug('暂停Lua垃圾回收:' + collectgarbage('stop'));
        });
        ClosureCounter.init();
        FrameDebug.init();
        HandleDebug.init();
        FunctionDebug.init();
    }
    static close() {
        runtime.console = false;
        isDebug = false;
        Log.enable = false;
        Log.enablePrint = false;
    }
    static showDebugInfo() {
        log.debug(DebugGameUtil.getDebugInfo());
    }
}
