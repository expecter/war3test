local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 13,["31"] = 13,["32"] = 15,["33"] = 15,["34"] = 15,["36"] = 26,["37"] = 27,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 32,["44"] = 31,["45"] = 31,["46"] = 34,["47"] = 35,["48"] = 36,["49"] = 25,["50"] = 42,["51"] = 43,["52"] = 44,["55"] = 47,["56"] = 48,["59"] = 52,["60"] = 53,["61"] = 54,["62"] = 55,["63"] = 56,["64"] = 56,["65"] = 56,["66"] = 56,["69"] = 60,["70"] = 61,["71"] = 62,["72"] = 63,["73"] = 64,["74"] = 65,["75"] = 66,["76"] = 66,["77"] = 66,["78"] = 66,["79"] = 66,["80"] = 66,["81"] = 66,["83"] = 68,["89"] = 75,["90"] = 76,["91"] = 77,["92"] = 78,["93"] = 79,["94"] = 80,["95"] = 80,["96"] = 80,["97"] = 80,["98"] = 81,["99"] = 82,["100"] = 82,["101"] = 82,["102"] = 82,["103"] = 82,["104"] = 82,["105"] = 82,["106"] = 82,["108"] = 84,["109"] = 84,["110"] = 84,["111"] = 84,["112"] = 84,["113"] = 84,["114"] = 84,["115"] = 84,["121"] = 43,["122"] = 42,["123"] = 16});
local ____exports = {}
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____UnitRewardUtil = require("solar.solar-common.util.unit.UnitRewardUtil")
local UnitRewardUtil = ____UnitRewardUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ItemUtil = require("solar.solar-common.util.game.ItemUtil")
local ItemUtil = ____ItemUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____ActorTypeUpgradeUnitsUtil = require("solar.solar-common.actor.util.convert.ActorTypeUpgradeUnitsUtil")
local ActorTypeUpgradeUnitsUtil = ____ActorTypeUpgradeUnitsUtil.default
local ____ActorTypeTrainUnitsUtil = require("solar.solar-common.actor.util.convert.ActorTypeTrainUnitsUtil")
local ActorTypeTrainUnitsUtil = ____ActorTypeTrainUnitsUtil.default
local ____ActorTypeBuildUtil = require("solar.solar-common.actor.util.ActorTypeBuildUtil")
local ActorTypeBuildUtil = ____ActorTypeBuildUtil.default
____exports.default = __TS__Class()
local SolarActorUnitState = ____exports.default
SolarActorUnitState.name = "SolarActorUnitState"
function SolarActorUnitState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorUnitState()")
        return
    end
    BaseUtil.runLater(
        2,
        function()
            ____exports.default:openBounty()
        end
    )
    _sl_funs.setBuilds2unit = ActorTypeBuildUtil.setBuilds2unit
    _sl_funs.setUpgradeUnits2unit = ActorTypeUpgradeUnitsUtil.setUpgradeUnits2unit
    _sl_funs.setTrainUnits2unit = ActorTypeTrainUnitsUtil.setTrainUnits2unit
end
function SolarActorUnitState.openBounty(self)
    se:onUnitDeath(function(e)
        if not e.hasKillingUnit then
            return
        end
        local actorUnit = ActorUnitUtil:getActorUnit(e.trigUnit)
        if actorUnit == nil then
            return
        end
        if ____exports.default.config.openBounty then
            local bounty = actorUnit:get("bounty")
            if bounty and bounty > 0 then
                local earnGold = UnitRewardUtil:addGoldWithEarnGoldP(e.killingUnit, bounty)
                TextTagUtil.textGold(
                    "+" .. tostring(earnGold),
                    e.trigUnit
                )
            end
        end
        if ____exports.default.config.openBountyItems then
            local bountyItems = actorUnit:get("bountyItems")
            if bountyItems then
                for itemId in pairs(bountyItems) do
                    if RandomUtil.isInChance(bountyItems[itemId]) then
                        if DataBase:getSolarActorType(itemId) == nil then
                            ItemUtil:createItems(
                                itemId,
                                e.trigUnitX,
                                e.trigUnitY,
                                1,
                                e.killingUnitOwnerId
                            )
                        else
                            ActorItemUtil:createActorItem(itemId, e.trigUnitX, e.trigUnitY, e.killingUnitOwner)
                        end
                    end
                end
            end
        end
        if ____exports.default.config.openAfterDeathBirthUnits then
            local afterDeathBirthUnits = actorUnit:get("afterDeathBirthUnits")
            if afterDeathBirthUnits then
                for unitId in pairs(afterDeathBirthUnits) do
                    if RandomUtil.isInChance(afterDeathBirthUnits[unitId]) then
                        local count = math.max(
                            math.floor(afterDeathBirthUnits[unitId]),
                            1
                        )
                        if DataBase:getSolarActorType(unitId) == nil then
                            UnitUtil.createUnit(
                                e.trigUnitOwner,
                                unitId,
                                e.trigUnitX,
                                e.trigUnitY,
                                0,
                                count
                            )
                        else
                            ActorUnitUtil:createActorUnit(
                                e.trigUnitOwner,
                                unitId,
                                e.trigUnitX,
                                e.trigUnitY,
                                0,
                                count
                            )
                        end
                    end
                end
            end
        end
    end)
end
SolarActorUnitState.config = {openBounty = true, openBountyItems = true, openAfterDeathBirthUnits = true}
return ____exports
