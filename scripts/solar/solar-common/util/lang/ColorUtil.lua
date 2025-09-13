local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["11"] = 1,["12"] = 40,["13"] = 41,["14"] = 40,["15"] = 50,["16"] = 51,["17"] = 50,["18"] = 55,["19"] = 56,["20"] = 57,["22"] = 60,["23"] = 61,["25"] = 64,["26"] = 65,["28"] = 68,["29"] = 69,["31"] = 72,["32"] = 73,["34"] = 76,["35"] = 77,["37"] = 80,["38"] = 81,["39"] = 82,["40"] = 83,["41"] = 84,["42"] = 85,["43"] = 86,["44"] = 87,["45"] = 88,["46"] = 89,["47"] = 90,["48"] = 91,["49"] = 92,["50"] = 93,["51"] = 94,["52"] = 95,["53"] = 96,["55"] = 98,["56"] = 55,["57"] = 101,["58"] = 103,["59"] = 104,["61"] = 107,["62"] = 108,["64"] = 111,["65"] = 112,["67"] = 115,["68"] = 116,["70"] = 119,["71"] = 120,["73"] = 123,["74"] = 124,["76"] = 127,["77"] = 101,["78"] = 134,["79"] = 135,["80"] = 136,["82"] = 139,["83"] = 140,["84"] = 141,["86"] = 143,["87"] = 134,["88"] = 3,["89"] = 3,["90"] = 3,["91"] = 3,["92"] = 3,["93"] = 3,["94"] = 3,["95"] = 3,["96"] = 3,["97"] = 3,["98"] = 3,["99"] = 3,["100"] = 3,["101"] = 3,["102"] = 3,["103"] = 3,["104"] = 3,["105"] = 3,["106"] = 3,["107"] = 3,["108"] = 3,["109"] = 3,["110"] = 3,["111"] = 3,["112"] = 3,["113"] = 3,["114"] = 3,["115"] = 3,["116"] = 3,["117"] = 3,["118"] = 3,["119"] = 3,["120"] = 3,["121"] = 3,["122"] = 3});
local ____exports = {}
____exports.default = __TS__Class()
local ColorUtil = ____exports.default
ColorUtil.name = "ColorUtil"
function ColorUtil.prototype.____constructor(self)
end
function ColorUtil.getColor(self, g)
    return ____exports.default.config[g]
end
function ColorUtil.getColorIntByRGB(self, r, g, b)
    return 255 * 16777216 + r * 65536 + g * 256 + b
end
function ColorUtil.getTextColor(self, text)
    if not text or text == "" then
        return ""
    end
    if text == "C" then
        return "|cff66ff00"
    end
    if text == "B" then
        return "|cff0042ff"
    end
    if text == "A" then
        return "|cffbe00fe"
    end
    if text == "S" then
        return "|cffff0303"
    end
    if text == "SS" then
        return "|cfffe8a0e"
    end
    local color = nil
    if __TS__StringIncludes(text, "红") then
        color = ____exports.default.config.red
    elseif __TS__StringIncludes(text, "橙") then
        color = ____exports.default.config.orange
    elseif __TS__StringIncludes(text, "黄") then
        color = ____exports.default.config.yellow
    elseif __TS__StringIncludes(text, "绿") then
        color = ____exports.default.config.green
    elseif __TS__StringIncludes(text, "青") then
        color = "|cff0348B1"
    elseif __TS__StringIncludes(text, "蓝") then
        color = ____exports.default.config.blue
    elseif __TS__StringIncludes(text, "紫") then
        color = ____exports.default.config.purple
    elseif __TS__StringIncludes(text, "多彩") then
        color = "|cffF16F21"
    end
    return color or ""
end
function ColorUtil.getTextColorByNumber(self, key)
    if not key or key == 0 then
        return "|CFFFFFFFF"
    end
    if key <= 10 then
        return "|CFF0042FF"
    end
    if key <= 20 then
        return "|CFFBE00FE"
    end
    if key <= 30 then
        return "|CFFFF0303"
    end
    if key <= 40 then
        return "|CFFFE8A0E"
    end
    if key <= 50 then
        return "|CFF000000"
    end
    return "|CFFFFFFFF"
end
function ColorUtil.adaptTextColor(self, text)
    if text == nil then
        return nil
    end
    local color = ____exports.default:getTextColor(text)
    if color ~= nil and #color > 5 then
        return (color .. text) .. "|r"
    end
    return text
end
ColorUtil.config = {
    red = "|cffff0303",
    blue = "|cff0042ff",
    teal = "|cff1ce6b9",
    purple = "|cff540081",
    yellow = "|cfffffc00",
    orange = "|cfffe8a0e",
    green = "|cff20c000",
    pink = "|cffe55bb0",
    gray = "|cff959697",
    lightblue = "|cff7ebff1",
    darkgreen = "|cff106246",
    brown = "|cff4a2a04",
    maroon = "|cff9b0000",
    navy = "|cff0000c3",
    turquoise = "|cff00eaff",
    violet = "|cffbe00fe",
    wheat = "|cffebcd87",
    peach = "|cfff8a48b",
    mint = "|cffbfff80",
    lavender = "|cffdcb9eb",
    coal = "|cff282828",
    snow = "|cffebf0ff",
    emerald = "|cff00781e",
    peanut = "|cffa46f33",
    sheepblue = "|CFF3F81F8",
    wolfred = "|CFFC00040",
    gold = "|CFFD9D919",
    string = "|cffce915b",
    number = "|cffdcdc8b",
    boolean = "|cff569cd6",
    white = "|cffffffff",
    handle = "|cff7ebff1",
    black = "|CFF000000"
}
return ____exports
