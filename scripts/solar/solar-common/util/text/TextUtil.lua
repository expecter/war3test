local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__StringReplaceAll = ____lualib.__TS__StringReplaceAll
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 13,["10"] = 13,["11"] = 13,["13"] = 13,["14"] = 30,["15"] = 31,["16"] = 31,["17"] = 31,["18"] = 31,["19"] = 31,["20"] = 31,["21"] = 31,["22"] = 31,["23"] = 31,["24"] = 31,["25"] = 31,["26"] = 31,["27"] = 32,["28"] = 32,["29"] = 32,["30"] = 32,["31"] = 32,["32"] = 32,["33"] = 32,["34"] = 32,["35"] = 32,["36"] = 32,["37"] = 32,["38"] = 33,["39"] = 34,["40"] = 35,["41"] = 36,["42"] = 37,["43"] = 38,["44"] = 39,["46"] = 41,["47"] = 42,["48"] = 43,["49"] = 44,["50"] = 45,["51"] = 46,["54"] = 49,["55"] = 50,["56"] = 51,["58"] = 53,["60"] = 55,["61"] = 56,["63"] = 58,["64"] = 59,["66"] = 61,["67"] = 30,["68"] = 71,["69"] = 71,["70"] = 71,["72"] = 71,["73"] = 71,["75"] = 72,["76"] = 73,["78"] = 74,["79"] = 75,["82"] = 78,["83"] = 79,["84"] = 74,["87"] = 81,["88"] = 82,["90"] = 84,["91"] = 85,["92"] = 86,["93"] = 87,["94"] = 88,["95"] = 89,["97"] = 91,["98"] = 92,["99"] = 93,["102"] = 96,["103"] = 71,["104"] = 104,["105"] = 104,["106"] = 104,["108"] = 105,["109"] = 106,["111"] = 108,["112"] = 109,["113"] = 110,["115"] = 112,["116"] = 113,["117"] = 114,["118"] = 115,["120"] = 117,["121"] = 104,["122"] = 125,["123"] = 126,["124"] = 127,["126"] = 129,["127"] = 130,["128"] = 131,["129"] = 131,["130"] = 131,["131"] = 131,["132"] = 131,["133"] = 132,["135"] = 134,["136"] = 135,["137"] = 135,["138"] = 135,["139"] = 135,["140"] = 135,["141"] = 136,["143"] = 138,["144"] = 139,["146"] = 125,["147"] = 143,["149"] = 144,["150"] = 144,["151"] = 145,["152"] = 144,["155"] = 147,["156"] = 143,["157"] = 150,["159"] = 151,["160"] = 151,["161"] = 152,["162"] = 151,["165"] = 154,["166"] = 150,["167"] = 14,["168"] = 16,["169"] = 16,["170"] = 16,["171"] = 16,["172"] = 16,["173"] = 16,["174"] = 16,["175"] = 16,["176"] = 16,["177"] = 16,["178"] = 16,["179"] = 16,["180"] = 16,["181"] = 16,["182"] = 16,["183"] = 16,["184"] = 16,["185"] = 16,["186"] = 16,["187"] = 16,["188"] = 16,["189"] = 16,["190"] = 16,["191"] = 16,["192"] = 16,["193"] = 16,["194"] = 16,["195"] = 16,["196"] = 14,["197"] = 18,["198"] = 18,["199"] = 18,["200"] = 18,["201"] = 18,["202"] = 18,["203"] = 18,["204"] = 18,["205"] = 18,["206"] = 18,["207"] = 18,["208"] = 18,["209"] = 18,["210"] = 18,["211"] = 18,["212"] = 18,["213"] = 18,["214"] = 18,["215"] = 18,["216"] = 18,["217"] = 18,["218"] = 18,["219"] = 18,["220"] = 18,["221"] = 18,["222"] = 18,["223"] = 18,["224"] = 18,["225"] = 14,["226"] = 20,["227"] = 20,["228"] = 20,["229"] = 20,["230"] = 20,["231"] = 20,["232"] = 20,["233"] = 20,["234"] = 20,["235"] = 20,["236"] = 20,["237"] = 20,["238"] = 20,["239"] = 20,["240"] = 20,["241"] = 20,["242"] = 20,["243"] = 20,["244"] = 20,["245"] = 20,["246"] = 14});
local ____exports = {}
____exports.default = __TS__Class()
local TextUtil = ____exports.default
TextUtil.name = "TextUtil"
function TextUtil.prototype.____constructor(self)
end
function TextUtil.toCn(self, digit)
    local chnNum = {
        "零",
        "一",
        "二",
        "三",
        "四",
        "五",
        "六",
        "七",
        "八",
        "九"
    }
    local chnNumUnit = {
        "",
        "十",
        "百",
        "千",
        "万",
        "十",
        "百",
        "千",
        "亿"
    }
    local tmp = ""
    local chnString = ""
    local zero = true
    local unitIndex = 0
    local isTen = false
    if digit > 9 and digit < 20 then
        isTen = true
    end
    while digit > 0 do
        local num = digit % 10
        if num == 0 then
            if not zero then
                zero = true
                chnString = chnNum[num + 1] .. chnString
            end
        else
            zero = false
            if isTen and unitIndex == 1 then
                tmp = ""
            else
                tmp = chnNum[num + 1]
            end
            tmp = tmp .. chnNumUnit[unitIndex + 1]
            chnString = tmp .. chnString
        end
        unitIndex = unitIndex + 1
        digit = math.floor(digit / 10)
    end
    return chnString
end
function TextUtil.toCnUnit(self, num, keepDecimalPoint, maxDigit)
    if keepDecimalPoint == nil then
        keepDecimalPoint = true
    end
    if maxDigit == nil then
        maxDigit = 4
    end
    local cnUnit = ""
    local index = 0
    do
        while index < #____exports.default.config.cnUnit do
            if math.abs(num) < 10000 then
                break
            end
            num = num / 10000
            cnUnit = ____exports.default.config.cnUnit[index + 1]
            index = index + 1
        end
    end
    if not keepDecimalPoint then
        num = math.floor(num)
    else
        local numStr = tostring(num) .. ""
        local indexOf = (string.find(numStr, ".", nil, true) or 0) - 1
        if indexOf < maxDigit then
            numStr = __TS__StringSubstring(numStr, 0, maxDigit + 1)
            if __TS__StringEndsWith(numStr, ".000") or __TS__StringEndsWith(numStr, ".00") or __TS__StringEndsWith(numStr, ".0") then
                numStr = __TS__StringSubstring(numStr, 0, indexOf)
            end
            return numStr .. cnUnit
        elseif indexOf == maxDigit then
            num = math.floor(num)
        end
    end
    return tostring(num) .. cnUnit
end
function TextUtil.toPercentage(self, num, decimalPrecision)
    if decimalPrecision == nil then
        decimalPrecision = 0
    end
    if num == nil then
        return "0%"
    end
    num = num * 100
    if decimalPrecision == 0 then
        return tostring(math.floor(num)) .. "%"
    end
    local percentageStr = tostring(num) .. ""
    local pointIndex = (string.find(percentageStr, ".", nil, true) or 0) - 1
    if pointIndex >= 0 and #percentageStr - pointIndex > decimalPrecision then
        return __TS__StringSubstring(percentageStr, 0, pointIndex + decimalPrecision + 1) .. "%"
    end
    return percentageStr .. "%"
end
function TextUtil.removeColors(self, value)
    if value == nil then
        return value
    else
        local color
        while (string.find(value, "|c", nil, true) or 0) - 1 >= 0 do
            color = __TS__StringSubstring(
                value,
                (string.find(value, "|c", nil, true) or 0) - 1,
                (string.find(value, "|c", nil, true) or 0) - 1 + 10
            )
            value = __TS__StringReplaceAll(value, color, "")
        end
        while (string.find(value, "|C", nil, true) or 0) - 1 >= 0 do
            color = __TS__StringSubstring(
                value,
                (string.find(value, "|C", nil, true) or 0) - 1,
                (string.find(value, "|C", nil, true) or 0) - 1 + 10
            )
            value = __TS__StringReplaceAll(value, color, "")
        end
        value = __TS__StringReplaceAll(value, "|r", "")
        return value
    end
end
function TextUtil.leftPad(self, value, totalLength, pad)
    do
        local i = totalLength - #value
        while i > 0 do
            value = pad .. value
            i = i - 1
        end
    end
    return value
end
function TextUtil.rightPad(self, value, totalLength, pad)
    do
        local i = totalLength - #value
        while i > 0 do
            value = value .. pad
            i = i - 1
        end
    end
    return value
end
TextUtil.config = {cnUnit = {
    "万",
    "亿",
    "兆",
    "京",
    "垓",
    "秭",
    "穰",
    "沟",
    "涧",
    "正",
    "载",
    "极",
    "恒",
    "阿",
    "那",
    "不",
    "大",
    "万大",
    "亿大",
    "兆大",
    "京大",
    "垓大",
    "秭大",
    "穰大",
    "沟大",
    "涧大",
    "正大",
    "载大"
}, cnUnit2 = {
    "万",
    "亿",
    "兆",
    "京",
    "垓E",
    "秭F",
    "穰G",
    "沟F",
    "涧G",
    "正H",
    "载I",
    "极J",
    "恒K",
    "阿L",
    "那M",
    "N",
    "大O",
    "万大P",
    "亿大Q",
    "兆大R",
    "京大S",
    "垓大T",
    "秭大U",
    "穰大V",
    "沟大W",
    "涧大X",
    "正大Y",
    "载大Z"
}, cnUnit3 = {
    "万",
    "亿",
    "兆",
    "京",
    "五",
    "六",
    "七",
    "八",
    "九",
    "十",
    "十一",
    "十二",
    "十三",
    "十四",
    "十五",
    "十六",
    "十七",
    "十八",
    "十九",
    "二十"
}}
return ____exports
