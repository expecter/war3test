import Buff from "@/tool/Buff";
import DataBase from "@/common/DataBase";
import BaseUtil from "../BaseUtil";
/**
 * @deprecated see ActorUtil 推荐使用演员buff 以跟演员系统 结合使用
 */
export default class BuffUtil {
    /**这里也保存一下 以保证遍历顺序跟注册顺序一致*/
    static buffTypes = [];
    /**
     * 注册buff类型
     * @param buffType
     */
    static registerBuffType(buffType) {
        //这里保存一下保证读取时快速根据ID读取
        if (DataBase.getSolarBuffType(buffType.id) == null) {
            DataBase.setSolarBuffType(buffType.id, buffType);
            BuffUtil.buffTypes.push(buffType);
        }
        else {
            log.errorWithTraceBack("不能重复注册BuffType:" + buffType.id + " -> " + tostring(buffType.name) + " -> " + DataBase.getSolarBuffType(buffType.id).name);
        }
    }
    /**
     * 注册buff 事件
     * 不能重复注册
     */
    static registerBuffCreatedEvent(buffTypeId, onCreated) {
        let buffType = BuffUtil.getBuffType(buffTypeId);
        if (buffType.onCreated) {
            log.errorWithTraceBack("不能重复注册Buff事件:" + buffTypeId);
            return;
        }
        buffType.onCreated = onCreated;
    }
    /**
     * 注册buff更新事件 取决于buff更新系统 通常为0.1秒更新一次 可用则绑定UI动画
     * @param buffTypeId
     * @param onUpdate
     */
    static registerBuffUpdateEvent(buffTypeId, onUpdate) {
        let buffType = BuffUtil.getBuffType(buffTypeId);
        if (buffType.onUpdate) {
            log.errorWithTraceBack("不能重复注册Buff事件:" + buffTypeId);
            return;
        }
        buffType.onUpdate = onUpdate;
    }
    /**
     * 注册buff 间隔到期事件
     */
    static registerBuffIntervalEvent(buffTypeId, onInterval) {
        let buffType = BuffUtil.getBuffType(buffTypeId);
        if (buffType.onInterval) {
            log.errorWithTraceBack("不能重复注册Buff事件:" + buffTypeId);
            return;
        }
        buffType.onInterval = onInterval;
    }
    /**
     * 注册buff 层数改变事件
     */
    static registerBuffStackCountChangeEvent(buffTypeId, onStackCountChange) {
        let buffType = BuffUtil.getBuffType(buffTypeId);
        if (buffType.onStackCountChange) {
            log.errorWithTraceBack("不能重复注册Buff事件:" + buffTypeId);
            return;
        }
        buffType.onStackCountChange = onStackCountChange;
    }
    /**
     * 注册buff 销毁事件
     */
    static registerBuffDestroyEvent(buffTypeId, onDestroy) {
        let buffType = BuffUtil.getBuffType(buffTypeId);
        if (buffType.onDestroy) {
            log.errorWithTraceBack("不能重复注册Buff事件:" + buffTypeId);
            return;
        }
        buffType.onDestroy = onDestroy;
    }
    /**
     * 根据buffTypeId返回Buff类型
     * @param buffTypeId
     */
    static getBuffType(buffTypeId) {
        let bt = DataBase.getSolarBuffType(buffTypeId);
        return bt;
    }
    /**
     * 给单位上一个buff
     * @param unit 给哪个单位上
     * @param buffTypeId
     * @param caster buff来源单位
     * @param initBuff 初始化buff回调 会在  buffType.onCreated 之前调用  以给buff设置初始自定义值
     */
    static addBuff(unit, buffTypeId, caster, initBuff) {
        let buffType = DataBase.getSolarBuffType(buffTypeId);
        if (!buffType) {
            log.errorWithTraceBack("buff不存在!请先使用registerBuffType注册Buff类型! id=" + buffTypeId);
            return null;
        }
        //判断是否已存在buff
        let oldUnitBuff = BuffUtil.getUnitBuff(unit, buffTypeId);
        if (oldUnitBuff) {
            if (buffType.stackCountMax && buffType.stackCountMax != 0) { //可叠加
                //-1 = 无限叠加
                if (buffType.stackCountMax == -1 || oldUnitBuff.stackCount < buffType.stackCountMax) {
                    oldUnitBuff.stackCount++; //增加叠加层数
                    if (buffType.stackDurMode) {
                        BaseUtil.runLater(buffType.dur, () => {
                            oldUnitBuff.stackCount--;
                        });
                    }
                }
            }
            oldUnitBuff.refresh();
            return oldUnitBuff;
        }
        //新建buff
        let buff = new Buff(buffType, unit, caster, initBuff);
        return buff;
    }
    /**
     * 获取某个玩家的所有单位拥有的增益效果的 第一个
     * （使用场景：比如获取羁绊UI显示的信息）
     * @param player
     * @param buffTypeId
     */
    static getPlayerUnitBuff(player, buffTypeId) {
        GroupEnumUnitsOfPlayer(_sl_tempGroup3, player, null);
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(_sl_tempGroup3);
            if (!IsHandle(unitHandle)) {
                break;
            }
            let buff = BuffUtil.getUnitBuff(unitHandle, buffTypeId);
            if (buff?.buffType.id == buffTypeId) {
                return buff;
            }
            GroupRemoveUnit(_sl_tempGroup3, unitHandle);
        }
        return null;
    }
    /**
     * 获取单位的某个类型的buff
     * @param unit
     * @param buffTypeId
     */
    static getUnitBuff(unit, buffTypeId) {
        return BuffUtil.getUnitBuffs(unit)?.[buffTypeId];
    }
    /**
     * 判断是否拥有某个类型的buff
     * @param unit
     * @param buffTypeId
     */
    static hasUnitBuff(unit, buffTypeId) {
        return BuffUtil.getUnitBuffs(unit)?.[buffTypeId] != null;
    }
    /**
     * 获取单位身上所有buff
     * @param unit
     */
    static getUnitBuffs(unit) {
        let unitSolarData = DataBase.getUnitSolarData(unit, false);
        return unitSolarData?._SL_solarBuffSet;
    }
    /**
     * 获取单位身上所有buff 的属性值
     * @param unit
     */
    static getUnitBuffAttributes(unit) {
        let unitSolarData = DataBase.getUnitSolarData(unit, false);
        let solarBuffSet = unitSolarData?._SL_solarBuffSet;
        if (!solarBuffSet) {
            return null;
        }
        let attributes = [];
        for (let solarBuffSetKey in solarBuffSet) {
            let attribute = solarBuffSet[solarBuffSetKey]?.attribute;
            if (attribute) {
                attributes.push(attribute);
            }
        }
        return attributes;
    }
    /**
     * 遍历所有buff类型
     * @param callback 遍历回调函数
     * @param buffTypeClass 增益效果类型的类别
     */
    static forAllBuffTypes(callback, buffTypeClass) {
        //
        for (let buffType of BuffUtil.buffTypes) {
            if (buffTypeClass) {
                if (buffTypeClass == buffType.class) {
                    callback(buffType);
                }
            }
            else {
                callback(buffType);
            }
        }
    }
    /**
     * 遍历地图上所有单位的所有buffs
     * @param callback
     * @param buffTypeId 只对某个buffType做遍历
     */
    static forAllBuffs(callback, buffTypeId) {
        if (buffTypeId) { //遍历单个类型
            //遍历所有
            DataBase.forUnitSolarDatas((id, solarData) => {
                let _SL_solarBuffSet = solarData?._SL_solarBuffSet;
                if (_SL_solarBuffSet) {
                    for (let tempBuffTypeId in _SL_solarBuffSet) {
                        let buff = _SL_solarBuffSet[tempBuffTypeId];
                        if (buff?.buffType.id == buffTypeId) {
                            callback(buff);
                        }
                    }
                }
            });
        }
        else {
            //遍历所有
            DataBase.forUnitSolarDatas((id, solarData) => {
                let _SL_solarBuffSet = solarData?._SL_solarBuffSet;
                if (_SL_solarBuffSet) {
                    for (let tempBuffTypeId in _SL_solarBuffSet) {
                        callback(_SL_solarBuffSet[tempBuffTypeId]);
                    }
                }
            });
        }
    }
    /**
     * 遍历此单位的 所有buff
     */
    static forUnitBuffs(unit, callback) {
        let buffSet = BuffUtil.getUnitBuffs(unit);
        if (!buffSet) {
            return;
        }
        for (let buffTypeId in buffSet) {
            let buff = buffSet[buffTypeId];
            if (buff) {
                callback(buff);
            }
        }
    }
    /**
     * 清除单位某个类型的buff
     * @param unit
     * @param buffTypeId
     */
    static clearUnitBuff(unit, buffTypeId) {
        BuffUtil.getUnitBuff(unit, buffTypeId)?.destroy();
    }
    /**
     * 清除单位所有buff
     * @param unit 单位
     * @param onlyDeBuff 只清除debuff
     */
    static clearUnitBuffs(unit, onlyDeBuff = false) {
        let buffs = BuffUtil.getUnitBuffs(unit);
        if (!buffs) {
            return;
        }
        for (let buffsKey in buffs) {
            if (onlyDeBuff) {
                if (buffs[buffsKey]?.buffType.isDebuff) {
                    buffs[buffsKey].destroy();
                }
            }
            else {
                buffs[buffsKey]?.destroy();
            }
        }
    }
    /**
     * 清除单位身上某个类别的所有buff
     * @param unit 单位
     * @param clazz
     */
    static clearUnitBuffsByClass(unit, clazz) {
        let buffs = BuffUtil.getUnitBuffs(unit);
        if (!buffs) {
            return;
        }
        for (let buffsKey in buffs) {
            let buff = buffs[buffsKey];
            if (buff?.buffType?.class == clazz) {
                buff.destroy();
            }
        }
    }
    /**
     * 添加任意buff创建事件 监听回调
     */
    static addAnyBuffCreatedListener(onBuffCreatedListener) {
        Buff._sl_anyBuffCreatedListeners.push(onBuffCreatedListener);
    }
    /**
     * 添加任意buff叠加层数改变事件 监听回调
     */
    static addAnyBuffStackCountChangeListener(onBuffStackCountChangeListener) {
        Buff._sl_anyBuffStackCountChangeListeners.push(onBuffStackCountChangeListener);
    }
    /**
     * 添加任意buff销毁事件 监听回调
     */
    static addAnyBuffDestroyListener(onBuffDestroyListener) {
        Buff._sl_anyBuffDestroyListeners.push(onBuffDestroyListener);
    }
    /**
     *
     * @param buffTypeId 增益效果类型id
     * @param enable 启用状态
     * @param player 改变指定玩家的图标启用状态 不填则给所有玩家修改
     */
    static setUiEnable(buffTypeId, enable, player) {
        if (player != null && GetLocalPlayer() != player) { //异步给指定的玩家改
            return;
        }
        let buffType = BuffUtil.getBuffType(buffTypeId);
        if (buffType == null) {
            print("设置未注册的Buff图标:" + buffTypeId);
            return;
        }
        buffType.uiEnable = enable;
    }
    /**
     * 可以改变buff类型 的提示信息
     * @param buffTypeId
     * @param ubertip
     * @param player 为指定玩家异步修改
     */
    static setBuffTypeUbertip(buffTypeId, ubertip, player) {
        if (player != null && GetLocalPlayer() != player) { //异步给指定的玩家改
            return;
        }
        let buffType = BuffUtil.getBuffType(buffTypeId);
        if (buffType == null) {
            print("设置未注册的Buff提示:" + buffTypeId);
            return;
        }
        buffType.ubertip = ubertip;
    }
}
