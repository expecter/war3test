local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 8,["12"] = 9,["13"] = 10,["15"] = 12,["16"] = 8,["17"] = 19,["18"] = 20,["19"] = 19,["20"] = 28,["21"] = 28,["22"] = 28,["24"] = 29,["25"] = 30,["26"] = 30,["27"] = 30,["28"] = 30,["29"] = 31,["30"] = 28,["31"] = 36,["32"] = 37,["33"] = 38,["34"] = 36,["35"] = 42,["36"] = 43,["37"] = 43,["39"] = 44,["40"] = 45,["41"] = 46,["42"] = 47,["43"] = 48,["44"] = 49,["46"] = 51,["48"] = 42,["49"] = 56,["50"] = 57,["51"] = 58,["52"] = 59,["53"] = 60,["54"] = 61,["55"] = 62,["57"] = 64,["58"] = 56,["59"] = 68,["60"] = 69,["61"] = 70,["62"] = 71,["63"] = 68,["64"] = 94,["65"] = 95,["66"] = 94});
local ____exports = {}
____exports.default = __TS__Class()
local StringUtil = ____exports.default
StringUtil.name = "StringUtil"
function StringUtil.prototype.____constructor(self)
end
function StringUtil.isEmpty(self, str)
    if str == nil or str == "" then
        return true
    end
    return false
end
function StringUtil.notEmpty(self, str)
    return not ____exports.default:isEmpty(str)
end
function StringUtil.prototype.toFixed(self, num, fractionDigits)
    if fractionDigits == nil then
        fractionDigits = 2
    end
    local stringTs = string
    local lm = stringTs.format(
        ("%." .. tostring(fractionDigits)) .. "f",
        num
    )
    return lm
end
function StringUtil.getBytes(self, char)
    local code = string.byte(char)
    return ____exports.default:getBytesByCode(code)
end
function StringUtil.getBytesByCode(self, code)
    if not code then
        return 0
    end
    if code > 240 then
        return 4
    elseif code > 225 then
        return 3
    elseif code > 192 then
        return 2
    else
        return 1
    end
end
function StringUtil.getLength(self, str)
    local length = 0
    local currentIndex = 1
    while currentIndex <= #str do
        local code = string.byte(str, currentIndex)
        currentIndex = currentIndex + ____exports.default:getBytesByCode(code)
        length = length + 1
    end
    return length
end
function StringUtil.subString(self, str, start, ____end)
    local start_byte = utf8.offset(str, start + 1)
    local end_byte = utf8.offset(str, ____end + 1) - 1
    return string.sub(str, start_byte, end_byte)
end
function StringUtil.getCharAtIndex(self, str, index)
    return ____exports.default:subString(str, index, index)
end
return ____exports
