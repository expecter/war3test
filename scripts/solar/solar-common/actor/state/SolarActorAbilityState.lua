local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 6,["15"] = 7,["18"] = 10,["19"] = 11,["20"] = 12,["21"] = 13,["22"] = 15,["26"] = 10,["27"] = 20,["28"] = 22,["29"] = 23,["30"] = 24,["33"] = 27,["34"] = 28,["35"] = 29,["36"] = 30,["37"] = 31,["38"] = 32,["40"] = 34,["41"] = 35,["43"] = 37,["45"] = 20,["46"] = 5});
local ____exports = {}
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
____exports.default = __TS__Class()
local SolarActorAbilityState = ____exports.default
SolarActorAbilityState.name = "SolarActorAbilityState"
function SolarActorAbilityState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorAbilityState()")
        return
    end
    se:onUnitSpellCast(function(e)
        local actor = ActorAbilityUtil:getActorAbilityByBaseId(e.spellAbilityIdStr, e.trigUnit, true)
        if actor then
            if actor:isPassive() or actor:isDisable() then
                IssueImmediateOrder(e.trigUnit, "stop")
                return
            end
        end
    end)
    se:onUnitSpellEffect(function(e)
        local actor = ActorAbilityUtil:getActorAbilityByBaseId(e.spellAbilityIdStr, e.trigUnit, true)
        if actor then
            if actor:isPassive() or actor:isDisable() then
                return
            end
            local targetUnit = GetSpellTargetUnit()
            local x = 0
            local y = 0
            if IsHandle(targetUnit) then
                x = GetUnitX(targetUnit)
                y = GetUnitY(targetUnit)
            else
                x = GetSpellTargetX()
                y = GetSpellTargetY()
            end
            actor:action(x, y, targetUnit)
        end
    end)
end
return ____exports
