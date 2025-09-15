/** @noSelfInFile */
import mitt from '@//lib/mitt';
import Cache from "@/tool/Cache";
import TriggerUtil from "@/util/system/TriggerUtil";
import UnitSpellEvent from "@/tool/event/UnitSpellEvent";
import UnitDeathEvent from "@/tool/event/UnitDeathEvent";
import UnitAttackedEvent from "@/tool/event/UnitAttackedEvent";
import UnitDamagedEvent from "../tool/event/UnitDamagedEvent";
import UnitEvent from "../tool/event/UnitEvent";
import UnitItemEvent from "../tool/event/UnitItemEvent";
import SingletonUtil from "@/SingletonUtil";
import SolarTrigger from "@/SolarTrigger";
import DataBase from "@/DataBase";
import PlayerEvent from "@/PlayerEvent";
import UIFrameEvent from "@/UIFrameEvent";
const emitter = mitt();
const cache = new Cache();
/**
 * 太阳事件(总线)
 * 所有监听的事件回调公用一个触发器去注册
 * (相同事件后注册的会先执行 最先注册的会最后执行 倒序遍历数组. 如果需要后注册的后执行 可以考虑使用原生的trigger)
 */
export default class SolarEvent {
    constructor() {
        if (SingletonUtil.notFirstTime(SolarEvent)) {
            print("不能重复new SolarEvent() 请直接使用全局变量se进行访问");
            return;
        }
    }
    /**
     * 注册一个事件接收器
     * @param type
     * @param handler
     */
    on(type, handler) {
        const key = "on:" + type;
        let solarTriggerSet = cache.get(key, () => {
            let stSet = [];
            emitter.on(type, (data) => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec(data);
                }
            });
            return stSet;
        });
        return new SolarTrigger((self, data) => {
            handler(data, self);
        }, solarTriggerSet);
    }
    /**
     * 发布一个事件
     * @param type
     * @param data
     */
    emit(type, data) {
        emitter.emit(type, data);
    }
    /**
     * 玩家输入聊天信息
     * @deprecated see onPlayerChat
     */
    playerChat(chatMessageToDetect, callback, exactMatchOnly = true) {
        return this.onPlayerChat(chatMessageToDetect, (e, s) => {
            callback(e.triggerPlayer, e.eventPlayerChatString);
        }, exactMatchOnly);
    }
    /**
     *   玩家输入聊天信息
     * @param chatMessageToDetect
     * @param callback
     * @param exactMatchOnly  传入false则包含匹配 传入true 则完整匹配
     */
    onPlayerChat(chatMessageToDetect, callback, exactMatchOnly = true) {
        const key = "onPlayerChat:" + chatMessageToDetect + ":" + exactMatchOnly;
        let solarTriggerSet = cache.get(key, () => {
            let stSet = [];
            let trigger = CreateTrigger();
            for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
                TriggerRegisterPlayerChatEvent(trigger, Player(i), chatMessageToDetect, exactMatchOnly);
            }
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
            });
            return stSet;
        });
        return new SolarTrigger((solarTrigger) => {
            callback(PlayerEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 任意单位伤害事件
     * @deprecated see onUnitDamaged
     */
    unitDamaged(callback, onlyHasDamageSource = true) {
        const key = "unitDamaged";
        let solarTriggerSet = cache.get(key, () => {
            let stSet = [];
            let trigger = CreateTrigger();
            TriggerUtil.SystemAnyUnitDamagedRegistTrigger(trigger);
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
            });
            return stSet;
        });
        return new SolarTrigger(() => {
            if (onlyHasDamageSource && !IsHandle(GetEventDamageSource())) {
                return;
            }
            callback(GetTriggerUnit(), GetEventDamageSource(), GetEventDamage());
        }, solarTriggerSet);
    }
    /**
     * 通常应该使用   SolarDamageState.addEventHandler()
     * 在启用太阳伤害系统SolarDamageState时  直接在此处设置伤害值可能不会生效 请用SolarDamageState.addEventHandler()
     * @param callback
     * @param onlyHasDamageSource 默认会判断是否有伤害来源 (投射物射出后 单位死亡 然后投射物造成伤害可能会导致造成伤害却没有伤害来源单位)
     */
    onUnitDamaged(callback, onlyHasDamageSource = true) {
        const key = "onUnitDamaged";
        let solarTriggerSet = cache.get(key, () => {
            let stSet = [];
            let trigger = CreateTrigger();
            TriggerUtil.SystemAnyUnitDamagedRegistTrigger(trigger);
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
            });
            return stSet;
        });
        return new SolarTrigger((solarTrigger) => {
            if (onlyHasDamageSource && !IsHandle(GetEventDamageSource())) {
                return;
            }
            callback(UnitDamagedEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 任意单位离开区域
     */
    onLeaveRect(whichRect = bj_mapInitialPlayableArea, callback) {
        const key = "onLeaveRect:" + GetHandleId(whichRect);
        let solarTriggerSet = cache.get(key, () => {
            let stSet = [];
            let rectRegion = CreateRegion();
            RegionAddRect(rectRegion, whichRect);
            //任意单位死亡事件
            let trigger = CreateTrigger();
            TriggerRegisterLeaveRegion(trigger, rectRegion, null);
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
            });
            return stSet;
        });
        return new SolarTrigger((solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 单位进入区域
     */
    onEnterRect(whichRect = bj_mapInitialPlayableArea, callback) {
        const key = "onEnterRect:" + GetHandleId(whichRect);
        let solarTriggerSet = cache.get(key, () => {
            let stSet = [];
            let rectRegion = CreateRegion();
            RegionAddRect(rectRegion, whichRect);
            //任意单位死亡事件
            let trigger = CreateTrigger();
            TriggerRegisterEnterRegion(trigger, rectRegion, null);
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
            });
            return stSet;
        });
        return new SolarTrigger((solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 当任意单位进入可用地图区域
     * @param callback
     */
    onUnitEnterMapRect(callback) {
        const key = "onUnitEnterMapRect";
        let solarTriggerSet = cache.get(key, () => {
            let stSet = [];
            let rectRegion = CreateRegion();
            RegionAddRect(rectRegion, GetPlayableMapRect());
            //任意单位死亡事件
            let trigger = CreateTrigger();
            TriggerRegisterEnterRegion(trigger, rectRegion, null);
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
            });
            return stSet;
        });
        return new SolarTrigger((solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 任意单位事件 - 抵押
     * @param callback
     */
    onUnitPawnItem(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_PAWN_ITEM, (triggerUnit, solarTrigger) => {
            callback(UnitItemEvent.instance, solarTrigger);
        });
    }
    /**
     * 任意单位事件 - 出售物品
     * @param callback
     */
    onUnitSellItem(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_SELL_ITEM, (triggerUnit, solarTrigger) => {
            callback(UnitItemEvent.instance, solarTrigger);
        });
    }
    /**
     * 任意单位事件 - 获得物品
     * @param callback
     */
    onUnitPickupItem(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, (triggerUnit, solarTrigger) => {
            callback(UnitItemEvent.instance, solarTrigger);
        });
    }
    /**
     * 任意单位事件 - 丢弃物品
     * @param callback
     */
    onUnitDropItem(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, (triggerUnit, solarTrigger) => {
            callback(UnitItemEvent.instance, solarTrigger);
        });
    }
    /**
     * 任意单位事件 - 使用物品
     * @param callback
     */
    onUnitUseItem(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_USE_ITEM, (triggerUnit, solarTrigger) => {
            callback(UnitItemEvent.instance, solarTrigger);
        });
    }
    /**
     * 玩家单位事件 - 开始建造
     * @param callback
     */
    onUnitConstructStart(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_CONSTRUCT_START, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        });
    }
    /**
     * 玩家单位事件 - 完成建造
     * @param callback
     */
    onUnitConstructFinish(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_CONSTRUCT_FINISH, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        });
    }
    /**
     * 玩家单位事件 - 取消建造
     * @param callback
     */
    onUnitConstructCancel(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        });
    }
    /**
     * 玩家单位事件 - 完成建筑升级
     * @param callback
     */
    onUnitUpgradeFinish(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_UPGRADE_FINISH, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        });
    }
    /**
     * 玩家单位事件 - 开始训练
     * @param callback
     */
    onUnitTrainStart(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_TRAIN_START, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        });
    }
    /**
     * 玩家单位事件 - 完成训练
     * @param callback
     */
    onUnitTrainFinish(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_TRAIN_FINISH, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        });
    }
    /**
     * 任意玩家单位事件 - 选择单位
     * @param callback
     */
    onUnitSelected(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_SELECTED, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        });
    }
    static _sl_last_select_info = {};
    /**
     * 任意玩家双击选择单位事件
     * @param callback
     */
    onUnitDoubleClickSelected(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_SELECTED, (triggerUnit, solarTrigger) => {
            let tu = GetTriggerUnit();
            let playerId = GetPlayerId(GetOwningPlayer(tu));
            let lastSelectInfo = SolarEvent._sl_last_select_info[playerId];
            if (lastSelectInfo == null) {
                SolarEvent._sl_last_select_info[playerId] = { unit: tu, time: _g_time };
                return;
            }
            if (lastSelectInfo.unit == tu && (_g_time - lastSelectInfo.time) < 1000) {
                callback(UnitEvent.instance, solarTrigger);
            }
            lastSelectInfo.unit = tu;
            lastSelectInfo.time = _g_time;
        });
    }
    /**
     * 任意单位事件 - 准备施放技能
     * @param callback
     * @param abilityId
     */
    onUnitSpellChannel(callback, abilityId) {
        return this.anyUnitSpellEvent(EVENT_PLAYER_UNIT_SPELL_CHANNEL, callback, abilityId);
    }
    /**
     * 任意单位事件 - 开始施放技能
     * @param callback
     * @param abilityId
     */
    onUnitSpellCast(callback, abilityId) {
        return this.anyUnitSpellEvent(EVENT_PLAYER_UNIT_SPELL_CAST, callback, abilityId);
    }
    /**
     * 任意单位事件 - 发动技能效果
     * @param callback
     * @param abilityId
     */
    onUnitSpellEffect(callback, abilityId) {
        return this.anyUnitSpellEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, callback, abilityId);
    }
    /**
     * 任意单位事件 - 死亡
     * @param callback
     */
    unitDeath(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_DEATH, triggerUnit => {
            callback(triggerUnit, GetKillingUnit());
        });
    }
    /**
     * 任意单位事件 - 死亡
     * @param callback
     * @param unitTypeIdStr 指定单位类型
     */
    onUnitTypeDeath(callback, unitTypeIdStr) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_DEATH, null);
        const key = "anyUnitEvent:" + GetHandleId(EVENT_PLAYER_UNIT_DEATH);
        let solarTriggerSet = SolarEvent.getUnitTypeDataEventHandler(unitTypeIdStr, key, true);
        return new SolarTrigger((solarTrigger) => {
            callback(UnitDeathEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 任意单位事件 - 死亡
     * @param callback
     * @param unit 指定单位事件
     */
    onUnitDeath(callback, unit) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_DEATH, (t, solarTrigger) => {
            callback(UnitDeathEvent.instance, solarTrigger);
        }, unit);
    }
    /**
     * 任意单位事件 - 开始研究科技
     * @param callback
     */
    onUnitResearchStart(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_RESEARCH_START, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        });
    }
    /**
     * 任意单位事件 - 研究科技完成
     * @param callback
     */
    onUnitResearchFinish(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_RESEARCH_FINISH, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        });
    }
    /**
     * 任意单位事件 - 被攻击
     * @param callback
     * @deprecated see onUnitAttacked
     */
    unitAttacked(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_ATTACKED, triggerUnit => {
            callback(triggerUnit, GetAttacker());
        });
    }
    /**
     * 任意单位事件 - 被攻击
     * @param callback
     */
    onUnitAttacked(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_ATTACKED, (triggerUnit, solarTrigger) => {
            callback(UnitAttackedEvent.instance, solarTrigger);
        });
    }
    /**
     * 任意单位事件 - 出售单位
     * @param callback
     */
    onUnitSellUnit(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_SELL, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        });
    }
    /**
     * 任意单位 受到攻击伤害
     * 这个可以防止单位寸止 即抬手时就触发了被攻击事件
     * @param callback
     */
    onUnitAttackedDamage(callback) {
        return this.onUnitDamaged((e, solarTrigger) => {
            if (0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK)) {
                callback(e, solarTrigger);
            }
        });
    }
    /**
     * 英雄单位 - 升级
     * @param callback
     */
    onHeroLevelUp(callback) {
        return this.anyUnitEvent(EVENT_PLAYER_HERO_LEVEL, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger);
        });
    }
    /**
     * 任意单位事件
     */
    anyUnitEvent(whichPlayerUnitEvent, callback, unit) {
        const key = "anyUnitEvent:" + GetHandleId(whichPlayerUnitEvent);
        let solarTriggerSet = cache.get(key, () => {
            //任意单位事件
            let stSet = [];
            let trigger = CreateTrigger();
            for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
                TriggerRegisterPlayerUnitEvent(trigger, Player(i), whichPlayerUnitEvent, null);
            }
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
                //
                let dataEventHandler = SolarEvent.getUnitDataEventHandler(GetTriggerUnit(), key, false);
                if (dataEventHandler) {
                    for (let i = dataEventHandler.length - 1; i >= 0; i--) {
                        dataEventHandler[i].exec();
                    }
                }
                dataEventHandler = SolarEvent.getUnitTypeDataEventHandler(id2string(GetUnitTypeId(GetTriggerUnit())), key, false);
                if (dataEventHandler) {
                    for (let i = dataEventHandler.length - 1; i >= 0; i--) {
                        dataEventHandler[i].exec();
                    }
                }
            });
            return stSet;
        });
        if (callback == null) {
            return null;
        }
        if (IsHandle(unit)) {
            solarTriggerSet = SolarEvent.getUnitDataEventHandler(unit, key, true);
        }
        return new SolarTrigger((solarTrigger) => {
            callback(GetTriggerUnit(), solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 任意单位释放技能总事件
     */
    anyUnitSpellEvent(whichPlayerUnitEvent, callback, spellAbilityId) {
        const key = "anyUnitSpellEvent:" + GetHandleId(whichPlayerUnitEvent);
        let solarTriggerSet = cache.get(key, () => {
            //任意单位事件
            let stSet = [];
            let trigger = CreateTrigger();
            for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
                TriggerRegisterPlayerUnitEvent(trigger, Player(i), whichPlayerUnitEvent, null);
            }
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
                //
                let dataEventHandler = SolarEvent.getUnitSpellAbilityDataEventHandler(id2string(GetSpellAbilityId()), key, false);
                if (dataEventHandler) {
                    for (let i = dataEventHandler.length - 1; i >= 0; i--) {
                        dataEventHandler[i].exec();
                    }
                }
            });
            return stSet;
        });
        if (spellAbilityId) {
            solarTriggerSet = SolarEvent.getUnitSpellAbilityDataEventHandler(spellAbilityId, key, true);
        }
        return new SolarTrigger((solarTrigger) => {
            callback(UnitSpellEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 异步的ui 事件回调
     */
    onFrameEvent(frame, event, callback) {
        const key = "onFrameEvent:" + event;
        let funcHandle = cache.get(key, () => {
            //任意单位事件
            return () => {
                //
                let dataEventHandler = SolarEvent.getFrameDataEventHandler(DzGetTriggerUIEventFrame(), key, false);
                if (dataEventHandler) {
                    isAsync = true;
                    for (let i = dataEventHandler.length - 1; i >= 0; i--) {
                        dataEventHandler[i].exec();
                    }
                    isAsync = false;
                }
            };
        });
        //统一用一个闭包去注册
        DzFrameSetScriptByCode(frame, event, funcHandle, false);
        //
        let solarTriggerSet = SolarEvent.getFrameDataEventHandler(frame, key, true);
        return new SolarTrigger((solarTrigger) => {
            callback(UIFrameEvent.instance, solarTrigger);
        }, solarTriggerSet);
    }
    /**
     * 当任意单位进入指定单位的范围内时
     * 此事件暂时没有排泄  所以整个游戏不要注册太多本事件 推荐不超过 500次
     * @param unit
     * @param range
     * @param callback
     */
    onUnitInRange(unit, range, callback) {
        //锁死这个handle
        handle_ref(unit);
        let solarTriggerSet = [];
        let t = CreateTrigger();
        TriggerRegisterUnitInRange(t, unit, range, null);
        TriggerAddAction(t, () => {
            for (let i = solarTriggerSet.length - 1; i >= 0; i--) {
                solarTriggerSet[i].exec();
            }
        });
        let solarTrigger = new SolarTrigger((solarTrigger) => {
            callback(UnitSpellEvent.instance, solarTrigger);
        }, solarTriggerSet);
        solarTrigger.onDestroy = solarTrigger => {
            TriggerClearActions(t);
            DestroyTrigger(t);
        };
        return solarTrigger;
    }
    /**
     * 清除所有注册的事件
     */
    clear() {
        cache.clear();
        emitter.all.clear();
    }
    static getUnitDataEventHandler(unit, eventKey, createDefault) {
        if (createDefault) {
            let unitSolarData = DataBase.getUnitSolarData(unit, createDefault);
            if (unitSolarData._SL_solarEventHandler == null) {
                unitSolarData._SL_solarEventHandler = {};
            }
            if (unitSolarData._SL_solarEventHandler[eventKey] == null) {
                unitSolarData._SL_solarEventHandler[eventKey] = [];
            }
            return unitSolarData._SL_solarEventHandler[eventKey];
        }
        return DataBase.getUnitSolarData(unit, createDefault)?._SL_solarEventHandler?.[eventKey];
    }
    static getUnitTypeDataEventHandler(unitType, eventKey, createDefault) {
        if (createDefault) {
            let unitSolarData = DataBase.getUnitTypeSolarData(unitType, createDefault);
            if (unitSolarData._SL_solarEventHandler == null) {
                unitSolarData._SL_solarEventHandler = {};
            }
            if (unitSolarData._SL_solarEventHandler[eventKey] == null) {
                unitSolarData._SL_solarEventHandler[eventKey] = [];
            }
            return unitSolarData._SL_solarEventHandler[eventKey];
        }
        return DataBase.getUnitTypeSolarData(unitType, createDefault)?._SL_solarEventHandler?.[eventKey];
    }
    //spellAbilityId
    static getUnitSpellAbilityDataEventHandler(abilityIdStr, eventKey, createDefault) {
        if (createDefault) {
            let unitSolarData = DataBase.getAbilityTypeSolarData(abilityIdStr, createDefault);
            if (unitSolarData._SL_solarEventHandler == null) {
                unitSolarData._SL_solarEventHandler = {};
            }
            if (unitSolarData._SL_solarEventHandler[eventKey] == null) {
                unitSolarData._SL_solarEventHandler[eventKey] = [];
            }
            return unitSolarData._SL_solarEventHandler[eventKey];
        }
        return DataBase.getAbilityTypeSolarData(abilityIdStr, createDefault)?._SL_solarEventHandler?.[eventKey];
    }
    //Frame
    static getFrameDataEventHandler(frame, eventKey, createDefault) {
        if (createDefault) {
            let unitSolarData = DataBase.getDataByTypeId("_SL_Frame_Event", tostring(frame));
            if (unitSolarData._SL_solarEventHandler == null) {
                unitSolarData._SL_solarEventHandler = {};
            }
            if (unitSolarData._SL_solarEventHandler[eventKey] == null) {
                unitSolarData._SL_solarEventHandler[eventKey] = [];
            }
            return unitSolarData._SL_solarEventHandler[eventKey];
        }
        return DataBase.getDataByTypeId("_SL_Frame_Event", tostring(frame))?._SL_solarEventHandler?.[eventKey];
    }
}
