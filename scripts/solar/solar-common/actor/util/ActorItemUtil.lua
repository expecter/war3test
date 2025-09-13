local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 10,["16"] = 10,["17"] = 10,["19"] = 10,["20"] = 19,["21"] = 20,["22"] = 21,["23"] = 22,["24"] = 23,["26"] = 25,["28"] = 27,["29"] = 27,["31"] = 19,["32"] = 38,["33"] = 39,["34"] = 40,["35"] = 41,["37"] = 43,["38"] = 38,["39"] = 52,["40"] = 53,["41"] = 54,["42"] = 54,["43"] = 54,["44"] = 54,["45"] = 54,["46"] = 55,["47"] = 56,["49"] = 58,["50"] = 59,["52"] = 61,["53"] = 61,["55"] = 52,["56"] = 71,["57"] = 72,["58"] = 73,["61"] = 76,["62"] = 76,["63"] = 76,["64"] = 76,["65"] = 76,["66"] = 76,["67"] = 77,["68"] = 78,["70"] = 80,["71"] = 81,["72"] = 71,["73"] = 91,["74"] = 92,["75"] = 92,["76"] = 93,["79"] = 96,["82"] = 99,["83"] = 91,["84"] = 107,["85"] = 108,["86"] = 109,["88"] = 111,["89"] = 111,["90"] = 112,["91"] = 113,["93"] = 115,["94"] = 116,["96"] = 118,["97"] = 107,["98"] = 125,["99"] = 126,["100"] = 126,["101"] = 127,["102"] = 128,["104"] = 130,["105"] = 125,["106"] = 139,["107"] = 140,["108"] = 140,["109"] = 140,["110"] = 141,["111"] = 142,["112"] = 143,["113"] = 144,["114"] = 145,["115"] = 145,["116"] = 145,["117"] = 145,["118"] = 146,["119"] = 146,["120"] = 146,["121"] = 146,["124"] = 149,["125"] = 150,["126"] = 151,["127"] = 152,["128"] = 152,["129"] = 152,["130"] = 152,["131"] = 153,["135"] = 157,["136"] = 158,["137"] = 140,["138"] = 140,["139"] = 139,["140"] = 166,["141"] = 167,["142"] = 167,["143"] = 168,["144"] = 169,["146"] = 171,["147"] = 166,["148"] = 179,["149"] = 180,["151"] = 181,["152"] = 181,["154"] = 182,["155"] = 183,["156"] = 184,["157"] = 184,["158"] = 185,["159"] = 186,["160"] = 187,["162"] = 189,["163"] = 190,["165"] = 192,["170"] = 181,["173"] = 196,["174"] = 179,["175"] = 204,["176"] = 205,["178"] = 206,["179"] = 206,["181"] = 207,["182"] = 208,["183"] = 209,["184"] = 209,["185"] = 210,["186"] = 211,["187"] = 212,["189"] = 214,["190"] = 215,["192"] = 217,["197"] = 206,["200"] = 221,["201"] = 204,["202"] = 230,["204"] = 231,["205"] = 231,["206"] = 232,["207"] = 233,["208"] = 234,["209"] = 234,["210"] = 235,["211"] = 236,["214"] = 231,["217"] = 240,["218"] = 230,["219"] = 251,["221"] = 252,["222"] = 252,["223"] = 253,["224"] = 254,["225"] = 255,["226"] = 255,["227"] = 256,["228"] = 257,["231"] = 252,["234"] = 251,["235"] = 269,["237"] = 270,["238"] = 270,["239"] = 271,["240"] = 272,["241"] = 273,["242"] = 273,["243"] = 274,["244"] = 275,["247"] = 270,["250"] = 279,["251"] = 269,["252"] = 286,["253"] = 287,["255"] = 288,["256"] = 288,["258"] = 289,["259"] = 290,["260"] = 291,["262"] = 293,["263"] = 294,["264"] = 295,["265"] = 296,["267"] = 299,["268"] = 299,["269"] = 300,["270"] = 301,["272"] = 303,["276"] = 288,["279"] = 306,["280"] = 286,["281"] = 315,["282"] = 316,["283"] = 317,["285"] = 318,["286"] = 318,["288"] = 319,["289"] = 320,["290"] = 321,["292"] = 323,["293"] = 325,["294"] = 327,["295"] = 327,["296"] = 328,["297"] = 329,["300"] = 332,["301"] = 333,["302"] = 334,["304"] = 337,["305"] = 338,["306"] = 339,["307"] = 340,["308"] = 341,["309"] = 342,["313"] = 318,["316"] = 345,["317"] = 315,["318"] = 353,["319"] = 354,["320"] = 355,["321"] = 356,["323"] = 358,["324"] = 353});
local ____exports = {}
local ____ActorItem = require("solar.solar-common.actor.ActorItem")
local ActorItem = ____ActorItem.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
____exports.default = __TS__Class()
local ActorItemUtil = ____exports.default
ActorItemUtil.name = "ActorItemUtil"
function ActorItemUtil.prototype.____constructor(self)
end
function ActorItemUtil.createItem(self, itemOrActorTypeId, x, y, player)
    if DataBase:getSolarActorType(itemOrActorTypeId) == nil then
        local item = CreateItem(itemOrActorTypeId, x, y)
        if player then
            SetItemPlayer(item, player, true)
        end
        return item
    else
        local ____opt_0 = ____exports.default:createActorItem(itemOrActorTypeId, x, y, player)
        return ____opt_0 and ____opt_0.item
    end
end
function ActorItemUtil.createActorItem(self, itemActorTypeId, x, y, player)
    local actorItem = __TS__New(ActorItem, itemActorTypeId, x, y)
    if IsHandle(player) then
        SetItemPlayer(actorItem.item, player, true)
    end
    return actorItem
end
function ActorItemUtil.addItemForUnit(self, itemOrActorTypeId, unit, uses)
    if DataBase:getSolarActorType(itemOrActorTypeId) == nil then
        local item = CreateItem(
            itemOrActorTypeId,
            GetUnitX(unit),
            GetUnitY(unit)
        )
        if uses then
            SetItemCharges(item, uses)
        end
        UnitAddItem(unit, item)
        return item
    else
        local ____opt_2 = ____exports.default:addActorItemForUnit(itemOrActorTypeId, unit, uses)
        return ____opt_2 and ____opt_2.item
    end
end
function ActorItemUtil.addActorItemForUnit(self, itemActorTypeId, unit, uses)
    if itemActorTypeId == nil or not IsHandle(unit) then
        log.errorWithTraceBack((("错误的参数:" .. tostring(itemActorTypeId)) .. " unit=") .. tostring(unit))
        return
    end
    local actor = __TS__New(
        ActorItem,
        itemActorTypeId,
        GetUnitX(unit),
        GetUnitY(unit)
    )
    if uses then
        actor:setUses(uses)
    end
    UnitAddItem(unit, actor.item)
    return actor
end
function ActorItemUtil.ifHasActorItem(self, item, callBack, actorTypeId)
    local ____opt_4 = DataBase:getItemSolarData(item, false)
    local actor = ____opt_4 and ____opt_4._SL_solarActorItem
    if actor == nil then
        return
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return
    end
    callBack(nil, actor)
end
function ActorItemUtil.getActorItem(self, item, actorTypeId)
    if not IsHandle(item) then
        return nil
    end
    local ____opt_6 = DataBase:getItemSolarData(item, false)
    local actor = ____opt_6 and ____opt_6._SL_solarActorItem
    if actor == nil then
        return nil
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return nil
    end
    return actor
end
function ActorItemUtil.getItemId(self, item)
    local ____opt_8 = DataBase:getItemSolarData(item, false)
    local actor = ____opt_8 and ____opt_8._SL_solarActorItem
    if actor ~= nil then
        return actor.actorTypeId
    end
    return id2string(GetItemTypeId(item))
end
function ActorItemUtil.sellItem(self, soldItem, who)
    ____exports.default:ifHasActorItem(
        soldItem,
        function(____, actor)
            if actor:get("pawnable") ~= false then
                if actor:get("goldCost") ~= nil and actor:get("goldCost") > 0 then
                    local add = actor:getPawnGold()
                    if add > 0 then
                        PlayerUtil:addGoldState(
                            GetOwningPlayer(who),
                            add
                        )
                        TextTagUtil.textGold(
                            "" .. tostring(add),
                            who
                        )
                    end
                end
                if actor:get("lumberCost") ~= nil and actor:get("lumberCost") > 0 then
                    local add = actor:getPawnLumber()
                    if add > 0 then
                        local texttag = TextTagUtil.textLumber(
                            "" .. tostring(add),
                            who
                        )
                        SetTextTagVelocity(texttag, 0.04, 0)
                    end
                end
            end
            actor.unit = nil
            actor:destroy()
        end
    )
end
function ActorItemUtil.getActorItemTypeId(self, item)
    local ____opt_10 = DataBase:getItemSolarData(item, false)
    local actor = ____opt_10 and ____opt_10._SL_solarActorItem
    if actor == nil then
        return nil
    end
    return actor.actorTypeId
end
function ActorItemUtil.getUnitActorItemList(self, unit, actorTypeId)
    local actorList = nil
    do
        local i = 0
        while i < 6 do
            do
                local item = UnitItemInSlot(unit, i)
                if IsHandle(item) then
                    local ____opt_12 = DataBase:getItemSolarData(item, false)
                    local actor = ____opt_12 and ____opt_12._SL_solarActorItem
                    if actor ~= nil then
                        if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
                            goto __continue36
                        end
                        if actorList == nil then
                            actorList = {}
                        end
                        actorList[#actorList + 1] = actor
                    end
                end
            end
            ::__continue36::
            i = i + 1
        end
    end
    return actorList
end
function ActorItemUtil.getUnitActorItemListByKind(self, unit, kind)
    local actorList = nil
    do
        local i = 0
        while i < 6 do
            do
                local item = UnitItemInSlot(unit, i)
                if IsHandle(item) then
                    local ____opt_14 = DataBase:getItemSolarData(item, false)
                    local actor = ____opt_14 and ____opt_14._SL_solarActorItem
                    if actor ~= nil then
                        if kind ~= actor:get("kind") then
                            goto __continue43
                        end
                        if actorList == nil then
                            actorList = {}
                        end
                        actorList[#actorList + 1] = actor
                    end
                end
            end
            ::__continue43::
            i = i + 1
        end
    end
    return actorList
end
function ActorItemUtil.getUnitActorItem(self, unit, actorTypeId)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                local ____opt_16 = DataBase:getItemSolarData(item, false)
                local actor = ____opt_16 and ____opt_16._SL_solarActorItem
                if actor ~= nil and actorTypeId == actor.actorTypeId then
                    return actor
                end
            end
            i = i + 1
        end
    end
    return nil
end
function ActorItemUtil.ifUnitHasActorItem(self, unit, callBack, actorTypeId)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                local ____opt_18 = DataBase:getItemSolarData(item, false)
                local actor = ____opt_18 and ____opt_18._SL_solarActorItem
                if actor ~= nil and actor.actorTypeId == actorTypeId then
                    callBack(nil, actor)
                end
            end
            i = i + 1
        end
    end
end
function ActorItemUtil.isUnitHasActorItem(self, unit, actorTypeId)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                local ____opt_20 = DataBase:getItemSolarData(item, false)
                local actor = ____opt_20 and ____opt_20._SL_solarActorItem
                if actor ~= nil and actor.actorTypeId == actorTypeId then
                    return true
                end
            end
            i = i + 1
        end
    end
    return false
end
function ActorItemUtil.getItemAndActorItemAndChargesFromUnit(self, unit)
    local items = {}
    do
        local i = 0
        while i < 6 do
            do
                local item = UnitItemInSlot(unit, i)
                if not IsHandle(item) then
                    goto __continue65
                end
                local itemTypeStr = id2string(GetItemTypeId(item))
                local itemCharges = GetItemCharges(item)
                if not itemCharges or itemCharges < 1 then
                    itemCharges = 1
                end
                local ____opt_22 = DataBase:getItemSolarData(item, false)
                local actor = ____opt_22 and ____opt_22._SL_solarActorItem
                if actor ~= nil then
                    items[actor.actorType.id] = (items[actor.actorType.id] or 0) + itemCharges
                else
                    items[itemTypeStr] = (items[itemTypeStr] or 0) + itemCharges
                end
            end
            ::__continue65::
            i = i + 1
        end
    end
    return items
end
function ActorItemUtil.costItemAndActorItemChargesFromUnit(self, unit, itemIdOrActorTypeId, charges)
    local costCharges = 0
    local needCostCharges = 0
    do
        local i = 0
        while i < 6 do
            do
                needCostCharges = charges - costCharges
                if costCharges >= charges then
                    return costCharges
                end
                local item = UnitItemInSlot(unit, i)
                if id2string(GetItemTypeId(item)) ~= itemIdOrActorTypeId then
                    local ____opt_24 = DataBase:getItemSolarData(item, false)
                    local actor = ____opt_24 and ____opt_24._SL_solarActorItem
                    if actor == nil or itemIdOrActorTypeId ~= actor.actorType.id then
                        goto __continue72
                    end
                end
                local itemCharges = GetItemCharges(item)
                if not itemCharges or itemCharges < 1 then
                    itemCharges = 1
                end
                if itemCharges <= needCostCharges then
                    costCharges = costCharges + itemCharges
                    RemoveItem(item)
                elseif itemCharges > needCostCharges then
                    costCharges = costCharges + needCostCharges
                    SetItemCharges(item, itemCharges - needCostCharges)
                end
            end
            ::__continue72::
            i = i + 1
        end
    end
    return costCharges
end
function ActorItemUtil.getItemName(self, item)
    local actor = ____exports.default:getActorItem(item)
    if actor ~= nil then
        return actor:getName()
    end
    return GetItemName(item)
end
return ____exports
