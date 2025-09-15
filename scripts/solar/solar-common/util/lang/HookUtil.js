import Cache from "../../tool/Cache";
export default class HookUtil {
    static cache = new Cache();
    /**调整玩家属性值*/
    static onAdjustPlayerStateBJ(listener) {
        let listeners = HookUtil.cache.get("onAdjustPlayerStateBJ", () => {
            let callbacks = [];
            let oldCallback = AdjustPlayerStateBJ;
            _G.AdjustPlayerStateBJ = function (delta, whichPlayer, whichPlayerState) {
                for (let callback of callbacks) {
                    callback(delta, whichPlayer, whichPlayerState);
                }
                return oldCallback(delta, whichPlayer, whichPlayerState);
            };
            return callbacks;
        });
        listeners.push(listener);
    }
    /**增加科技等级*/
    static onAddPlayerTechResearched(listener) {
        let listeners = HookUtil.cache.get("onAddPlayerTechResearched", () => {
            let callbacks = [];
            let oldCallback = AddPlayerTechResearched;
            _G.AddPlayerTechResearched = function (whichPlayer, techid, levels) {
                for (let callback of callbacks) {
                    callback(whichPlayer, techid, levels);
                }
                return oldCallback(whichPlayer, techid, levels);
            };
            return callbacks;
        });
        listeners.push(listener);
    }
    static onUnitAddAbility(listener) {
        let cs = HookUtil.cache.get("onUnitAddAbility", () => {
            let cst = [];
            let old = UnitAddAbility;
            _G.UnitAddAbility = function (whichUnit, abilityid) {
                for (let c of cst) {
                    c(whichUnit, abilityid);
                }
                return old(whichUnit, abilityid);
            };
            return cst;
        });
        cs.push(listener);
    }
    static onUnitRemoveAbility(listener) {
        let cs = HookUtil.cache.get("onUnitRemoveAbility", () => {
            let cst = [];
            let old = UnitRemoveAbility;
            _G.UnitRemoveAbility = function (whichUnit, abilityid) {
                for (let c of cst) {
                    c(whichUnit, abilityid);
                }
                return old(whichUnit, abilityid);
            };
            return cst;
        });
        cs.push(listener);
    }
    /**  Hook a function with your own logic that will execute after the original function. */
    static hookArguments(oldFunc, newFunc) {
        return (...args) => {
            let val = oldFunc(...args);
            newFunc(...args);
            return val;
        };
    }
    /**  Hook a function with your own logic that will execute before the original function. */
    static hookArgumentsBefore(oldFunc, newFunc) {
        return (...args) => {
            newFunc(...args);
            return oldFunc(...args);
        };
    }
    /**  Hook a function that will execute your own function and passes the result of the original to the new function. */
    static hookResult(hookFunc, passFunc) {
        return (...args) => {
            let value = hookFunc(...args);
            passFunc(value);
            return value;
        };
    }
    /**  Hook a function that will execute your own function and passes the result of the original to the new function. */
    static hookResultNoThis(hookFunc, passFunc) {
        return (...args) => {
            let value = hookFunc(...args);
            passFunc(value);
            return value;
        };
    }
}
