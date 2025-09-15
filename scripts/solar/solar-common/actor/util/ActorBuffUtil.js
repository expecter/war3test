import ActorBuff from "@/ActorBuff";
import Actor from "@/Actor";
import DataBase from "@/DataBase";
import BaseUtil from "@/BaseUtil";
/**
 * see ActorUtil 优先使用演员工具 不要把演员局限到技能或物品或buff上 这样会导致演员不够通用切换形态
 */
export default class ActorBuffUtil {
    /**
     * 添加任意演员Buff创建事件 监听回调
     */
    static addAnyActorBuffCreatedListener(onActorBuffCreatedListener) {
        Actor._sl_anyActorCreatedListeners.push(buff => {
            if (buff instanceof ActorBuff) {
                onActorBuffCreatedListener(buff);
            }
        });
    }
    /**
     * 添加任意演员Buff叠加层数改变事件 监听回调
     */
    static addAnyActorBuffLevelChangeListener(onActorBuffLevelChangeListener) {
        Actor._sl_anyActorLevelChangeListeners.push((buff, delta) => {
            if (buff instanceof ActorBuff) {
                onActorBuffLevelChangeListener(buff, delta);
            }
        });
    }
    /**
     * 添加任意演员Buff销毁事件 监听回调
     */
    static addAnyActorBuffDestroyListener(onActorBuffDestroyListener) {
        Actor._sl_anyActorDestroyListeners.push(buff => {
            if (buff instanceof ActorBuff) {
                onActorBuffDestroyListener(buff);
            }
        });
    }
    /**
     * 演员buff
     */
    /**
     * 给单位上一个演员buff
     * @param unit 给哪个单位上
     * @param actorTypeId 演员类型id
     * @param creator buff来源单位
     * @param initActorBuff 初始化ActorBuff回调 会在  buffType.onCreated 之前调用  以给buff设置初始自定义值
     */
    static addActorBuff(unit, actorTypeId, creator, initActorBuff) {
        let actorType = DataBase.getSolarActorType(actorTypeId);
        if (!actorType) {
            log.errorWithTraceBack("buff不存在!请先使用registerActorType注册演员类型! id=" + actorTypeId);
            return null;
        }
        //判断是否已存在buff
        let oldUnitBuff = ActorBuffUtil.getUnitActorBuff(unit, actorTypeId);
        if (oldUnitBuff) {
            let levelMax = oldUnitBuff.get("levelMax");
            if (levelMax && levelMax != 0) { //可叠加
                //-1 = 无限叠加
                if (levelMax == -1 || oldUnitBuff.level < levelMax) {
                    oldUnitBuff.level++; //增加叠加层数
                    if (actorType.levelDurMode == true) {
                        BaseUtil.runLater(actorType.dur, () => {
                            oldUnitBuff.level--;
                        });
                    }
                }
            }
            oldUnitBuff.updateDurStartTime();
            return oldUnitBuff;
        }
        //新建buff
        return new ActorBuff(actorTypeId, unit, creator, initActorBuff);
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
            let buff = ActorBuffUtil.getUnitActorBuff(unitHandle, buffTypeId);
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
     * @param actorTypeId
     */
    static getUnitActorBuff(unit, actorTypeId) {
        let actorBuffs = ActorBuffUtil.getUnitActorBuffs(unit);
        if (actorBuffs) {
            for (let actorBuff of actorBuffs) {
                if (actorBuff.actorTypeId == actorTypeId) {
                    return actorBuff;
                }
            }
        }
        return null;
    }
    /**
     * 使用此函数前请优先考虑使用ActorUtil.isUnitHasActor 以尽量保证演员的功能不局限于某一种演员类型 方便吞噬等转换
     * 判断是否拥有某个类型的ActorBuff
     * @param unit
     * @param actorTypeId
     */
    static isUnitHasActorBuff(unit, actorTypeId) {
        return ActorBuffUtil.getUnitActorBuff(unit, actorTypeId) != null;
    }
    /**
     * 使用此函数前请优先考虑使用ActorUtil.ifUnitHasActor（那样其他演员物品 技能等也有效，游戏代码写灵活点才能应对随时可能改变的玩法）
     * 如果拥有某个类型的ActorBuff 则执行回调
     * @param unit
     * @param callBack
     * @param actorTypeId
     */
    static ifUnitHasActorBuff(unit, callBack, actorTypeId) {
        let actorBuff = ActorBuffUtil.getUnitActorBuff(unit, actorTypeId);
        if (actorBuff) {
            callBack(actorBuff);
        }
    }
    /**
     * 获取单位身上所有ActorBuff
     * @param unit
     */
    static getUnitActorBuffs(unit) {
        let unitSolarData = DataBase.getUnitSolarData(unit, false);
        return unitSolarData?._SL_solarActorBuffs;
    }
    // /**
    //  * 将buff集合 根据创建时间排序为buff数组
    //  * @param actorBuffSet
    //  * @param filter 只对需要的buff进行筛选过滤  返回true表示此buff添加到排序结果中 如不传filter回调 则全部添加到排序结果
    //  */
    // static sortByCreateTime(actorBuffSet: ActorBuffSet, filter?: (actorBuff: ActorBuff) => boolean): ActorBuff[] {
    //     if (actorBuffSet == null) {
    //         return null;
    //     }
    //     let actorBuffList: ActorBuff[] = [];
    //     if (filter == null) {
    //         for (let actorBuffSetKey in actorBuffSet) {
    //             actorBuffList.push(actorBuffSet[actorBuffSetKey])
    //         }
    //     } else {
    //         for (let actorBuffSetKey in actorBuffSet) {
    //             let actorBuff = actorBuffSet[actorBuffSetKey];
    //             if (filter(actorBuff)) {
    //                 actorBuffList.push(actorBuff);
    //             }
    //         }
    //     }
    //
    //     actorBuffList.sort((a, b) => {
    //         return a.creationTime - b.creationTime;
    //     });
    //     return actorBuffList;
    // }
    /**
     * 遍历地图上所有单位的所有ActorBuffs
     * @param callback
     * @param actorBuffTypeId 只对某个ActorBuffType做遍历
     */
    static forAllActorBuffs(callback, actorBuffTypeId) {
        if (actorBuffTypeId) { //遍历单个类型
            //遍历所有
            DataBase.forUnitSolarDatas((id, solarData) => {
                let _SL_solarActorBuffSet = solarData?._SL_solarActorBuffs;
                if (_SL_solarActorBuffSet) {
                    for (let actorBuff of _SL_solarActorBuffSet) {
                        if (actorBuff?.actorType.id == actorBuffTypeId) {
                            callback(actorBuff);
                        }
                    }
                }
            });
        }
        else {
            //遍历所有
            DataBase.forUnitSolarDatas((id, solarData) => {
                let _SL_solarActorBuffSet = solarData?._SL_solarActorBuffs;
                if (_SL_solarActorBuffSet) {
                    for (let actorBuff of _SL_solarActorBuffSet) {
                        callback(actorBuff);
                    }
                }
            });
        }
    }
    /**
     * 获取此单位的 指定Class的所有ActorBuff
     */
    static getUnitActorBuffsByClass(unit, clazz) {
        let actorBuffSet = ActorBuffUtil.getUnitActorBuffs(unit);
        if (!actorBuffSet) {
            return;
        }
        let result = [];
        for (let actorBuff of actorBuffSet) {
            if (actorBuff) {
                if (clazz == null || clazz == actorBuff.get("class")) {
                    result.push(actorBuff);
                }
            }
        }
        return result;
    }
    // /**
    //  * 获取此单位的  所有ActorBuff 并按创建时间排序
    //  * @param unit
    //  * @param filter 返回true 表示此buff添加到排序结果中 如不传filter回调 则全部添加到排序结果
    //  */
    // static getUnitActorBuffsAndSortCreateTime(unit: unit, filter?: (actorBuff: ActorBuff) => boolean): ActorBuff[] {
    //     let actorBuffSet = ActorBuffUtil.getUnitActorBuffs(unit);
    //     return ActorBuffUtil.sortByCreateTime(actorBuffSet, filter);
    // }
    /**
     * 遍历此单位的 所有ActorBuff
     */
    static forUnitActorBuffs(unit, callback, clazz) {
        let actorBuffSet = ActorBuffUtil.getUnitActorBuffs(unit);
        if (!actorBuffSet) {
            return;
        }
        for (let actorBuff of actorBuffSet) {
            if (actorBuff) {
                if (clazz == null || clazz == actorBuff.get("class")) {
                    callback(actorBuff);
                }
            }
        }
    }
    /**
     * 清除单位某个类型的ActorBuff
     * @param unit
     * @param actorBuffTypeId
     */
    static clearUnitActorBuff(unit, actorBuffTypeId) {
        ActorBuffUtil.getUnitActorBuff(unit, actorBuffTypeId)?.destroy();
    }
    /**
     * 清除单位所有ActorBuff
     * @param unit 单位
     * @param onlyDeBuff 只销毁减益演员buff
     */
    static clearUnitActorBuffs(unit, onlyDeBuff = false) {
        let actorBuffs = ActorBuffUtil.getUnitActorBuffs(unit);
        if (!actorBuffs) {
            return;
        }
        for (let i = actorBuffs.length - 1; i >= 0; i--) {
            let actorBuff = actorBuffs[i];
            if (onlyDeBuff) {
                if (actorBuff?.get("isDebuff")) {
                    actorBuff.destroy();
                }
            }
            else {
                actorBuff?.destroy();
            }
        }
    }
    /**
     * 清除单位身上某个类别的所有ActorBuff
     * @param unit 单位
     * @param clazz 同 Class
     */
    static clearUnitActorBuffsByClass(unit, clazz) {
        let actorBuffs = ActorBuffUtil.getUnitActorBuffs(unit);
        if (!actorBuffs) {
            return;
        }
        for (let actorBuff of actorBuffs) {
            if (actorBuff?.actorType?.class == clazz) {
                actorBuff.destroy();
            }
        }
    }
}
