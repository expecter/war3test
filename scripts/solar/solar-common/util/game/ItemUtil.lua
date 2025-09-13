local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 4,["13"] = 4,["14"] = 25,["15"] = 25,["16"] = 25,["18"] = 25,["19"] = 25,["21"] = 26,["22"] = 27,["24"] = 28,["25"] = 28,["26"] = 29,["27"] = 30,["28"] = 28,["31"] = 32,["32"] = 25,["33"] = 41,["34"] = 41,["35"] = 41,["37"] = 42,["38"] = 43,["41"] = 46,["42"] = 47,["43"] = 49,["44"] = 50,["45"] = 41,["46"] = 59,["47"] = 60,["48"] = 61,["49"] = 61,["50"] = 61,["51"] = 62,["52"] = 61,["53"] = 61,["54"] = 64,["55"] = 59,["56"] = 72,["57"] = 73,["58"] = 74,["59"] = 76,["61"] = 72,["62"] = 86,["63"] = 87,["64"] = 88,["65"] = 90,["67"] = 86,["68"] = 99,["69"] = 100,["70"] = 99,["71"] = 106,["72"] = 107,["73"] = 108,["76"] = 110,["77"] = 110,["78"] = 111,["79"] = 112,["80"] = 113,["82"] = 110,["85"] = 116,["86"] = 106,["87"] = 123,["88"] = 124,["89"] = 125,["91"] = 127,["92"] = 129,["94"] = 130,["95"] = 130,["96"] = 131,["97"] = 132,["98"] = 132,["100"] = 133,["101"] = 133,["103"] = 133,["104"] = 134,["105"] = 134,["106"] = 134,["107"] = 134,["109"] = 130,["112"] = 137,["114"] = 139,["115"] = 140,["117"] = 141,["118"] = 141,["119"] = 142,["120"] = 143,["121"] = 144,["122"] = 144,["123"] = 144,["124"] = 144,["126"] = 141,["129"] = 147,["131"] = 123,["132"] = 156,["133"] = 157,["134"] = 158,["137"] = 160,["138"] = 160,["139"] = 161,["140"] = 162,["141"] = 163,["143"] = 160,["146"] = 166,["147"] = 156,["148"] = 172,["149"] = 173,["150"] = 174,["151"] = 175,["154"] = 178,["155"] = 172,["156"] = 185,["158"] = 186,["159"] = 186,["160"] = 187,["161"] = 188,["162"] = 189,["164"] = 186,["167"] = 192,["168"] = 185,["169"] = 199,["170"] = 200,["172"] = 201,["173"] = 201,["174"] = 202,["175"] = 203,["176"] = 204,["178"] = 201,["181"] = 207,["182"] = 199,["183"] = 214,["184"] = 215,["186"] = 216,["187"] = 216,["188"] = 217,["189"] = 218,["190"] = 219,["192"] = 216,["195"] = 225,["196"] = 214,["197"] = 233,["198"] = 234,["200"] = 235,["201"] = 235,["203"] = 236,["204"] = 237,["205"] = 238,["207"] = 240,["208"] = 241,["209"] = 242,["210"] = 243,["212"] = 246,["213"] = 247,["214"] = 248,["216"] = 250,["219"] = 235,["222"] = 252,["223"] = 233,["224"] = 261,["225"] = 262,["226"] = 263,["228"] = 264,["229"] = 264,["231"] = 265,["232"] = 266,["233"] = 267,["235"] = 269,["236"] = 270,["237"] = 271,["239"] = 274,["240"] = 275,["241"] = 276,["243"] = 279,["244"] = 280,["245"] = 281,["246"] = 282,["247"] = 283,["248"] = 284,["252"] = 264,["255"] = 287,["256"] = 261,["257"] = 296,["258"] = 297,["259"] = 298,["260"] = 299,["262"] = 301,["263"] = 302,["264"] = 303,["266"] = 305,["267"] = 296,["268"] = 313,["269"] = 314,["271"] = 315,["272"] = 315,["273"] = 316,["274"] = 317,["275"] = 318,["277"] = 315,["280"] = 321,["281"] = 313,["282"] = 329,["284"] = 330,["285"] = 330,["286"] = 331,["287"] = 332,["288"] = 333,["290"] = 330,["293"] = 329,["294"] = 343,["296"] = 344,["297"] = 344,["298"] = 345,["299"] = 346,["300"] = 347,["301"] = 348,["303"] = 344,["306"] = 343,["307"] = 5,["308"] = 6,["309"] = 7,["310"] = 8,["311"] = 9,["312"] = 12,["313"] = 13,["316"] = 16,["318"] = 7});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local CJ = require("jass.common")
____exports.default = __TS__Class()
local ItemUtil = ____exports.default
ItemUtil.name = "ItemUtil"
function ItemUtil.prototype.____constructor(self)
end
function ItemUtil.createItems(self, itemid, x, y, count, owningPlayerId)
    if count == nil then
        count = 1
    end
    if owningPlayerId == nil then
        owningPlayerId = PLAYER_NEUTRAL_PASSIVE
    end
    local p = Player(owningPlayerId)
    local item = nil
    do
        local i = 0
        while i < count do
            item = CreateItem(itemid, x, y)
            SetItemPlayer(item, p, true)
            i = i + 1
        end
    end
    return item
end
function ItemUtil.forItemsInRect(self, r, callBack, onlyAlive)
    if onlyAlive == nil then
        onlyAlive = true
    end
    if ____exports.default._temp_callBack ~= nil then
        log.errorWithTraceBack("不能在此函数回调参数里 再使用此函数!")
        return
    end
    ____exports.default._temp_onlyAlive = onlyAlive
    ____exports.default._temp_callBack = callBack
    CJ.EnumItemsInRect(r, nil, ____exports.default._SL_EnumItemsInRectFunc)
    ____exports.default._temp_callBack = nil
end
function ItemUtil.getItemsInRect(self, r)
    local result = {}
    ____exports.default:forItemsInRect(
        r,
        function(item)
            result[#result + 1] = item
        end
    )
    return result
end
function ItemUtil.setItemTip(self, itemcode, value)
    EXSetItemDataString(itemcode, 4, value)
    if isEmbedJapi then
        EXSetItemDataString(itemcode, 2, value)
    end
end
function ItemUtil.setItemUbertip(self, itemcode, value)
    EXSetItemDataString(itemcode, 3, value)
    if isEmbedJapi then
        EXSetItemDataString(itemcode, 5, value)
    end
end
function ItemUtil.setItemArt(self, itemcode, value)
    EXSetItemDataString(itemcode, 1, value)
end
function ItemUtil.getItemOfTypeFromUnit(self, udw, otid)
    if type(otid) == "string" then
        otid = FourCC(otid)
    end
    do
        local index = 0
        while index < 6 do
            local item = UnitItemInSlot(udw, index)
            if GetItemTypeId(item) == otid then
                return item
            end
            index = index + 1
        end
    end
    return nil
end
function ItemUtil.getItemCountOfTypeFromUnit(self, udw, itemIdStr)
    if itemIdStr == nil then
        return 0
    end
    if DataBase:getSolarActorType(itemIdStr) then
        local count = 0
        do
            local index = 0
            while index < 6 do
                local item = UnitItemInSlot(udw, index)
                local ____opt_0 = DataBase:getItemSolarData(item, false)
                local actorItem = ____opt_0 and ____opt_0._SL_solarActorItem
                local ____opt_result_4
                if actorItem ~= nil then
                    ____opt_result_4 = actorItem.actorTypeId
                end
                if ____opt_result_4 == itemIdStr then
                    count = count + math.max(
                        GetItemCharges(item),
                        1
                    )
                end
                index = index + 1
            end
        end
        return count
    else
        local otid = FourCC(itemIdStr)
        local count = 0
        do
            local index = 0
            while index < 6 do
                local item = UnitItemInSlot(udw, index)
                if GetItemTypeId(item) == otid then
                    count = count + math.max(
                        GetItemCharges(item),
                        1
                    )
                end
                index = index + 1
            end
        end
        return count
    end
end
function ItemUtil.isUnitHasItem(self, udw, otid)
    if type(otid) == "string" then
        otid = FourCC(otid)
    end
    do
        local index = 0
        while index < 6 do
            local wpid = GetItemTypeId(UnitItemInSlot(udw, index))
            if wpid == otid then
                return true
            end
            index = index + 1
        end
    end
    return false
end
function ItemUtil.isUnitHasItems(self, udw, itAy)
    for ____, iterator in ipairs(itAy) do
        if not ____exports.default:isUnitHasItem(udw, iterator) then
            return false
        end
    end
    return true
end
function ItemUtil.getFirstItemFromUnit(self, unit)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                return item
            end
            i = i + 1
        end
    end
    return nil
end
function ItemUtil.getAllItemFromUnit(self, unit)
    local items = {}
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                items[#items + 1] = item
            end
            i = i + 1
        end
    end
    return items
end
function ItemUtil.getAllItemInfoFromUnit(self, unit)
    local items = {}
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                items[#items + 1] = {index = i, item = item}
            end
            i = i + 1
        end
    end
    return items
end
function ItemUtil.getItemAndChargesFromUnit(self, unit)
    local items = {}
    do
        local i = 0
        while i < 6 do
            do
                local item = UnitItemInSlot(unit, i)
                if not IsHandle(item) then
                    goto __continue53
                end
                local itemTypeStr = id2string(GetItemTypeId(item))
                local itemCharges = GetItemCharges(item)
                if not itemCharges or itemCharges < 1 then
                    itemCharges = 1
                end
                local oldCharges = items[itemTypeStr]
                if not oldCharges then
                    oldCharges = 0
                end
                items[itemTypeStr] = oldCharges + itemCharges
            end
            ::__continue53::
            i = i + 1
        end
    end
    return items
end
function ItemUtil.costItemChargesFromUnit(self, unit, itemId, charges)
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
                if GetItemTypeId(item) ~= itemId then
                    goto __continue59
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
            ::__continue59::
            i = i + 1
        end
    end
    return costCharges
end
function ItemUtil.getItemSlotBySceneXY(self, sceneX, sceneY)
    local rX = math.floor((sceneX - 0.515) / 0.036)
    if rX < 0 or rX > 1 then
        return nil
    end
    local rY = 2 - math.floor((sceneY - 0.001) / 0.037)
    if rY < 0 or rY > 2 then
        return nil
    end
    return rY * 2 + rX
end
function ItemUtil.hasIdleItemGrid(self, unit)
    local inventorySize = UnitInventorySize(unit)
    do
        local i = 0
        while i < inventorySize do
            local item = UnitItemInSlot(unit, i)
            if not IsHandle(item) then
                return true
            end
            i = i + 1
        end
    end
    return false
end
function ItemUtil.removeUnitItems(self, unit)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                RemoveItem(item)
            end
            i = i + 1
        end
    end
end
function ItemUtil.transferItems(self, srcUnit, toUnit)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(srcUnit, i)
            if IsHandle(item) then
                UnitAddItem(toUnit, item)
                UnitDropItemSlot(toUnit, item, i)
            end
            i = i + 1
        end
    end
end
ItemUtil._temp_onlyAlive = true
ItemUtil._temp_callBack = nil
ItemUtil._SL_EnumItemsInRectFunc = function()
    local item = GetEnumItem()
    if ____exports.default._temp_onlyAlive then
        if GetWidgetLife(item) >= 1 and IsItemVisible(item) then
            ____exports.default._temp_callBack(item)
        end
    else
        ____exports.default._temp_callBack(item)
    end
end
return ____exports
