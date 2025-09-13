local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 14,["19"] = 14,["20"] = 14,["22"] = 14,["23"] = 66,["24"] = 67,["25"] = 68,["26"] = 70,["28"] = 71,["29"] = 72,["31"] = 74,["35"] = 77,["36"] = 77,["37"] = 77,["38"] = 78,["39"] = 78,["40"] = 79,["41"] = 79,["42"] = 80,["43"] = 77,["44"] = 77,["45"] = 83,["46"] = 84,["47"] = 85,["48"] = 86,["49"] = 87,["50"] = 88,["51"] = 89,["52"] = 90,["55"] = 93,["57"] = 95,["58"] = 66,["59"] = 105,["60"] = 105,["61"] = 105,["63"] = 106,["64"] = 107,["65"] = 108,["68"] = 111,["69"] = 112,["70"] = 113,["72"] = 115,["73"] = 105,["74"] = 125,["75"] = 125,["76"] = 125,["78"] = 126,["79"] = 127,["80"] = 128,["82"] = 130,["83"] = 125,["84"] = 138,["85"] = 139,["88"] = 142,["89"] = 143,["90"] = 144,["91"] = 145,["92"] = 146,["93"] = 147,["95"] = 149,["98"] = 138,["99"] = 159,["100"] = 159,["101"] = 159,["103"] = 160,["104"] = 161,["105"] = 162,["107"] = 164,["108"] = 159,["109"] = 172,["110"] = 172,["111"] = 172,["113"] = 173,["114"] = 174,["115"] = 175,["117"] = 177,["118"] = 172,["119"] = 186,["120"] = 186,["121"] = 186,["123"] = 187,["124"] = 188,["125"] = 189,["126"] = 190,["127"] = 191,["129"] = 193,["130"] = 194,["131"] = 186,["132"] = 202,["133"] = 202,["134"] = 202,["136"] = 203,["137"] = 204,["138"] = 205,["140"] = 207,["141"] = 202,["142"] = 215,["143"] = 216,["146"] = 219,["147"] = 220,["148"] = 221,["149"] = 222,["150"] = 223,["151"] = 224,["153"] = 226,["156"] = 215,["157"] = 238,["158"] = 238,["159"] = 238,["161"] = 239,["162"] = 240,["163"] = 241,["164"] = 242,["165"] = 243,["167"] = 245,["168"] = 246,["169"] = 238,["170"] = 255,["171"] = 255,["172"] = 255,["174"] = 256,["175"] = 257,["176"] = 258,["177"] = 259,["178"] = 260,["180"] = 262,["181"] = 263,["182"] = 255,["183"] = 272,["184"] = 272,["185"] = 272,["187"] = 273,["188"] = 274,["189"] = 275,["190"] = 276,["191"] = 277,["193"] = 279,["194"] = 280,["195"] = 272,["196"] = 289,["197"] = 289,["198"] = 289,["200"] = 290,["201"] = 291,["202"] = 292,["203"] = 293,["204"] = 294,["206"] = 296,["207"] = 297,["208"] = 289,["209"] = 303,["210"] = 304,["211"] = 305,["212"] = 306,["213"] = 307,["215"] = 304,["216"] = 303,["217"] = 315,["218"] = 315,["219"] = 315,["221"] = 316,["222"] = 317,["223"] = 318,["224"] = 319,["226"] = 316,["227"] = 315,["228"] = 328,["229"] = 329,["230"] = 330,["231"] = 331,["233"] = 333,["234"] = 334,["236"] = 335,["237"] = 336,["239"] = 338,["240"] = 339,["242"] = 341,["247"] = 345,["248"] = 328,["249"] = 352,["250"] = 353,["253"] = 356,["254"] = 357,["255"] = 358,["258"] = 352,["259"] = 367,["260"] = 368,["263"] = 371,["264"] = 372,["265"] = 373,["268"] = 367,["269"] = 382,["270"] = 383,["273"] = 386,["274"] = 387,["276"] = 389,["277"] = 390,["279"] = 392,["280"] = 393,["281"] = 394,["284"] = 397,["285"] = 382,["286"] = 403,["287"] = 404,["288"] = 405,["290"] = 407,["291"] = 408,["293"] = 410,["294"] = 411,["295"] = 412,["296"] = 413,["298"] = 415,["299"] = 416,["300"] = 417,["303"] = 420,["304"] = 403,["305"] = 434,["306"] = 435,["307"] = 436,["308"] = 434,["309"] = 445,["310"] = 446,["311"] = 447,["312"] = 445,["313"] = 456,["314"] = 457,["315"] = 458,["316"] = 459,["317"] = 456,["318"] = 468,["319"] = 469,["320"] = 470,["321"] = 468,["322"] = 479,["323"] = 480,["324"] = 481,["325"] = 479,["326"] = 490,["327"] = 491,["328"] = 492,["329"] = 493,["330"] = 490,["331"] = 19,["332"] = 19,["333"] = 19,["334"] = 19,["335"] = 19,["336"] = 19,["337"] = 19,["338"] = 19,["339"] = 19,["340"] = 19,["341"] = 19,["342"] = 19,["343"] = 19,["344"] = 19,["345"] = 19,["346"] = 19,["347"] = 19,["348"] = 19,["349"] = 19,["350"] = 19,["351"] = 19,["352"] = 19,["353"] = 19,["354"] = 19,["355"] = 19,["356"] = 19,["357"] = 19,["358"] = 19,["359"] = 19,["360"] = 19,["361"] = 19,["362"] = 19,["363"] = 19,["364"] = 19,["365"] = 19,["366"] = 19,["367"] = 19,["368"] = 19,["369"] = 19,["370"] = 19});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____HandleUtil = require("solar.solar-common.util.lang.HandleUtil")
local HandleUtil = ____HandleUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
____exports.default = __TS__Class()
local AttributeUtil = ____exports.default
AttributeUtil.name = "AttributeUtil"
function AttributeUtil.prototype.____constructor(self)
end
function AttributeUtil.getAttributeInfo(self, attribute)
    local info = ""
    local keys = {}
    for key in pairs(attribute) do
        do
            if type(attribute[key]) ~= "number" then
                goto __continue4
            end
            keys[#keys + 1] = key
        end
        ::__continue4::
    end
    __TS__ArraySort(
        keys,
        function(____, k1, k2)
            local ____opt_0 = ____exports.default.keyInfos[k1]
            local k1i = ____opt_0 and ____opt_0.index or 1000000
            local ____opt_2 = ____exports.default.keyInfos[k2]
            local k2i = ____opt_2 and ____opt_2.index or 1000000
            return k1i - k2i
        end
    )
    for ____, key in ipairs(keys) do
        local name = key
        local val = attribute[key]
        local keyInfo = ____exports.default.keyInfos[key]
        if keyInfo then
            name = keyInfo.name
            if keyInfo.isPercentage then
                val = TextUtil:toPercentage(val)
            end
        end
        info = info .. ((name .. " + ") .. tostring(val)) .. "|n"
    end
    return info
end
function AttributeUtil.getUnitAttribute(self, unitHandle, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    if isDebug and createDefault and not UnitUtil.isHero(unitHandle) then
        if not UnitAlive(unitHandle) or not HandleUtil:isUnitHandle(unitHandle) then
            log.errorWithTraceBack(("警告：你正在给一个死亡的单位创建属性: " .. GetUnitName(unitHandle)) .. " 如果只是查询数据请将createDefault参数传false")
        end
    end
    local solarData = db:getUnitSolarData(unitHandle, createDefault)
    if createDefault and not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    return solarData and solarData._SL_solarAttribute
end
function AttributeUtil.getUnitTypeAttribute(self, unitTypeId, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    local solarData = db:getUnitTypeSolarData(unitTypeId, createDefault)
    if createDefault and not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    return solarData and solarData._SL_solarAttribute
end
function AttributeUtil.addUnitAttribute(self, unitHandle, addAttribute)
    if not addAttribute then
        return
    end
    local baseAttribute = ____exports.default:getUnitAttribute(unitHandle, true)
    for key in pairs(addAttribute) do
        if type(addAttribute[key]) == "number" then
            baseAttribute[key] = (baseAttribute[key] or 0) + addAttribute[key]
        elseif baseAttribute[key] == nil then
            baseAttribute[key] = addAttribute[key]
        else
            print("未覆盖单位旧属性值:" .. key)
        end
    end
end
function AttributeUtil.getItemAttribute(self, itemHandle, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    local solarData = db:getItemSolarData(itemHandle, createDefault)
    if createDefault and not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    return solarData and solarData._SL_solarAttribute
end
function AttributeUtil.getItemTypeAttribute(self, itemTypeId, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    local solarData = db:getItemTypeSolarData(itemTypeId, createDefault)
    if createDefault and not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    return solarData and solarData._SL_solarAttribute
end
function AttributeUtil.setItemTypeAttribute(self, itemTypeId, attribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local solarData = db:getItemTypeSolarData(itemTypeId)
    local oldAttribute = solarData._SL_solarAttribute
    if oldAttribute and not allowCover then
        log.errorWithTraceBack("此物品类型已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" .. itemTypeId)
        return oldAttribute
    end
    solarData._SL_solarAttribute = attribute
    return oldAttribute
end
function AttributeUtil.getPlayerAttribute(self, playerHandle, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    local solarData = db:getPlayerSolarData(playerHandle, createDefault)
    if createDefault and not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    return solarData and solarData._SL_solarAttribute
end
function AttributeUtil.addPlayerAttribute(self, playerHandle, addAttribute)
    if not addAttribute then
        return
    end
    local basePlayerAttribute = ____exports.default:getPlayerAttribute(playerHandle, true)
    for key in pairs(addAttribute) do
        if type(addAttribute[key]) == "number" then
            basePlayerAttribute[key] = (basePlayerAttribute[key] or 0) + addAttribute[key]
        elseif basePlayerAttribute[key] == nil then
            basePlayerAttribute[key] = addAttribute[key]
        else
            print("未覆盖玩家旧属性值:" .. key)
        end
    end
end
function AttributeUtil.setPlayerAttribute(self, playerHandle, attribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local solarData = db:getPlayerSolarData(playerHandle)
    local oldAttribute = solarData._SL_solarAttribute
    if oldAttribute and not allowCover then
        log.errorWithTraceBack("此玩家已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" .. tostring(GetPlayerId(playerHandle)))
        return oldAttribute
    end
    solarData._SL_solarAttribute = attribute
    return oldAttribute
end
function AttributeUtil.setUnitAttribute(self, unitHandle, attribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local unitSolarData = db:getUnitSolarData(unitHandle)
    local oldAttribute = unitSolarData._SL_solarAttribute
    if oldAttribute and not allowCover then
        log.errorWithTraceBack("此单位已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" .. GetUnitName(unitHandle))
        return oldAttribute
    end
    unitSolarData._SL_solarAttribute = attribute
    return oldAttribute
end
function AttributeUtil.setUnitTypeAttribute(self, unitTypeId, attribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local solarData = db:getUnitTypeSolarData(unitTypeId, true)
    local oldAttribute = solarData._SL_solarAttribute
    if oldAttribute and not allowCover then
        log.errorWithTraceBack("此单位已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" .. unitTypeId)
        return oldAttribute
    end
    solarData._SL_solarAttribute = attribute
    return oldAttribute
end
function AttributeUtil.setItemAttribute(self, itemHandle, attribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local solarData = db:getItemSolarData(itemHandle)
    local oldAttribute = solarData._SL_solarAttribute
    if oldAttribute and not allowCover then
        log.errorWithTraceBack("此物品已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" .. GetItemName(itemHandle))
        return oldAttribute
    end
    solarData._SL_solarAttribute = attribute
    return oldAttribute
end
function AttributeUtil.forAllUnitsAttribute(self, callback)
    DataBase:forUnitSolarDatas(function(____, u, solarData)
        local solarAttribute = solarData and solarData._SL_solarAttribute
        if solarAttribute then
            callback(nil, u, solarAttribute)
        end
    end)
end
function AttributeUtil.forAllPlayerAttribute(self, callback, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    PlayerUtil:forPlayingPlayers(function(____, player)
        local playerAttribute = ____exports.default:getPlayerAttribute(player, createDefault)
        if playerAttribute then
            callback(nil, player, playerAttribute)
        end
    end)
end
function AttributeUtil.sumAttributes(self, attributes)
    local result = {}
    if attributes == nil then
        return result
    end
    for ____, attribute in ipairs(attributes) do
        for key in pairs(attribute) do
            do
                if type(attribute[key]) ~= "number" then
                    goto __continue57
                end
                if not result[key] then
                    result[key] = 0
                end
                result[key] = result[key] + attribute[key]
            end
            ::__continue57::
        end
    end
    return result
end
function AttributeUtil.add(self, attribute, _attribute)
    if not _attribute then
        return
    end
    for key in pairs(_attribute) do
        if type(_attribute[key]) == "number" then
            attribute[key] = (attribute[key] or 0) + _attribute[key]
        end
    end
end
function AttributeUtil.subtract(self, attribute, _attribute)
    if not _attribute then
        return
    end
    for key in pairs(_attribute) do
        if type(_attribute[key]) == "number" then
            attribute[key] = (attribute[key] or 0) - _attribute[key]
        end
    end
end
function AttributeUtil.multiply(self, attribute, scale, store)
    if not attribute then
        return
    end
    if scale == 0 then
        return {}
    end
    if store == nil then
        store = {}
    end
    for key in pairs(attribute) do
        if type(attribute[key]) == "number" then
            store[key] = (attribute[key] or 0) * scale
        end
    end
    return store
end
function AttributeUtil.isEquals(self, attribute, otherAttribute)
    if attribute == otherAttribute then
        return true
    end
    if attribute == nil or otherAttribute == nil then
        return false
    end
    local keys1 = __TS__ObjectKeys(attribute)
    local keys2 = __TS__ObjectKeys(otherAttribute)
    if #keys1 ~= #keys2 then
        return false
    end
    for ____, key in ipairs(keys1) do
        if attribute[key] ~= otherAttribute[key] then
            return false
        end
    end
    return true
end
function AttributeUtil.getAbilityCDP(self, unitHandle, abilityIdStr)
    local attribute = ____exports.default:getUnitAttribute(unitHandle, false)
    return attribute and attribute["ability_cd_p_" .. abilityIdStr] or 0
end
function AttributeUtil.setAbilityCDP(self, unitHandle, abilityIdStr, val)
    local attribute = ____exports.default:getUnitAttribute(unitHandle, true)
    attribute["ability_cd_p_" .. abilityIdStr] = val
end
function AttributeUtil.addAbilityCDP(self, unitHandle, abilityIdStr, val)
    local attribute = ____exports.default:getUnitAttribute(unitHandle, true)
    local key = "ability_cd_p_" .. abilityIdStr
    attribute[key] = (attribute[key] or 0) + val
end
function AttributeUtil.getAbilityCD(self, unitHandle, abilityIdStr)
    local attribute = ____exports.default:getUnitAttribute(unitHandle, false)
    return attribute and attribute["ability_cd_" .. abilityIdStr] or 0
end
function AttributeUtil.setAbilityCD(self, unitHandle, abilityIdStr, val)
    local attribute = ____exports.default:getUnitAttribute(unitHandle, true)
    attribute["ability_cd_" .. abilityIdStr] = val
end
function AttributeUtil.addAbilityCD(self, unitHandle, abilityIdStr, val)
    local attribute = ____exports.default:getUnitAttribute(unitHandle, true)
    local key = "ability_cd_" .. abilityIdStr
    attribute[key] = (attribute[key] or 0) + val
end
AttributeUtil.keyInfos = {
    attack = {name = "攻击", index = 1, isPercentage = false},
    attack_p = {name = "攻击增幅", index = 2, isPercentage = true},
    life = {name = "生命", index = 3, isPercentage = false},
    life_p = {name = "生命增幅", index = 4, isPercentage = true},
    mana = {name = "魔法", index = 5, isPercentage = false},
    mana_p = {name = "魔法增幅", index = 6, isPercentage = true},
    miss_p = {name = "闪避几率", index = 7, isPercentage = true},
    def = {name = "护甲", index = 8, isPercentage = false},
    def_p = {name = "护甲增幅", index = 9, isPercentage = true},
    def_pierce = {name = "护甲穿透", index = 10, isPercentage = false},
    def_pierce_p = {name = "护甲穿透比例", index = 11, isPercentage = true},
    full_property = {name = "全属性", index = 12, isPercentage = false},
    full_property_p = {name = "全属性增幅", index = 13, isPercentage = true},
    strength = {name = "力量", index = 14, isPercentage = false},
    strength_p = {name = "力量增幅", index = 15, isPercentage = true},
    agility = {name = "敏捷", index = 16, isPercentage = false},
    agility_p = {name = "敏捷增幅", index = 17, isPercentage = true},
    intelligence = {name = "智力", index = 18, isPercentage = false},
    intelligence_p = {name = "智力增幅", index = 19, isPercentage = true},
    attackSpd_p = {name = "攻击速度", index = 20, isPercentage = true},
    move_speed = {name = "移动速度", index = 21, isPercentage = false},
    damage_cool = {name = "攻击间隔", index = 22, isPercentage = false},
    damage_range = {name = "攻击范围", index = 23, isPercentage = false},
    attack_damage_increased = {name = "攻击增伤", index = 24, isPercentage = true},
    physical_damage_increased = {name = "物理增伤", index = 25, isPercentage = true},
    physical_damage_reduction = {name = "物理抗性", index = 26, isPercentage = true},
    magic_damage_increased = {name = "法术增伤", index = 27, isPercentage = true},
    physical_critical_chance = {name = "物理暴击几率", index = 28, isPercentage = true},
    physical_critical_damage = {name = "物理暴击伤害", index = 29, isPercentage = true},
    magic_power = {name = "法术强度", index = 30, isPercentage = false},
    magic_damage_reduction = {name = "法术抗性", index = 31, isPercentage = true},
    magic_critical_chance = {name = "法术暴击几率", index = 32, isPercentage = true},
    magic_critical_damage = {name = "法术暴击伤害", index = 33, isPercentage = true},
    damage_increased = {name = "全伤害增幅", index = 34, isPercentage = true},
    damage_reduction = {name = "|cff00ff00伤害减免|r", index = 35, isPercentage = true},
    blood_sucking = {name = "|cffff0000伤害吸血|r", index = 36, isPercentage = true},
    split_damage_range = {name = "分裂范围", index = 37, isPercentage = false},
    split_damage = {name = "分裂伤害", index = 38, isPercentage = true}
}
return ____exports
