local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__StringCharAt = ____lualib.__TS__StringCharAt
local __TS__StringAccess = ____lualib.__TS__StringAccess
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["15"] = 2,["16"] = 2,["17"] = 2,["19"] = 2,["20"] = 14,["21"] = 14,["22"] = 14,["24"] = 15,["26"] = 16,["30"] = 18,["31"] = 18,["33"] = 19,["34"] = 20,["35"] = 22,["36"] = 23,["37"] = 24,["39"] = 27,["40"] = 28,["42"] = 30,["43"] = 14,["44"] = 39,["45"] = 39,["46"] = 39,["48"] = 40,["50"] = 40,["54"] = 41,["56"] = 43,["57"] = 43,["58"] = 44,["59"] = 45,["60"] = 46,["62"] = 46,["66"] = 47,["67"] = 48,["68"] = 43,["71"] = 50,["72"] = 39,["73"] = 12});
local ____exports = {}
____exports.default = __TS__Class()
local NumberUtil = ____exports.default
NumberUtil.name = "NumberUtil"
function NumberUtil.prototype.____constructor(self)
end
function NumberUtil.toUnsignedString(n, radix)
    if radix == nil then
        radix = 62
    end
    if radix < 2 or radix > 94 then
        error(
            __TS__New(Error, "Base must be between 2 and 94"),
            0
        )
    end
    if n == 0 then
        return "0"
    end
    local result = ""
    local num = math.abs(n)
    while num > 0 do
        result = __TS__StringCharAt(____exports.default.digits, num % radix) .. result
        num = math.floor(num / radix)
    end
    if n < 0 then
        result = "-" .. result
    end
    return result
end
function NumberUtil.parseUnsignedString2Number(numStr, radix)
    if radix == nil then
        radix = 62
    end
    if radix < 2 or radix > 94 then
        error(
            __TS__New(Error, "Base must be between 2-94"),
            0
        )
    end
    local result = 0
    do
        local i = 0
        while i < #numStr do
            local char = __TS__StringAccess(numStr, i)
            local digit = (string.find(____exports.default.digits, char, nil, true) or 0) - 1
            if digit == -1 or digit >= radix then
                error(
                    __TS__New(Error, "Invalid character for base"),
                    0
                )
            end
            local power = #numStr - 1 - i
            result = result + digit * radix ^ power
            i = i + 1
        end
    end
    return result
end
NumberUtil.digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!#$%&()*+-./;<=>?@\\^_`~|,\"':{}[]"
return ____exports
