local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringPadStart = ____lualib.__TS__StringPadStart
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__NumberToString = ____lualib.__TS__NumberToString
local __TS__StringCharAt = ____lualib.__TS__StringCharAt
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["15"] = 8,["16"] = 9,["17"] = 10,["18"] = 11,["19"] = 11,["20"] = 11,["22"] = 11,["23"] = 18,["24"] = 19,["25"] = 20,["27"] = 22,["28"] = 23,["30"] = 25,["31"] = 18,["32"] = 34,["34"] = 35,["35"] = 35,["36"] = 36,["37"] = 35,["40"] = 38,["41"] = 34,["42"] = 45,["43"] = 46,["44"] = 47,["46"] = 49,["47"] = 51,["49"] = 52,["50"] = 52,["51"] = 54,["52"] = 55,["53"] = 56,["54"] = 57,["55"] = 58,["56"] = 59,["58"] = 61,["59"] = 62,["61"] = 65,["62"] = 66,["64"] = 52,["67"] = 69,["68"] = 70,["69"] = 71,["70"] = 72,["71"] = 73,["73"] = 75,["75"] = 77,["76"] = 45,["77"] = 84,["78"] = 85,["79"] = 86,["81"] = 88,["82"] = 89,["83"] = 90,["85"] = 92,["87"] = 93,["88"] = 93,["89"] = 94,["90"] = 95,["91"] = 96,["93"] = 97,["94"] = 97,["95"] = 98,["96"] = 99,["98"] = 101,["100"] = 97,["103"] = 93,["106"] = 105,["107"] = 84});
local ____exports = {}
local ____NumberUtil = require("solar.solar-common.util.math.NumberUtil")
local NumberUtil = ____NumberUtil.default
--- 布尔标记数组 转精简字符串 (底层通过二进制换算)
-- 可以拿来做一些开关存档 节省底层数据存储
-- 当前配置下  3个字符可存19个布尔数组长度(19/3=6.333) 一个63位长度的字符串可以存399个布尔长度
local maxBitLen = 19
local UnsignedStringLen = 3
local UnsignedStringRadix = 84
____exports.default = __TS__Class()
local BoolFlagsStringUtil = ____exports.default
BoolFlagsStringUtil.name = "BoolFlagsStringUtil"
function BoolFlagsStringUtil.prototype.____constructor(self)
end
function BoolFlagsStringUtil.isTrue(self, boolFlags, index)
    if boolFlags == nil then
        return false
    end
    if index < #boolFlags then
        return boolFlags[index + 1]
    end
    return false
end
function BoolFlagsStringUtil.updateBoolFlags(self, boolFlags, index, value)
    do
        local i = #boolFlags
        while i < index do
            boolFlags[#boolFlags + 1] = false
            i = i + 1
        end
    end
    boolFlags[index + 1] = value
end
function BoolFlagsStringUtil.toBoolFlagsString(self, boolFlags)
    if boolFlags == nil or #boolFlags == 0 then
        return ""
    end
    local boolFlagsString = ""
    local jz2 = ""
    do
        local i = 0
        while i < #boolFlags do
            jz2 = (boolFlags[i + 1] and "1" or "0") .. jz2
            if #jz2 >= maxBitLen then
                local number = tonumber(jz2, 2)
                local tempNumStrJz = NumberUtil.toUnsignedString(number, UnsignedStringRadix)
                if #tempNumStrJz < UnsignedStringLen then
                    tempNumStrJz = __TS__StringPadStart(tempNumStrJz, UnsignedStringLen, "0")
                end
                if #tempNumStrJz ~= UnsignedStringLen then
                    log.errorWithTraceBack((((((("错误的转换进制配置:长度超标>" .. tostring(UnsignedStringLen)) .. ":二进制=") .. jz2) .. " 十进制=") .. tostring(number)) .. " tempNumStrJz=") .. tempNumStrJz)
                end
                boolFlagsString = boolFlagsString .. tempNumStrJz
                jz2 = ""
            end
            i = i + 1
        end
    end
    if #jz2 > 0 then
        local number = tonumber(jz2, 2)
        local tempNumStrJz = NumberUtil.toUnsignedString(number, UnsignedStringRadix)
        if #tempNumStrJz < UnsignedStringLen then
            tempNumStrJz = __TS__StringPadStart(tempNumStrJz, UnsignedStringLen, "0")
        end
        boolFlagsString = boolFlagsString .. tempNumStrJz
    end
    return boolFlagsString
end
function BoolFlagsStringUtil.parseBoolFlags(self, boolFlagsString)
    if boolFlagsString == nil or #boolFlagsString == 0 then
        return {}
    end
    if #boolFlagsString % UnsignedStringLen ~= 0 then
        log.errorWithTraceBack("错误的boolFlagsString格式")
        return {}
    end
    local boolFlags = {}
    do
        local i = 0
        while i < #boolFlagsString do
            local tempNumStrJz = __TS__StringSubstring(boolFlagsString, i, i + UnsignedStringLen)
            local tempNum = NumberUtil.parseUnsignedString2Number(tempNumStrJz, UnsignedStringRadix)
            local jz2 = __TS__NumberToString(tempNum, 2)
            do
                local j = 0
                while j < maxBitLen do
                    if j < #jz2 then
                        boolFlags[#boolFlags + 1] = __TS__StringCharAt(jz2, #jz2 - j - 1) == "1"
                    else
                        boolFlags[#boolFlags + 1] = false
                    end
                    j = j + 1
                end
            end
            i = i + UnsignedStringLen
        end
    end
    return boolFlags
end
return ____exports
