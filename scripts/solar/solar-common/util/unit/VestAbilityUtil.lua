local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 13,["17"] = 13,["18"] = 13,["20"] = 13,["21"] = 21,["22"] = 22,["23"] = 22,["24"] = 22,["25"] = 22,["26"] = 22,["27"] = 23,["28"] = 24,["29"] = 25,["30"] = 27,["31"] = 28,["32"] = 29,["33"] = 30,["34"] = 31,["35"] = 32,["36"] = 33,["37"] = 21,["38"] = 45,["39"] = 45,["40"] = 45,["42"] = 45,["43"] = 45,["45"] = 45,["46"] = 45,["48"] = 46,["49"] = 46,["50"] = 46,["51"] = 46,["52"] = 46,["53"] = 47,["54"] = 48,["55"] = 49,["56"] = 51,["57"] = 52,["58"] = 53,["59"] = 54,["60"] = 55,["61"] = 56,["62"] = 57,["63"] = 45,["64"] = 64,["65"] = 65,["66"] = 66,["67"] = 64,["68"] = 76,["69"] = 77,["70"] = 78,["71"] = 79,["72"] = 81,["73"] = 82,["75"] = 84,["76"] = 86,["77"] = 87,["79"] = 89,["80"] = 91,["81"] = 92,["82"] = 92,["83"] = 92,["84"] = 94,["85"] = 95,["86"] = 96,["87"] = 97,["88"] = 98,["91"] = 92,["92"] = 92,["93"] = 76});
local ____exports = {}
local ____VestUtil = require("solar.solar-common.util.unit.VestUtil")
local VestUtil = ____VestUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____TargetType = require("solar.solar-common.constant.TargetType")
local TargetType = ____TargetType.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local VestAbilityUtil = ____exports.default
VestAbilityUtil.name = "VestAbilityUtil"
function VestAbilityUtil.prototype.____constructor(self)
end
function VestAbilityUtil.polymorph(self, target, dur)
    local vest = VestUtil.createVest(
        PlayerUtil:neutralPassivePlayer(),
        GetUnitX(target),
        GetUnitY(target)
    )
    local abilityId = "ACpy"
    UnitAddAbility(vest, abilityId)
    local ability = EXGetUnitAbility(vest, abilityId)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_A, 1000)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DUR, dur)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_HERODUR, dur)
    EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_TARGS, TargetType.notself)
    IncUnitAbilityLevel(vest, abilityId)
    DecUnitAbilityLevel(vest, abilityId)
    IssueTargetOrder(vest, "polymorph", target)
end
function VestAbilityUtil.lightningChain(self, source, target, damage, targetCountMax, area, damageAttenuation)
    if targetCountMax == nil then
        targetCountMax = 4
    end
    if area == nil then
        area = 1000
    end
    if damageAttenuation == nil then
        damageAttenuation = 0.1
    end
    local vest = VestUtil.createVest(
        GetOwningPlayer(source),
        GetUnitX(source),
        GetUnitY(source)
    )
    local abilityId = "ACcl"
    UnitAddAbility(vest, abilityId)
    local ability = EXGetUnitAbility(vest, abilityId)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_A, damage)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, targetCountMax)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, damageAttenuation)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_AREA, area)
    IncUnitAbilityLevel(vest, abilityId)
    DecUnitAbilityLevel(vest, abilityId)
    IssueTargetOrder(vest, "chainlightning", target)
end
function VestAbilityUtil.invisibility(self, target, dur)
    local abilityId = "Apiv"
    ____exports.default:addAbilityIfNotHave(target, dur, abilityId)
end
function VestAbilityUtil.addAbilityIfNotHave(self, unitHandle, dur, abilityId)
    local unitSolarData = DataBase:getUnitSolarData(unitHandle, true)
    local sdKey = "addAbilityIfNotHave_" .. abilityId
    local addAbilityIfNotHave_ = unitSolarData[sdKey]
    if GetUnitAbilityLevel(unitHandle, abilityId) > 0 and addAbilityIfNotHave_ == nil then
        return false
    end
    local newaddAbilityIfNotHave = _g_time + math.floor(dur * 100) * 10
    if addAbilityIfNotHave_ and addAbilityIfNotHave_ >= newaddAbilityIfNotHave then
        return false
    end
    unitSolarData[sdKey] = newaddAbilityIfNotHave
    UnitAddAbility(unitHandle, abilityId)
    BaseUtil.runLater(
        dur,
        function()
            local solarDataTemp = DataBase:getUnitSolarData(unitHandle, false)
            if (solarDataTemp and solarDataTemp[sdKey]) == nil or _g_time >= solarDataTemp[sdKey] then
                UnitRemoveAbility(unitHandle, abilityId)
                if solarDataTemp then
                    solarDataTemp.addAbilityIfNotHave_ = nil
                end
            end
        end
    )
end
return ____exports
