/** @noSelf **/
export default class DzApiHelper {
    static DzAPI_Map_IsPlatformVIP(whichPlayer) {
        return DzAPI_Map_GetPlatformVIP(whichPlayer) > 0;
    }
    static DzAPI_Map_Global_GetStoreString(key) {
        return RequestExtraStringData(36, GetLocalPlayer(), key, null, false, 0, 0, 0);
    }
    static DzAPI_Map_Global_StoreString(key, value) {
        RequestExtraStringData(37, GetLocalPlayer(), key, value, false, 0, 0, 0);
    }
    static DzAPI_Map_Global_ChangeMsg(trig) {
        DzTriggerRegisterSyncData(trig, "DZGAU", true);
    }
    static DzAPI_Map_ServerArchive(whichPlayer, key) {
        return RequestExtraStringData(38, whichPlayer, key, null, false, 0, 0, 0);
    }
    static DzAPI_Map_SaveServerArchive(whichPlayer, key, value) {
        RequestExtraBooleanData(39, whichPlayer, key, value, false, 0, 0, 0);
    }
    static DzAPI_Map_IsRPGQuickMatch() {
        return RequestExtraBooleanData(40, null, null, null, false, 0, 0, 0);
    }
    static DzAPI_Map_GetMallItemCount(whichPlayer, key) {
        return RequestExtraIntegerData(41, whichPlayer, key, null, false, 0, 0, 0);
    }
    static DzAPI_Map_ConsumeMallItem(whichPlayer, key, count) {
        return RequestExtraBooleanData(42, whichPlayer, key, null, false, count, 0, 0);
    }
    static DzAPI_Map_EnablePlatformSettings(whichPlayer, option, enable) {
        return RequestExtraBooleanData(43, whichPlayer, null, null, enable, option, 0, 0);
    }
    static DzAPI_Map_IsBuyReforged(whichPlayer) {
        return RequestExtraBooleanData(44, whichPlayer, null, null, false, 0, 0, 0);
    }
    static GetPlayerServerValueSuccess(whichPlayer) {
        if ((DzAPI_Map_GetServerValueErrorCode(whichPlayer) == 0))
            return true;
        else
            return false;
    }
    static DzAPI_Map_StoreIntegerEX(whichPlayer, key, value) {
        key = "I" + key;
        RequestExtraBooleanData(39, whichPlayer, key, I2S(value), false, 0, 0, 0);
        key = null;
        whichPlayer = null;
    }
    static DzAPI_Map_GetStoredIntegerEX(whichPlayer, key) {
        let value;
        key = "I" + key;
        value = S2I(RequestExtraStringData(38, whichPlayer, key, null, false, 0, 0, 0));
        key = null;
        whichPlayer = null;
        return value;
    }
    static DzAPI_Map_StoreInteger(whichPlayer, key, value) {
        key = "I" + key;
        DzAPI_Map_SaveServerValue(whichPlayer, key, I2S(value));
        key = null;
        whichPlayer = null;
    }
    static DzAPI_Map_GetStoredInteger(whichPlayer, key) {
        let value;
        key = "I" + key;
        value = S2I(DzAPI_Map_GetServerValue(whichPlayer, key));
        key = null;
        whichPlayer = null;
        return value;
    }
    static DzAPI_Map_CommentTotalCount1(whichPlayer, id) {
        return RequestExtraIntegerData(52, whichPlayer, null, null, false, id, 0, 0);
    }
    static DzAPI_Map_StoreReal(whichPlayer, key, value) {
        key = "R" + key;
        DzAPI_Map_SaveServerValue(whichPlayer, key, R2S(value));
        key = null;
        whichPlayer = null;
    }
    static DzAPI_Map_GetStoredReal(whichPlayer, key) {
        let value;
        key = "R" + key;
        value = S2R(DzAPI_Map_GetServerValue(whichPlayer, key));
        key = null;
        whichPlayer = null;
        return value;
    }
    static DzAPI_Map_StoreBoolean(whichPlayer, key, value) {
        key = "B" + key;
        if ((value))
            DzAPI_Map_SaveServerValue(whichPlayer, key, "1");
        else
            DzAPI_Map_SaveServerValue(whichPlayer, key, "0");
        key = null;
        whichPlayer = null;
    }
    static DzAPI_Map_GetStoredBoolean(whichPlayer, key) {
        let value;
        key = "B" + key;
        key = DzAPI_Map_GetServerValue(whichPlayer, key);
        if ((key == "1"))
            value = true;
        else
            value = false;
        key = null;
        whichPlayer = null;
        return value;
    }
    static DzAPI_Map_StoreString(whichPlayer, key, value) {
        key = "S" + key;
        DzAPI_Map_SaveServerValue(whichPlayer, key, value);
        key = null;
        whichPlayer = null;
    }
    static DzAPI_Map_GetStoredString(whichPlayer, key) {
        return DzAPI_Map_GetServerValue(whichPlayer, "S" + key);
    }
    static DzAPI_Map_StoreStringEX(whichPlayer, key, value) {
        key = "S" + key;
        RequestExtraBooleanData(39, whichPlayer, key, value, false, 0, 0, 0);
        key = null;
        whichPlayer = null;
    }
    static DzAPI_Map_GetStoredStringEX(whichPlayer, key) {
        return RequestExtraStringData(38, whichPlayer, "S" + key, null, false, 0, 0, 0);
    }
    static DzAPI_Map_GetStoredUnitType(whichPlayer, key) {
        let value;
        key = "I" + key;
        value = S2I(DzAPI_Map_GetServerValue(whichPlayer, key));
        key = null;
        whichPlayer = null;
        return value;
    }
    static DzAPI_Map_GetStoredAbilityId(whichPlayer, key) {
        let value;
        key = "I" + key;
        value = S2I(DzAPI_Map_GetServerValue(whichPlayer, key));
        key = null;
        whichPlayer = null;
        return value;
    }
    static DzAPI_Map_FlushStoredMission(whichPlayer, key) {
        DzAPI_Map_SaveServerValue(whichPlayer, key, "");
        // DzAPI_Map_SaveServerValue(whichPlayer, key, null);
        key = null;
        whichPlayer = null;
    }
    static DzAPI_Map_Ladder_SubmitIntegerData(whichPlayer, key, value) {
        DzAPI_Map_Ladder_SetStat(whichPlayer, key, I2S(value));
    }
    static DzAPI_Map_Stat_SubmitUnitIdData(whichPlayer, key, value) {
        if ((value == 0)) {
        }
        //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
        else
            DzAPI_Map_Ladder_SetStat(whichPlayer, key, I2S(value));
    }
    // static DzAPI_Map_Stat_SubmitUnitData(whichPlayer: player, key: string, value: unit): void {
    //
    //
    //     DzAPI_Map_Stat_SubmitUnitIdData(whichPlayer, key, GetUnitTypeId(value));
    // }
    static DzAPI_Map_Ladder_SubmitAblityIdData(whichPlayer, key, value) {
        if ((value == 0)) {
        }
        //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
        else
            DzAPI_Map_Ladder_SetStat(whichPlayer, key, I2S(value));
    }
    static DzAPI_Map_Ladder_SubmitItemIdData(whichPlayer, key, value) {
        let S;
        if ((value == 0))
            S = "0";
        else {
            S = I2S(value);
            DzAPI_Map_Ladder_SetStat(whichPlayer, key, S);
        }
        //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,S)
        S = null;
        whichPlayer = null;
    }
    // static DzAPI_Map_Ladder_SubmitItemData(whichPlayer: player, key: string, value: item): void {
    //
    //
    //     DzAPI_Map_Ladder_SubmitItemIdData(whichPlayer, key, GetItemTypeId(value));
    // }
    static DzAPI_Map_Ladder_SubmitBooleanData(whichPlayer, key, value) {
        if ((value))
            DzAPI_Map_Ladder_SetStat(whichPlayer, key, "1");
        else
            DzAPI_Map_Ladder_SetStat(whichPlayer, key, "0");
    }
    static DzAPI_Map_Ladder_SubmitTitle(whichPlayer, value) {
        DzAPI_Map_Ladder_SetStat(whichPlayer, value, "1");
    }
    static DzAPI_Map_Ladder_SubmitPlayerRank(whichPlayer, value) {
        DzAPI_Map_Ladder_SetPlayerStat(whichPlayer, "RankIndex", I2S(value));
    }
    static DzAPI_Map_Ladder_SubmitPlayerExtraExp(whichPlayer, value) {
        DzAPI_Map_Ladder_SetStat(whichPlayer, "ExtraExp", I2S(value));
    }
    static DzAPI_Map_PlayedGames(whichPlayer) {
        return RequestExtraIntegerData(45, whichPlayer, null, null, false, 0, 0, 0);
    }
    static DzAPI_Map_CommentCount(whichPlayer) {
        return RequestExtraIntegerData(46, whichPlayer, null, null, false, 0, 0, 0);
    }
    static DzAPI_Map_FriendCount(whichPlayer) {
        return RequestExtraIntegerData(47, whichPlayer, null, null, false, 0, 0, 0);
    }
    static DzAPI_Map_IsConnoisseur(whichPlayer) {
        return RequestExtraBooleanData(48, whichPlayer, null, null, false, 0, 0, 0);
    }
    static DzAPI_Map_IsBattleNetAccount(whichPlayer) {
        return RequestExtraBooleanData(49, whichPlayer, null, null, false, 0, 0, 0);
    }
    static DzAPI_Map_IsAuthor(whichPlayer) {
        return RequestExtraBooleanData(50, whichPlayer, null, null, false, 0, 0, 0);
    }
    static DzAPI_Map_CommentTotalCount() {
        return RequestExtraIntegerData(51, null, null, null, false, 0, 0, 0);
    }
    static DzAPI_Map_Statistics(whichPlayer, eventKey, eventType, value) {
        RequestExtraBooleanData(34, whichPlayer, eventKey, "", false, value, 0, 0);
    }
    static DzAPI_Map_Returns(whichPlayer, label) {
        return RequestExtraBooleanData(53, whichPlayer, null, null, false, label, 0, 0);
    }
    static DzAPI_Map_ContinuousCount(whichPlayer, id) {
        return RequestExtraIntegerData(54, whichPlayer, null, null, false, id, 0, 0);
    }
    // IsPlayer,                      //是否为玩家
    static DzAPI_Map_IsPlayer(whichPlayer) {
        return RequestExtraBooleanData(55, whichPlayer, null, null, false, 0, 0, 0);
    }
    // MapsTotalPlayed,               //所有地图的总游戏时长
    static DzAPI_Map_MapsTotalPlayed(whichPlayer) {
        return RequestExtraIntegerData(56, whichPlayer, null, null, false, 0, 0, 0);
    }
    // MapsLevel,                    //指定地图的地图等级
    static DzAPI_Map_MapsLevel(whichPlayer, mapId) {
        return RequestExtraIntegerData(57, whichPlayer, null, null, false, mapId, 0, 0);
    }
    // MapsConsumeGold,              //所有地图的金币消耗
    static DzAPI_Map_MapsConsumeGold(whichPlayer, mapId) {
        return RequestExtraIntegerData(58, whichPlayer, null, null, false, mapId, 0, 0);
    }
    // MapsConsumeLumber,            //所有地图的木材消耗
    static DzAPI_Map_MapsConsumeLumber(whichPlayer, mapId) {
        return RequestExtraIntegerData(59, whichPlayer, null, null, false, mapId, 0, 0);
    }
    // MapsConsumeLv1,               //消费 1-199
    static DzAPI_Map_MapsConsumeLv1(whichPlayer, mapId) {
        return RequestExtraBooleanData(60, whichPlayer, null, null, false, mapId, 0, 0);
    }
    // MapsConsumeLv2,               //消费 200-499
    static DzAPI_Map_MapsConsumeLv2(whichPlayer, mapId) {
        return RequestExtraBooleanData(61, whichPlayer, null, null, false, mapId, 0, 0);
    }
    // MapsConsumeLv3,               //消费 500~999
    static DzAPI_Map_MapsConsumeLv3(whichPlayer, mapId) {
        return RequestExtraBooleanData(62, whichPlayer, null, null, false, mapId, 0, 0);
    }
    // MapsConsumeLv4,               //消费 1000+
    static DzAPI_Map_MapsConsumeLv4(whichPlayer, mapId) {
        return RequestExtraBooleanData(63, whichPlayer, null, null, false, mapId, 0, 0);
    }
    //获取论坛数据（0=累计获得赞数，1=精华帖数量，2=发表回复次数，3=收到的欢乐数，4=是否发过贴子，5=是否版主，6=主题数量）
    static DzAPI_Map_GetForumData(whichPlayer, whichData) {
        return RequestExtraIntegerData(65, whichPlayer, null, null, false, whichData, 0, 0);
    }
    static DzAPI_Map_OpenMall(whichPlayer, whichkey) {
        return RequestExtraBooleanData(66, whichPlayer, whichkey, null, false, 0, 0, 0);
    }
    static DzAPI_Map_GameResult_CommitData(whichPlayer, key, value) {
        RequestExtraIntegerData(69, whichPlayer, key, value, false, 0, 0, 0);
    }
    static DzTriggerRegisterMallItemSyncData(trig) {
        DzTriggerRegisterSyncData(trig, "DZMIA", true);
    }
    static DzGetTriggerMallItemPlayer() {
        return DzGetTriggerSyncPlayer();
    }
    static DzGetTriggerMallItem() {
        return DzGetTriggerSyncData();
    }
    //游戏结算
    static DzAPI_Map_GameResult_CommitTitle(whichPlayer, value) {
        DzAPI_Map_GameResult_CommitData(whichPlayer, value, "1");
    }
    static DzAPI_Map_GameResult_CommitPlayerRank(whichPlayer, value) {
        DzAPI_Map_GameResult_CommitData(whichPlayer, "RankIndex", I2S(value));
    }
    static DzAPI_Map_GameResult_CommitGameMode(value) {
        DzAPI_Map_GameResult_CommitData(GetLocalPlayer(), "InnerGameMode", value);
    }
    static DzAPI_Map_GameResult_CommitGameResult(whichPlayer, value) {
        DzAPI_Map_GameResult_CommitData(whichPlayer, "GameResult", I2S(value));
    }
    static DzAPI_Map_GameResult_CommitGameResultNoEnd(whichPlayer, value) {
        DzAPI_Map_GameResult_CommitData(whichPlayer, "GameResultNoEnd", I2S(value));
    }
    // GetSinceLastPlayedSeconds, // 获取距最后一次游戏的秒数
    static DzAPI_Map_GetSinceLastPlayedSeconds(whichPlayer) {
        return RequestExtraIntegerData(70, whichPlayer, null, null, false, 0, 0, 0);
    }
    // QuickBuy, //游戏内快速购买
    static DzAPI_Map_QuickBuy(whichPlayer, key, count, seconds) {
        return RequestExtraBooleanData(72, whichPlayer, key, null, false, count, seconds, 0);
    }
    // CancelQuickBuy, //取消快速购买
    static DzAPI_Map_CancelQuickBuy(whichPlayer) {
        return RequestExtraBooleanData(73, whichPlayer, null, null, false, 0, 0, 0);
    }
    //判断是加载成功某个玩家的道具
    static DzAPI_Map_PlayerLoadedItems(whichPlayer) {
        return RequestExtraBooleanData(77, whichPlayer, null, null, false, 0, 0, 0);
    }
    //addons
    static DzTriggerRegisterMouseEventTrg(trg, status, btn) {
        DzTriggerRegisterMouseEvent(trg, btn, status, true, null);
    }
    static DzTriggerRegisterKeyEventTrg(trg, status, btn) {
        DzTriggerRegisterKeyEvent(trg, btn, status, true, null);
    }
    static DzTriggerRegisterMouseMoveEventTrg(trg) {
        DzTriggerRegisterMouseMoveEvent(trg, true, null);
    }
    static DzTriggerRegisterMouseWheelEventTrg(trg) {
        DzTriggerRegisterMouseWheelEvent(trg, true, null);
    }
    static DzTriggerRegisterWindowResizeEventTrg(trg) {
        DzTriggerRegisterWindowResizeEvent(trg, true, null);
    }
    static DzF2I(i) {
        return i;
    }
    static DzI2F(i) {
        return i;
    }
    static DzK2I(i) {
        return i;
    }
    static DzI2K(i) {
        return i;
    }
    /**
     * 24.1.8 addons
     */
    static DzAPI_Map_CustomRankCount(id) {
        return RequestExtraIntegerData(78, null, null, null, false, id, 0, 0);
    }
    // CustomRankPlayerName            // 获取排行榜上指定排名的用户名称
    static DzAPI_Map_CustomRankPlayerName(id, ranking) {
        return RequestExtraStringData(79, null, null, null, false, id, ranking, 0);
    }
    // CustomRankPlayerValue           // 获取排行榜上指定排名的值
    static DzAPI_Map_CustomRankValue(id, ranking) {
        return RequestExtraIntegerData(80, null, null, null, false, id, ranking, 0);
    }
    //获取玩家在KK平台的完整昵称（基础昵称#编号）
    static DzAPI_Map_GetPlayerUserName(whichPlayer) {
        return RequestExtraStringData(81, whichPlayer, null, null, false, 0, 0, 0);
    }
}
