local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 3,["13"] = 11,["14"] = 12,["15"] = 13,["16"] = 14,["17"] = 11,["18"] = 22,["19"] = 23,["20"] = 24,["21"] = 25,["22"] = 22,["23"] = 33,["24"] = 34,["25"] = 35,["26"] = 36,["27"] = 33,["28"] = 43,["29"] = 44,["30"] = 45,["31"] = 46,["32"] = 43,["33"] = 54,["34"] = 55,["35"] = 56,["36"] = 57,["37"] = 54,["38"] = 65,["39"] = 66,["40"] = 67,["41"] = 65,["42"] = 75,["43"] = 76,["44"] = 77,["45"] = 75,["46"] = 85,["47"] = 86,["48"] = 87,["49"] = 85});
local ____exports = {}
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
____exports.default = __TS__Class()
local UnitTypeUtil = ____exports.default
UnitTypeUtil.name = "UnitTypeUtil"
function UnitTypeUtil.prototype.____constructor(self)
end
function UnitTypeUtil.setUnitTypeName(self, idOrIdStr, value)
    local uid = LangUtil:getIntId(idOrIdStr)
    EXSetUnitArrayString(uid, 10, 0, value)
    EXSetUnitInteger(uid, 10, 1)
end
function UnitTypeUtil.setHeroTypeProperName(self, idOrIdStr, value)
    local uid = LangUtil:getIntId(idOrIdStr)
    EXSetUnitArrayString(uid, 61, 0, value)
    EXSetUnitInteger(uid, 61, 1)
end
function UnitTypeUtil.setUnitIcon(self, idOrIdStr, value)
    local uid = LangUtil:getIntId(idOrIdStr)
    EXSetUnitArrayString(uid, 146, 0, value)
    EXSetUnitInteger(uid, 146, 1)
end
function UnitTypeUtil.setUnitTypeTip(self, idOrIdStr, value)
    local uid = LangUtil:getIntId(idOrIdStr)
    EXSetUnitArrayString(uid, 151, 0, value)
    EXSetUnitInteger(uid, 151, 1)
end
function UnitTypeUtil.setUnitTypeUbertip(self, idOrIdStr, value)
    local uid = LangUtil:getIntId(idOrIdStr)
    EXSetUnitArrayString(uid, 154, 0, value)
    EXSetUnitInteger(uid, 154, 1)
end
function UnitTypeUtil.setUnitTypeModel(self, idOrIdStr, value)
    local uid = LangUtil:getIntId(idOrIdStr)
    EXSetUnitString(uid, 13, value)
end
function UnitTypeUtil.setUnitTypePortraitModel(self, idOrIdStr, value)
    local uid = LangUtil:getIntId(idOrIdStr)
    EXSetUnitString(uid, 14, value)
end
function UnitTypeUtil.setUnitTypeModelScale(self, idOrIdStr, value)
    local uid = LangUtil:getIntId(idOrIdStr)
    EXSetUnitReal(uid, 44, value)
end
return ____exports
