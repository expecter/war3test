local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Number = ____lualib.__TS__Number
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 3,["11"] = 3,["12"] = 8,["13"] = 9,["14"] = 8,["15"] = 16,["16"] = 17,["17"] = 18,["18"] = 19,["19"] = 16,["20"] = 26,["21"] = 27,["22"] = 28,["23"] = 29,["24"] = 30,["25"] = 30,["26"] = 30,["28"] = 30,["29"] = 26,["30"] = 38,["31"] = 39,["32"] = 40,["33"] = 41,["34"] = 41,["35"] = 41,["36"] = 41,["37"] = 41,["38"] = 38,["39"] = 59,["40"] = 59,["41"] = 59,["43"] = 59,["44"] = 59,["46"] = 60,["47"] = 61,["48"] = 62,["49"] = 63,["51"] = 65,["53"] = 67,["54"] = 68,["55"] = 69,["56"] = 70,["58"] = 72,["60"] = 74,["61"] = 75,["62"] = 76,["63"] = 77,["65"] = 79,["67"] = 59,["68"] = 101,["69"] = 101,["70"] = 101,["72"] = 101,["73"] = 101,["75"] = 102,["76"] = 103,["77"] = 104,["78"] = 105,["80"] = 107,["82"] = 109,["83"] = 110,["84"] = 111,["85"] = 112,["87"] = 114,["89"] = 116,["90"] = 117,["91"] = 118,["92"] = 119,["94"] = 121,["96"] = 101,["97"] = 133,["98"] = 134,["99"] = 135,["100"] = 136,["101"] = 137,["103"] = 139,["104"] = 139,["105"] = 139,["106"] = 139,["107"] = 139,["108"] = 140,["109"] = 140,["110"] = 140,["111"] = 140,["112"] = 140,["113"] = 141,["114"] = 141,["115"] = 141,["116"] = 141,["117"] = 141,["119"] = 133,["120"] = 152,["121"] = 154,["122"] = 155,["123"] = 156,["124"] = 157,["126"] = 159,["127"] = 160,["128"] = 161,["129"] = 162,["130"] = 163,["132"] = 165,["133"] = 166,["134"] = 167,["135"] = 168,["136"] = 169,["138"] = 171,["140"] = 152,["141"] = 180,["142"] = 181,["143"] = 182,["144"] = 183,["146"] = 185,["147"] = 180,["148"] = 193,["149"] = 194,["150"] = 195,["151"] = 196,["153"] = 198,["154"] = 193,["155"] = 206,["156"] = 207,["157"] = 208,["158"] = 209,["160"] = 211,["161"] = 206,["162"] = 218,["163"] = 218,["164"] = 218,["166"] = 219,["167"] = 220,["168"] = 221,["169"] = 222,["170"] = 223,["171"] = 224,["172"] = 225,["174"] = 227,["175"] = 218,["176"] = 234,["177"] = 235,["178"] = 236,["179"] = 237,["180"] = 234,["181"] = 244,["182"] = 245,["183"] = 246,["184"] = 247,["185"] = 248,["186"] = 249,["187"] = 250,["188"] = 251,["190"] = 253,["191"] = 244,["192"] = 261,["193"] = 261,["194"] = 261,["196"] = 262,["197"] = 263,["198"] = 264,["199"] = 265,["200"] = 261,["201"] = 275,["202"] = 275,["203"] = 275,["205"] = 275,["206"] = 275,["208"] = 275,["209"] = 275,["211"] = 276,["212"] = 277,["213"] = 278,["215"] = 280,["216"] = 281,["218"] = 283,["219"] = 284,["221"] = 286,["222"] = 275});
local ____exports = {}
____exports.default = __TS__Class()
local HeroUtil = ____exports.default
HeroUtil.name = "HeroUtil"
function HeroUtil.prototype.____constructor(self)
end
function HeroUtil.isHero(self, handle)
    return IsHeroUnitId(GetUnitTypeId(handle))
end
function HeroUtil.getHeroPrimary(self, handle)
    local objIdStr = id2string(GetUnitTypeId(handle))
    local obj = _g_objs.unit[objIdStr]
    return obj.Primary
end
function HeroUtil.getHeroPrimaryPlus(self, handle)
    local objIdStr = id2string(GetUnitTypeId(handle))
    local obj = _g_objs.unit[objIdStr]
    local primaryPlus = obj[obj.Primary .. "plus"]
    local ____primaryPlus_0 = primaryPlus
    if ____primaryPlus_0 == nil then
        ____primaryPlus_0 = "0"
    end
    return __TS__Number(____primaryPlus_0)
end
function HeroUtil.getHeroPlus(self, handle)
    local objIdStr = id2string(GetUnitTypeId(handle))
    local obj = _g_objs.unit[objIdStr]
    return {
        __TS__Number(obj.STRplus),
        __TS__Number(obj.AGIplus),
        __TS__Number(obj.INTplus)
    }
end
function HeroUtil.addHeroProperty(self, handle, addStr, addAgi, addInt)
    if addAgi == nil then
        addAgi = addStr
    end
    if addInt == nil then
        addInt = addStr
    end
    if addStr ~= 0 then
        local newVal = GetHeroStr(handle, false) + addStr
        if not isBigAttributeMode then
            newVal = math.min(newVal, 2100000000)
        end
        SetHeroStr(handle, newVal, true)
    end
    if addAgi ~= 0 then
        local newVal = GetHeroAgi(handle, false) + addAgi
        if not isBigAttributeMode then
            newVal = math.min(newVal, 2100000000)
        end
        SetHeroAgi(handle, newVal, true)
    end
    if addInt ~= 0 then
        local newVal = GetHeroInt(handle, false) + addInt
        if not isBigAttributeMode then
            newVal = math.min(newVal, 2100000000)
        end
        SetHeroInt(handle, newVal, true)
    end
end
function HeroUtil.addHeroPropertyP(self, handle, includeBonuses, addStrP, addAgiP, addIntP)
    if addAgiP == nil then
        addAgiP = addStrP
    end
    if addIntP == nil then
        addIntP = addStrP
    end
    if addStrP ~= 0 then
        local newVal = GetHeroStr(handle, includeBonuses) * (1 + addStrP)
        if not isBigAttributeMode then
            newVal = math.min(newVal, 2100000000)
        end
        SetHeroStr(handle, newVal, true)
    end
    if addAgiP ~= 0 then
        local newVal = GetHeroAgi(handle, includeBonuses) * (1 + addAgiP)
        if not isBigAttributeMode then
            newVal = math.min(newVal, 2100000000)
        end
        SetHeroAgi(handle, newVal, true)
    end
    if addIntP ~= 0 then
        local newVal = GetHeroInt(handle, includeBonuses) * (1 + addIntP)
        if not isBigAttributeMode then
            newVal = math.min(newVal, 2100000000)
        end
        SetHeroInt(handle, newVal, true)
    end
end
function HeroUtil.setHeroProperty(self, handle, newStr, newAgi, newInt)
    if isBigAttributeMode then
        SetHeroStr(handle, newStr, true)
        SetHeroAgi(handle, newAgi, true)
        SetHeroInt(handle, newInt, true)
    else
        SetHeroStr(
            handle,
            math.min(newStr, 2100000000),
            true
        )
        SetHeroAgi(
            handle,
            math.min(newAgi, 2100000000),
            true
        )
        SetHeroInt(
            handle,
            math.min(newInt, 2100000000),
            true
        )
    end
end
function HeroUtil.addHeroPropertyByKey(self, handle, key, addVal)
    if key == "STR" then
        local newVal = GetHeroStr(handle, false) + addVal
        if not isBigAttributeMode then
            newVal = math.min(newVal, 2100000000)
        end
        SetHeroStr(handle, newVal, true)
    elseif key == "AGI" then
        local newVal = GetHeroAgi(handle, false) + addVal
        if not isBigAttributeMode then
            newVal = math.min(newVal, 2100000000)
        end
        SetHeroAgi(handle, newVal, true)
    elseif key == "INT" then
        local newVal = GetHeroInt(handle, false) + addVal
        if not isBigAttributeMode then
            newVal = math.min(newVal, 2100000000)
        end
        SetHeroInt(handle, newVal, true)
    end
end
function HeroUtil.addStr(self, handle, addVal)
    local newVal = GetHeroStr(handle, false) + addVal
    if not isBigAttributeMode then
        newVal = math.min(newVal, 2100000000)
    end
    SetHeroStr(handle, newVal, true)
end
function HeroUtil.addAgi(self, handle, addVal)
    local newVal = GetHeroAgi(handle, false) + addVal
    if not isBigAttributeMode then
        newVal = math.min(newVal, 2100000000)
    end
    SetHeroAgi(handle, newVal, true)
end
function HeroUtil.addInt(self, handle, addVal)
    local newVal = GetHeroInt(handle, false) + addVal
    if not isBigAttributeMode then
        newVal = math.min(newVal, 2100000000)
    end
    SetHeroInt(handle, newVal, true)
end
function HeroUtil.getHeroPrimaryValue(self, handle, includeBonuses)
    if includeBonuses == nil then
        includeBonuses = true
    end
    local Primary = ____exports.default:getHeroPrimary(handle)
    if Primary == "STR" then
        return GetHeroStr(handle, includeBonuses)
    elseif Primary == "AGI" then
        return GetHeroAgi(handle, includeBonuses)
    elseif Primary == "INT" then
        return GetHeroInt(handle, includeBonuses)
    end
    return 0
end
function HeroUtil.addHeroPrimary(self, handle, addVal)
    local Primary = ____exports.default:getHeroPrimary(handle)
    ____exports.default:addHeroPropertyByKey(handle, Primary, addVal)
    return 0
end
function HeroUtil.getHeroPrimaryBonusValue(self, handle)
    local Primary = ____exports.default:getHeroPrimary(handle)
    if Primary == "STR" then
        return GetHeroStr(handle, true) - GetHeroStr(handle, false)
    elseif Primary == "AGI" then
        return GetHeroAgi(handle, true) - GetHeroAgi(handle, false)
    elseif Primary == "INT" then
        return GetHeroInt(handle, true) - GetHeroInt(handle, false)
    end
    return 0
end
function HeroUtil.getFullProperty(self, handle, includeBonuses)
    if includeBonuses == nil then
        includeBonuses = true
    end
    local fullProperty = GetHeroStr(handle, includeBonuses)
    fullProperty = fullProperty + GetHeroAgi(handle, includeBonuses)
    fullProperty = fullProperty + GetHeroInt(handle, includeBonuses)
    return fullProperty
end
function HeroUtil.getPropertyWithScale(self, handle, strScale, agiScale, intScale)
    if strScale == nil then
        strScale = 0
    end
    if agiScale == nil then
        agiScale = 0
    end
    if intScale == nil then
        intScale = 0
    end
    local fullProperty = 0
    if strScale ~= 0 then
        fullProperty = fullProperty + GetHeroStr(handle, true) * strScale
    end
    if agiScale ~= 0 then
        fullProperty = fullProperty + GetHeroAgi(handle, true) * agiScale
    end
    if intScale ~= 0 then
        fullProperty = fullProperty + GetHeroInt(handle, true) * intScale
    end
    return fullProperty
end
return ____exports
