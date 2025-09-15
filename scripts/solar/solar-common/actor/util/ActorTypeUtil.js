import DataBase from "@/DataBase";
import ActorItem from "@/ActorItem";
import ArrayUtil from "@/ArrayUtil";
/**
 * 演员类型相关工具
 */
export default class ActorTypeUtil {
    /**这里也保存一下 以保证遍历顺序跟注册顺序一致*/
    static actorTypes = [];
    /**
     * 全局任意演员类型事件
     */
    static _sl_onRegisterActorTypeListeners = [];
    /**
     * 添加任意演员类型注册事件 监听回调
     *
     * @param registerActorTypeListener 回调
     * @param actorTypeID 指定只监听某一个演员类型
     */
    static addRegisterActorTypeListener(registerActorTypeListener, actorTypeID) {
        if (actorTypeID) {
            ActorTypeUtil._sl_onRegisterActorTypeListeners.push(actorType => {
                if (actorTypeID == actorType.id) {
                    registerActorTypeListener(actorType);
                }
            });
        }
        else {
            ActorTypeUtil._sl_onRegisterActorTypeListeners.push(registerActorTypeListener);
        }
    }
    static registerActorType(actorTypeIdOrActorType) {
        let actorType = null;
        if (typeof actorTypeIdOrActorType == "string") {
            actorType = { id: actorTypeIdOrActorType };
        }
        else {
            actorType = actorTypeIdOrActorType;
        }
        if (actorType.id == null || actorType.id.length == 0) {
            print_r(actorType);
            log.errorWithTraceBack("ActorType id必须赋值！");
            return;
        }
        //这里保存一下保证读取时快速根据ID读取
        if (DataBase.getSolarActorType(actorType.id) == null || gv.reloadIng == true) {
            DataBase.setSolarActorType(actorType.id, actorType);
            ActorTypeUtil.actorTypes.push(actorType);
            ArrayUtil.forEach(ActorTypeUtil._sl_onRegisterActorTypeListeners, (registerActorTypeListener) => {
                registerActorTypeListener(actorType);
            });
        }
        else {
            log.errorWithTraceBack("不能重复注册ActorType:" + actorType.id + " -> " + tostring(actorType.name));
        }
        return actorType;
    }
    /**
     * 是否拥有指定的演员类型
     * @param actorTypeId 类型id
     */
    static hasActorType(actorTypeId) {
        //这里保存一下保证读取时快速根据ID读取
        if (actorTypeId == null || actorTypeId.length == 0) {
            return false;
        }
        if (DataBase.getSolarActorType(actorTypeId) == null) {
            return false;
        }
        return true;
    }
    /**
     * 根据actorTypeId返回Actor类型
     * @param actorTypeId
     */
    static getActorType(actorTypeId) {
        if (actorTypeId == null) {
            log.errorWithTraceBack("actorTypeId不能为null!");
            return null;
        }
        return DataBase.getSolarActorType(actorTypeId);
    }
    /**
     * 获取所有类型
     */
    static getAllActorTypes() {
        return ActorTypeUtil.actorTypes;
    }
    /**
     * 遍历所有Actor类型
     * @param callback 遍历回调函数
     * @param actorTypeClass ActorType的类别 Class
     */
    static forAllActorTypes(callback, ...actorTypeClass) {
        //
        let index = 0;
        if (actorTypeClass && actorTypeClass.length > 0) {
            for (let actorType of ActorTypeUtil.actorTypes) {
                if (actorTypeClass.includes(actorType.class)) {
                    callback(actorType, index);
                    index++;
                }
            }
        }
        else {
            for (let actorType of ActorTypeUtil.actorTypes) {
                callback(actorType, index);
                index++;
            }
        }
    }
    /**
     *
     * @param actorTypeId 增益效果类型id
     * @param uiEnable 是否启用
     * @param player 改变指定玩家的图标禁用状态 不填则给所有玩家修改
     * （示例 商城道具跟存档这些也是演员类型 默认都是禁用的 可以使用此方法对玩家启用此类型  数值计算还是同步计算 这个类型就是作为ui显示数据而已 ）
     */
    static setUiEnable(actorTypeId, uiEnable, player) {
        if (player != null && GetLocalPlayer() != player) { //异步给指定的玩家改
            return;
        }
        let actorType = ActorTypeUtil.getActorType(actorTypeId);
        if (actorType == null) {
            print("设置未注册的Actor图标:" + actorTypeId);
            return;
        }
        actorType.uiEnable = uiEnable;
    }
    /**
     * 可以改变演员类型 的扩展提示信息
     * @param actorTypeId
     * @param describe
     * @param player 为指定玩家异步修改
     */
    static setTypeDescribe(actorTypeId, describe, player) {
        if (player != null && GetLocalPlayer() != player) { //异步给指定的玩家改
            return;
        }
        let actorType = ActorTypeUtil.getActorType(actorTypeId);
        if (actorType == null) {
            print("设置未注册的Actor提示:" + actorTypeId);
            return;
        }
        actorType.describe = describe;
    }
    /**
     * 从基础物品物编注册 演员类型
     *  (将一个原始物品类型包装到一个演员物品 以方便使用演员物编的事件等api)
     * （使用举例: 部分需要原始物品的效果 比如市场(随机)售卖的物品 获得后又需要演员物品的事件效果）
     * @param itemTypeIdStr
     * @param baseData
     * @param bindItemAndActor
     */
    static registerActorTypeFromBaseItemType(itemTypeIdStr, baseData = {}, bindItemAndActor = false) {
        let itemObjInfo = _g_objs.item[itemTypeIdStr];
        if (itemObjInfo == null) {
            log.errorWithTraceBack("不存在此物品id:" + itemTypeIdStr);
            return null;
        }
        baseData.id = itemTypeIdStr;
        baseData.name = itemObjInfo.Tip;
        baseData.icon = itemObjInfo.Art;
        baseData.describe = itemObjInfo.Ubertip;
        if (itemObjInfo.file) {
            baseData.model = itemObjInfo.file;
        }
        if (itemObjInfo.pawnable) {
            baseData.pawnable = itemObjInfo.pawnable == "1";
        }
        if (itemObjInfo.droppable) {
            baseData.droppable = itemObjInfo.droppable == "1";
        }
        if (itemObjInfo.goldcost) {
            baseData.goldCost = Math.floor(tonumber(itemObjInfo.goldcost));
        }
        if (itemObjInfo.lumbercost) {
            baseData.lumberCost = Math.floor(tonumber(itemObjInfo.lumbercost));
        }
        ActorTypeUtil.registerActorType(baseData);
        if (bindItemAndActor) {
            se.onUnitPickupItem(e => {
                if (e.manipulatedItemTypeIdStr == itemTypeIdStr) {
                    RemoveItem(e.manipulatedItem);
                    let actorItem = new ActorItem(itemTypeIdStr);
                    UnitAddItem(e.trigUnit, actorItem.item);
                }
            });
        }
        return baseData;
    }
}
