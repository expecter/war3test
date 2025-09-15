import { MapPlayer } from "@/player";
import DataBase from "@/DataBase";
import AttributeUtil from "@/AttributeUtil";
export default class UIFrameEvent {
    static instance = new UIFrameEvent();
    constructor() {
    }
    /**
     * 触发UI
     */
    get triggerFrame() {
        return DzGetTriggerUIEventFrame();
    }
    /**
     * 触发玩家
     */
    get triggerPlayer() {
        //应该是本地玩家
        return DzGetTriggerUIEventPlayer();
    }
    /**
     * 触发玩家对象
     */
    get triggerPlayerObj() {
        return MapPlayer.fromHandle(DzGetTriggerUIEventPlayer());
    }
    /**
     * 触发玩家id
     */
    get triggerPlayerId() {
        return GetPlayerId(DzGetTriggerUIEventPlayer());
    }
    /**
     * 触发玩家名字
     */
    get triggerPlayerName() {
        return GetPlayerName(DzGetTriggerUIEventPlayer());
    }
    /**
     * 触发玩家 SolarData
     */
    get triggerPlayerSolarData() {
        return DataBase.getPlayerSolarData(DzGetTriggerUIEventPlayer(), false);
    }
    /**
     * 触发玩家 Attribute
     */
    get triggerPlayerAttribute() {
        return AttributeUtil.getPlayerAttribute(DzGetTriggerUIEventPlayer(), false);
    }
}
