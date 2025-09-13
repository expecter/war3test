local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 4,["10"] = 4,["11"] = 4,["13"] = 4,["14"] = 14,["15"] = 15,["16"] = 15,["17"] = 15,["18"] = 15,["19"] = 15,["20"] = 15,["21"] = 15,["22"] = 14,["23"] = 25,["24"] = 26,["25"] = 25,["26"] = 33,["27"] = 33,["28"] = 34,["29"] = 35,["30"] = 36,["32"] = 38,["33"] = 39,["34"] = 33,["35"] = 47,["36"] = 47,["37"] = 48,["38"] = 49,["39"] = 50,["41"] = 52,["42"] = 53,["43"] = 54,["44"] = 55,["46"] = 56,["47"] = 56,["48"] = 57,["49"] = 58,["50"] = 59,["52"] = 61,["53"] = 62,["55"] = 64,["56"] = 65,["58"] = 67,["59"] = 68,["61"] = 56,["64"] = 71,["65"] = 47,["66"] = 78,["67"] = 79,["68"] = 79,["69"] = 79,["70"] = 79,["71"] = 80,["72"] = 80,["73"] = 80,["74"] = 80,["75"] = 81,["76"] = 78,["77"] = 88,["79"] = 89,["80"] = 89,["81"] = 90,["82"] = 90,["83"] = 90,["84"] = 90,["85"] = 91,["86"] = 91,["87"] = 91,["88"] = 91,["89"] = 92,["90"] = 93,["92"] = 89,["95"] = 96,["96"] = 88,["97"] = 102,["99"] = 103,["100"] = 103,["101"] = 104,["102"] = 104,["103"] = 104,["104"] = 104,["105"] = 105,["106"] = 105,["107"] = 105,["108"] = 105,["109"] = 106,["110"] = 108,["112"] = 103,["115"] = 111,["116"] = 102,["117"] = 118,["118"] = 119,["119"] = 119,["120"] = 119,["121"] = 119,["122"] = 118,["123"] = 125,["124"] = 126,["125"] = 126,["126"] = 126,["127"] = 126,["128"] = 125,["129"] = 136,["130"] = 137,["131"] = 136,["132"] = 146,["133"] = 147,["134"] = 146,["135"] = 156,["136"] = 157,["137"] = 156,["138"] = 164,["139"] = 165,["140"] = 164});
local ____exports = {}
local ____rect = require("solar.solar-common.w3ts.handles.rect")
local Rectangle = ____rect.Rectangle
____exports.default = __TS__Class()
local RectUtil = ____exports.default
RectUtil.name = "RectUtil"
function RectUtil.prototype.____constructor(self)
end
function RectUtil.GetRectFromCircle(centerX, centerY, radius)
    return __TS__New(
        Rectangle,
        centerX - radius,
        centerY - radius,
        centerX + radius,
        centerY + radius
    )
end
function RectUtil.createRect(x, y, width, height)
    return Rect(x - width * 0.5, y - height * 0.5, x + width * 0.5, y + height * 0.5)
end
function RectUtil.createRectByVecs(...)
    local vecs = {...}
    if vecs == nil or #vecs < 2 then
        log.errorWithTraceBack("必须传入2个或以上的坐标点")
        return nil
    end
    local vs = ____exports.default.getMinXYAndMaxXYByVecs(table.unpack(vecs))
    return Rect(vs[1], vs[2], vs[3], vs[4])
end
function RectUtil.getMinXYAndMaxXYByVecs(...)
    local vecs = {...}
    if vecs == nil or #vecs < 2 then
        log.errorWithTraceBack("必须传入2个或以上的坐标点")
        return nil
    end
    local minX = vecs[1].x
    local minY = vecs[1].y
    local maxX = vecs[1].x
    local maxY = vecs[1].y
    do
        local i = 1
        while i < #vecs do
            local vec = vecs[i + 1]
            if vec.x < minX then
                minX = vec.x
            end
            if vec.x > maxX then
                maxX = vec.x
            end
            if vec.y < minY then
                minY = vec.y
            end
            if vec.y > maxY then
                maxY = vec.y
            end
            i = i + 1
        end
    end
    return {minX, minY, maxX, maxY}
end
function RectUtil.getRandomXYInRect(qy)
    local x = GetRandomInt(
        GetRectMinX(qy),
        GetRectMaxX(qy)
    )
    local y = GetRandomInt(
        GetRectMinY(qy),
        GetRectMaxY(qy)
    )
    return {x = x, y = y}
end
function RectUtil.getRandomDeepWaterXYInRect(region)
    do
        local i = 0
        while i < 1000000 do
            local x = GetRandomInt(
                GetRectMinX(region),
                GetRectMaxX(region)
            )
            local y = GetRandomInt(
                GetRectMinY(region),
                GetRectMaxY(region)
            )
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) then
                return {x = x, y = y}
            end
            i = i + 1
        end
    end
    return nil
end
function RectUtil.getRandomLandXYInRect(region)
    do
        local i = 0
        while i < 1000000 do
            local x = GetRandomInt(
                GetRectMinX(region),
                GetRectMaxX(region)
            )
            local y = GetRandomInt(
                GetRectMinY(region),
                GetRectMaxY(region)
            )
            if IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) then
                return {x = x, y = y}
            end
            i = i + 1
        end
    end
    return nil
end
function RectUtil.getRandomXInRect(qy)
    return GetRandomInt(
        GetRectMinX(qy),
        GetRectMaxX(qy)
    )
end
function RectUtil.getRandomYInRect(qy)
    return GetRandomInt(
        GetRectMinY(qy),
        GetRectMaxY(qy)
    )
end
function RectUtil.isContainsCoords(r, x, y)
    return GetRectMinX(r) <= x and x <= GetRectMaxX(r) and GetRectMinY(r) <= y and y <= GetRectMaxY(r)
end
function RectUtil.isInPlayableArea(x, y)
    return GetRectMinX(bj_mapInitialPlayableArea) <= x and x <= GetRectMaxX(bj_mapInitialPlayableArea) and GetRectMinY(bj_mapInitialPlayableArea) <= y and y <= GetRectMaxY(bj_mapInitialPlayableArea)
end
function RectUtil.getRectWidth(r)
    return GetRectMaxX(r) - GetRectMinX(r)
end
function RectUtil.getRectHeight(r)
    return GetRectMaxY(r) - GetRectMinY(r)
end
return ____exports
