/** @noSelf **/
export default class KKApiHelper {


// GetServerValueLimitLeft,   // 获取服务器存档限制余额
    static KKApiGetServerValueLimitLeft(whichPlayer: player, key: string): number {
        return RequestExtraIntegerData(82, whichPlayer, key, null, false, 0, 0, 0);
    }

// RequestBackendLogic,       //请求后端逻辑生成
    static KKApiRequestBackendLogic(whichPlayer: player, key: string, groupkey: string): boolean {
        return RequestExtraBooleanData(83, whichPlayer, key, groupkey, false, 0, 0, 0);
    }

// CheckBackendLogicExists,   // 获取后端逻辑生成结果 是否存在
    static KKApiCheckBackendLogicExists(whichPlayer: player, key: string): boolean {
        return RequestExtraBooleanData(84, whichPlayer, key, null, false, 0, 0, 0);
    }

// GetBackendLogicIntResult,  // 获取后端逻辑生成结果 整型
    static KKApiGetBackendLogicIntResult(whichPlayer: player, key: string): number {
        return RequestExtraIntegerData(85, whichPlayer, key, null, false, 0, 0, 0);
    }

// GetBackendLogicStrResult,  // 获取后端逻辑生成结果 字符串
    static KKApiGetBackendLogicStrResult(whichPlayer: player, key: string): string {
        return RequestExtraStringData(86, whichPlayer, key, null, false, 0, 0, 0);
    }

// GetBackendLogicUpdateTime, // 获取后端逻辑生成时间
    static KKApiGetBackendLogicUpdateTime(whichPlayer: player, key: string): number {
        return RequestExtraIntegerData(87, whichPlayer, key, null, false, 0, 0, 0);
    }

// GetBackendLogicGroup,      // 获取后端逻辑生成组
    static KKApiGetBackendLogicGroup(whichPlayer: player, key: string): string {
        return RequestExtraStringData(88, whichPlayer, key, null, false, 0, 0, 0);
    }

// RemoveBackendLogicResult,  // 删除后端逻辑生成结果
    static KKApiRemoveBackendLogicResult(whichPlayer: player, key: string): boolean {
        return RequestExtraBooleanData(89, whichPlayer, key, null, false, 0, 0, 0);
    }

    static KKApiTriggerRegisterBackendLogicUpdata(trig: trigger): void {
        DzTriggerRegisterSyncData(trig, "DZBLU", true);
    }

    static KKApiTriggerRegisterBackendLogicDelete(trig: trigger): void {
        DzTriggerRegisterSyncData(trig, "DZBLD", true);
    }

    static KKApiGetSyncBackendLogic(): string {
        return DzGetTriggerSyncData();
    }

    static KKApiIsGameMode(): boolean {
        return RequestExtraBooleanData(90, null, null, null, false, 0, 0, 0);
    }

    static KKApiInitializeGameKey(whichPlayer: player, setIndex: number, k: string, data: string): boolean {
        return RequestExtraBooleanData(91, whichPlayer, "[{\"name\":\"" + data + "\",\"key\":\"" + k + "\"}]", null, false, setIndex, 0, 0);
    }

    static KKApiPlayerGUID(whichPlayer: player): string {
        return RequestExtraStringData(93, whichPlayer, null, null, false, 0, 0, 0);
    }

    static KKApiIsTaskInProgress(whichPlayer: player, setIndex: number, taskstat: number): boolean {
        return RequestExtraIntegerData(94, whichPlayer, null, null, false, setIndex, 0, 0) == taskstat;
    }

    static KKApiQueryTaskCurrentProgress(whichPlayer: player, setIndex: number): number {
        return RequestExtraIntegerData(95, whichPlayer, null, null, false, setIndex, 0, 0);
    }

    static KKApiQueryTaskTotalProgress(whichPlayer: player, setIndex: number): number {
        return RequestExtraIntegerData(96, whichPlayer, null, null, false, setIndex, 0, 0);
    }

// IsAchievementCompleted,  // 获取玩家成就是否完成
    static KKApiIsAchievementCompleted(whichPlayer: player, id: string): boolean {
        return RequestExtraBooleanData(98, whichPlayer, id, null, false, 0, 0, 0);
    }

// AchievementPoints,  // 获取玩家地图成就点数
    static KKApiAchievementPoints(whichPlayer: player): number {
        return RequestExtraIntegerData(99, whichPlayer, null, null, false, 0, 0, 0);
    }


// BeginBatchSaveArchive,  // 开始批量保存存档
    static KKApiBeginBatchSaveArchive(whichPlayer: player): boolean {


        return RequestExtraBooleanData(102, whichPlayer, null, null, false, 0, 0, 0);
    }

// AddBatchSaveArchive,    // 添加批量保存存档条目
    static KKApiAddBatchSaveArchive(whichPlayer: player, key: string, value: string, caseInsensitive: boolean): boolean {


        return RequestExtraBooleanData(103, whichPlayer, key, value, caseInsensitive, 0, 0, 0);
    }

// EndBatchSaveArchive,    // 结束批量保存存档
    static KKApiEndBatchSaveArchive(whichPlayer: player, abandon: boolean): boolean {
        return RequestExtraBooleanData(104, whichPlayer, null, null, abandon, 0, 0, 0);
    }


    static KKApiRandomSaveGameCount(whichPlayer: player, groupkey: string): number {
        return RequestExtraIntegerData(101, whichPlayer, groupkey, null, false, 0, 0, 0);
    }


    //
    static DzSetHeroTypeProperName(uid: number, name: string): void {


        EXSetUnitArrayString(uid, 61, 0, name);
        EXSetUnitInteger(uid, 61, 1);
    }

    static DzSetUnitTypeName(uid: number, name: string): void {


        EXSetUnitArrayString(uid, 10, 0, name);
        EXSetUnitInteger(uid, 10, 1);
    }

    static DzIsUnitAttackType(whichUnit: unit, index: number, attackType: attacktype): boolean {


        return ConvertAttackType(R2I(GetUnitState(whichUnit, ConvertUnitState(16 + 19 * index)))) == attackType;
    }

    static DzSetUnitAttackType(whichUnit: unit, index: number, attackType: attacktype): void {


        SetUnitState(whichUnit, ConvertUnitState(16 + 19 * index), GetHandleId(attackType));
    }

    static DzIsUnitDefenseType(whichUnit: unit, defenseType: number): boolean {


        return R2I(GetUnitState(whichUnit, ConvertUnitState(0x50))) == defenseType;
    }

    static DzSetUnitDefenseType(whichUnit: unit, defenseType: number): void {


        SetUnitState(whichUnit, ConvertUnitState(0x50), defenseType);
    }


// GetLotteryUsedCount, // 获取宝箱抽取次数
    static DzAPI_Map_GetLotteryUsedCountEx(whichPlayer: player, index: number): number {
        return RequestExtraIntegerData(68, whichPlayer, null, null, false, index, 0, 0);
    }

    static DzAPI_Map_GetLotteryUsedCount(whichPlayer: player): number {
        return DzAPI_Map_GetLotteryUsedCountEx(whichPlayer, 0) + DzAPI_Map_GetLotteryUsedCountEx(whichPlayer, 1) + DzAPI_Map_GetLotteryUsedCountEx(whichPlayer, 2);
    }


    //


    static KKWESetUnitDataCacheInteger(uid: number, id: number, v: number): void {


        DzSetUnitDataCacheInteger(uid, id, 0, v);
    }

    static KKWEUnitUIAddUpgradesIds(uid: number, id: number, v: number): void {


        DzUnitUIAddLevelArrayInteger(uid, 94, id, v);
    }

    static KKWEUnitUIAddBuildsIds(uid: number, id: number, v: number): void {


        DzUnitUIAddLevelArrayInteger(uid, 100, id, v);
    }

    static KKWEUnitUIAddResearchesIds(uid: number, id: number, v: number): void {


        DzUnitUIAddLevelArrayInteger(uid, 112, id, v);
    }

    static KKWEUnitUIAddTrainsIds(uid: number, id: number, v: number): void {


        DzUnitUIAddLevelArrayInteger(uid, 106, id, v);
    }

    static KKWEUnitUIAddSellsUnitIds(uid: number, id: number, v: number): void {


        DzUnitUIAddLevelArrayInteger(uid, 118, id, v);
    }

    static KKWEUnitUIAddSellsItemIds(uid: number, id: number, v: number): void {


        DzUnitUIAddLevelArrayInteger(uid, 124, id, v);
    }

    static KKWEUnitUIAddMakesItemIds(uid: number, id: number, v: number): void {


        DzUnitUIAddLevelArrayInteger(uid, 130, id, v);
    }

    static KKWEUnitUIAddRequiresUnitCode(uid: number, id: number, v: number): void {


        DzUnitUIAddLevelArrayInteger(uid, 166, id, v);
    }

    static KKWEUnitUIAddRequiresTechcode(uid: number, id: number, v: number): void {


        DzUnitUIAddLevelArrayInteger(uid, 166, id, v);
    }

    static KKWEUnitUIAddRequiresAmounts(uid: number, id: number, v: number): void {


        DzUnitUIAddLevelArrayInteger(uid, 172, id, v);
    }


}