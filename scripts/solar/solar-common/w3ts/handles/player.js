/** @noSelfInFile **/
import { Handle } from "./handle";
import DataBase from "../../common/DataBase";
const cache = {};
export class MapPlayer extends Handle {
    //GetUserId 对战平台的账号id
    userId;
    constructor(index) {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(Player(index));
        }
    }
    /**
     * 太阳 自定义数据集
     */
    get solarData() {
        return DataBase.getPlayerSolarData(this.handle);
    }
    set solarData(obj) {
        DataBase.setDataByHandle("+ply", this.handle, obj);
    }
    /**
     * 本地玩家 [R]
     */
    isLocalPlayer() {
        if (GetLocalPlayer() == this.handle) {
            return true;
        }
        return false;
    }
    /**
     * 获取玩家所有单位 （新建单位组）
     */
    getAllUnits() {
        let g = CreateGroup();
        GroupEnumUnitsOfPlayer(g, this.handle, null);
        return g;
    }
    /**
     * 对玩家显示文本消息(指定时间) [R]
     */
    displayText(text, duration = 5) {
        DisplayTimedTextToPlayer(this.handle, 0, 0, duration, text);
    }
    // /**
    //  * 同步获取当前玩家选择的第一个单位
    //  *
    //  * @deprecated see PlayerUtil.syncSelectedUnit
    //  */
    // public getSelectedUnit(): unit {
    //     SyncSelections()
    //     GroupClear(tempGroup)
    //     GroupEnumUnitsSelected(tempGroup, this.handle, null)
    //     let unitHandle = FirstOfGroup(tempGroup)
    //     return unitHandle;
    // }
    /**
     * 玩家颜色 [R]
     */
    set color(color) {
        SetPlayerColor(this.handle, color);
    }
    /**
     * 玩家颜色 [R]
     */
    get color() {
        return GetPlayerColor(this.handle);
    }
    /**
     * 玩家控制者
     */
    get controller() {
        return GetPlayerController(this.handle);
    }
    /**经验上限*/
    get handicap() {
        return GetPlayerHandicap(this.handle);
    }
    /**
     * 设置经验上限 [R]
     */
    set handicap(handicap) {
        SetPlayerHandicap(this.handle, handicap);
    }
    /***
     * 经验获得率
     */
    get handicapXp() {
        return GetPlayerHandicapXP(this.handle);
    }
    /**
     * 设置经验获得率 [R]
     */
    set handicapXp(handicap) {
        SetPlayerHandicapXP(this.handle, handicap);
    }
    /**
     * 玩家ID - 1 [R]
     */
    get id() {
        return GetPlayerId(this.handle);
    }
    /**
     * 玩家名字
     */
    get name() {
        return GetPlayerName(this.handle);
    }
    /**
     * 设置玩家名字
     */
    set name(value) {
        SetPlayerName(this.handle, value);
    }
    /**
     * 玩家的种族
     */
    get race() {
        return GetPlayerRace(this.handle);
    }
    /**
     * 玩家游戏属性
     */
    get slotState() {
        return GetPlayerSlotState(this.handle);
    }
    /**
     * 玩家开始点
     */
    get startLocation() {
        return GetPlayerStartLocation(this.handle);
    }
    /**
     * 起始点x
     */
    get startLocationX() {
        return GetStartLocationX(this.startLocation);
    }
    /**
     * 起始点y
     */
    get startLocationY() {
        return GetStartLocationY(this.startLocation);
    }
    /**
     * 起始点
     */
    get startLocationPoint() {
        return GetStartLocationLoc(this.startLocation);
    }
    /**
     * 玩家所在的队伍
     */
    get team() {
        return GetPlayerTeam(this.handle);
    }
    // public get townHallCount() {
    //   return BlzGetPlayerTownHallCount(this.handle);
    // }
    /**
     * 增加科技等级
     */
    addTechResearched(techId, levels) {
        AddPlayerTechResearched(this.handle, techId, levels);
    }
    // public decTechResearched(techId: number | string, levels: number) {
    //   BlzDecPlayerTechResearched(this.handle, techId, levels);
    // }
    // Used to store hero level data for the scorescreen
    // before units are moved to neutral passive in melee games
    /**
     * 缓存玩家数据
     */
    cacheHeroData() {
        CachePlayerHeroData(this.handle);
    }
    /**
     * 玩家与玩家结盟
     */
    compareAlliance(otherPlayer, whichAllianceSetting) {
        return GetPlayerAlliance(this.handle, otherPlayer.handle, whichAllianceSetting);
    }
    /**
     * 坐标在迷雾中
     */
    coordsFogged(x, y) {
        return IsFoggedToPlayer(x, y, this.handle);
    }
    /**
     * 坐标在黑色阴影中
     */
    coordsMasked(x, y) {
        return IsMaskedToPlayer(x, y, this.handle);
    }
    /**
     * 坐标可见
     */
    coordsVisible(x, y) {
        return IsVisibleToPlayer(x, y, this.handle);
    }
    /**
     * 削弱玩家
     */
    cripple(toWhichPlayers, flag) {
        CripplePlayer(this.handle, toWhichPlayers.handle, flag);
    }
    /**
     * 获得玩家得分
     */
    getScore(whichPlayerScore) {
        return GetPlayerScore(this.handle, whichPlayerScore);
    }
    /**
     * 获得玩家属性
     */
    getState(whichPlayerState) {
        return GetPlayerState(this.handle, whichPlayerState);
    }
    /**
     * 获得建筑数量
     */
    getStructureCount(includeIncomplete) {
        return GetPlayerStructureCount(this.handle, includeIncomplete);
    }
    /**
     * 玩家税率 [R]
     */
    getTaxRate(otherPlayer, whichResource) {
        return GetPlayerTaxRate(this.handle, otherPlayer, whichResource);
    }
    /**
     * 获取玩家科技数量
     */
    getTechCount(techId, specificonly) {
        return GetPlayerTechCount(this.handle, techId, specificonly);
    }
    /**
     * 获取允许玩家的科技上限
     * 单位默认建造数量为2147483647 */
    getTechMaxAllowed(techId) {
        return GetPlayerTechMaxAllowed(this.handle, techId);
    }
    /**
     * 获取玩家科技是否已经研究
     */
    getTechResearched(techId, specificonly) {
        return GetPlayerTechResearched(this.handle, techId, specificonly);
    }
    /**
     * 单位数量
     */
    getUnitCount(includeIncomplete) {
        return GetPlayerUnitCount(this.handle, includeIncomplete);
    }
    /**
     * 获取玩家特定单位数
     * @param unitName
     * @param includeIncomplete
     * @param includeUpgrades
     */
    getUnitCountByType(unitName, includeIncomplete, includeUpgrades) {
        return GetPlayerTypedUnitCount(this.handle, unitName, includeIncomplete, includeUpgrades);
    }
    /**
     * 玩家在玩家组
     */
    inForce(whichForce) {
        return IsPlayerInForce(this.handle, whichForce.handle);
    }
    /**
     * 玩家是裁判或观察者 [R]
     */
    isObserver() {
        return IsPlayerObserver(this.handle);
    }
    /**
     * 玩家是玩家的同盟
     */
    isPlayerAlly(otherPlayer) {
        return IsPlayerAlly(this.handle, otherPlayer.handle);
    }
    /**
     * 玩家是玩家的敌人
     */
    isPlayerEnemy(otherPlayer) {
        return IsPlayerEnemy(this.handle, otherPlayer.handle);
    }
    /**
     * 玩家的种族选择
     */
    isRacePrefSet(pref) {
        return IsPlayerRacePrefSet(this.handle, pref);
    }
    /**
     * 玩家是否可选
     */
    isSelectable() {
        return GetPlayerSelectable(this.handle);
    }
    /**
     * 点被迷雾遮挡
     */
    pointFogged(whichPoint) {
        return IsLocationFoggedToPlayer(whichPoint.handle, this.handle);
    }
    /**
     * 点被黑色阴影遮挡
     */
    pointMasked(whichPoint) {
        return IsLocationMaskedToPlayer(whichPoint.handle, this.handle);
    }
    /**
     * 点对于玩家可见
     */
    pointVisible(whichPoint) {
        return IsLocationVisibleToPlayer(whichPoint.handle, this.handle);
    }
    /**
     * 踢除玩家
     */
    remove(gameResult) {
        RemovePlayer(this.handle, gameResult);
    }
    /**
     * 忽略所有单位的防守职责
     */
    removeAllGuardPositions() {
        RemoveAllGuardPositions(this.handle);
    }
    /**
     * 允许/禁用 技能 [R]
     */
    setAbilityAvailable(abilId, avail) {
        SetPlayerAbilityAvailable(this.handle, abilId, avail);
    }
    /**
     * 设置联盟状态(指定项目) [R]
     */
    setAlliance(otherPlayer, whichAllianceSetting, value) {
        SetPlayerAlliance(this.handle, otherPlayer.handle, whichAllianceSetting, value);
    }
    /**
     * 显示/隐藏计分屏显示 [R]
     */
    setOnScoreScreen(flag) {
        SetPlayerOnScoreScreen(this.handle, flag);
    }
    /**
     * 增加金币
     */
    addGoldState(value) {
        this.addState(PLAYER_STATE_RESOURCE_GOLD, value);
    }
    /**
     * 增加木材
     */
    addLumberState(value) {
        this.addState(PLAYER_STATE_RESOURCE_LUMBER, value);
    }
    /**
     * 拥有指定数量的金币
     */
    hasGold(value) {
        return this.getState(PLAYER_STATE_RESOURCE_GOLD) >= value;
    }
    /**
     * 拥有指定数量的木材
     */
    hasLumber(value) {
        return this.getState(PLAYER_STATE_RESOURCE_LUMBER) >= value;
    }
    /**
     * 获取金币数量
     */
    getGold() {
        return this.getState(PLAYER_STATE_RESOURCE_GOLD);
    }
    /**
     * 获取木材数量
     */
    getLumber() {
        return this.getState(PLAYER_STATE_RESOURCE_LUMBER);
    }
    /**
     * 添加属性
     */
    addState(whichPlayerState, value) {
        this.setState(whichPlayerState, this.getState(whichPlayerState) + value);
    }
    /**
     * 设置属性
     */
    setState(whichPlayerState, value) {
        SetPlayerState(this.handle, whichPlayerState, value);
    }
    /**
     * 设置税率 [R]
     */
    setTaxRate(otherPlayer, whichResource, rate) {
        SetPlayerTaxRate(this.handle, otherPlayer.handle, whichResource, rate);
    }
    /**
     * 允许玩家的科技上限
     * @param techId
     * @param maximum
     */
    setTechMaxAllowed(techId, maximum) {
        SetPlayerTechMaxAllowed(this.handle, techId, maximum);
    }
    /**
     * 设置玩家科技等级
     */
    setTechResearched(techId, setToLevel) {
        SetPlayerTechResearched(this.handle, techId, setToLevel);
    }
    /**
     * 设置单位所属玩家
     */
    setUnitsOwner(newOwner) {
        SetPlayerUnitsOwner(this.handle, newOwner);
    }
    /**
     * 选取的玩家
     */
    static fromEnum() {
        return MapPlayer.fromHandle(GetEnumPlayer());
    }
    /**
     * 触发玩家
     */
    static fromEvent() {
        return MapPlayer.fromHandle(GetTriggerPlayer());
    }
    /**
     * 匹配的玩家
     */
    static fromFilter() {
        return MapPlayer.fromHandle(GetFilterPlayer());
    }
    /**
     * 从handle获取玩家封装类
     */
    static fromHandle(handle) {
        let obj = cache[GetHandleId(handle)];
        if (!obj) {
            obj = this.getObject(handle);
            cache[GetHandleId(handle)] = obj;
        }
        return obj;
    }
    /**
     * 从玩家id获取玩家封装类
     */
    static fromIndex(index) {
        return this.fromHandle(Player(index));
    }
    /**
     * 获取本地玩家封装类
     */
    static fromLocal() {
        return this.fromHandle(GetLocalPlayer());
    }
}
