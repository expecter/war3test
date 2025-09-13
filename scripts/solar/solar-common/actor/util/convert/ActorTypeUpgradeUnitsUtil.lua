local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 12,["28"] = 12,["29"] = 13,["30"] = 13,["31"] = 15,["32"] = 15,["33"] = 15,["35"] = 15,["36"] = 23,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 25,["41"] = 26,["42"] = 27,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 27,["47"] = 27,["48"] = 27,["49"] = 27,["50"] = 27,["51"] = 27,["52"] = 27,["53"] = 27,["54"] = 27,["55"] = 40,["56"] = 41,["57"] = 43,["58"] = 41,["59"] = 46,["60"] = 47,["61"] = 24,["62"] = 24,["63"] = 23,["64"] = 52,["65"] = 53,["66"] = 54,["67"] = 54,["68"] = 54,["69"] = 54,["70"] = 54,["71"] = 55,["73"] = 57,["74"] = 58,["75"] = 58,["76"] = 58,["77"] = 58,["78"] = 58,["79"] = 59,["81"] = 61,["82"] = 62,["83"] = 62,["84"] = 62,["85"] = 62,["86"] = 62,["87"] = 63,["89"] = 65,["90"] = 66,["91"] = 67,["92"] = 68,["93"] = 69,["94"] = 70,["95"] = 71,["96"] = 72,["97"] = 73,["98"] = 74,["99"] = 75,["100"] = 76,["105"] = 82,["106"] = 83,["107"] = 84,["108"] = 85,["111"] = 88,["112"] = 89,["113"] = 90,["114"] = 90,["115"] = 90,["116"] = 90,["117"] = 90,["118"] = 90,["119"] = 90,["120"] = 91,["121"] = 92,["122"] = 93,["123"] = 94,["124"] = 95,["127"] = 98,["128"] = 99,["130"] = 101,["131"] = 102,["132"] = 103,["133"] = 104,["135"] = 106,["136"] = 107,["137"] = 108,["138"] = 109,["139"] = 109,["140"] = 109,["141"] = 110,["142"] = 111,["143"] = 109,["144"] = 109,["145"] = 52,["146"] = 115,["147"] = 115,["148"] = 115,["150"] = 116,["151"] = 117,["152"] = 118,["153"] = 119,["154"] = 120,["155"] = 121,["156"] = 122,["157"] = 122,["158"] = 122,["159"] = 123,["160"] = 124,["161"] = 125,["162"] = 126,["164"] = 122,["165"] = 122,["166"] = 122,["167"] = 122,["168"] = 115,["169"] = 137,["171"] = 138,["172"] = 138,["173"] = 139,["174"] = 140,["175"] = 141,["178"] = 144,["179"] = 145,["180"] = 146,["181"] = 147,["182"] = 148,["184"] = 150,["186"] = 153,["187"] = 154,["188"] = 138,["191"] = 137,["192"] = 16,["193"] = 17});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorTypeWarpUtil = require("solar.solar-common.actor.util.convert.ActorTypeWarpUtil")
local ActorTypeWarpUtil = ____ActorTypeWarpUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ObjectTemplateUtil = require("solar.solar-common.util.object.ObjectTemplateUtil")
local ObjectTemplateUtil = ____ObjectTemplateUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____ActorAbility = require("solar.solar-common.actor.ActorAbility")
local ActorAbility = ____ActorAbility.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local ____ItemUtil = require("solar.solar-common.util.game.ItemUtil")
local ItemUtil = ____ItemUtil.default
local ____AbilityButtonUtil = require("solar.solar-common.util.ability.AbilityButtonUtil")
local AbilityButtonUtil = ____AbilityButtonUtil.default
____exports.default = __TS__Class()
local ActorTypeUpgradeUnitsUtil = ____exports.default
ActorTypeUpgradeUnitsUtil.name = "ActorTypeUpgradeUnitsUtil"
function ActorTypeUpgradeUnitsUtil.prototype.____constructor(self)
end
function ActorTypeUpgradeUnitsUtil.warpUnit2UpgradeUnitAbility(self, unitIdOrActorId)
    return ____exports.default.cache:get(
        "warpUnit2UpgradeUnitAbility:" .. unitIdOrActorId,
        function()
            local actorTypeId = "_sl_UpgradeUnitAbility:" .. unitIdOrActorId
            local unitActorType = ActorTypeWarpUtil:warpUnitActorType(unitIdOrActorId)
            local actorType = {
                id = actorTypeId,
                class = ____exports.default._sl_baseUnitUpgradeUnitAbilityClass,
                name = "升级到:" .. (unitActorType.name or unitIdOrActorId),
                icon = unitActorType.icon,
                describe = unitActorType.describe,
                goldCost = unitActorType.goldCost,
                lumberCost = unitActorType.lumberCost,
                foodCost = unitActorType.foodCost,
                passive = false,
                maxCd = 0,
                upgrade2UnitId = unitIdOrActorId
            }
            actorType.templateAllocPolicy = "actorTypeShare"
            actorType.onAction = function(____, actor)
                ____exports.default:upgradeUnit(actor, actorType, unitActorType.id)
            end
            ActorTypeUtil:registerActorType(actorType)
            return actorType
        end
    )
end
function ActorTypeUpgradeUnitsUtil.upgradeUnit(self, actor, actorType, newUnitTypeId)
    if PlayerUtil:getGold(GetOwningPlayer(actor.unit)) < (actorType.goldCost or 0) then
        PlayerUtil:message(
            "|cffff0000金币不足!",
            10,
            GetOwningPlayer(actor.unit)
        )
        return false
    end
    if PlayerUtil:getLumber(GetOwningPlayer(actor.unit)) < (actorType.lumberCost or 0) then
        PlayerUtil:message(
            "|cffff0000木材不足!",
            10,
            GetOwningPlayer(actor.unit)
        )
        return false
    end
    if actorType.foodCost and actorType.foodCost > 0 and PlayerUtil:getFoodCapLeft(GetOwningPlayer(actor.unit)) < actorType.foodCost then
        PlayerUtil:message(
            "|cffff0000人口不足!",
            10,
            GetOwningPlayer(actor.unit)
        )
        return false
    end
    PlayerUtil:costEnoughState(actor.unitOwner, actorType.goldCost, actorType.lumberCost)
    local trigUnit = actor.unit
    local p = GetOwningPlayer(trigUnit)
    local x = GetUnitX(trigUnit)
    local y = GetUnitY(trigUnit)
    local facing = GetUnitFacing(trigUnit)
    local needSelect = selection() == trigUnit
    if needSelect == false and get_select_list then
        local selectList = get_select_list()
        for ____, temp in ipairs(selectList) do
            if temp == trigUnit then
                needSelect = true
                break
            end
        end
    end
    local items = ItemUtil:getAllItemInfoFromUnit(trigUnit)
    if items then
        for ____, item in ipairs(items) do
            UnitRemoveItem(trigUnit, item.item)
        end
    end
    local lifeP = UnitStateUtil:getUnitLifeP(trigUnit)
    RemoveUnit(trigUnit)
    local unit = ActorUnitUtil:createUnit(
        p,
        newUnitTypeId,
        x,
        y,
        facing
    )
    UnitStateUtil:setUnitLifeP(unit, lifeP)
    if items then
        for ____, item in ipairs(items) do
            UnitAddItem(unit, item.item)
            UnitDropItemSlot(unit, item.item, item.index)
        end
    end
    if needSelect then
        SelectUnit(unit, true)
    end
    local buildTime = 3
    local unitActor = ActorTypeUtil:getActorType(newUnitTypeId)
    if unitActor and unitActor.buildTime then
        buildTime = unitActor.buildTime
    end
    ____exports.default:showUnitBirthAnim(unit, buildTime)
    se:emit("升级开始", unit)
    DzUnitSilence(unit, true)
    BaseUtil.runLater(
        buildTime,
        function()
            DzUnitSilence(unit, false)
            se:emit("升级完成", unit)
        end
    )
end
function ActorTypeUpgradeUnitsUtil.showUnitBirthAnim(self, unit, dur)
    if dur == nil then
        dur = 1
    end
    SetUnitAnimation(unit, "birth")
    SetUnitTimeScale(unit, 30 / dur)
    local execCount = math.floor(dur * 10)
    local lifeP = UnitStateUtil:getUnitLifeP(unit)
    UnitStateUtil:setUnitLifeP(unit, lifeP * 0.8 + 0.01)
    local onelife = lifeP * 0.2 / execCount + 0.001
    BaseUtil.runLater(
        0.1,
        function(count, maxCount)
            UnitStateUtil:addUnitLifeByMaxLifeP(unit, onelife)
            if count == maxCount then
                SetUnitAnimation(unit, "stand")
                SetUnitTimeScale(unit, 1)
            end
        end,
        execCount,
        true
    )
end
function ActorTypeUpgradeUnitsUtil.setUpgradeUnits2unit(self, unit, upgradeUnits)
    do
        local i = 0
        while i < #upgradeUnits do
            local upgradeUnitIdStr = upgradeUnits[i + 1]
            local appActorType = ____exports.default:warpUnit2UpgradeUnitAbility(upgradeUnitIdStr)
            if ActorAbilityUtil:isUnitHasActorAbility(unit, appActorType.id) then
                return
            end
            local startPosNum = 1
            if ObjectTemplateUtil:hasUnitAbilityTemplateSpace(unit, 9, 12) then
                startPosNum = 9
            elseif ObjectTemplateUtil:hasUnitAbilityTemplateSpace(unit, 5, 8) then
                startPosNum = 5
            else
                startPosNum = 1
            end
            local actorAbility = __TS__New(ActorAbility, appActorType.id, unit, startPosNum)
            actorAbility:setHotKey(AbilityButtonUtil:getHotKeyByNumber(actorAbility.posNum))
            i = i + 1
        end
    end
end
ActorTypeUpgradeUnitsUtil._sl_baseUnitUpgradeUnitAbilityClass = "太阳单位演员技能升级到单位"
ActorTypeUpgradeUnitsUtil.cache = __TS__New(Cache)
return ____exports
