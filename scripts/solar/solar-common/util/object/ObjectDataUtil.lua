local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 5,["10"] = 5,["11"] = 5,["13"] = 5,["14"] = 11,["15"] = 12,["16"] = 13,["18"] = 16,["19"] = 17,["20"] = 18,["22"] = 19,["23"] = 20,["25"] = 22,["26"] = 23,["27"] = 24,["32"] = 27,["33"] = 11,["34"] = 35,["35"] = 36,["36"] = 37,["37"] = 35,["38"] = 44,["39"] = 45,["40"] = 44,["41"] = 52,["42"] = 53,["43"] = 52,["44"] = 60,["45"] = 61,["46"] = 60,["47"] = 68,["48"] = 69,["49"] = 68,["50"] = 76,["51"] = 77,["52"] = 76,["53"] = 84,["54"] = 85,["55"] = 84,["56"] = 92,["57"] = 93,["58"] = 92,["59"] = 100,["60"] = 101,["61"] = 100,["62"] = 108,["63"] = 109,["64"] = 108,["65"] = 117,["66"] = 117,["67"] = 117,["69"] = 118,["70"] = 119,["71"] = 120,["73"] = 122,["74"] = 117,["75"] = 129,["76"] = 130,["77"] = 129,["78"] = 138,["79"] = 139,["80"] = 138,["81"] = 147,["82"] = 148,["83"] = 149,["84"] = 147,["85"] = 157,["86"] = 158,["87"] = 157,["88"] = 165,["89"] = 166,["90"] = 165,["91"] = 173,["92"] = 174,["93"] = 173,["94"] = 182,["95"] = 183,["96"] = 184,["97"] = 182,["98"] = 192,["99"] = 193,["100"] = 194,["101"] = 192,["102"] = 201,["103"] = 202,["104"] = 203,["105"] = 204,["106"] = 204,["107"] = 204,["108"] = 204,["109"] = 201,["110"] = 212,["111"] = 213,["112"] = 212,["113"] = 220,["114"] = 221,["115"] = 220,["116"] = 228,["117"] = 229,["118"] = 228,["119"] = 237,["120"] = 238,["121"] = 239,["122"] = 240,["123"] = 241,["125"] = 243,["126"] = 237,["127"] = 251,["128"] = 252,["129"] = 253,["131"] = 255,["132"] = 256,["133"] = 257,["134"] = 258,["136"] = 260,["137"] = 261,["138"] = 262,["139"] = 263,["141"] = 265,["142"] = 266,["143"] = 267,["145"] = 269,["146"] = 251});
local ____exports = {}
____exports.default = __TS__Class()
local ObjectDataUtil = ____exports.default
ObjectDataUtil.name = "ObjectDataUtil"
function ObjectDataUtil.prototype.____constructor(self)
end
function ObjectDataUtil.idsStr2idsArray(self, idsStr)
    if idsStr == nil or #idsStr < 4 then
        return {}
    end
    local result = {}
    local idsTemp = __TS__StringSplit(idsStr, ",")
    for ____, id in ipairs(idsTemp) do
        do
            if id == nil then
                goto __continue5
            end
            id = __TS__StringTrim(id)
            if #id == 4 then
                result[#result + 1] = id
            end
        end
        ::__continue5::
    end
    return result
end
function ObjectDataUtil.getUnitResearches(self, objIdStr)
    local idsStr = ____exports.default:getUnitDataString(objIdStr, "Researches")
    return ____exports.default:idsStr2idsArray(idsStr)
end
function ObjectDataUtil.getUnitGoldCost(self, objIdStr)
    return ____exports.default:getUnitDataNumber(objIdStr, "goldcost")
end
function ObjectDataUtil.getUnitHP(self, objIdStr)
    return ____exports.default:getUnitDataNumber(objIdStr, "HP")
end
function ObjectDataUtil.getUnitDef(self, objIdStr)
    return ____exports.default:getUnitDataNumber(objIdStr, "def")
end
function ObjectDataUtil.getUnitDmgplus1(self, objIdStr)
    return ____exports.default:getUnitDataNumber(objIdStr, "dmgplus1")
end
function ObjectDataUtil.getUnitName(self, objIdStr)
    return ____exports.default:getUnitDataString(objIdStr, "Name")
end
function ObjectDataUtil.getUpgradeName(self, objIdStr)
    return ____exports.default:getUpgradeDataString(objIdStr, "Name")
end
function ObjectDataUtil.getUnitTip(self, objIdStr)
    return ____exports.default:getUnitDataString(objIdStr, "Tip")
end
function ObjectDataUtil.getUnitArt(self, objIdStr)
    return ____exports.default:getUnitDataString(objIdStr, "Art")
end
function ObjectDataUtil.getUnitMissileart(self, objIdStr)
    return ____exports.default:getUnitDataString(objIdStr, "Missileart")
end
function ObjectDataUtil.getUnitFile(self, objIdStr, format2StandardModelPath)
    if format2StandardModelPath == nil then
        format2StandardModelPath = false
    end
    local result = ____exports.default:getUnitDataString(objIdStr, "file")
    if result and format2StandardModelPath then
        result = ____exports.default:getStandardModelPath(result)
    end
    return result
end
function ObjectDataUtil.getUnitUbertip(self, objIdStr)
    return ____exports.default:getUnitDataString(objIdStr, "Ubertip")
end
function ObjectDataUtil.getUnitDataNumber(self, objIdStr, property)
    return tonumber(____exports.default:getUnitDataString(objIdStr, property))
end
function ObjectDataUtil.getUnitDataString(self, objIdStr, property)
    local obj = _g_objs.unit[objIdStr]
    return obj and obj[property]
end
function ObjectDataUtil.getItemDataNumber(self, objIdStr, property)
    return tonumber(____exports.default:getItemDataString(objIdStr, property))
end
function ObjectDataUtil.getItemAbilList(self, objIdStr)
    return ____exports.default:getItemDataString(objIdStr, "abilList")
end
function ObjectDataUtil.getItemName(self, objIdStr)
    return ____exports.default:getItemDataString(objIdStr, "Name")
end
function ObjectDataUtil.getItemDataString(self, objIdStr, property)
    local obj = _g_objs.item[objIdStr]
    return obj[tostring(property) .. "1"] or obj[property]
end
function ObjectDataUtil.getUpgradeDataString(self, objIdStr, property)
    local obj = _g_objs.upgrade[objIdStr]
    return obj[tostring(property) .. "1"] or obj[property]
end
function ObjectDataUtil.getAbilityBtnXY(self, objIdStr)
    local xyStr = ____exports.default:getAbilityDataString(objIdStr, "Buttonpos")
    local xyStrs = __TS__StringSplit(xyStr, ",")
    return {
        x = tonumber(xyStrs[1]),
        y = tonumber(xyStrs[2])
    }
end
function ObjectDataUtil.getAbilityDataNumber(self, objIdStr, property)
    return tonumber(____exports.default:getAbilityDataString(objIdStr, property))
end
function ObjectDataUtil.getAbilityName(self, objIdStr)
    return ____exports.default:getAbilityDataString(objIdStr, "Name")
end
function ObjectDataUtil.getAbilityArt(self, objIdStr)
    return ____exports.default:getAbilityDataString(objIdStr, "Art")
end
function ObjectDataUtil.getAbilityDataString(self, objIdStr, property)
    local obj = _g_objs.ability[objIdStr]
    if obj == nil then
        log.errorWithTraceBack("没有发现技能物编:" .. tostring(objIdStr))
        return nil
    end
    return obj[tostring(property) .. "1"] or obj[property]
end
function ObjectDataUtil.getStandardModelPath(self, path)
    if not path then
        return ""
    end
    local lenght = #path
    if lenght < 4 then
        path = path .. ".mdx"
        return path
    end
    local hsw = string.lower(__TS__StringSubstring(path, lenght - 4))
    if hsw == ".mdl" then
        path = __TS__StringSubstring(path, 0, lenght - 4) .. ".mdx"
        return path
    end
    if hsw ~= ".mdx" then
        path = path .. ".mdx"
        return path
    end
    return path
end
return ____exports
