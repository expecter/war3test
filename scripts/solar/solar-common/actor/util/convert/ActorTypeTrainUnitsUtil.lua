local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 9,["22"] = 9,["23"] = 9,["25"] = 9,["26"] = 19,["27"] = 20,["28"] = 20,["29"] = 20,["30"] = 21,["31"] = 22,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 23,["41"] = 23,["42"] = 23,["43"] = 23,["44"] = 35,["45"] = 36,["46"] = 37,["47"] = 38,["48"] = 38,["49"] = 38,["50"] = 38,["51"] = 38,["52"] = 39,["54"] = 41,["55"] = 42,["56"] = 42,["57"] = 42,["58"] = 42,["59"] = 42,["60"] = 43,["62"] = 45,["63"] = 46,["64"] = 46,["65"] = 46,["66"] = 46,["67"] = 46,["68"] = 47,["70"] = 49,["71"] = 51,["72"] = 52,["73"] = 53,["74"] = 54,["75"] = 55,["76"] = 56,["77"] = 58,["78"] = 59,["79"] = 60,["80"] = 36,["81"] = 62,["82"] = 63,["83"] = 20,["84"] = 20,["85"] = 19,["86"] = 69,["88"] = 70,["89"] = 70,["90"] = 71,["91"] = 72,["92"] = 73,["95"] = 76,["96"] = 77,["97"] = 78,["98"] = 79,["99"] = 80,["101"] = 82,["102"] = 70,["105"] = 69,["106"] = 10,["107"] = 11});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorTypeWarpUtil = require("solar.solar-common.actor.util.convert.ActorTypeWarpUtil")
local ActorTypeWarpUtil = ____ActorTypeWarpUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local ____ObjectTemplateUtil = require("solar.solar-common.util.object.ObjectTemplateUtil")
local ObjectTemplateUtil = ____ObjectTemplateUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local ActorTypeTrainUnitsUtil = ____exports.default
ActorTypeTrainUnitsUtil.name = "ActorTypeTrainUnitsUtil"
function ActorTypeTrainUnitsUtil.prototype.____constructor(self)
end
function ActorTypeTrainUnitsUtil.warpUnit2TrainUnitAbility(self, unitIdOrActorId)
    return ____exports.default.cache:get(
        "warpUnit2TrainUnitAbility:" .. unitIdOrActorId,
        function()
            local actorTypeId = "_sl_TrainUnitAbility:" .. unitIdOrActorId
            local unitActorType = ActorTypeWarpUtil:warpUnitActorType(unitIdOrActorId)
            local actorType = {
                id = actorTypeId,
                class = ____exports.default._sl_baseUnitTrainUnitAbilityClass,
                name = "雇用:" .. (unitActorType.name or unitIdOrActorId),
                icon = unitActorType.icon,
                describe = unitActorType.describe,
                goldCost = unitActorType.goldCost,
                lumberCost = unitActorType.lumberCost,
                foodCost = unitActorType.foodCost,
                passive = false,
                maxCd = 1
            }
            actorType.templateAllocPolicy = "actorTypeShare"
            actorType.onAction = function(____, actor)
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
                local trigUnitTypeIdStr = unitActorType.id
                local p = GetOwningPlayer(trigUnit)
                local x = GetUnitX(trigUnit)
                local y = GetUnitY(trigUnit)
                local facing = GetUnitFacing(trigUnit)
                local unit = ActorUnitUtil:createUnit(p, trigUnitTypeIdStr, x, y)
                local effectPath = "Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdx"
                DestroyEffect(AddSpecialEffect(effectPath, x, y))
            end
            ActorTypeUtil:registerActorType(actorType)
            return actorType
        end
    )
end
function ActorTypeTrainUnitsUtil.setTrainUnits2unit(self, unit, trainUnits)
    do
        local i = 0
        while i < #trainUnits do
            local upgradeUnitIdStr = trainUnits[i + 1]
            local appActorType = ____exports.default:warpUnit2TrainUnitAbility(upgradeUnitIdStr)
            if ActorAbilityUtil:isUnitHasActorAbility(unit, appActorType.id) then
                return
            end
            local startPosNum = 1
            if ObjectTemplateUtil:hasUnitAbilityTemplateSpace(unit, 9, 12) then
                startPosNum = 9
            elseif ObjectTemplateUtil:hasUnitAbilityTemplateSpace(unit, 5, 8) then
                startPosNum = 5
            end
            ActorAbilityUtil:createActorAbility(appActorType.id, unit, startPosNum)
            i = i + 1
        end
    end
end
ActorTypeTrainUnitsUtil._sl_baseUnitTrainUnitAbilityClass = "太阳单位演员技能训练单位"
ActorTypeTrainUnitsUtil.cache = __TS__New(Cache)
return ____exports
