local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 8,["11"] = 8,["12"] = 8,["14"] = 8,["15"] = 15,["16"] = 16,["17"] = 15,["18"] = 25,["19"] = 26,["20"] = 27,["22"] = 29,["23"] = 30,["24"] = 31,["25"] = 33,["26"] = 34,["27"] = 35,["29"] = 38,["30"] = 39,["31"] = 40,["32"] = 41,["34"] = 43,["35"] = 44,["36"] = 45,["37"] = 46,["41"] = 51,["42"] = 52,["43"] = 53,["44"] = 54,["45"] = 55,["47"] = 57,["51"] = 61,["53"] = 62,["54"] = 62,["55"] = 63,["56"] = 64,["57"] = 65,["58"] = 65,["59"] = 66,["60"] = 67,["61"] = 68,["63"] = 70,["66"] = 62,["69"] = 74,["70"] = 25,["71"] = 83,["72"] = 84,["73"] = 85,["77"] = 88,["78"] = 88,["79"] = 89,["80"] = 90,["81"] = 91,["83"] = 88,["86"] = 83,["87"] = 101,["88"] = 102,["89"] = 103,["92"] = 106,["94"] = 107,["95"] = 107,["96"] = 108,["97"] = 109,["98"] = 110,["100"] = 107,["103"] = 113,["104"] = 101,["105"] = 121,["106"] = 122,["107"] = 123,["110"] = 126,["112"] = 127,["113"] = 127,["114"] = 128,["115"] = 129,["116"] = 130,["118"] = 127,["121"] = 133,["122"] = 121,["123"] = 143,["124"] = 144,["125"] = 145,["128"] = 148,["130"] = 149,["131"] = 149,["133"] = 150,["134"] = 151,["135"] = 152,["137"] = 154,["138"] = 155,["140"] = 157,["141"] = 158,["143"] = 160,["146"] = 149,["149"] = 162,["150"] = 143,["151"] = 169,["152"] = 170,["153"] = 171,["154"] = 172,["155"] = 174,["157"] = 174,["159"] = 174,["160"] = 175,["161"] = 176,["163"] = 179,["164"] = 180,["165"] = 181,["166"] = 182,["168"] = 184,["169"] = 185,["170"] = 186,["171"] = 187,["175"] = 192,["176"] = 193,["177"] = 194,["178"] = 195,["179"] = 196,["180"] = 197,["181"] = 198,["183"] = 200,["188"] = 205,["190"] = 206,["191"] = 206,["192"] = 207,["193"] = 208,["194"] = 209,["195"] = 209,["197"] = 209,["199"] = 209,["200"] = 210,["201"] = 211,["202"] = 212,["204"] = 214,["207"] = 206,["210"] = 218,["211"] = 169,["212"] = 227,["213"] = 228,["214"] = 229,["217"] = 232,["218"] = 233,["219"] = 234,["223"] = 227,["224"] = 245,["225"] = 246,["226"] = 247,["227"] = 248,["229"] = 250,["230"] = 251,["231"] = 252,["234"] = 255,["235"] = 245,["236"] = 261,["237"] = 262,["238"] = 262,["239"] = 261,["240"] = 268,["241"] = 269,["242"] = 269,["243"] = 268,["244"] = 275,["245"] = 276,["246"] = 276,["247"] = 275});
local ____exports = {}
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local ActorUtil = ____exports.default
ActorUtil.name = "ActorUtil"
function ActorUtil.prototype.____constructor(self)
end
function ActorUtil.getActor(self, uuid)
    return Actor.allActors[uuid]
end
function ActorUtil.getUnitAllActorList(self, unit)
    if not IsHandle(unit) then
        return nil
    end
    local actorList = nil
    local solarData = DataBase:getUnitSolarData(unit, false)
    if solarData ~= nil then
        local actor = solarData._SL_solarActorUnit
        if actor ~= nil then
            actorList = {actor}
        end
        local actorAbilitys = solarData._SL_solarActorAbilitys
        if actorAbilitys ~= nil then
            if actorList == nil then
                actorList = {}
            end
            for abilityTemplateKey in pairs(actorAbilitys) do
                local actor = actorAbilitys[abilityTemplateKey]
                if actor ~= nil then
                    actorList[#actorList + 1] = actor
                end
            end
        end
        local _SL_solarActorBuffSet = solarData._SL_solarActorBuffs
        if _SL_solarActorBuffSet then
            for ____, actor in ipairs(_SL_solarActorBuffSet) do
                if actorList == nil then
                    actorList = {}
                end
                actorList[#actorList + 1] = actor
            end
        end
    end
    local invSize = UnitInventorySize(unit)
    do
        local i = 0
        while i < invSize do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                local ____opt_0 = DataBase:getItemSolarData(item, false)
                local actor = ____opt_0 and ____opt_0._SL_solarActorItem
                if actor ~= nil then
                    if actorList == nil then
                        actorList = {}
                    end
                    actorList[#actorList + 1] = actor
                end
            end
            i = i + 1
        end
    end
    return actorList
end
function ActorUtil.forUnitAllActorList(self, unit, callback, clazz)
    local actorList = ____exports.default:getUnitAllActorList(unit)
    if actorList == nil then
        return
    end
    do
        local i = #actorList - 1
        while i >= 0 do
            local actor = actorList[i + 1]
            if clazz == nil or clazz == actor:get("class") then
                callback(nil, actor)
            end
            i = i - 1
        end
    end
end
function ActorUtil.getUnitAllActorListByActorTypeId(self, unit, actorTypeId)
    local actorList = ____exports.default:getUnitAllActorList(unit)
    if actorList == nil then
        return
    end
    local result = {}
    do
        local i = #actorList - 1
        while i >= 0 do
            local actor = actorList[i + 1]
            if actorTypeId == nil or actorTypeId == actor.actorTypeId then
                result[#result + 1] = actor
            end
            i = i - 1
        end
    end
    return result
end
function ActorUtil.getUnitAllActorListByClass(self, unit, clazz)
    local actorList = ____exports.default:getUnitAllActorList(unit)
    if actorList == nil then
        return
    end
    local result = {}
    do
        local i = #actorList - 1
        while i >= 0 do
            local actor = actorList[i + 1]
            if clazz == nil or clazz == actor:get("class") then
                result[#result + 1] = actor
            end
            i = i - 1
        end
    end
    return result
end
function ActorUtil.getUnitAllActorListAndWhere(self, unit, clazz, kind, tag)
    local actorList = ____exports.default:getUnitAllActorList(unit)
    if actorList == nil then
        return
    end
    local result = {}
    do
        local i = #actorList - 1
        while i >= 0 do
            do
                local actor = actorList[i + 1]
                if clazz ~= nil and clazz ~= actor:get("class") then
                    goto __continue40
                end
                if kind ~= nil and kind ~= actor:get("kind") then
                    goto __continue40
                end
                if tag ~= nil and tag ~= actor:get("tag") then
                    goto __continue40
                end
                result[#result + 1] = actor
            end
            ::__continue40::
            i = i - 1
        end
    end
    return result
end
function ActorUtil.getUnitAllActorAttributes(self, unit)
    local attributeArray = nil
    local solarData = DataBase:getUnitSolarData(unit, false)
    if solarData ~= nil then
        local ____opt_2 = solarData._SL_solarActorUnit
        if ____opt_2 ~= nil then
            ____opt_2 = ____opt_2.attribute
        end
        local attribute = ____opt_2
        if attribute ~= nil then
            attributeArray = {attribute}
        end
        local actorAbilitys = solarData._SL_solarActorAbilitys
        if actorAbilitys ~= nil then
            if attributeArray == nil then
                attributeArray = {}
            end
            for abilityTemplateKey in pairs(actorAbilitys) do
                local attribute = actorAbilitys[abilityTemplateKey]
                if attribute ~= nil then
                    attributeArray[#attributeArray + 1] = attribute
                end
            end
        end
        local _SL_solarActorBuffSet = solarData._SL_solarActorBuffs
        if _SL_solarActorBuffSet then
            for ____, actorBuff in ipairs(_SL_solarActorBuffSet) do
                local attribute = actorBuff.attribute
                if attribute ~= nil then
                    if attributeArray == nil then
                        attributeArray = {}
                    end
                    attributeArray[#attributeArray + 1] = attribute
                end
            end
        end
    end
    local invSize = UnitInventorySize(unit)
    do
        local i = 0
        while i < invSize do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                local ____opt_6 = DataBase:getItemSolarData(item, false)
                local ____opt_4 = ____opt_6 and ____opt_6._SL_solarActorItem
                if ____opt_4 ~= nil then
                    ____opt_4 = ____opt_4.attribute
                end
                local attribute = ____opt_4
                if attribute ~= nil then
                    if attributeArray == nil then
                        attributeArray = {}
                    end
                    attributeArray[#attributeArray + 1] = attribute
                end
            end
            i = i + 1
        end
    end
    return attributeArray
end
function ActorUtil.ifUnitHasActor(self, unit, actorTypeId, callBack)
    local unitAllActorList = ____exports.default:getUnitAllActorList(unit)
    if unitAllActorList == nil then
        return
    end
    for ____, actor in ipairs(unitAllActorList) do
        if actor.actorTypeId == actorTypeId then
            callBack(nil, actor)
            return
        end
    end
end
function ActorUtil.isUnitHasActor(self, unit, actorTypeId)
    local unitAllActorList = ____exports.default:getUnitAllActorList(unit)
    if unitAllActorList == nil then
        return false
    end
    for ____, actor in ipairs(unitAllActorList) do
        if actor.actorTypeId == actorTypeId then
            return true
        end
    end
    return false
end
function ActorUtil.addAnyActorCreatedListener(self, onActorCreatedListener)
    local ____Actor__sl_anyActorCreatedListeners_8 = Actor._sl_anyActorCreatedListeners
    ____Actor__sl_anyActorCreatedListeners_8[#____Actor__sl_anyActorCreatedListeners_8 + 1] = onActorCreatedListener
end
function ActorUtil.addAnyActorLevelChangeListener(self, onActorLevelChangeListener)
    local ____Actor__sl_anyActorLevelChangeListeners_9 = Actor._sl_anyActorLevelChangeListeners
    ____Actor__sl_anyActorLevelChangeListeners_9[#____Actor__sl_anyActorLevelChangeListeners_9 + 1] = onActorLevelChangeListener
end
function ActorUtil.addAnyActorDestroyListener(self, onActorDestroyListener)
    local ____Actor__sl_anyActorDestroyListeners_10 = Actor._sl_anyActorDestroyListeners
    ____Actor__sl_anyActorDestroyListeners_10[#____Actor__sl_anyActorDestroyListeners_10 + 1] = onActorDestroyListener
end
return ____exports
