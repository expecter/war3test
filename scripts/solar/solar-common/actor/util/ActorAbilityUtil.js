import ActorAbility from "@/ActorAbility";
import DataBase from "@/DataBase";
import AbilityButtonUtil from "@/AbilityButtonUtil";
/**
 * see ActorUtil 优先使用演员工具 不要把演员局限到技能或物品上 这样会导致演员不够统一
 */
export default class ActorAbilityUtil {
    /**
     *
     * 给单位添加一个演员技能
     * @param actorTypeId
     * @param unit
     * @param startPosNum
     * @param allocHotKey
     */
    static createActorAbility(actorTypeId, unit, startPosNum, allocHotKey) {
        let actorAbility = new ActorAbility(actorTypeId, unit, startPosNum);
        if (allocHotKey) {
            actorAbility.setHotKey(AbilityButtonUtil.getHotKeyByNumber(actorAbility.posNum));
        }
        return actorAbility;
    }
    /**
     * 移除并销毁单位身上指定演员类型的演员技能
     * @param unit
     * @param actorTypeId
     */
    static destroyUnitAbility(unit, actorTypeId) {
        let actorAbility = ActorAbilityUtil.getUnitActorAbility(unit, actorTypeId);
        if (actorAbility == null) {
            return false;
        }
        actorAbility.destroy();
        return true;
    }
    /**
     * 获取单位身上指定演员类型的演员技能
     * @param unit
     * @param actorTypeId 技能演员类型id
     */
    static getUnitActorAbility(unit, actorTypeId) {
        if (!IsHandle(unit)) {
            return null;
        }
        let actorAbilitys = DataBase.getUnitSolarData(unit, false)?._SL_solarActorAbilitys;
        if (actorAbilitys == null) {
            return null;
        }
        for (let abilityTemplateKey in actorAbilitys) {
            let actor = actorAbilitys[abilityTemplateKey];
            if (actor != null && actor.actorTypeId == actorTypeId) {
                return actor;
            }
        }
        return null;
    }
    /**
     * 获取单位身上指定位置的演员技能 1=左上角 12=右下角
     * @param unit
     * @param pos
     */
    static getUnitActorAbilityByPos(unit, pos) {
        let abilityTemplate = DataBase.getUnitSolarData(unit, false)?._SL_abilityTemplate;
        if (abilityTemplate == null) {
            return null;
        }
        let actorAbilitys = DataBase.getUnitSolarData(unit, false)?._SL_solarActorAbilitys;
        if (actorAbilitys == null) {
            return null;
        }
        if (abilityTemplate[pos] == null) {
            return null;
        }
        let actor = actorAbilitys[abilityTemplate[pos]];
        if (actor != null) {
            return actor;
        }
        return null;
    }
    /**
     * 如果有演员技能数据
     * @param abilityId
     * @param callBack
     * @param unit
     */
    static ifHasActorAbility(abilityId, callBack, unit) {
        let actor = ActorAbilityUtil.getActorAbilityByBaseId(abilityId, unit);
        if (actor) {
            callBack(actor);
        }
    }
    // /**
    //  * 是否有演员技能数据
    //  * @param abilityId
    //  * @param actorTypeId
    //  * @param unit
    //  */
    // static isHasActorAbility(abilityId: string, unit: unit, actorTypeId?: string): boolean {
    //     let actor: ActorAbility = ActorAbilityUtil.getActorAbilityByBaseId(abilityId, unit);
    //     if (actor == null) {
    //         return false;
    //     }
    //     if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
    //         return false;
    //     }
    //     return true;
    // }
    /**
     * 获取演员技能数据
     * @param abilityId 技能id 如 q001 基础物编id 如果是演员类型id请使用
     * @param unit 尝试根据单位拥有的演员技能获得
     * @param includeActorItem
     */
    static getActorAbilityByBaseId(abilityId, unit, includeActorItem = false) {
        if (!IsHandle(unit)) {
            return null;
        }
        let solarActorAbilitys = DataBase.getUnitSolarData(unit, false)?._SL_solarActorAbilitys;
        let actorAbility = solarActorAbilitys?.[abilityId];
        if (actorAbility) {
            return actorAbility;
        }
        if (includeActorItem) {
            let invSize = UnitInventorySize(unit);
            for (let i = 0; i < invSize; i++) {
                let item = UnitItemInSlot(unit, i);
                if (IsHandle(item)) {
                    let actorItem = DataBase.getItemSolarData(item, false)?._SL_solarActorItem;
                    if (actorItem != null && actorItem.abilityId == abilityId) {
                        return actorItem;
                    }
                }
            }
        }
        return null;
    }
    /**
     * 获取一个单位身上的所有 演员技能 的数量
     * @param unit
     * @param clazz 同class 类别
     */
    static getUnitActorAbilityListSize(unit, clazz) {
        let abilityList = ActorAbilityUtil.getUnitActorAbilityList(unit, clazz);
        if (abilityList == null) {
            return 0;
        }
        return abilityList.length;
    }
    /**
     * 获取一个单位身上的所有 演员技能
     * @param unit
     * @param clazz 同class 类别
     */
    static getUnitActorAbilityList(unit, clazz) {
        let solarActorAbilitys = DataBase.getUnitSolarData(unit, false)?._SL_solarActorAbilitys;
        if (solarActorAbilitys == null) {
            return null;
        }
        let actorList = null;
        for (let abilityTemplateKey in solarActorAbilitys) {
            let actor = solarActorAbilitys[abilityTemplateKey];
            if (actor != null) {
                if (clazz != null && clazz != actor.actorType.class) {
                    continue;
                }
                if (actorList == null) {
                    actorList = [];
                }
                actorList.push(actor);
            }
        }
        return actorList;
    }
    /**
     * 遍历一个单位身上的所有 演员技能
     * @param unit
     * @param callBack
     * @param clazz 同class 类别
     */
    static forUnitActorAbilityList(unit, callBack, clazz) {
        let actorAbilitys = DataBase.getUnitSolarData(unit, false)?._SL_solarActorAbilitys;
        if (actorAbilitys == null) {
            return null;
        }
        for (let abilityTemplateKey in actorAbilitys) {
            let actor = actorAbilitys[abilityTemplateKey];
            if (actor != null) {
                if (clazz != null && clazz != actor.actorType.class) {
                    continue;
                }
                callBack(actor);
            }
        }
    }
    /**
     * 使用此函数前请优先考虑使用ActorUtil.ifUnitHasActor 以尽量保证演员的功能不局限于某一种演员类型 方便吞噬等转换
     * 如果单位是有拥有某个类型的 演员技能
     * @param unit
     * @param callBack
     * @param actorTypeId
     */
    static ifUnitHasActorAbility(unit, callBack, actorTypeId) {
        let actorAbilitys = DataBase.getUnitSolarData(unit, false)?._SL_solarActorAbilitys;
        if (actorAbilitys == null) {
            return;
        }
        for (let abilityTemplateKey in actorAbilitys) {
            let actor = actorAbilitys[abilityTemplateKey];
            if (actor != null && actor.actorTypeId == actorTypeId) {
                callBack(actor);
                return;
            }
        }
        return;
    }
    /**
     * 使用此函数前请优先考虑使用ActorUtil.isUnitHasActor 以尽量保证演员的功能不局限于某一种演员类型 方便吞噬等转换
     * 判断单位是有拥有某个类型的 演员技能
     * @param unit
     * @param actorTypeId
     */
    static isUnitHasActorAbility(unit, actorTypeId) {
        let actorAbilitys = DataBase.getUnitSolarData(unit, false)?._SL_solarActorAbilitys;
        if (actorAbilitys == null) {
            return false;
        }
        for (let abilityTemplateKey in actorAbilitys) {
            let actor = actorAbilitys[abilityTemplateKey];
            if (actor != null && actor.actorTypeId == actorTypeId) {
                return true;
            }
        }
        return false;
    }
    /**
     * 销毁一个单位身上的所有 演员技能
     * @param unit
     * @param clazz
     */
    static destroyUnitAllActorAbility(unit, clazz) {
        if (!IsHandle(unit)) {
            return;
        }
        let actorAbilitys = DataBase.getUnitSolarData(unit, false)?._SL_solarActorAbilitys;
        if (actorAbilitys == null) {
            return null;
        }
        for (let abilityTemplateKey in actorAbilitys) {
            let actor = actorAbilitys[abilityTemplateKey];
            if (actor != null) {
                if (clazz == null || clazz == actor.actorType.class) {
                    actor.destroy();
                }
            }
        }
    }
}
