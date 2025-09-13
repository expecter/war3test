local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 11,["21"] = 11,["22"] = 11,["23"] = 11,["24"] = 24,["25"] = 11,["26"] = 27,["29"] = 30,["30"] = 31,["31"] = 32,["34"] = 36,["35"] = 37,["36"] = 38,["37"] = 39,["38"] = 39,["39"] = 39,["40"] = 39,["41"] = 40,["43"] = 42,["45"] = 45,["46"] = 46,["47"] = 48,["48"] = 49,["49"] = 24,["50"] = 53,["51"] = 11,["52"] = 55,["53"] = 56,["57"] = 59,["58"] = 60,["60"] = 61,["63"] = 63,["65"] = 64,["68"] = 66,["70"] = 67,["73"] = 69,["75"] = 70,["76"] = 71,["78"] = 73,["79"] = 73,["80"] = 74,["81"] = 75,["86"] = 79,["88"] = 80,["91"] = 82,["93"] = 85,["94"] = 86,["95"] = 87,["96"] = 88,["97"] = 89,["98"] = 89,["99"] = 89,["100"] = 89,["104"] = 92,["106"] = 93,["107"] = 93,["108"] = 93,["109"] = 93,["110"] = 93,["113"] = 95,["115"] = 96,["116"] = 96,["117"] = 96,["118"] = 96,["119"] = 96,["120"] = 96,["123"] = 98,["125"] = 99,["128"] = 101,["130"] = 102,["133"] = 104,["135"] = 105,["136"] = 106,["137"] = 107,["139"] = 109,["143"] = 112,["145"] = 113,["148"] = 115,["150"] = 116,["151"] = 117,["154"] = 119,["156"] = 120,["159"] = 122,["161"] = 123,["165"] = 53,["166"] = 128,["167"] = 11,["168"] = 128,["169"] = 139,["170"] = 140,["171"] = 139,["172"] = 144,["173"] = 145,["174"] = 144,["175"] = 149,["176"] = 11,["177"] = 151,["178"] = 149,["179"] = 158,["180"] = 159,["181"] = 160,["184"] = 163,["185"] = 164,["186"] = 165,["187"] = 158,["188"] = 169,["189"] = 170,["190"] = 171,["191"] = 172,["192"] = 172,["193"] = 172,["194"] = 172,["195"] = 172,["196"] = 173,["197"] = 174,["198"] = 175,["200"] = 177,["201"] = 169,["202"] = 180,["203"] = 181,["204"] = 183,["205"] = 185,["206"] = 186,["207"] = 186,["208"] = 187,["209"] = 188,["213"] = 180,["214"] = 198,["215"] = 199,["216"] = 200,["218"] = 202,["219"] = 198,["220"] = 208,["221"] = 209,["222"] = 208,["223"] = 216,["224"] = 217,["225"] = 216,["226"] = 224,["227"] = 225,["228"] = 225,["229"] = 225,["230"] = 225,["231"] = 225,["232"] = 224,["233"] = 232,["234"] = 233,["235"] = 233,["236"] = 233,["237"] = 233,["238"] = 232,["239"] = 240,["240"] = 241,["241"] = 240,["242"] = 245,["243"] = 246,["246"] = 11,["247"] = 250,["248"] = 251,["251"] = 254,["252"] = 256,["253"] = 257,["254"] = 257,["255"] = 257,["256"] = 258,["257"] = 259,["258"] = 259,["259"] = 259,["260"] = 259,["262"] = 261,["263"] = 262,["264"] = 262,["265"] = 262,["266"] = 262,["268"] = 264,["269"] = 257,["270"] = 257,["272"] = 245,["273"] = 269,["274"] = 270,["277"] = 11,["278"] = 269,["279"] = 277,["280"] = 278,["281"] = 11,["282"] = 280,["283"] = 277,["284"] = 13,["289"] = 136});
local ____exports = {}
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____ObjectTemplateUtil = require("solar.solar-common.util.object.ObjectTemplateUtil")
local ObjectTemplateUtil = ____ObjectTemplateUtil.default
local ____AbilityUtil = require("solar.solar-common.util.ability.AbilityUtil")
local AbilityUtil = ____AbilityUtil.default
local ____AbilityButtonUtil = require("solar.solar-common.util.ability.AbilityButtonUtil")
local AbilityButtonUtil = ____AbilityButtonUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local ActorAbility = ____exports.default
ActorAbility.name = "ActorAbility"
__TS__ClassExtends(ActorAbility, Actor)
function ActorAbility.prototype.____constructor(self, actorTypeId, unit, startPosNum)
    Actor.prototype.____constructor(self, actorTypeId)
    if self._actorType == nil then
        return
    end
    ____exports.default.allActorAbilitys[self.uuid] = self
    self.startPosNum = startPosNum
    if unit == nil then
        return
    end
    if startPosNum ~= nil then
        self.posNum = ObjectTemplateUtil:getUnitAbilityTemplateNextNumber(unit, startPosNum)
    elseif self:get("y") ~= nil then
        local basePos = AbilityButtonUtil:getNumberByPos(
            self:get("x", 0),
            self:get("y")
        )
        self.posNum = ObjectTemplateUtil:getUnitAbilityTemplateNextNumber(unit, basePos)
    else
        self.posNum = ObjectTemplateUtil:getUnitAbilityTemplateNextNumber(unit, 1)
    end
    self.unit = unit
    self:addUnitAbilityTemplate(self.posNum)
    self:_sl_init()
    self:update()
end
function ActorAbility.prototype._sl_rawset(self, key, value)
    Actor.prototype._sl_rawset(self, key, value)
    local ability = self:getAbility()
    if ability == nil then
        return
    end
    repeat
        local ____switch10 = key
        local ____cond10 = ____switch10 == "id"
        if ____cond10 then
            EXSetAbilityDataString(ability, 1, ABILITY_DATA_NAME, self.uuid)
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "name"
        if ____cond10 then
            EXSetAbilityDataString(ability, 1, ABILITY_DATA_TIP, value)
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "icon"
        if ____cond10 then
            EXSetAbilityDataString(ability, 1, ABILITY_DATA_ART, value)
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "disable"
        if ____cond10 then
            if self:get("disable") then
                self:getRootFrameControl():getDisableFrame().visible = true
            else
                local ____opt_0 = self:getRootFrameControl(false)
                local disableFrame = ____opt_0 and ____opt_0:getDisableFrame(false)
                if disableFrame then
                    disableFrame.visible = false
                end
            end
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "describe"
        if ____cond10 then
            EXSetAbilityDataString(ability, 1, ABILITY_DATA_UBERTIP, value)
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "passive"
        if ____cond10 then
            if value == true then
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1)
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0)
            elseif self:get("targetType") ~= nil then
                AbilityUtil:setTargetType(
                    ability,
                    self:get("targetType")
                )
            end
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "hide"
        if ____cond10 then
            SetPlayerAbilityAvailable(
                GetOwningPlayer(self.unit),
                self.abilityId,
                not value
            )
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "hotKey"
        if ____cond10 then
            EXSetAbilityDataInteger(
                ability,
                1,
                ABILITY_DATA_HOTKET,
                char2number(value) or 0
            )
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "range"
        if ____cond10 then
            EXSetAbilityDataReal(ability, 1, 107, value)
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "area"
        if ____cond10 then
            EXSetAbilityDataReal(ability, 1, 106, value)
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "targetType"
        if ____cond10 then
            if self:isPassive() then
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1)
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0)
            else
                AbilityUtil:setTargetType(ability, value)
            end
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "targetAllow"
        if ____cond10 then
            AbilityUtil:setTargetAllow(ability, value)
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "dur"
        if ____cond10 then
            EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_DUR, value)
            EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_HERODUR, value)
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "manaCost"
        if ____cond10 then
            EXSetAbilityDataInteger(ability, 1, 104, value)
            break
        end
        ____cond10 = ____cond10 or ____switch10 == "maxCd"
        if ____cond10 then
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_COOL, value)
            break
        end
    until true
end
function ActorAbility.prototype.get(self, key, defaultValue)
    return Actor.prototype.get(self, key, defaultValue)
end
function ActorAbility.prototype.setPassive(self, passive)
    self:set("passive", passive)
end
function ActorAbility.prototype.isPassive(self)
    return self:get("passive", false)
end
function ActorAbility.prototype.setXY(self, x, y)
    Actor.prototype.setXY(self, x, y)
    self:setAbilityPos(AbilityButtonUtil:getNumberByPos(x, y))
end
function ActorAbility.prototype.setAbilityPos(self, pos)
    local ability = self:getAbility()
    if ability == nil then
        return
    end
    self:removeUnitAbilityTemplate()
    self:addUnitAbilityTemplate(pos)
    self:update()
end
function ActorAbility.prototype.addUnitAbilityTemplate(self, pos)
    self.abilityId = ObjectTemplateUtil:addUnitAbilityTemplate(self.unit, pos, self.templateCacheKey, self.uuid)
    self.templateId = self.abilityId
    SetPlayerAbilityAvailable(
        GetOwningPlayer(self.unit),
        self.abilityId,
        true
    )
    local unitSolarData = DataBase:getUnitSolarData(self.unit, true)
    if unitSolarData._SL_solarActorAbilitys == nil then
        unitSolarData._SL_solarActorAbilitys = {}
    end
    unitSolarData._SL_solarActorAbilitys[self.templateId] = self
end
function ActorAbility.prototype.removeUnitAbilityTemplate(self)
    if self.abilityId ~= nil then
        if self.unit ~= nil then
            ObjectTemplateUtil:removeUnitAbilityTemplate(self.unit, self.abilityId, self.templateCacheKey, self.uuid)
            local ____opt_2 = DataBase:getUnitSolarData(self.unit, false)
            local solarActorAbilitys = ____opt_2 and ____opt_2._SL_solarActorAbilitys
            if solarActorAbilitys and solarActorAbilitys[self.abilityId] then
                solarActorAbilitys[self.abilityId] = nil
            end
        end
    end
end
function ActorAbility.prototype.getAbility(self)
    if self.abilityId ~= nil and self.unit ~= nil then
        return EXGetUnitAbility(self.unit, self.abilityId)
    end
    return nil
end
function ActorAbility.prototype.getMaxCd(self)
    return self:get("maxCd", 0)
end
function ActorAbility.prototype.setMaxCd(self, maxCd)
    self:set("maxCd", maxCd)
end
function ActorAbility.prototype.setCooldown(self, cd)
    EXSetAbilityState(
        self:getAbility(),
        1,
        cd
    )
end
function ActorAbility.prototype.getCooldown(self)
    return EXGetAbilityState(
        self:getAbility(),
        1
    )
end
function ActorAbility.prototype.setHotKey(self, hotKey)
    self:set("hotKey", hotKey)
end
function ActorAbility.prototype.update(self)
    if self._sl_isDestroyed then
        return
    end
    Actor.prototype.update(self)
    local ability = self:getAbility()
    if ability == nil then
        return
    end
    AbilityUtil:refreshAbility(self.unit, self.abilityId)
    if self:get("targetAllow") or self:get("targetType") then
        BaseUtil.runLater(
            0.01,
            function()
                if self:get("targetType") then
                    self:_sl_rawset(
                        "targetType",
                        self:get("targetType")
                    )
                end
                if self:get("targetAllow") then
                    self:_sl_rawset(
                        "targetAllow",
                        self:get("targetAllow")
                    )
                end
                AbilityUtil:refreshAbility(self.unit, self.abilityId)
            end
        )
    end
end
function ActorAbility.prototype.action(self, x, y, targetUnit)
    if self:isPassive() then
        return
    end
    Actor.prototype.action(self, x, y, targetUnit)
end
function ActorAbility.prototype.destroy(self)
    self:removeUnitAbilityTemplate()
    Actor.prototype.destroy(self)
    deleteKey(____exports.default.allActorAbilitys, self.uuid)
end
ActorAbility.allActorAbilitys = {}
__TS__SetDescriptor(
    ActorAbility.prototype,
    "actorType",
    {get = function(self)
        return self._actorType
    end},
    true
)
return ____exports
