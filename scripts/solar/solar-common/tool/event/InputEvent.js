import { MapPlayer } from "@/player";
import DataBase from "@/DataBase";
import AttributeUtil from "@/AttributeUtil";
export default class InputEvent {
    static instance = new InputEvent();
    constructor() {
    }
    /**
     * 触发玩家
     */
    get triggerPlayer() {
        //应该是本地玩家
        return GetLocalPlayer();
    }
    /**
     * 触发玩家对象
     */
    get triggerPlayerObj() {
        return MapPlayer.fromHandle(GetLocalPlayer());
    }
    /**
     * 触发玩家id
     */
    get triggerPlayerId() {
        return GetPlayerId(GetLocalPlayer());
    }
    /**
     * 触发玩家名字
     */
    get triggerPlayerName() {
        return GetPlayerName(GetLocalPlayer());
    }
    /**
     * 触发玩家 SolarData
     */
    get triggerPlayerSolarData() {
        return DataBase.getPlayerSolarData(GetLocalPlayer(), false);
    }
    /**
     * 触发玩家 Attribute
     */
    get triggerPlayerAttribute() {
        return AttributeUtil.getPlayerAttribute(GetLocalPlayer(), false);
    }
}
