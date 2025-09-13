local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 7,["11"] = 7,["12"] = 7,["14"] = 7,["15"] = 12,["16"] = 13,["19"] = 16,["20"] = 17,["21"] = 17,["22"] = 17,["23"] = 17,["24"] = 17,["25"] = 17,["26"] = 17,["27"] = 17,["28"] = 25,["29"] = 26,["32"] = 29,["33"] = 17,["34"] = 31,["35"] = 32,["38"] = 35,["39"] = 17,["40"] = 17,["41"] = 39,["42"] = 39,["43"] = 39,["44"] = 39,["45"] = 39,["46"] = 39,["47"] = 39,["48"] = 39,["49"] = 48,["50"] = 49,["53"] = 52,["54"] = 39,["55"] = 54,["56"] = 55,["59"] = 58,["60"] = 39,["61"] = 39,["62"] = 12,["63"] = 68,["64"] = 69,["65"] = 70,["66"] = 71,["67"] = 72,["68"] = 73,["71"] = 76,["72"] = 77,["73"] = 78,["76"] = 81,["77"] = 82,["79"] = 68,["80"] = 91,["81"] = 92,["82"] = 93,["83"] = 94,["84"] = 95,["85"] = 96,["88"] = 99,["89"] = 100,["90"] = 101,["93"] = 105,["94"] = 106,["95"] = 107,["98"] = 110,["99"] = 111,["100"] = 91,["101"] = 8,["102"] = 9,["103"] = 10});
local ____exports = {}
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.default = __TS__Class()
local CommonBuffUtil = ____exports.default
CommonBuffUtil.name = "CommonBuffUtil"
function CommonBuffUtil.prototype.____constructor(self)
end
function CommonBuffUtil._sl_checkInit(self)
    if not ____exports.default._sl_init then
        return
    end
    ____exports.default._sl_init = false
    ActorTypeUtil:registerActorType({
        id = ____exports.default["BuffId_击晕"],
        name = "被击晕的",
        describe = "该单位不能移动。",
        icon = "ReplaceableTextures\\CommandButtons\\BTNStun.blp",
        modelAttach = "Abilities\\Spells\\Human\\Thunderclap\\ThunderclapTarget.mdx",
        modelAttachTarget = "overhead",
        dur = 1,
        onCreated = function(____, actor)
            if not IsHandle(actor.unit) then
                return
            end
            EXPauseUnit(actor.unit, true)
        end,
        onDestroy = function(____, actor)
            if not IsHandle(actor.unit) then
                return
            end
            EXPauseUnit(actor.unit, false)
        end
    })
    ActorTypeUtil:registerActorType({
        id = ____exports.default["BuffId_无敌"],
        name = "无敌的",
        describe = "该单位是无敌的，所以任何的攻击和魔法都对其无效。",
        icon = "ReplaceableTextures\\CommandButtons\\BTNDivineIntervention.blp",
        modelAttach = "Abilities\\Spells\\Human\\DivineShield\\DivineShieldTarget.mdl",
        modelAttachTarget = "origin",
        dur = 1,
        onCreated = function(____, actor)
            if not IsHandle(actor.unit) then
                return
            end
            SetUnitInvulnerable(actor.unit, true)
        end,
        onDestroy = function(____, actor)
            if not IsHandle(actor.unit) then
                return
            end
            SetUnitInvulnerable(actor.unit, false)
        end
    })
end
function CommonBuffUtil.pauseUnit(self, unitHandle, dur)
    ____exports.default:_sl_checkInit()
    local actorBuff = ActorBuffUtil:getUnitActorBuff(unitHandle, ____exports.default["BuffId_击晕"])
    if actorBuff == nil then
        actorBuff = ActorBuffUtil:addActorBuff(unitHandle, ____exports.default["BuffId_击晕"])
        actorBuff:setDur(dur)
        return
    else
        local remainingTime = actorBuff:getRemainingTime()
        if remainingTime >= dur then
            print("已经有其他更长的眩晕时间了")
            return
        end
        actorBuff = ActorBuffUtil:addActorBuff(unitHandle, ____exports.default["BuffId_击晕"])
        actorBuff:setDur(dur)
    end
end
function CommonBuffUtil.addInvulnerableIfNot(self, unitHandle, dur)
    ____exports.default:_sl_checkInit()
    local _____539F_751F_65E0_654Cbuff = GetUnitAbilityLevel(unitHandle, "Avul")
    if _____539F_751F_65E0_654Cbuff == 0 then
        local _____65E0_654Cbuff = ActorBuffUtil:addActorBuff(unitHandle, ____exports.default["BuffId_无敌"])
        _____65E0_654Cbuff:setDur(dur)
        return
    end
    local actorBuff = ActorBuffUtil:getUnitActorBuff(unitHandle, ____exports.default["BuffId_无敌"])
    if actorBuff == nil then
        print("通用无敌不与无敌技能同时存在")
        return
    end
    local remainingTime = actorBuff:getRemainingTime()
    if remainingTime >= dur then
        print("通用无敌buff剩余时间大于指定无敌时间")
        return
    end
    actorBuff = ActorBuffUtil:addActorBuff(unitHandle, ____exports.default["BuffId_无敌"])
    actorBuff:setDur(dur)
end
CommonBuffUtil["BuffId_击晕"] = "_sl_:CommonBuff:击晕"
CommonBuffUtil["BuffId_无敌"] = "_sl_:CommonBuff:无敌"
CommonBuffUtil._sl_init = true
return ____exports
