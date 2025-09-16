local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 13,["24"] = 13,["25"] = 13,["27"] = 27,["28"] = 28,["29"] = 29,["31"] = 32,["32"] = 33,["33"] = 34,["34"] = 35,["37"] = 38,["38"] = 39,["39"] = 40,["41"] = 42,["42"] = 32,["43"] = 26,["44"] = 49,["45"] = 50,["46"] = 51,["47"] = 52,["50"] = 56,["51"] = 57,["52"] = 58,["53"] = 59,["54"] = 60,["55"] = 61,["56"] = 62,["57"] = 62,["58"] = 64,["59"] = 64,["60"] = 65,["61"] = 66,["62"] = 67,["63"] = 68,["64"] = 69,["65"] = 70,["67"] = 72,["68"] = 73,["69"] = 73,["70"] = 73,["71"] = 73,["74"] = 76,["75"] = 77,["79"] = 82,["80"] = 83,["81"] = 83,["82"] = 83,["83"] = 84,["84"] = 84,["85"] = 84,["86"] = 84,["87"] = 83,["88"] = 83,["89"] = 86,["90"] = 86,["91"] = 86,["92"] = 86,["93"] = 87,["94"] = 88,["95"] = 88,["96"] = 88,["97"] = 88,["98"] = 88,["99"] = 88,["100"] = 88,["101"] = 89,["104"] = 92,["105"] = 93,["106"] = 94,["107"] = 86,["108"] = 86,["109"] = 86,["110"] = 86,["111"] = 86,["112"] = 86,["113"] = 86,["115"] = 101,["116"] = 102,["118"] = 49,["119"] = 18,["120"] = 24});
local ____exports = {}
local ____AbilityUtil = require("solar.solar-common.util.ability.AbilityUtil")
local AbilityUtil = ____AbilityUtil.default
local ____DialogUtil = require("solar.solar-common.util.game.DialogUtil")
local DialogUtil = ____DialogUtil.default
local ____AbilityButtonUtil = require("solar.solar-common.util.ability.AbilityButtonUtil")
local AbilityButtonUtil = ____AbilityButtonUtil.default
local ____ItemUtil = require("solar.solar-common.util.game.ItemUtil")
local ItemUtil = ____ItemUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ObjectDataUtil = require("solar.solar-common.util.object.ObjectDataUtil")
local ObjectDataUtil = ____ObjectDataUtil.default
____exports.default = __TS__Class()
local _____6280_80FD_4E66_5B66_4E60_5230QWER_680F_4F4D = ____exports.default
_____6280_80FD_4E66_5B66_4E60_5230QWER_680F_4F4D.name = "技能书学习到QWER栏位"
function _____6280_80FD_4E66_5B66_4E60_5230QWER_680F_4F4D.prototype.____constructor(self)
    local itemIdAndAbilityIdMap = ____exports.default.cfg.itemIdAndAbilityIdMap
    for itemId in pairs(itemIdAndAbilityIdMap) do
        ____exports.default.abilityIdItemIdMap[itemIdAndAbilityIdMap[itemId]] = itemId
    end
    se:onUnitUseItem(function(e)
        local itemIdStr = e.manipulatedItemTypeIdStr
        local abilityId = ____exports.default.cfg.itemIdAndAbilityIdMap[itemIdStr]
        if not abilityId then
            return
        end
        local trigUnit = e.trigUnit
        if not e.isHeroUnitTrig then
            trigUnit = SelectUtil.getAnHero(e.trigUnitOwnerId)
        end
        ____exports.default:studyAbility(trigUnit, abilityId, itemIdStr)
    end)
end
function _____6280_80FD_4E66_5B66_4E60_5230QWER_680F_4F4D.studyAbility(self, trigUnit, abilityId, itemid)
    local abilityIdBaseName = DataBase:getAbilityTypeSolarData(abilityId).baseName
    if not abilityIdBaseName then
        BJDebugMsg("没有发现基础技能名字")
        return
    end
    local unitAbilityIds = AbilityUtil:getUnitAbilityIds(trigUnit)
    local weAbilityIds = {}
    local player = GetOwningPlayer(trigUnit)
    local pid = GetPlayerId(player)
    for ____, unitAbilityId in ipairs(unitAbilityIds) do
        if ____exports.default.abilityIdItemIdMap[unitAbilityId] then
            local ____opt_0 = DataBase:getAbilityTypeSolarData(unitAbilityId)
            local baseName = ____opt_0 and ____opt_0.baseName
            local ____opt_2 = AbilityButtonUtil.syncAbilityIdButtonXMap[pid]
            local x = ____opt_2 and ____opt_2[FourCC(unitAbilityId)]
            if baseName == abilityIdBaseName then
                UnitRemoveAbility(trigUnit, unitAbilityId)
                UnitAddAbility(trigUnit, abilityId)
                if not x then
                    PlayerUtil:text(player, "错误：没有发现之前的技能的位置")
                    x = 0
                end
                AbilityButtonUtil:setAbilityBottomButtonXAndHotKey(trigUnit, abilityId, x)
                PlayerUtil:text(
                    player,
                    (("替换技能:" .. ObjectDataUtil:getAbilityName(unitAbilityId)) .. " -> ") .. ObjectDataUtil:getAbilityName(abilityId)
                )
                return
            end
            if x then
                weAbilityIds[#weAbilityIds + 1] = unitAbilityId
            end
        end
    end
    if #weAbilityIds >= 4 then
        __TS__ArraySort(
            weAbilityIds,
            function(____, a, b)
                local ____opt_4 = AbilityButtonUtil.syncAbilityIdButtonXMap[pid]
                local ____temp_8 = ____opt_4 and ____opt_4[FourCC(a)]
                local ____opt_6 = AbilityButtonUtil.syncAbilityIdButtonXMap[pid]
                return ____temp_8 - (____opt_6 and ____opt_6[FourCC(b)])
            end
        )
        DialogUtil:show(
            pid,
            "选择要替换的技能",
            function(____, i, text)
                if i == 4 then
                    local item = ItemUtil:createItems(
                        itemid,
                        0,
                        0,
                        1,
                        pid
                    )
                    UnitAddItem(trigUnit, item)
                    return
                end
                UnitRemoveAbility(trigUnit, weAbilityIds[i + 1])
                UnitAddAbility(trigUnit, abilityId)
                AbilityButtonUtil:setAbilityBottomButtonXAndHotKey(trigUnit, abilityId, i)
            end,
            "[Q]" .. _g_objs.ability[weAbilityIds[1]].Name,
            "[W]" .. _g_objs.ability[weAbilityIds[2]].Name,
            "[E]" .. _g_objs.ability[weAbilityIds[3]].Name,
            "[R]" .. _g_objs.ability[weAbilityIds[4]].Name,
            "取消"
        )
    else
        UnitAddAbility(trigUnit, abilityId)
        AbilityButtonUtil:setAbilityBottomButtonXAndHotKey(trigUnit, abilityId, #weAbilityIds)
    end
end
_____6280_80FD_4E66_5B66_4E60_5230QWER_680F_4F4D.cfg = {itemIdAndAbilityIdMap = {}}
_____6280_80FD_4E66_5B66_4E60_5230QWER_680F_4F4D.abilityIdItemIdMap = {}
return ____exports
