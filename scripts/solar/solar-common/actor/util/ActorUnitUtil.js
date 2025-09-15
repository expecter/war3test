import ActorUnit from "@/ActorUnit";
import DataBase from "@/DataBase";
import ActorTypeUtil from "@/ActorTypeUtil";
import UnitUtil from "@/UnitUtil";
import GroupUtil from "@/GroupUtil";
export default class ActorUnitUtil {
    /**
     * 创建单位或者演员单位
     * @param player
     * @param actorUnitTypeId
     * @param x
     * @param y
     * @param face
     * @param count 创建数量 默认为1
     * 返回最后一个创建的演员单位
     * @param callBack 创建单位后的回调
     */
    static createUnit(player, actorUnitTypeId, x, y, face = 0, count = 1, callBack) {
        if (ActorTypeUtil.hasActorType(actorUnitTypeId)) {
            let actorCallBack = null;
            if (callBack) {
                actorCallBack = (actorUnit) => {
                    callBack(actorUnit?.unit);
                };
            }
            return ActorUnitUtil.createActorUnit(player, actorUnitTypeId, x, y, face, count, actorCallBack)?.unit;
        }
        else {
            let unit = UnitUtil.createUnit(player, actorUnitTypeId, x, y, face, count);
            // SetUnitFacing(unit, face);
            return unit;
        }
    }
    /**
     * 创建演员单位
     * @param player
     * @param actorUnitTypeId
     * @param x
     * @param y
     * @param face
     * @param count 创建数量 默认为1
     * 返回最后一个创建的演员单位
     * @param callBack 创建单位后的回调
     */
    static createActorUnit(player, actorUnitTypeId, x, y, face = 0, count = 1, callBack) {
        let actorUnit = null;
        for (let i = 0; i < count; i++) {
            actorUnit = new ActorUnit(actorUnitTypeId, player, x, y);
            SetUnitFacing(actorUnit.unit, face);
            callBack?.(actorUnit);
        }
        return actorUnit;
    }
    /**
     * 如果单位是一个 演员单位
     * @param unit
     * @param callBack
     * @param actorTypeId
     */
    static ifHasActorUnit(unit, callBack, actorTypeId) {
        let actor = DataBase.getUnitSolarData(unit, false)?._SL_solarActorUnit;
        if (actor == null) {
            return;
        }
        if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
            return;
        }
        callBack(actor);
    }
    /**
     * 判断单位是一个 演员单位
     * @param unit
     * @param callBack
     * @param actorTypeId
     */
    static hasActorUnit(unit, callBack, actorTypeId) {
        let actor = DataBase.getUnitSolarData(unit, false)?._SL_solarActorUnit;
        if (actor == null) {
            return false;
        }
        if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
            return false;
        }
        return true;
    }
    /**
     * 判断单位是一个 演员单位
     * @param unit
     * @param callBack
     * @param actorTypeId
     */
    static getActorUnit(unit, actorTypeId) {
        let actor = DataBase.getUnitSolarData(unit, false)?._SL_solarActorUnit;
        if (actor == null) {
            return null;
        }
        if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
            return null;
        }
        return actor;
    }
    /**
     * 判断单位是一个演员单位类型
     * @param unit
     * @param actorTypeId
     */
    static isActorUnitType(unit, actorTypeId) {
        let actor = DataBase.getUnitSolarData(unit, false)?._SL_solarActorUnit;
        if (actor == null) {
            return false;
        }
        if (actorTypeId == actor.actorTypeId) {
            return true;
        }
        return false;
    }
    /**
     * 获取单位的演员单位类型id 如果不是演员类型则返回基础的类型id
     * @param unit
     */
    static getUnitId(unit) {
        let actor = DataBase.getUnitSolarData(unit, false)?._SL_solarActorUnit;
        if (actor == null) {
            return id2string(GetUnitTypeId(unit));
        }
        return actor.actorTypeId;
    }
    /**
     * 获取单位的演员单位类型id
     * @param unit
     */
    static getActorUnitTypeId(unit) {
        let actor = DataBase.getUnitSolarData(unit, false)?._SL_solarActorUnit;
        return actor?.actorTypeId;
    }
    /**
     * 获取玩家所有单位
     * @param playerIndex
     * @param actorUnitType
     */
    static getPlayerActorUnits(playerIndex, actorUnitType) {
        let resultUnits = [];
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsOfPlayer(group, Player(playerIndex), null);
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(group);
            if (!IsHandle(unitHandle)) {
                break;
            }
            let actor = DataBase.getUnitSolarData(unitHandle, false)?._SL_solarActorUnit;
            if (actor && UnitAlive(unitHandle) && (actorUnitType == null || actor.actorTypeId == actorUnitType)) {
                resultUnits.push(actor);
            }
            GroupRemoveUnit(group, unitHandle);
        }
        GroupUtil.groupObjectPool.returnObject(group);
        return resultUnits;
    }
    /**
     * 获取单位的名字
     * @param whichUnit
     */
    static getUnitName(whichUnit) {
        let actorUnit = ActorUnitUtil.getActorUnit(whichUnit);
        if (actorUnit != null) {
            return actorUnit.getName();
        }
        return GetUnitName(whichUnit);
    }
}
