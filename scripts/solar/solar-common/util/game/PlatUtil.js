/**
 * 对战平台工具
 * platform Util
 */
import DataBase from "@/DataBase";
import SyncUtil from "@/SyncUtil";
import SolarTrigger from "@/SolarTrigger";
export default class PlatUtil {
    static allArchiveKeys = [];
    /**
     * 是否拥有商品
     * @param p
     * @param key 商品key
     */
    static hasMallItem(p, key) {
        return DzAPI_Map_HasMallItem(p, key);
    }
    /**
     * 获取玩家商品数量
     * (消耗品可以叠加效果 做可重复购买的道具 如每个商品增加1%攻击 无上限)
     * @param p
     * @param key
     */
    static getMallItemCount(p, key) {
        return DzAPI_Map_GetMallItemCount(p, key);
    }
    /**
     * 消耗商品
     * @param p
     * @param key
     * @param count
     */
    static consumeMallItem(p, key, count) {
        return DzAPI_Map_ConsumeMallItem(p, key, count);
    }
    /**
     * 地图等级
     * @param p
     */
    static getMapLevel(p) {
        return DzAPI_Map_GetMapLevel(p);
    }
    /**
     * 总签到天数
     * @param p
     */
    static continuousCount(p) {
        return DzAPI_Map_ContinuousCount(p, 0);
    }
    /**
     * 累计获得赞数
     * @param p
     */
    static getForumDataTotalLikes(p) {
        return DzAPI_Map_GetForumData(p, 0);
    }
    /**
     * 主题数量
     * @param p
     */
    static getForumDataTotalSubject(p) {
        return DzAPI_Map_GetForumData(p, 6);
    }
    /**
     * 收藏过地图
     * @param p
     */
    static isCollect(p) {
        return DzAPI_Map_Returns(p, 16);
    }
    /**
     * 公会名称
     * @param p
     */
    static getGuildName(p) {
        return DzAPI_Map_GetGuildName(p);
    }
    /**
     * 可以设置1-3个存档用于对战平台房间内及个人战绩展示
     * (11可以设置1-8个 只能设置数字)
     * @param whichPlayer
     * @param key
     * @param value
     */
    static setStat(whichPlayer, key, value) {
        DzAPI_Map_Stat_SetStat(whichPlayer, key, value);
    }
    /**
     * 所有地图的总游戏时长
     * @param whichPlayer
     */
    static mapsTotalPlayed(whichPlayer) {
        return DzAPI_Map_MapsTotalPlayed(whichPlayer);
    }
    /**
     * 获取宝箱抽取总次数
     * @param whichPlayer
     * @param limitIndex 只返回指定宝箱的抽取次数
     */
    static getLotteryUsedCount(whichPlayer, limitIndex) {
        if (limitIndex == null) {
            return DzAPI_Map_GetLotteryUsedCount(whichPlayer);
        }
        else {
            return DzAPI_Map_GetLotteryUsedCountEx(whichPlayer, limitIndex);
        }
    }
    /**
     * 存储服务器存档字符串
     * 实际key 不会加S前缀
     * @param whichPlayer
     * @param key
     * @param value
     */
    static storeStr(whichPlayer, key, value) {
        if (!PlatUtil.allArchiveKeys.includes(key)) {
            PlatUtil.allArchiveKeys.push(key);
        }
        DzAPI_Map_SaveServerValue(whichPlayer, key, value);
    }
    /**
     * 获取服务器存档字符串
     * 实际key 不会加S前缀
     * @param whichPlayer
     * @param key
     */
    static getStoreStr(whichPlayer, key) {
        if (!PlatUtil.allArchiveKeys.includes(key)) {
            PlatUtil.allArchiveKeys.push(key);
        }
        return DzAPI_Map_GetServerValue(whichPlayer, key);
    }
    /**
     * 存储服务器存档整数
     * 实际key 不会加I前缀
     * @param whichPlayer
     * @param key
     * @param value
     */
    static storeInt(whichPlayer, key, value) {
        if (!PlatUtil.allArchiveKeys.includes(key)) {
            PlatUtil.allArchiveKeys.push(key);
        }
        return DzAPI_Map_SaveServerValue(whichPlayer, key, I2S(value));
    }
    /**
     * 获取服务器存档整数
     * 实际key 不会加I前缀
     * @param whichPlayer
     * @param key
     */
    static getStoreInt(whichPlayer, key) {
        if (!PlatUtil.allArchiveKeys.includes(key)) {
            PlatUtil.allArchiveKeys.push(key);
        }
        return S2I(DzAPI_Map_GetServerValue(whichPlayer, key));
    }
    /**
     * 增加存储服务器存档整数 单局可以重复调用 累加
     * 实际key 不会加I前缀
     * @param whichPlayer
     * @param key
     * @param addValue 增加值
     */
    static addStoreInt(whichPlayer, key, addValue) {
        let oldNum = 0;
        let playerSolarData = DataBase.getPlayerSolarData(whichPlayer);
        if (playerSolarData["_sl_addStoreInt:" + key]) {
            oldNum = playerSolarData["_sl_addStoreInt:" + key];
        }
        else {
            oldNum = PlatUtil.getStoreInt(whichPlayer, key) || 0;
        }
        let newNum = oldNum + addValue;
        //用自定义值存一下 最新的值 以免一直以开始游戏的基础值做基数加了 这样会导致只有最后一次加的数才会加上，
        playerSolarData["_sl_addStoreInt:" + key] = newNum;
        return PlatUtil.storeInt(whichPlayer, key, newNum);
    }
    /**
     * 获取全局存档整数
     * @param key
     */
    static storeGlobalInt(key, val) {
        return DzAPI_Map_Global_StoreString(key, tostring(val));
    }
    /**
     * 获取全局存档整数
     * @param key
     */
    static getGlobalStoreInt(key) {
        return S2I(PlatUtil.getGlobalStoreString(key));
    }
    /**
     * 获取全局存档
     * @param key
     */
    static getGlobalStoreString(key) {
        //全局存档可读可写时使用DzAPI_Map_Global_GetStoreString才能取到值
        //全局存档只读时使用DzAPI_Map_GetMapConfig才能取到值
        return DzAPI_Map_Global_GetStoreString(key) || DzAPI_Map_GetMapConfig(key);
    }
    /**
     * kk addons
     */
    static getPlayerUserName(whichPlayer) {
        return RequestExtraIntegerData(81, whichPlayer, null, null, false, 0, 0, 0);
    }
    /**
     * 获取玩家在指定自定义排行榜上的排名。
     * @param whichPlayer
     * @param id
     */
    static getCustomRank(whichPlayer, id) {
        return RequestExtraIntegerData(52, whichPlayer, null, null, false, id, 0, 0);
    }
    /**
     * 获取指定自定义排行榜的上榜人数。
     * 需要授权后才允许使用 否则返回0
     * @param id
     */
    static getCustomRankCount(id) {
        return RequestExtraIntegerData(78, null, null, null, false, id, 0, 0);
    }
    /**
     * 获取指定自定义排行榜上指定名次的玩家昵称。。
     * 需要授权后才允许使用 否则返回null
     * @param id
     * @param ranking
     */
    static getCustomRankPlayerName(id, ranking) {
        return RequestExtraStringData(79, null, null, null, false, id, ranking, 0);
    }
    /**
     * 获取指定自定义排行榜上指定名次的玩家数值（排行榜值）。。。
     * 需要授权后才允许使用 否则返回0
     * @param id
     * @param ranking
     */
    static getCustomRankValue(id, ranking) {
        return RequestExtraIntegerData(80, null, null, null, false, id, ranking, 0);
    }
    /**
     * 通知服务器端产生一个随机数，并将随机数保存至指定的只读型存档变量Key中。
     *
     * 生成随机数时需要关联一个组ID，该组ID可以在平台进行防刷分管理，同组ID下各个Key共享CD和次数。
     * @param whichPlayer
     * @param key 支持64位长度 只支持大小写字母与数字(不支持负号-)
     * @param groupkey
     */
    static requestBackendLogic(whichPlayer, key, groupkey) {
        return RequestExtraBooleanData(83, whichPlayer, key, groupkey, false, 0, 0, 0);
    }
    /**
     * 读取服务器端所产生的随机数的值
     * @param whichPlayer
     * @param key
     */
    static checkBackendLogicExists(whichPlayer, key) {
        return RequestExtraBooleanData(84, whichPlayer, key, null, false, 0, 0, 0);
    }
    /**
     * 读取服务器端所产生的随机数的值
     * @param whichPlayer
     * @param key
     */
    static getBackendLogicIntResult(whichPlayer, key) {
        return RequestExtraIntegerData(85, whichPlayer, key, null, false, 0, 0, 0);
    }
    /**
     * 读取服务器端所产生随机数的生成时间
     * @param whichPlayer
     * @param key
     */
    static getBackendLogicUpdateTime(whichPlayer, key) {
        return RequestExtraIntegerData(87, whichPlayer, key, null, false, 0, 0, 0);
    }
    /**
     * 读取指定的随机只读存档变量Key最后一次是由哪个组ID所生成的。
     * @param whichPlayer
     * @param key
     */
    static getBackendLogicGroup(whichPlayer, key) {
        return RequestExtraStringData(88, whichPlayer, key, null, false, 0, 0, 0);
    }
    /**
     * 删除指定的随机只读存档变量Key中所保存的随机数。
     *
     * @param whichPlayer
     * @param key
     */
    static removeBackendLogicResult(whichPlayer, key) {
        return RequestExtraBooleanData(89, whichPlayer, key, null, false, 0, 0, 0);
    }
    static _sl_onBackendLogicUpdateEvent_init = true;
    static _sl_onBackendLogicUpdateEventCallBacks = {};
    /**
     * 注册随机数更新事件
     * @param key
     * @param callBack
     */
    static onBackendLogicUpdateEvent(key, callBack) {
        if (PlatUtil._sl_onBackendLogicUpdateEvent_init) {
            SyncUtil.onSyncData("DZBLU", (eventPlayer, eventKey) => {
                let callBacks = PlatUtil._sl_onBackendLogicUpdateEventCallBacks[eventKey];
                if (callBacks) {
                    let newRandomInt = PlatUtil.getBackendLogicIntResult(eventPlayer, eventKey);
                    let timeStamp = KKApiGetBackendLogicUpdateTime(eventPlayer, eventKey);
                    let groupKey = KKApiGetBackendLogicGroup(eventPlayer, eventKey);
                    let data = { eventPlayer, newRandomInt, eventKey, groupKey, timeStamp };
                    for (let callBack of callBacks) {
                        callBack.exec(data);
                    }
                }
            }, true);
            PlatUtil._sl_onBackendLogicUpdateEvent_init = false;
        }
        let solarTriggerSet = PlatUtil._sl_onBackendLogicUpdateEventCallBacks[key];
        if (solarTriggerSet == null) {
            solarTriggerSet = [];
            PlatUtil._sl_onBackendLogicUpdateEventCallBacks[key] = solarTriggerSet;
        }
        return new SolarTrigger((solarTrigger, data) => {
            callBack(data.eventPlayer, data.newRandomInt, data.eventKey, data.groupKey, data.timeStamp);
        }, solarTriggerSet);
    }
    /**
     * 获取指定服务器存档变量的天/周上限余额，需要在开发者平台配置服务器存档防刷。
     *（高级接口，需要授权后才允许使用。）
     * @param whichPlayer
     * @param key
     */
    static getServerValueLimitLeft(whichPlayer, key) {
        return RequestExtraIntegerData(82, whichPlayer, key, null, false, 0, 0, 0);
    }
    /**
     * 获取玩家平台id
     * @param player
     */
    static getPlayerGUID(player) {
        if (KKApiPlayerGUID) {
            return KKApiPlayerGUID(player);
        }
        return GetPlayerName(player);
    }
}
