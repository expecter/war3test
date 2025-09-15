/**
 * 玩家 里的常用函数集合
 */
import { MapPlayer } from "@/player";
import DataBase from "@/DataBase";
import AttributeUtil from "@/AttributeUtil";
export default class PlayerEvent {
    static instance = new PlayerEvent();
    constructor() {
    }
    /**
     * 触发玩家
     */
    get triggerPlayer() {
        return GetTriggerPlayer();
    }
    /**
     * 触发玩家对象
     */
    get triggerPlayerObj() {
        return MapPlayer.fromHandle(GetTriggerPlayer());
    }
    /**
     * 触发玩家id
     */
    get triggerPlayerId() {
        return GetPlayerId(GetTriggerPlayer());
    }
    /**
     * 触发玩家名字
     */
    get triggerPlayerName() {
        return GetPlayerName(GetTriggerPlayer());
    }
    /**
     * 触发玩家 聊天信息
     */
    get eventPlayerChatString() {
        return GetEventPlayerChatString();
    }
    /**
     * 触发玩家 SolarData
     */
    get triggerPlayerSolarData() {
        return DataBase.getPlayerSolarData(GetTriggerPlayer());
    }
    /**
     * 触发玩家 Attribute
     */
    get triggerPlayerAttribute() {
        return AttributeUtil.getPlayerAttribute(GetTriggerPlayer());
    }
}
