/** @noSelf **/
export default class KKApiHelper {
    // GetServerValueLimitLeft,   // 获取服务器存档限制余额
    static KKApiGetServerValueLimitLeft(whichPlayer, key) {
        return RequestExtraIntegerData(82, whichPlayer, key, null, false, 0, 0, 0);
    }
    // RequestBackendLogic,       //请求后端逻辑生成
    static KKApiRequestBackendLogic(whichPlayer, key, groupkey) {
        return RequestExtraBooleanData(83, whichPlayer, key, groupkey, false, 0, 0, 0);
    }
    // CheckBackendLogicExists,   // 获取后端逻辑生成结果 是否存在
    static KKApiCheckBackendLogicExists(whichPlayer, key) {
        return RequestExtraBooleanData(84, whichPlayer, key, null, false, 0, 0, 0);
    }
    // GetBackendLogicIntResult,  // 获取后端逻辑生成结果 整型
    static KKApiGetBackendLogicIntResult(whichPlayer, key) {
        return RequestExtraIntegerData(85, whichPlayer, key, null, false, 0, 0, 0);
    }
    // GetBackendLogicStrResult,  // 获取后端逻辑生成结果 字符串
    static KKApiGetBackendLogicStrResult(whichPlayer, key) {
        return RequestExtraStringData(86, whichPlayer, key, null, false, 0, 0, 0);
    }
    // GetBackendLogicUpdateTime, // 获取后端逻辑生成时间
    static KKApiGetBackendLogicUpdateTime(whichPlayer, key) {
        return RequestExtraIntegerData(87, whichPlayer, key, null, false, 0, 0, 0);
    }
    // GetBackendLogicGroup,      // 获取后端逻辑生成组
    static KKApiGetBackendLogicGroup(whichPlayer, key) {
        return RequestExtraStringData(88, whichPlayer, key, null, false, 0, 0, 0);
    }
    // RemoveBackendLogicResult,  // 删除后端逻辑生成结果
    static KKApiRemoveBackendLogicResult(whichPlayer, key) {
        return RequestExtraBooleanData(89, whichPlayer, key, null, false, 0, 0, 0);
    }
    static KKApiTriggerRegisterBackendLogicUpdata(trig) {
        DzTriggerRegisterSyncData(trig, "DZBLU", true);
    }
    static KKApiTriggerRegisterBackendLogicDelete(trig) {
        DzTriggerRegisterSyncData(trig, "DZBLD", true);
    }
    static KKApiGetSyncBackendLogic() {
        return DzGetTriggerSyncData();
    }
    static KKApiIsGameMode() {
        return RequestExtraBooleanData(90, null, null, null, false, 0, 0, 0);
    }
    static KKApiInitializeGameKey(whichPlayer, setIndex, k, data) {
        return RequestExtraBooleanData(91, whichPlayer, "[{\"name\":\"" + data + "\",\"key\":\"" + k + "\"}]", null, false, setIndex, 0, 0);
    }
    static KKApiPlayerGUID(whichPlayer) {
        return RequestExtraStringData(93, whichPlayer, null, null, false, 0, 0, 0);
    }
    static KKApiIsTaskInProgress(whichPlayer, setIndex, taskstat) {
        return RequestExtraIntegerData(94, whichPlayer, null, null, false, setIndex, 0, 0) == taskstat;
    }
    static KKApiQueryTaskCurrentProgress(whichPlayer, setIndex) {
        return RequestExtraIntegerData(95, whichPlayer, null, null, false, setIndex, 0, 0);
    }
    static KKApiQueryTaskTotalProgress(whichPlayer, setIndex) {
        return RequestExtraIntegerData(96, whichPlayer, null, null, false, setIndex, 0, 0);
    }
    // IsAchievementCompleted,  // 获取玩家成就是否完成
    static KKApiIsAchievementCompleted(whichPlayer, id) {
        return RequestExtraBooleanData(98, whichPlayer, id, null, false, 0, 0, 0);
    }
    // AchievementPoints,  // 获取玩家地图成就点数
    static KKApiAchievementPoints(whichPlayer) {
        return RequestExtraIntegerData(99, whichPlayer, null, null, false, 0, 0, 0);
    }
    // BeginBatchSaveArchive,  // 开始批量保存存档
    static KKApiBeginBatchSaveArchive(whichPlayer) {
        return RequestExtraBooleanData(102, whichPlayer, null, null, false, 0, 0, 0);
    }
    // AddBatchSaveArchive,    // 添加批量保存存档条目
    static KKApiAddBatchSaveArchive(whichPlayer, key, value, caseInsensitive) {
        return RequestExtraBooleanData(103, whichPlayer, key, value, caseInsensitive, 0, 0, 0);
    }
    // EndBatchSaveArchive,    // 结束批量保存存档
    static KKApiEndBatchSaveArchive(whichPlayer, abandon) {
        return RequestExtraBooleanData(104, whichPlayer, null, null, abandon, 0, 0, 0);
    }
    static KKApiRandomSaveGameCount(whichPlayer, groupkey) {
        return RequestExtraIntegerData(101, whichPlayer, groupkey, null, false, 0, 0, 0);
    }
    //
    static DzSetHeroTypeProperName(uid, name) {
        EXSetUnitArrayString(uid, 61, 0, name);
        EXSetUnitInteger(uid, 61, 1);
    }
    static DzSetUnitTypeName(uid, name) {
        EXSetUnitArrayString(uid, 10, 0, name);
        EXSetUnitInteger(uid, 10, 1);
    }
    static DzIsUnitAttackType(whichUnit, index, attackType) {
        return ConvertAttackType(R2I(GetUnitState(whichUnit, ConvertUnitState(16 + 19 * index)))) == attackType;
    }
    static DzSetUnitAttackType(whichUnit, index, attackType) {
        SetUnitState(whichUnit, ConvertUnitState(16 + 19 * index), GetHandleId(attackType));
    }
    static DzIsUnitDefenseType(whichUnit, defenseType) {
        return R2I(GetUnitState(whichUnit, ConvertUnitState(0x50))) == defenseType;
    }
    static DzSetUnitDefenseType(whichUnit, defenseType) {
        SetUnitState(whichUnit, ConvertUnitState(0x50), defenseType);
    }
    // GetLotteryUsedCount, // 获取宝箱抽取次数
    static DzAPI_Map_GetLotteryUsedCountEx(whichPlayer, index) {
        return RequestExtraIntegerData(68, whichPlayer, null, null, false, index, 0, 0);
    }
    static DzAPI_Map_GetLotteryUsedCount(whichPlayer) {
        return DzAPI_Map_GetLotteryUsedCountEx(whichPlayer, 0) + DzAPI_Map_GetLotteryUsedCountEx(whichPlayer, 1) + DzAPI_Map_GetLotteryUsedCountEx(whichPlayer, 2);
    }
    //
    static KKWESetUnitDataCacheInteger(uid, id, v) {
        DzSetUnitDataCacheInteger(uid, id, 0, v);
    }
    static KKWEUnitUIAddUpgradesIds(uid, id, v) {
        DzUnitUIAddLevelArrayInteger(uid, 94, id, v);
    }
    static KKWEUnitUIAddBuildsIds(uid, id, v) {
        DzUnitUIAddLevelArrayInteger(uid, 100, id, v);
    }
    static KKWEUnitUIAddResearchesIds(uid, id, v) {
        DzUnitUIAddLevelArrayInteger(uid, 112, id, v);
    }
    static KKWEUnitUIAddTrainsIds(uid, id, v) {
        DzUnitUIAddLevelArrayInteger(uid, 106, id, v);
    }
    static KKWEUnitUIAddSellsUnitIds(uid, id, v) {
        DzUnitUIAddLevelArrayInteger(uid, 118, id, v);
    }
    static KKWEUnitUIAddSellsItemIds(uid, id, v) {
        DzUnitUIAddLevelArrayInteger(uid, 124, id, v);
    }
    static KKWEUnitUIAddMakesItemIds(uid, id, v) {
        DzUnitUIAddLevelArrayInteger(uid, 130, id, v);
    }
    static KKWEUnitUIAddRequiresUnitCode(uid, id, v) {
        DzUnitUIAddLevelArrayInteger(uid, 166, id, v);
    }
    static KKWEUnitUIAddRequiresTechcode(uid, id, v) {
        DzUnitUIAddLevelArrayInteger(uid, 166, id, v);
    }
    static KKWEUnitUIAddRequiresAmounts(uid, id, v) {
        DzUnitUIAddLevelArrayInteger(uid, 172, id, v);
    }
}
