local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 9,["14"] = 9,["15"] = 9,["17"] = 9,["18"] = 20,["19"] = 21,["20"] = 22,["21"] = 23,["23"] = 25,["24"] = 20,["25"] = 33,["26"] = 34,["27"] = 35,["28"] = 36,["30"] = 38,["31"] = 39,["32"] = 33,["33"] = 47,["34"] = 48,["35"] = 49,["37"] = 51,["38"] = 51,["39"] = 52,["40"] = 53,["42"] = 55,["43"] = 56,["44"] = 57,["45"] = 58,["48"] = 61,["49"] = 47,["50"] = 69,["51"] = 70,["52"] = 70,["53"] = 71,["54"] = 72,["56"] = 74,["57"] = 74,["58"] = 75,["59"] = 76,["61"] = 78,["62"] = 79,["64"] = 81,["65"] = 82,["66"] = 83,["68"] = 85,["69"] = 69,["70"] = 94,["71"] = 95,["72"] = 96,["73"] = 97,["75"] = 94,["76"] = 124,["77"] = 124,["78"] = 124,["80"] = 125,["81"] = 126,["83"] = 128,["84"] = 128,["85"] = 129,["86"] = 130,["87"] = 131,["89"] = 133,["90"] = 134,["92"] = 135,["93"] = 135,["94"] = 136,["95"] = 137,["96"] = 138,["97"] = 138,["98"] = 139,["99"] = 140,["102"] = 135,["106"] = 145,["107"] = 124,["108"] = 153,["109"] = 154,["110"] = 155,["111"] = 156,["113"] = 158,["114"] = 153,["115"] = 166,["116"] = 167,["117"] = 167,["118"] = 168,["119"] = 169,["121"] = 171,["122"] = 172,["124"] = 173,["125"] = 174,["126"] = 175,["127"] = 176,["129"] = 178,["130"] = 179,["132"] = 181,["137"] = 184,["138"] = 166,["139"] = 193,["140"] = 194,["141"] = 194,["142"] = 195,["143"] = 196,["145"] = 198,["147"] = 199,["148"] = 200,["149"] = 201,["150"] = 202,["152"] = 204,["157"] = 193,["158"] = 216,["159"] = 217,["160"] = 217,["161"] = 218,["164"] = 221,["165"] = 222,["166"] = 223,["167"] = 224,["172"] = 216,["173"] = 237,["174"] = 238,["175"] = 238,["176"] = 239,["177"] = 240,["179"] = 242,["180"] = 243,["181"] = 244,["182"] = 245,["185"] = 248,["186"] = 237,["187"] = 256,["188"] = 257,["191"] = 260,["192"] = 260,["193"] = 261,["194"] = 262,["196"] = 264,["197"] = 265,["198"] = 266,["199"] = 267,["200"] = 268,["204"] = 256});
local ____exports = {}
local ____ActorAbility = require("solar.solar-common.actor.ActorAbility")
local ActorAbility = ____ActorAbility.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____AbilityButtonUtil = require("solar.solar-common.util.ability.AbilityButtonUtil")
local AbilityButtonUtil = ____AbilityButtonUtil.default
____exports.default = __TS__Class()
local ActorAbilityUtil = ____exports.default
ActorAbilityUtil.name = "ActorAbilityUtil"
function ActorAbilityUtil.prototype.____constructor(self)
end
function ActorAbilityUtil.createActorAbility(self, actorTypeId, unit, startPosNum, allocHotKey)
    local actorAbility = __TS__New(ActorAbility, actorTypeId, unit, startPosNum)
    if allocHotKey then
        actorAbility:setHotKey(AbilityButtonUtil:getHotKeyByNumber(actorAbility.posNum))
    end
    return actorAbility
end
function ActorAbilityUtil.destroyUnitAbility(self, unit, actorTypeId)
    local actorAbility = ____exports.default:getUnitActorAbility(unit, actorTypeId)
    if actorAbility == nil then
        return false
    end
    actorAbility:destroy()
    return true
end
function ActorAbilityUtil.getUnitActorAbility(self, unit, actorTypeId)
    if not IsHandle(unit) then
        return nil
    end
    local ____opt_0 = DataBase:getUnitSolarData(unit, false)
    local actorAbilitys = ____opt_0 and ____opt_0._SL_solarActorAbilitys
    if actorAbilitys == nil then
        return nil
    end
    for abilityTemplateKey in pairs(actorAbilitys) do
        local actor = actorAbilitys[abilityTemplateKey]
        if actor ~= nil and actor.actorTypeId == actorTypeId then
            return actor
        end
    end
    return nil
end
function ActorAbilityUtil.getUnitActorAbilityByPos(self, unit, pos)
    local ____opt_2 = DataBase:getUnitSolarData(unit, false)
    local abilityTemplate = ____opt_2 and ____opt_2._SL_abilityTemplate
    if abilityTemplate == nil then
        return nil
    end
    local ____opt_4 = DataBase:getUnitSolarData(unit, false)
    local actorAbilitys = ____opt_4 and ____opt_4._SL_solarActorAbilitys
    if actorAbilitys == nil then
        return nil
    end
    if abilityTemplate[pos] == nil then
        return nil
    end
    local actor = actorAbilitys[abilityTemplate[pos]]
    if actor ~= nil then
        return actor
    end
    return nil
end
function ActorAbilityUtil.ifHasActorAbility(self, abilityId, callBack, unit)
    local actor = ____exports.default:getActorAbilityByBaseId(abilityId, unit)
    if actor then
        callBack(nil, actor)
    end
end
function ActorAbilityUtil.getActorAbilityByBaseId(self, abilityId, unit, includeActorItem)
    if includeActorItem == nil then
        includeActorItem = false
    end
    if not IsHandle(unit) then
        return nil
    end
    local ____opt_6 = DataBase:getUnitSolarData(unit, false)
    local solarActorAbilitys = ____opt_6 and ____opt_6._SL_solarActorAbilitys
    local actorAbility = solarActorAbilitys and solarActorAbilitys[abilityId]
    if actorAbility then
        return actorAbility
    end
    if includeActorItem then
        local invSize = UnitInventorySize(unit)
        do
            local i = 0
            while i < invSize do
                local item = UnitItemInSlot(unit, i)
                if IsHandle(item) then
                    local ____opt_10 = DataBase:getItemSolarData(item, false)
                    local actorItem = ____opt_10 and ____opt_10._SL_solarActorItem
                    if actorItem ~= nil and actorItem.abilityId == abilityId then
                        return actorItem
                    end
                end
                i = i + 1
            end
        end
    end
    return nil
end
function ActorAbilityUtil.getUnitActorAbilityListSize(self, unit, clazz)
    local abilityList = ____exports.default:getUnitActorAbilityList(unit, clazz)
    if abilityList == nil then
        return 0
    end
    return #abilityList
end
function ActorAbilityUtil.getUnitActorAbilityList(self, unit, clazz)
    local ____opt_12 = DataBase:getUnitSolarData(unit, false)
    local solarActorAbilitys = ____opt_12 and ____opt_12._SL_solarActorAbilitys
    if solarActorAbilitys == nil then
        return nil
    end
    local actorList = nil
    for abilityTemplateKey in pairs(solarActorAbilitys) do
        do
            local actor = solarActorAbilitys[abilityTemplateKey]
            if actor ~= nil then
                if clazz ~= nil and clazz ~= actor.actorType.class then
                    goto __continue32
                end
                if actorList == nil then
                    actorList = {}
                end
                actorList[#actorList + 1] = actor
            end
        end
        ::__continue32::
    end
    return actorList
end
function ActorAbilityUtil.forUnitActorAbilityList(self, unit, callBack, clazz)
    local ____opt_14 = DataBase:getUnitSolarData(unit, false)
    local actorAbilitys = ____opt_14 and ____opt_14._SL_solarActorAbilitys
    if actorAbilitys == nil then
        return nil
    end
    for abilityTemplateKey in pairs(actorAbilitys) do
        do
            local actor = actorAbilitys[abilityTemplateKey]
            if actor ~= nil then
                if clazz ~= nil and clazz ~= actor.actorType.class then
                    goto __continue39
                end
                callBack(nil, actor)
            end
        end
        ::__continue39::
    end
end
function ActorAbilityUtil.ifUnitHasActorAbility(self, unit, callBack, actorTypeId)
    local ____opt_16 = DataBase:getUnitSolarData(unit, false)
    local actorAbilitys = ____opt_16 and ____opt_16._SL_solarActorAbilitys
    if actorAbilitys == nil then
        return
    end
    for abilityTemplateKey in pairs(actorAbilitys) do
        local actor = actorAbilitys[abilityTemplateKey]
        if actor ~= nil and actor.actorTypeId == actorTypeId then
            callBack(nil, actor)
            return
        end
    end
    return
end
function ActorAbilityUtil.isUnitHasActorAbility(self, unit, actorTypeId)
    local ____opt_18 = DataBase:getUnitSolarData(unit, false)
    local actorAbilitys = ____opt_18 and ____opt_18._SL_solarActorAbilitys
    if actorAbilitys == nil then
        return false
    end
    for abilityTemplateKey in pairs(actorAbilitys) do
        local actor = actorAbilitys[abilityTemplateKey]
        if actor ~= nil and actor.actorTypeId == actorTypeId then
            return true
        end
    end
    return false
end
function ActorAbilityUtil.destroyUnitAllActorAbility(self, unit, clazz)
    if not IsHandle(unit) then
        return
    end
    local ____opt_20 = DataBase:getUnitSolarData(unit, false)
    local actorAbilitys = ____opt_20 and ____opt_20._SL_solarActorAbilitys
    if actorAbilitys == nil then
        return nil
    end
    for abilityTemplateKey in pairs(actorAbilitys) do
        local actor = actorAbilitys[abilityTemplateKey]
        if actor ~= nil then
            if clazz == nil or clazz == actor.actorType.class then
                actor:destroy()
            end
        end
    end
end
return ____exports
