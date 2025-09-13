local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 2,["10"] = 2,["11"] = 13,["12"] = 14,["13"] = 15,["14"] = 17,["15"] = 17,["16"] = 17,["17"] = 17,["18"] = 17,["19"] = 17,["20"] = 17,["21"] = 19,["22"] = 20,["23"] = 13,["24"] = 29,["25"] = 30,["26"] = 31,["27"] = 32,["29"] = 34,["30"] = 29,["31"] = 43,["32"] = 44,["33"] = 45,["34"] = 45,["35"] = 45,["36"] = 45,["37"] = 45,["38"] = 45,["39"] = 45,["40"] = 47,["41"] = 48,["42"] = 43,["43"] = 51,["44"] = 52,["45"] = 53,["47"] = 51,["48"] = 57,["49"] = 58,["50"] = 58,["51"] = 57,["52"] = 4});
local ____exports = {}
____exports.default = __TS__Class()
local DestructableUtil = ____exports.default
DestructableUtil.name = "DestructableUtil"
function DestructableUtil.prototype.____constructor(self)
end
function DestructableUtil.hasDestructableInRect(centerX, centerY, radius, destructableId)
    tempBoolean = false
    tempNumber = FourCC(destructableId)
    SetRect(
        tempRect,
        centerX - radius,
        centerY - radius,
        centerX + radius,
        centerY + radius
    )
    EnumDestructablesInRect(tempRect, nil, ____exports.default._HasDestructableInRectActionFunc)
    return tempBoolean
end
function DestructableUtil.getDestructableInRect(centerX, centerY, radius)
    ____exports.default.getDestructablesInRect(centerX, centerY, radius)
    if ____exports.default.lastDestructables and #____exports.default.lastDestructables > 0 then
        return ____exports.default.lastDestructables[1]
    end
    return nil
end
function DestructableUtil.getDestructablesInRect(centerX, centerY, radius)
    ____exports.default.lastDestructables = {}
    SetRect(
        tempRect,
        centerX - radius,
        centerY - radius,
        centerX + radius,
        centerY + radius
    )
    EnumDestructablesInRect(tempRect, nil, ____exports.default._GetDestructableInRectActionFunc)
    return ____exports.default.lastDestructables
end
function DestructableUtil._HasDestructableInRectActionFunc()
    if GetDestructableTypeId(GetEnumDestructable()) == tempNumber then
        tempBoolean = true
    end
end
function DestructableUtil._GetDestructableInRectActionFunc()
    local ____exports_default_lastDestructables_0 = ____exports.default.lastDestructables
    ____exports_default_lastDestructables_0[#____exports_default_lastDestructables_0 + 1] = GetEnumDestructable()
end
DestructableUtil.lastDestructables = {}
return ____exports
