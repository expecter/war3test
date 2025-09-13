local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 7,["21"] = 7,["22"] = 8,["23"] = 8,["24"] = 9,["25"] = 9,["26"] = 13,["27"] = 13,["28"] = 13,["30"] = 29,["31"] = 30,["35"] = 34,["36"] = 35,["37"] = 36,["38"] = 37,["39"] = 39,["40"] = 40,["43"] = 43,["44"] = 44,["45"] = 46,["46"] = 47,["47"] = 46,["48"] = 37,["49"] = 52,["50"] = 52,["51"] = 52,["52"] = 54,["53"] = 55,["54"] = 54,["55"] = 52,["56"] = 52,["57"] = 59,["58"] = 60,["59"] = 61,["61"] = 59,["62"] = 64,["63"] = 65,["64"] = 66,["65"] = 66,["66"] = 66,["67"] = 67,["68"] = 66,["69"] = 66,["70"] = 64,["71"] = 70,["72"] = 72,["73"] = 73,["74"] = 73,["75"] = 73,["76"] = 74,["77"] = 73,["78"] = 73,["79"] = 70,["80"] = 28,["81"] = 80,["82"] = 82,["85"] = 85,["86"] = 86,["87"] = 86,["88"] = 87,["89"] = 88,["93"] = 92,["95"] = 97,["96"] = 98,["97"] = 99,["99"] = 102,["100"] = 103,["101"] = 105,["102"] = 107,["103"] = 80,["104"] = 115,["105"] = 116,["106"] = 117,["107"] = 118,["108"] = 120,["110"] = 120,["112"] = 120,["113"] = 121,["114"] = 122,["116"] = 125,["117"] = 126,["118"] = 127,["119"] = 128,["121"] = 130,["122"] = 131,["124"] = 131,["126"] = 131,["127"] = 132,["128"] = 133,["132"] = 138,["133"] = 139,["134"] = 140,["135"] = 141,["136"] = 142,["137"] = 143,["138"] = 144,["140"] = 146,["141"] = 147,["142"] = 148,["143"] = 149,["146"] = 152,["151"] = 157,["152"] = 158,["154"] = 159,["155"] = 159,["156"] = 160,["157"] = 161,["158"] = 162,["159"] = 162,["160"] = 163,["161"] = 164,["162"] = 165,["164"] = 167,["165"] = 168,["166"] = 169,["167"] = 170,["168"] = 171,["171"] = 174,["174"] = 159,["178"] = 179,["179"] = 115,["180"] = 22,["181"] = 23,["182"] = 25});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitAttributeState = require("solar.solar-common.attribute.UnitAttributeState")
local UnitAttributeState = ____UnitAttributeState.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local SolarActorAttributeState = ____exports.default
SolarActorAttributeState.name = "SolarActorAttributeState"
function SolarActorAttributeState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorAttributeState()")
        return
    end
    --- buff 属性更新到单位属性
    local trigger2 = __TS__New(Trigger)
    local noUpdateAttributeTime = 0
    trigger2:registerTimerEvent(0.99, true)
    trigger2:addAction(function()
        if Actor._sl_needUpdateAttribute == false and noUpdateAttributeTime < 5 then
            noUpdateAttributeTime = noUpdateAttributeTime + 1
            return
        end
        Actor._sl_needUpdateAttribute = false
        noUpdateAttributeTime = 0
        DataBase:forUnitSolarDatas(function(____, u, solarData)
            ____exports.default:refreshActorAttributes2UnitSolarAttribute(u)
        end)
    end)
    se:on(
        "属性刷新",
        function()
            DataBase:forUnitSolarDatas(function(____, u, solarData)
                ____exports.default:refreshActorAttributes2UnitSolarAttribute(u)
            end)
        end
    )
    ActorBuffUtil:addAnyActorBuffCreatedListener(function(____, buff)
        if buff.attribute then
            ____exports.default:refreshActorAttributes2UnitSolarAttribute(buff.unit)
        end
    end)
    se:onUnitPickupItem(function(e)
        local trigUnit = e.trigUnit
        BaseUtil.runLater(
            0.1,
            function()
                ____exports.default:refreshActorAttributes2UnitSolarAttribute(trigUnit)
            end
        )
    end)
    se:onUnitDropItem(function(e)
        local trigUnit = e.trigUnit
        BaseUtil.runLater(
            0.1,
            function()
                ____exports.default:refreshActorAttributes2UnitSolarAttribute(trigUnit)
            end
        )
    end)
end
function SolarActorAttributeState.refreshActorAttributes2UnitSolarAttribute(self, unitHandle)
    if not UnitStateUtil:isAlive(unitHandle) then
        return
    end
    local attributes = ____exports.default:getUnitAllActorAttributes(unitHandle)
    local ____opt_0 = DataBase:getUnitSolarData(unitHandle, false)
    local oldAttr = ____opt_0 and ____opt_0._SL_totalActorsSolarAttribute
    if oldAttr == nil then
        if attributes == nil or #attributes == 0 then
            return
        end
    end
    local totalAttribute = AttributeUtil:sumAttributes(attributes)
    --- 属性 系统
    local solarData = DataBase:getUnitSolarData(unitHandle)
    if not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    AttributeUtil:subtract(solarData._SL_solarAttribute, oldAttr)
    AttributeUtil:add(solarData._SL_solarAttribute, totalAttribute)
    solarData._SL_totalActorsSolarAttribute = totalAttribute
    UnitAttributeState:refreshUnitSolarAttribute(unitHandle)
end
function SolarActorAttributeState.getUnitAllActorAttributes(self, unit)
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
                local ____opt_4 = actorAbilitys[abilityTemplateKey]
                if ____opt_4 ~= nil then
                    ____opt_4 = ____opt_4.attribute
                end
                local attribute = ____opt_4
                if attribute ~= nil then
                    attributeArray[#attributeArray + 1] = attribute
                end
            end
        end
        local _SL_solarActorBuffSet = solarData._SL_solarActorBuffs
        if _SL_solarActorBuffSet then
            for ____, actorBuff in ipairs(_SL_solarActorBuffSet) do
                local resultAttribute = actorBuff.attribute
                if resultAttribute ~= nil then
                    if attributeArray == nil then
                        attributeArray = {}
                    end
                    if #____exports.default.buffAttributeHandlers > 0 then
                        resultAttribute = __TS__ObjectAssign({}, actorBuff.attribute)
                        for ____, buffAttributeHandler in ipairs(____exports.default.buffAttributeHandlers) do
                            resultAttribute = buffAttributeHandler(nil, actorBuff, resultAttribute)
                        end
                    end
                    attributeArray[#attributeArray + 1] = resultAttribute
                end
            end
        end
    end
    if ____exports.default.enableItemAttribute then
        local invSize = UnitInventorySize(unit)
        do
            local i = 0
            while i < invSize do
                local item = UnitItemInSlot(unit, i)
                if IsHandle(item) then
                    local ____opt_6 = DataBase:getItemSolarData(item, false)
                    local actorItem = ____opt_6 and ____opt_6._SL_solarActorItem
                    if actorItem and actorItem.attribute ~= nil then
                        if attributeArray == nil then
                            attributeArray = {}
                        end
                        local resultAttribute = actorItem.attribute
                        if #____exports.default.itemAttributeHandlers > 0 then
                            resultAttribute = __TS__ObjectAssign({}, actorItem.attribute)
                            for ____, itemAttributeHandler in ipairs(____exports.default.itemAttributeHandlers) do
                                resultAttribute = itemAttributeHandler(nil, actorItem, resultAttribute)
                            end
                        end
                        attributeArray[#attributeArray + 1] = resultAttribute
                    end
                end
                i = i + 1
            end
        end
    end
    return attributeArray
end
SolarActorAttributeState.itemAttributeHandlers = {}
SolarActorAttributeState.buffAttributeHandlers = {}
SolarActorAttributeState.enableItemAttribute = true
return ____exports
