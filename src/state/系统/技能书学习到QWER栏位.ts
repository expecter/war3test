import AbilityUtil from "@/AbilityUtil";
import DialogUtil from "@/DialogUtil";
import AbilityButtonUtil from "@/AbilityButtonUtil";
import ItemUtil from "@/ItemUtil";
import PlayerUtil from "@/PlayerUtil";
import SelectUtil from "@/SelectUtil";
import DataBase from "@/DataBase";
import ObjectDataUtil from "@/ObjectDataUtil";

/**
 * @deprecated see演员技能
 */
export default class 技能书学习到QWER栏位 {

    static cfg: {
        /**技能id 与物品 的映射 */
        itemIdAndAbilityIdMap: {}
    } = {
        itemIdAndAbilityIdMap: {}
    }


    //技能id 与物品 的映射
    static abilityIdItemIdMap = {};

    constructor() {
        let itemIdAndAbilityIdMap = 技能书学习到QWER栏位.cfg.itemIdAndAbilityIdMap;
        for (let itemId in itemIdAndAbilityIdMap) {
            技能书学习到QWER栏位.abilityIdItemIdMap[itemIdAndAbilityIdMap[itemId]] = itemId;
        }

        se.onUnitUseItem(e => {
            let itemIdStr = e.manipulatedItemTypeIdStr
            let abilityId = 技能书学习到QWER栏位.cfg.itemIdAndAbilityIdMap[itemIdStr];
            if (!abilityId) {
                return
            }
            let trigUnit = e.trigUnit;
            if (!e.isHeroUnitTrig) {//宝宝买书
                trigUnit = SelectUtil.getAnHero(e.trigUnitOwnerId)
            }
            技能书学习到QWER栏位.studyAbility(trigUnit, abilityId, itemIdStr)
        });


    }


    static studyAbility(trigUnit: unit, abilityId: string, itemid: string) {
        let abilityIdBaseName = DataBase.getAbilityTypeSolarData(abilityId).baseName
        if (!abilityIdBaseName) {
            BJDebugMsg("没有发现基础技能名字")
            return
        }
        //
        let unitAbilityIds = AbilityUtil.getUnitAbilityIds(trigUnit);
        let weAbilityIds = [];
        let player = GetOwningPlayer(trigUnit);
        let pid = GetPlayerId(player)
        for (let unitAbilityId of unitAbilityIds) {
            if (技能书学习到QWER栏位.abilityIdItemIdMap[unitAbilityId]) {
                let baseName = DataBase.getAbilityTypeSolarData(unitAbilityId)?.baseName
                //使用同步数据
                let x = AbilityButtonUtil.syncAbilityIdButtonXMap[pid]?.[FourCC(unitAbilityId)];
                if (baseName == abilityIdBaseName) {//直接替换技能
                    UnitRemoveAbility(trigUnit, unitAbilityId)
                    UnitAddAbility(trigUnit, abilityId)
                    if (!x) {
                        PlayerUtil.text(player, "错误：没有发现之前的技能的位置")
                        x = 0;
                    }
                    AbilityButtonUtil.setAbilityBottomButtonXAndHotKey(trigUnit, abilityId, x)
                    PlayerUtil.text(player, "替换技能:" + ObjectDataUtil.getAbilityName(unitAbilityId) + " -> " + ObjectDataUtil.getAbilityName(abilityId))
                    return;
                }
                if (x) {
                    weAbilityIds.push(unitAbilityId)
                }
            }
        }
        //替换技能
        if (weAbilityIds.length >= 4) {
            weAbilityIds.sort((a, b) => {
                return AbilityButtonUtil.syncAbilityIdButtonXMap[pid]?.[FourCC(a)] - AbilityButtonUtil.syncAbilityIdButtonXMap[pid]?.[FourCC(b)]
            })
            DialogUtil.show(pid, "选择要替换的技能", (i, text) => {
                    if (i == 4) {
                        let item = ItemUtil.createItems(itemid, 0, 0, 1, pid)
                        UnitAddItem(trigUnit, item)
                        return
                    }
                    UnitRemoveAbility(trigUnit, weAbilityIds[i])
                    UnitAddAbility(trigUnit, abilityId)
                    AbilityButtonUtil.setAbilityBottomButtonXAndHotKey(trigUnit, abilityId, i)
                }, "[Q]" + _g_objs.ability[weAbilityIds[0]].Name,
                "[W]" + _g_objs.ability[weAbilityIds[1]].Name,
                "[E]" + _g_objs.ability[weAbilityIds[2]].Name,
                "[R]" + _g_objs.ability[weAbilityIds[3]].Name,
                "取消");
        } else {
            UnitAddAbility(trigUnit, abilityId)
            AbilityButtonUtil.setAbilityBottomButtonXAndHotKey(trigUnit, abilityId, weAbilityIds.length)
        }
    }


}