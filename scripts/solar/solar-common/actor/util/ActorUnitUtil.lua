local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 7,["18"] = 7,["19"] = 7,["21"] = 7,["22"] = 21,["23"] = 21,["24"] = 21,["26"] = 21,["27"] = 21,["29"] = 22,["30"] = 23,["31"] = 24,["32"] = 25,["33"] = 26,["34"] = 25,["36"] = 29,["37"] = 29,["38"] = 29,["39"] = 29,["40"] = 29,["41"] = 29,["42"] = 29,["43"] = 29,["44"] = 29,["45"] = 29,["47"] = 31,["48"] = 31,["49"] = 31,["50"] = 31,["51"] = 31,["52"] = 31,["53"] = 31,["54"] = 31,["55"] = 33,["57"] = 21,["58"] = 48,["59"] = 48,["60"] = 48,["62"] = 48,["63"] = 48,["65"] = 49,["67"] = 50,["68"] = 50,["69"] = 51,["70"] = 51,["71"] = 51,["72"] = 51,["73"] = 51,["74"] = 51,["75"] = 51,["76"] = 52,["77"] = 53,["78"] = 53,["80"] = 50,["83"] = 55,["84"] = 48,["85"] = 65,["86"] = 66,["87"] = 66,["88"] = 67,["91"] = 70,["94"] = 73,["95"] = 65,["96"] = 82,["97"] = 83,["98"] = 83,["99"] = 84,["100"] = 85,["102"] = 87,["103"] = 88,["105"] = 90,["106"] = 82,["107"] = 99,["108"] = 100,["109"] = 100,["110"] = 101,["111"] = 102,["113"] = 104,["114"] = 105,["116"] = 107,["117"] = 99,["118"] = 115,["119"] = 116,["120"] = 116,["121"] = 117,["122"] = 118,["124"] = 120,["125"] = 121,["127"] = 123,["128"] = 115,["129"] = 130,["130"] = 131,["131"] = 131,["132"] = 132,["133"] = 133,["135"] = 135,["136"] = 130,["137"] = 142,["138"] = 143,["139"] = 143,["140"] = 144,["141"] = 142,["142"] = 153,["143"] = 154,["144"] = 155,["145"] = 156,["146"] = 156,["147"] = 156,["148"] = 156,["149"] = 156,["151"] = 157,["152"] = 157,["153"] = 158,["154"] = 159,["157"] = 162,["158"] = 162,["159"] = 163,["160"] = 164,["162"] = 166,["163"] = 157,["166"] = 168,["167"] = 169,["168"] = 153,["169"] = 177,["170"] = 178,["171"] = 179,["172"] = 180,["174"] = 182,["175"] = 177});
local ____exports = {}
local ____ActorUnit = require("solar.solar-common.actor.ActorUnit")
local ActorUnit = ____ActorUnit.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____GroupUtil = require("solar.solar-common.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
____exports.default = __TS__Class()
local ActorUnitUtil = ____exports.default
ActorUnitUtil.name = "ActorUnitUtil"
function ActorUnitUtil.prototype.____constructor(self)
end
function ActorUnitUtil.createUnit(self, player, actorUnitTypeId, x, y, face, count, callBack)
    if face == nil then
        face = 0
    end
    if count == nil then
        count = 1
    end
    if ActorTypeUtil:hasActorType(actorUnitTypeId) then
        local actorCallBack = nil
        if callBack then
            actorCallBack = function(____, actorUnit)
                callBack(nil, actorUnit and actorUnit.unit)
            end
        end
        local ____opt_2 = ____exports.default:createActorUnit(
            player,
            actorUnitTypeId,
            x,
            y,
            face,
            count,
            actorCallBack
        )
        return ____opt_2 and ____opt_2.unit
    else
        local unit = UnitUtil.createUnit(
            player,
            actorUnitTypeId,
            x,
            y,
            face,
            count
        )
        return unit
    end
end
function ActorUnitUtil.createActorUnit(self, player, actorUnitTypeId, x, y, face, count, callBack)
    if face == nil then
        face = 0
    end
    if count == nil then
        count = 1
    end
    local actorUnit = nil
    do
        local i = 0
        while i < count do
            actorUnit = __TS__New(
                ActorUnit,
                actorUnitTypeId,
                player,
                x,
                y
            )
            SetUnitFacing(actorUnit.unit, face)
            if callBack ~= nil then
                callBack(nil, actorUnit)
            end
            i = i + 1
        end
    end
    return actorUnit
end
function ActorUnitUtil.ifHasActorUnit(self, unit, callBack, actorTypeId)
    local ____opt_6 = DataBase:getUnitSolarData(unit, false)
    local actor = ____opt_6 and ____opt_6._SL_solarActorUnit
    if actor == nil then
        return
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return
    end
    callBack(nil, actor)
end
function ActorUnitUtil.hasActorUnit(self, unit, callBack, actorTypeId)
    local ____opt_8 = DataBase:getUnitSolarData(unit, false)
    local actor = ____opt_8 and ____opt_8._SL_solarActorUnit
    if actor == nil then
        return false
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return false
    end
    return true
end
function ActorUnitUtil.getActorUnit(self, unit, actorTypeId)
    local ____opt_10 = DataBase:getUnitSolarData(unit, false)
    local actor = ____opt_10 and ____opt_10._SL_solarActorUnit
    if actor == nil then
        return nil
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return nil
    end
    return actor
end
function ActorUnitUtil.isActorUnitType(self, unit, actorTypeId)
    local ____opt_12 = DataBase:getUnitSolarData(unit, false)
    local actor = ____opt_12 and ____opt_12._SL_solarActorUnit
    if actor == nil then
        return false
    end
    if actorTypeId == actor.actorTypeId then
        return true
    end
    return false
end
function ActorUnitUtil.getUnitId(self, unit)
    local ____opt_14 = DataBase:getUnitSolarData(unit, false)
    local actor = ____opt_14 and ____opt_14._SL_solarActorUnit
    if actor == nil then
        return id2string(GetUnitTypeId(unit))
    end
    return actor.actorTypeId
end
function ActorUnitUtil.getActorUnitTypeId(self, unit)
    local ____opt_16 = DataBase:getUnitSolarData(unit, false)
    local actor = ____opt_16 and ____opt_16._SL_solarActorUnit
    return actor and actor.actorTypeId
end
function ActorUnitUtil.getPlayerActorUnits(self, playerIndex, actorUnitType)
    local resultUnits = {}
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsOfPlayer(
        group,
        Player(playerIndex),
        nil
    )
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(group)
            if not IsHandle(unitHandle) then
                break
            end
            local ____opt_20 = DataBase:getUnitSolarData(unitHandle, false)
            local actor = ____opt_20 and ____opt_20._SL_solarActorUnit
            if actor and UnitAlive(unitHandle) and (actorUnitType == nil or actor.actorTypeId == actorUnitType) then
                resultUnits[#resultUnits + 1] = actor
            end
            GroupRemoveUnit(group, unitHandle)
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
    return resultUnits
end
function ActorUnitUtil.getUnitName(self, whichUnit)
    local actorUnit = ____exports.default:getActorUnit(whichUnit)
    if actorUnit ~= nil then
        return actorUnit:getName()
    end
    return GetUnitName(whichUnit)
end
return ____exports
