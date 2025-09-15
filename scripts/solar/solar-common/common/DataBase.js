import GameCenter from "@/GameCenter";
import UnitDeathTimeUtil from "@/UnitDeathTimeUtil";
import BaseUtil from "@/BaseUtil";
/**
 * 数据库
 * 任意数据都可以放到数据库来管理
 */
export default class DataBase {
    static idStrHandleMap = {};
    static dataBaseContext = {};
    static _sl_solarDataIdIndex = 0;
    /**
     * 默认不存在solarData时 创建 solarData
     */
    static DefaultCreateSolarData = true;
    /**
     * base
     * @param type
     * @param handle
     * @param createDefault
     */
    static getDataByHandle(type, handle, createDefault = DataBase.DefaultCreateSolarData) {
        if (!IsHandle(handle)) {
            if (createDefault) {
                log.errorWithTraceBack("DataBase.getData():" + type + ":你传的handle为空或0！不能为空hanlde创建SolarData");
            }
            return null;
        }
        return DataBase.getDataByTypeId(type, tostring(GetHandleId(handle)), createDefault);
    }
    /**
     * 获取一个类型的所有数据
     * @param type
     */
    static getTypeData(type) {
        return DataBase.dataBaseContext[type];
    }
    /**
     * 遍历一个类型的所有数据
     * @param type
     * @param callBack
     */
    static forTypeDatas(type, callBack) {
        let typeData = DataBase.dataBaseContext[type];
        if (typeData) {
            for (let id in typeData) {
                callBack(id, typeData[id]);
            }
        }
    }
    /**
     * 基础的获取数据的方式
     * @param type 类型
     * @param id 数据id
     * @param createDefault 如之前未设置data 则可以返回一个默认的空对象 以供使用
     */
    static getDataByTypeId(type, id, createDefault = DataBase.DefaultCreateSolarData) {
        let typeData = DataBase.dataBaseContext[type];
        if (typeData == null && createDefault) {
            typeData = {};
            DataBase.dataBaseContext[type] = typeData;
        }
        if (typeData == null) {
            return null;
        }
        let data = typeData[id];
        if (!data && createDefault) {
            data = {};
            typeData[id] = data;
            if (isDebug) {
                DataBase._sl_solarDataIdIndex++;
                data._SL_id = (type + ":" + DataBase._sl_solarDataIdIndex);
            }
        }
        return data;
    }
    static setDataByHandle(type, handle, obj) {
        if (!IsHandle(handle)) {
            let tb = debug.traceback();
            log.error("DataBase.setData():" + type + ":你传的handle为空或0！");
            log.error(tb);
            return null;
        }
        return DataBase.setDataByTypeId(type, tostring(GetHandleId(handle)), obj);
    }
    /**
     * 基础的设置数据的方式
     * @param type
     * @param id
     * @param obj
     */
    static setDataByTypeId(type, id, obj) {
        let typeData = DataBase.dataBaseContext[type];
        if (typeData == null && obj != null) {
            typeData = {};
            DataBase.dataBaseContext[type] = typeData;
        }
        if (obj == null && typeData?.[id] == null) {
            //如果有才清空 没有就不要设置一个key为null了
            return;
        }
        typeData[id] = obj;
    }
    static clearDataByHandle(type, handle) {
        if (!IsHandle(handle)) {
            let tb = debug.traceback();
            log.error("DataBase.clearData():" + type + ":你传的handle为空或0！");
            log.error(tb);
            return null;
        }
        DataBase.setDataByTypeId(type, tostring(GetHandleId(handle)), null);
    }
    /**
     * addons Obj Type
     */
    static getUnitTypeSolarData(id, createDefault = DataBase.DefaultCreateSolarData) {
        return DataBase.getDataByTypeId("_SL_UnitType", id, createDefault);
    }
    static setUnitTypeSolarData(id, obj) {
        DataBase.setDataByTypeId("_SL_UnitType", id, obj);
    }
    static forUnitTypeSolarDatas(callback) {
        DataBase.forTypeDatas("_SL_UnitType", callback);
    }
    static getItemTypeSolarData(id, createDefault = DataBase.DefaultCreateSolarData) {
        return DataBase.getDataByTypeId("_SL_ItemType", id, createDefault);
    }
    static setItemTypeSolarData(id, obj) {
        DataBase.setDataByTypeId("_SL_ItemType", id, obj);
    }
    static forItemTypeSolarDatas(callback) {
        DataBase.forTypeDatas("_SL_ItemType", callback);
    }
    static getAbilityTypeSolarData(id, createDefault = DataBase.DefaultCreateSolarData) {
        return DataBase.getDataByTypeId("_SL_AbilityType", id, createDefault);
    }
    static setAbilityTypeSolarData(id, obj) {
        DataBase.setDataByTypeId("_SL_AbilityType", id, obj);
    }
    static forAbilityTypeSolarDatas(callback) {
        DataBase.forTypeDatas("_SL_AbilityType", callback);
    }
    /**
     * Solar Buff Type
     * 存储太阳增益效果类型
     */
    static getSolarBuffType(sBuffTypeId) {
        return DataBase.getDataByTypeId("_SL_SolarBuffType", sBuffTypeId, false);
    }
    static setSolarBuffType(sBuffTypeId, appBuffType) {
        DataBase.setDataByTypeId("_SL_SolarBuffType", sBuffTypeId, appBuffType);
    }
    /**
     * 获取太阳buff的自定义值
     * @param id
     * @param createDefault
     */
    static getSolarBuffSolarData(id, createDefault = DataBase.DefaultCreateSolarData) {
        return DataBase.getDataByTypeId("_SL_SolarBuff", id, createDefault);
    }
    static setSolarBuffSolarData(id, obj) {
        DataBase.setDataByTypeId("_SL_SolarBuff", id, obj);
    }
    static forSolarBuffSolarData(callBack) {
        DataBase.forTypeDatas("_SL_SolarBuff", callBack);
    }
    /**
     * Solar Actor Type
     * 存储太阳 演员 类型
     */
    static getSolarActorType(sActorTypeId) {
        return DataBase.getDataByTypeId("_SL_SolarActorType", sActorTypeId, false);
    }
    static setSolarActorType(sActorTypeId, appActorType) {
        DataBase.setDataByTypeId("_SL_SolarActorType", sActorTypeId, appActorType);
    }
    /**
     * 获取太阳actor的自定义值
     * @param id
     * @param createDefault
     */
    static getSolarActorSolarData(id, createDefault = DataBase.DefaultCreateSolarData) {
        return DataBase.getDataByTypeId("_SL_SolarActor", id, createDefault);
    }
    static setSolarActorSolarData(id, obj) {
        DataBase.setDataByTypeId("_SL_SolarActor", id, obj);
    }
    static forSolarActorSolarData(callBack) {
        DataBase.forTypeDatas("_SL_SolarActor", callBack);
    }
    /**
     * addons Handle
     * ps: 支持异步创建solarData 放心使用
     */
    static getUnitSolarData(handle, createDefault = DataBase.DefaultCreateSolarData) {
        if (!IsHandle(handle)) {
            log.errorWithTraceBack("你正在获取一个空单位handle的solarData!");
            return null;
        }
        if (isDebug && createDefault) {
            let info = handledef(handle);
            if (info && info.type != null && info.type != "+w3u") { //判断一下是否被底层回收
                print("handle= " + GetHandleId(handle));
                print_r(handledef(handle));
                log.errorWithTraceBack(time + "正在从一个不是单位的handle中 获取单位solarData。可能此handle已被底层销毁 或被其他类型的handle重用！");
            }
            //
            if (!UnitAlive(handle) && DataBase.getDataByHandle("+w3u", handle, false) == null) {
                //延迟0.01秒 以兼容在死亡事件里新建solarData 可能还未正取设置死亡时间 延迟可以获得正确的死亡时间(以免获取到继承的旧单位时间)
                let tb = debug.traceback();
                BaseUtil.runLater(0.01, () => {
                    if (!UnitDeathTimeUtil.hasDeathTime(handle)) {
                        print("time=" + time);
                        log.errorWithTraceBack(time + "警告：正在给没有死亡时间的死亡单位新建SolarData: " + tostring(GetUnitName(handle)) +
                            "这可能是死亡单位已被RemoveUnit移除超过handle重用时间，请不要获取已被移除很久的单位的solarData数据。handle重用保护时间=" + handleReuseMinTime);
                    }
                    else if (UnitDeathTimeUtil.isTimeOfDeathExceeded(handle, handleReuseMinTime)) {
                        //不是英雄单位 或已被底层回收的英雄单位 需要判断是否在handle重用时间之内
                        print("deathTime=" + UnitDeathTimeUtil.getDeathTime(handle));
                        print("time=" + time);
                        print("baseTraceback=" + tostring(tb));
                        log.errorWithTraceBack(time + "警告：正在给超过handle重用保护时间的死亡单位新建SolarData: " + tostring(GetUnitName(handle)) +
                            ":这可能导致单位不会被正常清理solarData并造成solarData重用。handle重用保护时间=" + handleReuseMinTime);
                    }
                });
            }
        }
        let solarData = DataBase.getDataByHandle("+w3u", handle, createDefault);
        if (isDebug && solarData) { //debug数据 附加
            if (!solarData._SL_name) {
                solarData._SL_name = GetUnitName(handle);
            }
            if (createDefault) {
                solarData._SL_createDefaultGetTime = time;
            }
        }
        return solarData;
    }
    static clearUnitSolarData(handle) {
        let solarData = DataBase.getUnitSolarData(handle, false);
        if (solarData) {
            if (solarData._SL_solarBuffSet) {
                for (let buffTypeId in solarData._SL_solarBuffSet) {
                    solarData._SL_solarBuffSet[buffTypeId]?.destroy();
                }
            }
            DataBase.clearDataByHandle("+w3u", handle);
        }
    }
    /**
     * 遍历所有单位的 solarData
     * @param handle
     * @param callBack
     */
    static forUnitSolarDatas(callBack) {
        let typeData = DataBase.dataBaseContext["+w3u"];
        if (!typeData) {
            return;
        }
        //这里虽然可以使用typeData反推单位handle出来 但是对数据同步性要求太高 导致易用性极低，所以还是使用带缓存的全图单位靠谱，稳定大于一切
        let allUnits = GameCenter.getAllUnits(true);
        for (let unitHandle of allUnits) {
            let solarData = typeData[tostring(unitHandle)];
            if (solarData) {
                callBack(unitHandle, solarData);
            }
        }
    }
    static getItemSolarData(handle, createDefault = DataBase.DefaultCreateSolarData) {
        return DataBase.getDataByHandle("item", handle, createDefault);
    }
    static clearItemSolarData(handle) {
        DataBase.clearDataByHandle("item", handle);
    }
    static getDialogButtonSolarData(handle) {
        return DataBase.getDataByHandle("+dlb", handle);
    }
    static clearDialogButtonSolarData(handle) {
        DataBase.clearDataByHandle("+dlb", handle);
    }
    static getPlayerSolarData(handle, createDefault = DataBase.DefaultCreateSolarData) {
        return DataBase.getDataByHandle("+ply", handle, createDefault);
    }
    static clearPlayerSolarData(handle) {
        DataBase.clearDataByHandle("+ply", handle);
    }
    /**获取handle的 solar data */
    static sd(handle, createDefault = DataBase.DefaultCreateSolarData) {
        if (!IsHandle(handle)) {
            log.errorWithTraceBack("sd:你传的handle为空或0！");
            return null;
        }
        let type = handledef(handle)?.type;
        if (!type) {
            print("警告：你的handle数据已被底层回收!请实时获取handle,sd智能方法不能使用过时的handle");
            log.errorWithTraceBack("sd:" + tostring(type) + ":你传的handle类型不存在！" + tostring(handle));
            return null;
        }
        if (type == "+w3u") {
            //单位走专用的 方法
            return DataBase.getUnitSolarData(handle, createDefault);
        }
        return DataBase.getDataByHandle(type, handle, createDefault);
    }
}
