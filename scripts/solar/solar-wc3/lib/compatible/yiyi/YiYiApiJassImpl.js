/** @noSelfInFile */
import JassBridgeUtil from "@sl-wc3/game/JassBridgeUtil";
import SingletonUtil from "@/SingletonUtil";
let sl_bridge = null;
/**
 * 使用前置条件:
 * 需要在自定义函数加上这些jass声明
 *
 */
/** @noSelf */
export default class YiYiApiJassImpl {
    static uiCallback = {};
    static keyCallback = {};
    static mouseCallback = {};
    static mouseMoveEventCallbacks = [];
    static frameUpdateCallback = [];
    static init() {
        sl_bridge = require('jass.globals')["sl_bridge"];
        JassBridgeUtil.sl_bridge = sl_bridge;
        _G.InitGameCache = YiYiApiJassImpl.sl_bridge_InitGameCache;
        _G.SaveGameCache = YiYiApiJassImpl.sl_bridge_SaveGameCache;
        _G.DzCreateFrame = YiYiApiJassImpl.sl_bridge_DzCreateFrame;
        _G.DzCreateFrameByTagName = YiYiApiJassImpl.sl_bridge_DzCreateFrameByTagName;
        _G.DzFrameSetScriptByCode = YiYiApiJassImpl.sl_bridge_DzFrameSetScriptByCode;
        _G.DzTriggerRegisterKeyEventByCode = YiYiApiJassImpl.sl_bridge_DzTriggerRegisterKeyEventByCode;
        _G.DzTriggerRegisterMouseEventByCode = YiYiApiJassImpl.sl_bridge_DzTriggerRegisterMouseEventByCode;
        _G.DzTriggerRegisterMouseMoveEventByCode = YiYiApiJassImpl.sl_bridge_DzTriggerRegisterMouseMoveEventByCode;
        _G.DzFrameSetUpdateCallbackByCode = YiYiApiJassImpl.sl_bridge_DzFrameSetUpdateCallbackByCode;
        //
        _G.StoreInteger = YiYiApiJassImpl.sl_bridge_StoreInteger;
        _G.StoreString = YiYiApiJassImpl.sl_bridge_StoreString;
        //
        _G.GetStoredInteger = YiYiApiJassImpl.sl_bridge_GetStoredInteger;
        _G.GetStoredReal = YiYiApiJassImpl.sl_bridge_GetStoredReal;
        _G.GetStoredBoolean = YiYiApiJassImpl.sl_bridge_GetStoredBoolean;
        _G.GetStoredString = YiYiApiJassImpl.sl_bridge_GetStoredString;
        //
        YiYiApiJassImpl.hook_sl_bridge_ui_callback();
    }
    static hook_sl_bridge_ui_callback() {
        _G.on_slbu_cb = function () {
            let event_id = LoadInteger(sl_bridge, 3, 3);
            let triggerUIEventFrame = LoadInteger(sl_bridge, 3, 4);
            let callbackFun = YiYiApiJassImpl.uiCallback[event_id + "_" + triggerUIEventFrame];
            if (callbackFun) {
                callbackFun();
            }
        };
        _G.on_slbk_cb = function () {
            let status = LoadInteger(sl_bridge, 4, 4);
            let key = LoadInteger(sl_bridge, 4, 5);
            let callbackFun = YiYiApiJassImpl.keyCallback[key + "_" + status];
            if (callbackFun) {
                for (let fun of callbackFun) {
                    fun();
                }
            }
        };
        _G.on_slbm_cb = function () {
            let status = LoadInteger(sl_bridge, 5, 5);
            let key = LoadInteger(sl_bridge, 5, 6);
            let callbackFun = YiYiApiJassImpl.mouseCallback[key + "_" + status];
            if (callbackFun) {
                for (let fun of callbackFun) {
                    fun();
                }
            }
        };
        _G.on_slbmm_cb = function () {
            for (let fun of YiYiApiJassImpl.mouseMoveEventCallbacks) {
                fun();
            }
        };
        _G.on_slbfu_cb = function () {
            for (let fun of YiYiApiJassImpl.frameUpdateCallback) {
                fun();
            }
        };
    }
    /**
     * Get
     */
    static sl_bridge_GetStoredString(cache, missionKey, key) {
        require('jass.globals')["sl_bridge_gamecache"] = cache;
        SaveStr(sl_bridge, 1, 2, missionKey);
        SaveStr(sl_bridge, 1, 3, key);
        DzExecuteFunc("sl_bridge_GetStoredString");
        return JassBridgeUtil.getResultAsStr();
    }
    static sl_bridge_GetStoredBoolean(cache, missionKey, key) {
        require('jass.globals')["sl_bridge_gamecache"] = cache;
        SaveStr(sl_bridge, 1, 2, missionKey);
        SaveStr(sl_bridge, 1, 3, key);
        DzExecuteFunc("sl_bridge_GetStoredBoolean");
        return JassBridgeUtil.getResultAsBoolean();
    }
    static sl_bridge_GetStoredReal(cache, missionKey, key) {
        require('jass.globals')["sl_bridge_gamecache"] = cache;
        SaveStr(sl_bridge, 1, 2, missionKey);
        SaveStr(sl_bridge, 1, 3, key);
        DzExecuteFunc("sl_bridge_GetStoredReal");
        return JassBridgeUtil.getResultAsReal();
    }
    static sl_bridge_GetStoredInteger(cache, missionKey, key) {
        require('jass.globals')["sl_bridge_gamecache"] = cache;
        SaveStr(sl_bridge, 1, 2, missionKey);
        SaveStr(sl_bridge, 1, 3, key);
        DzExecuteFunc("sl_bridge_GetStoredInteger");
        return JassBridgeUtil.getResultAsInt();
    }
    /**
     * Store
     */
    static sl_bridge_StoreString(cache, missionKey, key, value) {
        require('jass.globals')["sl_bridge_gamecache"] = cache;
        SaveStr(sl_bridge, 1, 2, missionKey);
        SaveStr(sl_bridge, 1, 3, key);
        SaveStr(sl_bridge, 1, 4, value);
        DzExecuteFunc("sl_bridge_StoreString");
        return true;
    }
    static sl_bridge_StoreInteger(cache, missionKey, key, value) {
        require('jass.globals')["sl_bridge_gamecache"] = cache;
        SaveStr(sl_bridge, 1, 2, missionKey);
        SaveStr(sl_bridge, 1, 3, key);
        SaveInteger(sl_bridge, 1, 4, value);
        DzExecuteFunc("sl_bridge_StoreInteger");
    }
    static sl_bridge_SaveGameCache(whichCache) {
        require('jass.globals')["sl_bridge_gamecache"] = whichCache;
        DzExecuteFunc("sl_bridge_SaveGameCache");
        return JassBridgeUtil.getResultAsBoolean();
    }
    static sl_bridge_InitGameCache(campaignFile) {
        SaveStr(sl_bridge, 1, 1, campaignFile);
        DzExecuteFunc("sl_bridge_InitGameCache");
        return require('jass.globals')["sl_bridge_gamecache"];
    }
    static sl_bridge_DzCreateFrame(frame, parent, id) {
        SaveStr(sl_bridge, 1, 1, frame);
        SaveInteger(sl_bridge, 1, 2, parent);
        SaveInteger(sl_bridge, 1, 3, id);
        DzExecuteFunc("sl_bridge_DzCreateFrame");
        return JassBridgeUtil.getResultAsInt();
    }
    static sl_bridge_DzCreateFrameByTagName(frameType, name, parent, template, id) {
        if (template == "") {
            template = " "; //哈希表 存储
        }
        SaveStr(sl_bridge, 1, 1, frameType);
        SaveStr(sl_bridge, 1, 2, name);
        SaveInteger(sl_bridge, 1, 3, parent);
        SaveStr(sl_bridge, 1, 4, template);
        SaveInteger(sl_bridge, 1, 5, id);
        DzExecuteFunc("sl_bridge_DzCreateFrameByTagName");
        return JassBridgeUtil.getResultAsInt();
    }
    //
    static sl_bridge_DzFrameSetScriptByCode(frame, eventId, funcHandle, sync) {
        SaveInteger(sl_bridge, 1, 1, frame);
        SaveInteger(sl_bridge, 1, 2, eventId);
        YiYiApiJassImpl.uiCallback[eventId + "_" + frame] = funcHandle;
        SaveBoolean(sl_bridge, 1, 4, sync);
        if (sync == true) {
            print("此环境下FrameSetScriptByCode sync只能为false，如需同步请自行手动同步。");
        }
        DzExecuteFunc("sl_bridge_DzFrameSetScriptByCode");
    }
    //
    static sl_bridge_DzTriggerRegisterKeyEventByCode(trig, key, status, sync, funcHandle) {
        SaveInteger(sl_bridge, 1, 2, key);
        SaveInteger(sl_bridge, 1, 3, status);
        SaveBoolean(sl_bridge, 1, 4, sync);
        if (sync == true) {
            print("此环境下TriggerRegisterKeyEventByCode sync只能为false，如需同步请自行手动同步。");
        }
        if (YiYiApiJassImpl.keyCallback[key + "_" + status] != null) {
            //说明已经注册过此key了
            YiYiApiJassImpl.keyCallback[key + "_" + status].push(funcHandle);
            return;
        }
        YiYiApiJassImpl.keyCallback[key + "_" + status] = [];
        YiYiApiJassImpl.keyCallback[key + "_" + status].push(funcHandle);
        DzExecuteFunc("sl_bridge_DzTriggerRegisterKeyEventByCode");
    }
    //
    static sl_bridge_DzTriggerRegisterMouseEventByCode(trig, btn, status, sync, funcHandle) {
        SaveInteger(sl_bridge, 1, 2, btn);
        SaveInteger(sl_bridge, 1, 3, status);
        SaveBoolean(sl_bridge, 1, 4, sync);
        if (sync == true) {
            print("此环境下TriggerRegisterMouseEventByCode sync只能为false，如需同步请自行手动同步。");
        }
        if (YiYiApiJassImpl.mouseCallback[btn + "_" + status] != null) {
            //说明已经注册过此key了
            YiYiApiJassImpl.mouseCallback[btn + "_" + status].push(funcHandle);
            return;
        }
        YiYiApiJassImpl.mouseCallback[btn + "_" + status] = [];
        YiYiApiJassImpl.mouseCallback[btn + "_" + status].push(funcHandle);
        DzExecuteFunc("sl_bridge_DzTriggerRegisterMouseEventByCode");
    }
    //
    static sl_bridge_DzTriggerRegisterMouseMoveEventByCode(trig, sync, funcHandle) {
        SaveBoolean(sl_bridge, 1, 2, sync);
        if (sync == true) {
            print("此环境下TriggerRegisterMouseMoveEventByCode sync只能为false，如需同步请自行手动同步。");
        }
        YiYiApiJassImpl.mouseMoveEventCallbacks.push(funcHandle);
        SingletonUtil.executeOnce("init_sl_bridge_DzTriggerRegisterMouseMoveEventByCode", () => {
            DzExecuteFunc("init_sl_bridge_DzTriggerRegisterMouseMoveEventByCode");
        });
    }
    //
    static sl_bridge_DzFrameSetUpdateCallbackByCode(funcHandle) {
        YiYiApiJassImpl.frameUpdateCallback.push(funcHandle);
        SingletonUtil.executeOnce("init_sl_bridge_DzFrameSetUpdateCallbackByCode", () => {
            DzExecuteFunc("init_sl_bridge_DzFrameSetUpdateCallbackByCode");
        });
    }
}
