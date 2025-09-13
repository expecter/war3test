local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 4,["9"] = 4,["10"] = 4,["12"] = 4,["13"] = 7,["14"] = 8,["15"] = 9,["17"] = 11,["18"] = 7,["19"] = 14,["20"] = 15,["21"] = 16,["23"] = 18,["24"] = 14,["25"] = 25,["26"] = 26,["27"] = 27,["29"] = 25,["30"] = 35,["31"] = 36,["32"] = 37,["34"] = 35,["35"] = 45,["36"] = 46,["37"] = 47,["39"] = 45,["40"] = 56,["41"] = 57,["42"] = 58,["44"] = 56,["45"] = 66,["46"] = 67,["47"] = 68,["49"] = 66,["50"] = 75,["51"] = 76,["52"] = 77,["54"] = 79,["55"] = 75,["56"] = 85,["57"] = 86,["58"] = 87,["59"] = 88,["61"] = 90,["62"] = 85,["63"] = 96,["64"] = 97,["65"] = 98,["66"] = 99,["67"] = 100,["70"] = 103,["71"] = 96,["72"] = 124,["73"] = 125,["74"] = 126,["75"] = 127,["76"] = 128,["79"] = 131,["80"] = 124,["81"] = 139,["82"] = 140,["83"] = 141,["85"] = 139,["86"] = 151,["87"] = 152,["88"] = 153,["89"] = 154,["91"] = 156,["92"] = 157,["93"] = 158,["95"] = 151,["96"] = 168,["97"] = 168,["98"] = 168,["100"] = 170,["101"] = 171,["102"] = 171,["103"] = 171,["104"] = 171,["105"] = 168});
local ____exports = {}
____exports.default = __TS__Class()
local LangUtil = ____exports.default
LangUtil.name = "LangUtil"
function LangUtil.prototype.____constructor(self)
end
function LangUtil.getIntId(self, id)
    if id and type(id) == "string" then
        id = FourCC(id)
    end
    return id
end
function LangUtil.getStringId(self, id)
    if id and type(id) == "string" then
        return id
    end
    return id2string(id)
end
function LangUtil.isNumber(self, obj)
    if type(obj) == "number" then
        return true
    end
end
function LangUtil.isString(self, obj)
    if type(obj) == "string" then
        return true
    end
end
function LangUtil.isBoolean(self, obj)
    if type(obj) == "boolean" then
        return true
    end
end
function LangUtil.isFunction(self, obj)
    if type(obj) == "function" then
        return true
    end
end
function LangUtil.isObject(self, obj)
    if type(obj) == "table" then
        return true
    end
end
function LangUtil.isEmptyObject(self, obj)
    for i in pairs(obj) do
        return false
    end
    return true
end
function LangUtil.getObjectKeyCount(self, obj)
    local count = 0
    for i in pairs(obj) do
        count = count + 1
    end
    return count
end
function LangUtil.clearObject(self, obj)
    if obj then
        for k in pairs(obj) do
            obj[k] = nil
            __TS__Delete(obj, k)
        end
    end
    return true
end
function LangUtil.removeSetElement(self, set, ele)
    for key in pairs(set) do
        if set[key] == ele then
            deleteKey(set, key)
            return true
        end
    end
    return false
end
function LangUtil.forEach(self, set, callback)
    for key in pairs(set) do
        callback(nil, key, set[key])
    end
end
function LangUtil.forEachSort(self, set, callback, compareFn)
    local keys = {}
    for key in pairs(set) do
        keys[#keys + 1] = key
    end
    __TS__ArraySort(keys, compareFn)
    for ____, key in ipairs(keys) do
        callback(nil, key, set[key])
    end
end
function LangUtil.toFixed(self, num, fractionDigits)
    if fractionDigits == nil then
        fractionDigits = 3
    end
    local stringTs = string
    return stringTs.format(
        ("%." .. tostring(fractionDigits)) .. "f",
        num
    )
end
return ____exports
