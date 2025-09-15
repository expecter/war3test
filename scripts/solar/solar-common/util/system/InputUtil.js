import Cache from "@/Cache";
import AsyncUtil from "@/AsyncUtil";
import BaseUtil from "@/BaseUtil";
import SolarTrigger from "@/SolarTrigger";
import InputEvent from "@/InputEvent";
export default class InputUtil {
    static cache = new Cache();
    static _sl_isMouseLeftButtonDown = false;
    /**
     * 键盘按下
     * @param key
     * @param callback
     * @param isSync 是否同步
     */
    static onKeyPressed(key, callback, isSync = false) {
        let solarTriggerSet = InputUtil.cache.get("onKeyPressed:" + key + ":" + isSync, () => {
            let stSet = [];
            if (isSync) {
                if (isAsync) {
                    log.errorWithTraceBack("不能在异步环境注册同步事件!");
                    return;
                }
                let t = CreateTrigger();
                DzTriggerRegisterKeyEventByCode(t, key, 1, true, null);
                TriggerAddAction(t, () => {
                    for (let i = stSet.length - 1; i >= 0; i--) {
                        stSet[i].exec();
                    }
                });
            }
            else {
                DzTriggerRegisterKeyEventByCode(null, key, 1, false, () => {
                    isAsync = true;
                    for (let i = stSet.length - 1; i >= 0; i--) {
                        stSet[i].exec();
                    }
                    isAsync = false;
                });
            }
            return stSet;
        });
        return new SolarTrigger((solarTrigger) => {
            callback(InputEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 键盘释放
     * @param key
     * @param callback
     * @param isSync
     */
    static onKeyReleased(key, callback, isSync = false) {
        let solarTriggerSet = InputUtil.cache.get("onKeyReleased:" + key + ":" + isSync, () => {
            let stSet = [];
            if (isSync) {
                if (isAsync) {
                    log.errorWithTraceBack("不能在异步环境注册同步事件!");
                    return;
                }
                let t = CreateTrigger();
                DzTriggerRegisterKeyEventByCode(t, key, 0, true, null);
                TriggerAddAction(t, () => {
                    for (let i = stSet.length - 1; i >= 0; i--) {
                        stSet[i].exec();
                    }
                });
            }
            else {
                DzTriggerRegisterKeyEventByCode(null, key, 0, false, () => {
                    isAsync = true;
                    for (let i = stSet.length - 1; i >= 0; i--) {
                        stSet[i].exec();
                    }
                    isAsync = false;
                });
            }
            return stSet;
        });
        return new SolarTrigger((solarTrigger) => {
            callback(InputEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 鼠标左键按下
     * @param callback
     */
    static onMouseLeftButtonPressed(callback) {
        let solarTriggerSet = InputUtil.cache.get("onMouseLeftButtonPressed", () => {
            let stSet = [];
            DzTriggerRegisterMouseEventByCode(null, 1, 1, false, () => {
                isAsync = true;
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
                isAsync = false;
            });
            return stSet;
        });
        return new SolarTrigger((solarTrigger) => {
            callback(InputEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 鼠标左键释放
     * @param callback
     */
    static onMouseLeftButtonReleased(callback) {
        let solarTriggerSet = InputUtil.cache.get("onMouseLeftButtonReleased", () => {
            let stSet = [];
            DzTriggerRegisterMouseEventByCode(null, 1, 0, false, () => {
                isAsync = true;
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
                isAsync = false;
            });
            return stSet;
        });
        return new SolarTrigger((solarTrigger) => {
            callback(InputEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 鼠标右键按下
     * @param callback
     */
    static onMouseRightButtonPressed(callback) {
        let solarTriggerSet = InputUtil.cache.get("onMouseRightButtonPressed", () => {
            let stSet = [];
            DzTriggerRegisterMouseEventByCode(null, 2, 1, false, () => {
                isAsync = true;
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
                isAsync = false;
            });
            return stSet;
        });
        return new SolarTrigger((solarTrigger) => {
            callback(InputEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 鼠标右键释放
     * @param callback
     */
    static onMouseRightButtonReleased(callback) {
        let solarTriggerSet = InputUtil.cache.get("onMouseRightButtonReleased", () => {
            let stSet = [];
            DzTriggerRegisterMouseEventByCode(null, 2, 0, false, () => {
                isAsync = true;
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
                isAsync = false;
            });
            return stSet;
        });
        return new SolarTrigger((solarTrigger) => {
            callback(InputEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 添加鼠标移动事件
     * (内置环境下 此函数不能在鼠标回调事件中调用 否则崩溃 延迟执行即可)
     * @param actionFunc
     * @param key
     * @param delay 延迟执行
     */
    static onMouseMoveEvent(actionFunc, key = "slmm" + AsyncUtil.getUUIDAsync(), delay = 0.1) {
        BaseUtil.runLater(delay, () => {
            let callbacks = InputUtil.cache.get("onMouseMoveEvent", () => {
                let cbs = {};
                DzTriggerRegisterMouseMoveEventByCode(null, false, () => {
                    isAsync = true;
                    for (let key in cbs) {
                        cbs[key]?.();
                    }
                    isAsync = false;
                });
                return cbs;
            });
            callbacks[key] = actionFunc;
        });
        return key;
    }
    /**
     * 移除 鼠标移动事件
     * @param key
     */
    static removeMouseMoveEvent(key) {
        let callbacks = InputUtil.cache.get("onMouseMoveEvent");
        if (callbacks) {
            callbacks[key] = null;
        }
    }
    /**
     * 是否左键按下
     */
    static isMouseRightButtonDown() {
        InputUtil._sl_init_isMouseLeftButtonDown();
        return InputUtil._sl_isMouseLeftButtonDown;
    }
    /**
     * 计算鼠标所在的X 0-0.8
     */
    static getMouseSceneX() {
        let sceneX = DzGetMouseXRelative() / DzGetClientWidth() * 0.8;
        return sceneX;
    }
    /**
     * 计算鼠标所在的X 0-0.6 (从下到上)
     */
    static getMouseSceneY() {
        let sceneY = DzGetMouseYRelative() / DzGetClientHeight() * 0.6;
        return 0.6 - sceneY;
    }
    static _sl_last_click_unit_info = null;
    /**
     * 本地玩家 异步双击单位 (比如模拟双击选择相同类型的单位可以使用这个)
     */
    static onUnitMouseDoubleClicked(callback) {
        InputUtil.onMouseLeftButtonReleased((event, solarTrigger) => {
            let tu = DzGetUnitUnderMouse();
            if (!IsHandle(tu)) {
                return;
            }
            let lastSelectInfo = InputUtil._sl_last_click_unit_info;
            if (lastSelectInfo == null) {
                InputUtil._sl_last_click_unit_info = { unit: tu, time: _g_time };
                return;
            }
            if (lastSelectInfo.unit == tu && (_g_time - lastSelectInfo.time) < 1000) {
                callback(InputEvent.instance, solarTrigger, tu);
            }
            lastSelectInfo.unit = tu;
            lastSelectInfo.time = _g_time;
        });
    }
    /**
     * solar addons helper
     */
    static _sl_init_isMouseLeftButtonDown_flag = false;
    static _sl_init_isMouseLeftButtonDown() {
        if (InputUtil._sl_init_isMouseLeftButtonDown_flag) {
            return;
        }
        //释放鼠标左键事件
        InputUtil.onMouseLeftButtonPressed(() => {
            InputUtil._sl_isMouseLeftButtonDown = true;
        });
        InputUtil.onMouseLeftButtonReleased(() => {
            InputUtil._sl_isMouseLeftButtonDown = false;
        });
        InputUtil._sl_init_isMouseLeftButtonDown_flag = true;
    }
}
