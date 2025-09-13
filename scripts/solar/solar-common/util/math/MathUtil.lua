local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 2,["9"] = 3,["10"] = 4,["11"] = 5,["12"] = 6,["13"] = 7,["14"] = 9,["15"] = 9,["16"] = 9,["18"] = 9,["19"] = 19,["20"] = 20,["21"] = 20,["22"] = 20,["23"] = 20,["24"] = 20,["25"] = 20,["26"] = 19,["27"] = 30,["28"] = 31,["29"] = 32,["30"] = 33,["31"] = 30,["32"] = 43,["33"] = 44,["34"] = 45,["35"] = 46,["36"] = 43,["37"] = 56,["38"] = 57,["39"] = 56,["40"] = 67,["41"] = 68,["42"] = 67,["43"] = 75,["44"] = 76,["45"] = 75,["46"] = 83,["47"] = 84,["48"] = 83,["49"] = 92,["50"] = 93,["51"] = 92,["52"] = 100,["53"] = 101,["54"] = 102,["56"] = 104,["57"] = 105,["58"] = 106,["60"] = 108,["61"] = 100,["62"] = 117,["63"] = 117,["64"] = 117,["66"] = 118,["67"] = 119,["68"] = 120,["69"] = 121,["71"] = 123,["73"] = 124,["74"] = 124,["75"] = 125,["76"] = 124,["79"] = 127,["80"] = 117,["81"] = 134,["82"] = 135,["83"] = 134,["84"] = 142,["85"] = 143,["86"] = 142,["87"] = 156,["88"] = 157,["89"] = 158,["90"] = 159,["91"] = 160,["93"] = 162,["94"] = 156,["95"] = 172,["96"] = 172,["97"] = 172,["99"] = 173,["100"] = 174,["101"] = 175,["102"] = 176,["103"] = 177,["105"] = 179,["106"] = 172});
local ____exports = {}
local PI = 3.14159
local E = 2.71828
local CELLWIDTH = 128
local CLIFFHEIGHT = 128
local UNIT_FACING = 270
local RADTODEG = 180 / PI
local DEGTORAD = PI / 180
____exports.default = __TS__Class()
local MathUtil = ____exports.default
MathUtil.name = "MathUtil"
function MathUtil.prototype.____constructor(self)
end
function MathUtil.distanceBetweenUnits(u1, u2)
    return ____exports.default.distanceBetweenPoints(
        GetUnitX(u1),
        GetUnitY(u1),
        GetUnitX(u2),
        GetUnitY(u2)
    )
end
function MathUtil.distanceBetweenPoints(x1, y1, x2, y2)
    local dx = x2 - x1
    local dy = y2 - y1
    return SquareRoot(dx * dx + dy * dy)
end
function MathUtil.polarProjection(x1, y1, dist, angle)
    local x = x1 + dist * Cos(angle * DEGTORAD)
    local y = y1 + dist * Sin(angle * DEGTORAD)
    return {x = x, y = y}
end
function MathUtil.angleBetweenCoords(x1, y1, x2, y2)
    return RADTODEG * Atan2(y2 - y1, x2 - x1)
end
function MathUtil.radianBetweenCoords(x1, y1, x2, y2)
    return Atan2(y2 - y1, x2 - x1)
end
function MathUtil.radian2angle(radian)
    return RADTODEG * radian
end
function MathUtil.angle2radian(angle)
    return DEGTORAD * angle
end
function MathUtil.isBackAngle(jd0, jd1)
    return CosBJ(jd1 - jd0) >= 0
end
function MathUtil.sum(data)
    if not data then
        return 0
    end
    local count = 0
    for k in pairs(data) do
        count = count + data[k]
    end
    return count
end
function MathUtil.moling(num, saveLength)
    if saveLength == nil then
        saveLength = 2
    end
    num = math.floor(num)
    local numberStr = tostring(num)
    if #numberStr <= saveLength then
        return num
    end
    local newNumberStr = __TS__StringSubstring(numberStr, 0, saveLength)
    do
        local i = #newNumberStr
        while i < #numberStr do
            newNumberStr = newNumberStr .. "0"
            i = i + 1
        end
    end
    return tonumber(newNumberStr)
end
function MathUtil.min(...)
    return math.min(...)
end
function MathUtil.max(...)
    return math.max(...)
end
function MathUtil.clamp(value, min, max)
    if value > max then
        return max
    elseif value < min then
        return min
    end
    return value
end
function MathUtil.armorReduction(armor, ardf)
    if ardf == nil then
        ardf = ArmorReducesDamageFactor
    end
    if armor == 0 then
        return 0
    elseif armor < 0 then
        armor = -armor
        return -(armor / (armor + 1 / ardf))
    end
    return armor / (armor + 1 / ardf)
end
return ____exports
