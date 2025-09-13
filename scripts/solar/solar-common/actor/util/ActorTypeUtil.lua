local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 10,["15"] = 10,["16"] = 10,["18"] = 10,["19"] = 24,["20"] = 25,["21"] = 26,["22"] = 26,["23"] = 27,["24"] = 28,["26"] = 26,["28"] = 32,["29"] = 32,["31"] = 24,["32"] = 42,["33"] = 43,["34"] = 44,["35"] = 45,["37"] = 47,["39"] = 49,["40"] = 50,["41"] = 51,["44"] = 55,["45"] = 56,["46"] = 57,["47"] = 57,["48"] = 58,["49"] = 58,["50"] = 58,["51"] = 59,["52"] = 58,["53"] = 58,["55"] = 62,["57"] = 64,["58"] = 42,["59"] = 71,["60"] = 73,["61"] = 74,["63"] = 76,["64"] = 77,["66"] = 79,["67"] = 71,["68"] = 87,["69"] = 88,["70"] = 89,["71"] = 90,["73"] = 92,["74"] = 87,["75"] = 99,["76"] = 100,["77"] = 99,["78"] = 109,["79"] = 109,["80"] = 111,["81"] = 112,["82"] = 113,["83"] = 114,["84"] = 115,["85"] = 116,["89"] = 120,["90"] = 121,["91"] = 122,["94"] = 109,["95"] = 137,["96"] = 138,["99"] = 141,["100"] = 142,["101"] = 143,["104"] = 146,["105"] = 137,["106"] = 156,["107"] = 157,["110"] = 160,["111"] = 161,["112"] = 162,["115"] = 165,["116"] = 156,["117"] = 177,["118"] = 177,["119"] = 177,["121"] = 177,["122"] = 177,["124"] = 178,["125"] = 179,["126"] = 180,["127"] = 181,["129"] = 183,["130"] = 184,["131"] = 185,["132"] = 186,["133"] = 187,["134"] = 188,["136"] = 190,["137"] = 191,["139"] = 193,["140"] = 194,["142"] = 196,["143"] = 197,["145"] = 199,["146"] = 200,["148"] = 202,["149"] = 203,["150"] = 204,["151"] = 205,["152"] = 206,["153"] = 207,["154"] = 208,["156"] = 204,["158"] = 212,["159"] = 177,["160"] = 12,["161"] = 16});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ActorItem = require("solar.solar-common.actor.ActorItem")
local ActorItem = ____ActorItem.default
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
____exports.default = __TS__Class()
local ActorTypeUtil = ____exports.default
ActorTypeUtil.name = "ActorTypeUtil"
function ActorTypeUtil.prototype.____constructor(self)
end
function ActorTypeUtil.addRegisterActorTypeListener(self, registerActorTypeListener, actorTypeID)
    if actorTypeID then
        local ____exports_default__sl_onRegisterActorTypeListeners_0 = ____exports.default._sl_onRegisterActorTypeListeners
        ____exports_default__sl_onRegisterActorTypeListeners_0[#____exports_default__sl_onRegisterActorTypeListeners_0 + 1] = function(____, actorType)
            if actorTypeID == actorType.id then
                registerActorTypeListener(nil, actorType)
            end
        end
    else
        local ____exports_default__sl_onRegisterActorTypeListeners_1 = ____exports.default._sl_onRegisterActorTypeListeners
        ____exports_default__sl_onRegisterActorTypeListeners_1[#____exports_default__sl_onRegisterActorTypeListeners_1 + 1] = registerActorTypeListener
    end
end
function ActorTypeUtil.registerActorType(self, actorTypeIdOrActorType)
    local actorType = nil
    if type(actorTypeIdOrActorType) == "string" then
        actorType = {id = actorTypeIdOrActorType}
    else
        actorType = actorTypeIdOrActorType
    end
    if actorType.id == nil or actorType.id.length == 0 then
        print_r(actorType)
        log.errorWithTraceBack("ActorType id必须赋值！")
        return
    end
    if DataBase:getSolarActorType(actorType.id) == nil or gv.reloadIng == true then
        DataBase:setSolarActorType(actorType.id, actorType)
        local ____exports_default_actorTypes_2 = ____exports.default.actorTypes
        ____exports_default_actorTypes_2[#____exports_default_actorTypes_2 + 1] = actorType
        ArrayUtil:forEach(
            ____exports.default._sl_onRegisterActorTypeListeners,
            function(____, registerActorTypeListener)
                registerActorTypeListener(nil, actorType)
            end
        )
    else
        log.errorWithTraceBack((("不能重复注册ActorType:" .. tostring(actorType.id)) .. " -> ") .. tostring(actorType.name))
    end
    return actorType
end
function ActorTypeUtil.hasActorType(self, actorTypeId)
    if actorTypeId == nil or #actorTypeId == 0 then
        return false
    end
    if DataBase:getSolarActorType(actorTypeId) == nil then
        return false
    end
    return true
end
function ActorTypeUtil.getActorType(self, actorTypeId)
    if actorTypeId == nil then
        log.errorWithTraceBack("actorTypeId不能为null!")
        return nil
    end
    return DataBase:getSolarActorType(actorTypeId)
end
function ActorTypeUtil.getAllActorTypes(self)
    return ____exports.default.actorTypes
end
function ActorTypeUtil.forAllActorTypes(self, callback, ...)
    local actorTypeClass = {...}
    local index = 0
    if actorTypeClass and #actorTypeClass > 0 then
        for ____, actorType in ipairs(____exports.default.actorTypes) do
            if __TS__ArrayIncludes(actorTypeClass, actorType.class) then
                callback(nil, actorType, index)
                index = index + 1
            end
        end
    else
        for ____, actorType in ipairs(____exports.default.actorTypes) do
            callback(nil, actorType, index)
            index = index + 1
        end
    end
end
function ActorTypeUtil.setUiEnable(self, actorTypeId, uiEnable, player)
    if player ~= nil and GetLocalPlayer() ~= player then
        return
    end
    local actorType = ____exports.default:getActorType(actorTypeId)
    if actorType == nil then
        print("设置未注册的Actor图标:" .. actorTypeId)
        return
    end
    actorType.uiEnable = uiEnable
end
function ActorTypeUtil.setTypeDescribe(self, actorTypeId, describe, player)
    if player ~= nil and GetLocalPlayer() ~= player then
        return
    end
    local actorType = ____exports.default:getActorType(actorTypeId)
    if actorType == nil then
        print("设置未注册的Actor提示:" .. actorTypeId)
        return
    end
    actorType.describe = describe
end
function ActorTypeUtil.registerActorTypeFromBaseItemType(self, itemTypeIdStr, baseData, bindItemAndActor)
    if baseData == nil then
        baseData = {}
    end
    if bindItemAndActor == nil then
        bindItemAndActor = false
    end
    local itemObjInfo = _g_objs.item[itemTypeIdStr]
    if itemObjInfo == nil then
        log.errorWithTraceBack("不存在此物品id:" .. itemTypeIdStr)
        return nil
    end
    baseData.id = itemTypeIdStr
    baseData.name = itemObjInfo.Tip
    baseData.icon = itemObjInfo.Art
    baseData.describe = itemObjInfo.Ubertip
    if itemObjInfo.file then
        baseData.model = itemObjInfo.file
    end
    if itemObjInfo.pawnable then
        baseData.pawnable = itemObjInfo.pawnable == "1"
    end
    if itemObjInfo.droppable then
        baseData.droppable = itemObjInfo.droppable == "1"
    end
    if itemObjInfo.goldcost then
        baseData.goldCost = math.floor(tonumber(itemObjInfo.goldcost))
    end
    if itemObjInfo.lumbercost then
        baseData.lumberCost = math.floor(tonumber(itemObjInfo.lumbercost))
    end
    ____exports.default:registerActorType(baseData)
    if bindItemAndActor then
        se:onUnitPickupItem(function(e)
            if e.manipulatedItemTypeIdStr == itemTypeIdStr then
                RemoveItem(e.manipulatedItem)
                local actorItem = __TS__New(ActorItem, itemTypeIdStr)
                UnitAddItem(e.trigUnit, actorItem.item)
            end
        end)
    end
    return baseData
end
ActorTypeUtil.actorTypes = {}
ActorTypeUtil._sl_onRegisterActorTypeListeners = {}
return ____exports
