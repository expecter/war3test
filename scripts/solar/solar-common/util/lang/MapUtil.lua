local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 8,["12"] = 9,["15"] = 12,["16"] = 13,["17"] = 14,["20"] = 8,["21"] = 23,["22"] = 24,["25"] = 27,["26"] = 28,["27"] = 29,["30"] = 23,["31"] = 38,["32"] = 39,["35"] = 42,["36"] = 43,["38"] = 45,["39"] = 46,["41"] = 48,["42"] = 49,["43"] = 50,["46"] = 53,["47"] = 38,["48"] = 60,["49"] = 61,["50"] = 62,["52"] = 64,["53"] = 65,["55"] = 67,["56"] = 68,["57"] = 69,["58"] = 70,["62"] = 74,["63"] = 60,["64"] = 82,["65"] = 82,["66"] = 82,["68"] = 83,["69"] = 84,["70"] = 85,["71"] = 86,["73"] = 88,["75"] = 90,["76"] = 82});
local ____exports = {}
____exports.default = __TS__Class()
local MapUtil = ____exports.default
MapUtil.name = "MapUtil"
function MapUtil.prototype.____constructor(self)
end
function MapUtil.addNumber(self, base, _addVal)
    if not _addVal then
        return
    end
    for key in pairs(_addVal) do
        if type(_addVal[key]) == "number" then
            base[key] = (base[key] or 0) + _addVal[key]
        end
    end
end
function MapUtil.subtractNumber(self, base, _subtractVal)
    if not _subtractVal then
        return
    end
    for key in pairs(_subtractVal) do
        if type(_subtractVal[key]) == "number" then
            base[key] = (base[key] or 0) - _subtractVal[key]
        end
    end
end
function MapUtil.multiply(self, base, scale, store)
    if not base then
        return
    end
    if scale == 0 then
        return {}
    end
    if store == nil then
        store = {}
    end
    for key in pairs(base) do
        if type(base[key]) == "number" then
            store[key] = (base[key] or 0) * scale
        end
    end
    return store
end
function MapUtil.hasEnoughNumber(self, base, conditionVal)
    if not conditionVal then
        return true
    end
    if base == nil then
        return false
    end
    for key in pairs(conditionVal) do
        if type(conditionVal[key]) == "number" then
            if (base[key] or 0) < conditionVal[key] then
                return false
            end
        end
    end
    return true
end
function MapUtil.map2String(self, map, separator)
    if separator == nil then
        separator = " "
    end
    local str = ""
    for mapKey in pairs(map) do
        if #str > 0 then
            str = str .. " "
        end
        str = ((str .. mapKey) .. separator) .. tostring(map[mapKey])
    end
    return str
end
return ____exports
