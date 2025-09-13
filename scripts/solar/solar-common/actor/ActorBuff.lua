local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 5,["18"] = 5,["19"] = 6,["20"] = 6,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 24,["26"] = 12,["27"] = 26,["28"] = 27,["29"] = 28,["30"] = 30,["31"] = 31,["32"] = 32,["34"] = 34,["35"] = 34,["36"] = 36,["37"] = 37,["38"] = 39,["39"] = 39,["41"] = 41,["42"] = 42,["43"] = 42,["44"] = 42,["45"] = 42,["46"] = 42,["48"] = 12,["49"] = 47,["50"] = 48,["51"] = 49,["53"] = 24,["54"] = 54,["55"] = 12,["56"] = 54,["57"] = 58,["58"] = 59,["59"] = 59,["60"] = 59,["61"] = 60,["64"] = 64,["65"] = 65,["68"] = 69,["69"] = 69,["70"] = 69,["71"] = 70,["72"] = 71,["73"] = 72,["75"] = 74,["76"] = 69,["77"] = 69,["78"] = 59,["79"] = 59,["80"] = 58,["81"] = 90,["82"] = 91,["83"] = 93,["84"] = 94,["85"] = 95,["86"] = 96,["87"] = 96,["88"] = 96,["89"] = 97,["90"] = 96,["91"] = 96,["92"] = 96,["94"] = 101,["95"] = 102,["96"] = 103,["97"] = 104,["98"] = 105,["100"] = 90,["101"] = 109,["102"] = 110,["103"] = 109,["104"] = 116,["105"] = 117,["107"] = 117,["109"] = 116,["110"] = 123,["111"] = 124,["112"] = 123,["113"] = 130,["114"] = 131,["115"] = 130,["116"] = 137,["117"] = 138,["118"] = 12,["119"] = 141,["120"] = 143,["121"] = 144,["122"] = 145,["125"] = 148,["126"] = 137,["127"] = 13,["132"] = 84});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____STimer = require("solar.solar-common.tool.STimer")
local STimer = ____STimer.default
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____TargetAttach = require("solar.solar-common.constant.TargetAttach")
local TargetAttach = ____TargetAttach.default
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
____exports.default = __TS__Class()
local ActorBuff = ____exports.default
ActorBuff.name = "ActorBuff"
__TS__ClassExtends(ActorBuff, Actor)
function ActorBuff.prototype.____constructor(self, actorTypeId, unit, creator, initActorBuff)
    Actor.prototype.____constructor(self, actorTypeId)
    ____exports.default.allActorBuffs[self.uuid] = self
    self.unit = unit
    self.creator = creator
    local solarData = DataBase:getUnitSolarData(unit)
    if not solarData._SL_solarActorBuffs then
        solarData._SL_solarActorBuffs = {}
    end
    local ____solarData__SL_solarActorBuffs_0 = solarData._SL_solarActorBuffs
    ____solarData__SL_solarActorBuffs_0[#____solarData__SL_solarActorBuffs_0 + 1] = self
    self:updateDurStartTime()
    self:update()
    if initActorBuff ~= nil then
        initActorBuff(nil, self)
    end
    if self:get("modelAttach") ~= nil and #self:get("modelAttach") > 4 then
        self.effect = AddSpecialEffectTarget(
            self:get("modelAttach"),
            unit,
            self:get("modelAttachTarget", TargetAttach.origin)
        )
    end
    Actor.prototype._sl_init(self)
    local dur = self:get("dur")
    if dur ~= nil and dur > 0 then
        self:initDur(dur)
    end
end
function ActorBuff.prototype.get(self, key, defaultValue)
    return Actor.prototype.get(self, key, defaultValue)
end
function ActorBuff.prototype.initDur(self, dur)
    BaseUtil.runLater(
        dur,
        function()
            if self._sl_isDestroyed then
                return
            end
            if self:getRemainingTime() <= 0 then
                self:destroy()
                return
            end
            BaseUtil.onTimer(
                1,
                function(____, count)
                    if self:getRemainingTime() <= 0 then
                        self:destroy()
                        return false
                    end
                    return true
                end
            )
        end
    )
end
function ActorBuff.prototype.setTimerInterval(self, timeS)
    self:set("interval", timeS)
    if timeS > 0 then
        if self._sl_intervalTimer == nil then
            self._sl_intervalTimer = __TS__New(STimer)
            self._sl_intervalTimer:start(
                timeS,
                function()
                    self:interval()
                end,
                true
            )
        end
        self._sl_intervalTimer.timeout = timeS
    elseif self._sl_intervalTimer then
        log.errorWithTraceBack("buff间隔必须 > 0")
        self._sl_intervalTimer:destroy()
        self._sl_intervalTimer = nil
    end
end
function ActorBuff.prototype.updateDurStartTime(self)
    self.durStartTime = _g_time / 1000
end
function ActorBuff.prototype.update(self)
    local ____opt_3 = self:get("onUpdate")
    if ____opt_3 ~= nil then
        ____opt_3(nil, self)
    end
end
function ActorBuff.prototype.getDieTime(self)
    return self.durStartTime + self:get("dur", 0)
end
function ActorBuff.prototype.getRemainingTime(self)
    return self.durStartTime + self:get("dur", 0) - _g_time / 1000
end
function ActorBuff.prototype.destroy(self)
    local unit = self.unit
    Actor.prototype.destroy(self)
    if self._sl_isDestroyed and IsHandle(unit) then
        local solarData = DataBase:getUnitSolarData(unit, false)
        if solarData and solarData._SL_solarActorBuffs then
            ArrayUtil:removeElement(solarData and solarData._SL_solarActorBuffs, self)
        end
    end
    deleteKey(____exports.default.allActorBuffs, self.uuid)
end
ActorBuff.allActorBuffs = {}
__TS__SetDescriptor(
    ActorBuff.prototype,
    "actorType",
    {get = function(self)
        return self._actorType
    end},
    true
)
return ____exports
