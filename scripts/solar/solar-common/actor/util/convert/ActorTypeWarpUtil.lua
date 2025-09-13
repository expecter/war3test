local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 4,["15"] = 7,["16"] = 8,["17"] = 9,["18"] = 10,["19"] = 10,["20"] = 10,["21"] = 10,["22"] = 10,["23"] = 10,["24"] = 10,["25"] = 10,["26"] = 10,["27"] = 10,["28"] = 10,["29"] = 10,["30"] = 10,["32"] = 24,["33"] = 7});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ObjectDataUtil = require("solar.solar-common.util.object.ObjectDataUtil")
local ObjectDataUtil = ____ObjectDataUtil.default
____exports.default = __TS__Class()
local ActorTypeWarpUtil = ____exports.default
ActorTypeWarpUtil.name = "ActorTypeWarpUtil"
function ActorTypeWarpUtil.prototype.____constructor(self)
end
function ActorTypeWarpUtil.warpUnitActorType(self, unitIdOrActorId)
    local unitActorType = ActorTypeUtil:getActorType(unitIdOrActorId)
    if unitActorType == nil then
        unitActorType = {
            id = unitIdOrActorId,
            name = ObjectDataUtil:getUnitName(unitIdOrActorId),
            icon = ObjectDataUtil:getUnitArt(unitIdOrActorId),
            model = ObjectDataUtil:getUnitFile(unitIdOrActorId, true),
            describe = ObjectDataUtil:getUnitDataString(unitIdOrActorId, "Ubertip"),
            maxLife = ObjectDataUtil:getUnitDataNumber(unitIdOrActorId, "HP"),
            goldCost = ObjectDataUtil:getUnitGoldCost(unitIdOrActorId),
            lumberCost = ObjectDataUtil:getUnitDataNumber(unitIdOrActorId, "lumbercost"),
            foodCost = ObjectDataUtil:getUnitDataNumber(unitIdOrActorId, "fused"),
            buildTime = ObjectDataUtil:getUnitDataNumber(unitIdOrActorId, "bldtm"),
            modelScale = ObjectDataUtil:getUnitDataNumber(unitIdOrActorId, "modelScale")
        }
    end
    return unitActorType
end
return ____exports
