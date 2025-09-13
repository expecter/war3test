local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 9,["19"] = 9,["20"] = 9,["22"] = 13,["23"] = 14,["26"] = 17,["27"] = 19,["30"] = 22,["31"] = 22,["32"] = 22,["33"] = 23,["34"] = 24,["35"] = 26,["36"] = 28,["37"] = 29,["38"] = 30,["39"] = 31,["40"] = 32,["45"] = 37,["46"] = 38,["47"] = 39,["48"] = 41,["50"] = 43,["51"] = 44,["52"] = 45,["57"] = 52,["58"] = 53,["59"] = 53,["60"] = 53,["61"] = 54,["62"] = 53,["63"] = 53,["65"] = 58,["66"] = 60,["67"] = 22,["68"] = 22,["69"] = 17,["70"] = 63,["71"] = 65,["74"] = 68,["75"] = 68,["76"] = 68,["77"] = 69,["78"] = 68,["79"] = 68,["80"] = 63,["81"] = 74,["82"] = 75,["83"] = 74,["84"] = 12,["85"] = 82,["86"] = 83,["87"] = 84,["88"] = 86,["89"] = 86,["92"] = 89,["93"] = 90,["94"] = 91,["95"] = 91,["96"] = 91,["97"] = 91,["98"] = 93,["101"] = 96,["102"] = 97,["103"] = 98,["104"] = 99,["105"] = 100,["106"] = 102,["111"] = 82});
local ____exports = {}
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local SolarActorItemState = ____exports.default
SolarActorItemState.name = "SolarActorItemState"
function SolarActorItemState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorItemState()")
        return
    end
    se:onUnitPickupItem(function(e)
        if UnitUtil.isSummoned(e.trigUnit) then
            return
        end
        ActorItemUtil:ifHasActorItem(
            e.manipulatedItem,
            function(____, actor)
                local stackMax = actor:get("stackMax")
                if stackMax and stackMax > 1 then
                    local actorItems = ActorItemUtil:getUnitActorItemList(e.trigUnit, actor.actorTypeId)
                    local actorItem = nil
                    if actorItems ~= nil and #actorItems > 0 then
                        for ____, tempItem in ipairs(actorItems) do
                            if tempItem ~= actor and tempItem:getUses() < stackMax then
                                actorItem = tempItem
                                break
                            end
                        end
                    end
                    if actorItem ~= nil then
                        if actorItem:getUses() <= stackMax - actor:getUses() then
                            actorItem:addUses(actor:getUses())
                            actor:destroy()
                        else
                            local moveUse = stackMax - actorItem:getUses()
                            actorItem:addUses(moveUse)
                            actor:addUses(-moveUse)
                        end
                        return
                    end
                end
                if actor:get("unique") == true then
                    BaseUtil.runLater(
                        0.1,
                        function()
                            ____exports.default:checkItemUnique(actor)
                        end
                    )
                end
                actor.unit = e.trigUnit
                actor:update()
            end
        )
    end)
    se:onUnitDropItem(function(e)
        if UnitUtil.isSummoned(e.trigUnit) then
            return
        end
        ActorItemUtil:ifHasActorItem(
            e.manipulatedItem,
            function(____, actor)
                actor.unit = nil
            end
        )
    end)
    se:onUnitPawnItem(function(e)
        ActorItemUtil:sellItem(e.soldItem, e.trigUnit)
    end)
end
function SolarActorItemState.checkItemUnique(self, actor)
    if actor:get("unique") == true and IsHandle(actor.unit) then
        local unit = actor.unit
        local ____opt_0 = DataBase:getPlayerSolarData(actor.unitOwner, false)
        if (____opt_0 and ____opt_0.assistant) == unit then
            return
        end
        local itemList = ActorItemUtil:getUnitActorItemList(unit, actor.actorTypeId)
        if itemList and #itemList > 1 then
            TextTagUtil.textWarn(
                "只能携带一个" .. actor:getName(),
                unit
            )
            UnitRemoveItem(actor.unit, actor.item)
            return
        end
        local kind = actor:get("kind")
        if kind ~= nil then
            local itemList = ActorItemUtil:getUnitActorItemListByKind(unit, kind)
            if itemList and #itemList > 1 then
                TextTagUtil.textWarn("只能携带一种" .. kind, unit)
                UnitRemoveItem(actor.unit, actor.item)
                return
            end
        end
    end
end
return ____exports
