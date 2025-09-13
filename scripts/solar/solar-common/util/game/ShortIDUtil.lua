local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 9,["9"] = 9,["10"] = 9,["12"] = 9,["13"] = 19,["14"] = 20,["15"] = 21,["16"] = 19,["17"] = 28,["18"] = 29,["19"] = 30,["20"] = 31,["21"] = 32,["22"] = 33,["23"] = 34,["25"] = 36,["27"] = 39,["28"] = 28,["29"] = 46,["30"] = 47,["31"] = 46,["32"] = 11,["33"] = 12});
local ____exports = {}
local ____NumberUtil = require("solar.solar-common.util.math.NumberUtil")
local NumberUtil = ____NumberUtil.default
____exports.default = __TS__Class()
local ShortIDUtil = ____exports.default
ShortIDUtil.name = "ShortIDUtil"
function ShortIDUtil.prototype.____constructor(self)
end
function ShortIDUtil.calculateShortId(full_id)
    local stringHash = math.abs(StringHash(full_id))
    return NumberUtil.toUnsignedString(stringHash, 62)
end
function ShortIDUtil.fullId2shortId(full_id)
    local shortId = ____exports.default.fullIdShortIdMap[full_id]
    if shortId == nil then
        shortId = ____exports.default.calculateShortId(full_id)
        ____exports.default.fullIdShortIdMap[full_id] = shortId
        if ____exports.default.shortIdFullIdMap[shortId] then
            log.errorWithTraceBack((((("fullId2shortId映射冲突:[" .. ____exports.default.shortIdFullIdMap[shortId]) .. "]和[") .. full_id) .. "]都映射到短id:") .. shortId)
        end
        ____exports.default.shortIdFullIdMap[shortId] = full_id
    end
    return shortId
end
function ShortIDUtil.shortId2fullId(shortId)
    return ____exports.default.shortIdFullIdMap[shortId]
end
ShortIDUtil.shortIdFullIdMap = {}
ShortIDUtil.fullIdShortIdMap = {}
return ____exports
