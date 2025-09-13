local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 6,["11"] = 6,["12"] = 6,["14"] = 6,["15"] = 13,["16"] = 14,["17"] = 15,["18"] = 16,["19"] = 17,["20"] = 18,["22"] = 20,["23"] = 13,["24"] = 28,["25"] = 29,["26"] = 30,["27"] = 31,["28"] = 32,["29"] = 33,["31"] = 35,["32"] = 28,["33"] = 43,["34"] = 44,["35"] = 45,["36"] = 46,["37"] = 47,["38"] = 48,["40"] = 50,["41"] = 43,["42"] = 58,["43"] = 59,["44"] = 60,["45"] = 61,["46"] = 62,["47"] = 63,["49"] = 65,["50"] = 58,["51"] = 73,["52"] = 74,["53"] = 75,["54"] = 76,["55"] = 73,["56"] = 84,["57"] = 85,["58"] = 86,["60"] = 89,["61"] = 90,["62"] = 91,["63"] = 92,["64"] = 93,["65"] = 94,["67"] = 96,["68"] = 97,["71"] = 109,["74"] = 99,["75"] = 100,["76"] = 101,["77"] = 102,["78"] = 103,["79"] = 104,["80"] = 105,["82"] = 107,["88"] = 98,["91"] = 111,["92"] = 112,["94"] = 115,["95"] = 84});
local ____exports = {}
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
____exports.default = __TS__Class()
local VectorUtil = ____exports.default
VectorUtil.name = "VectorUtil"
function VectorUtil.prototype.____constructor(self)
end
function VectorUtil.add(self, v1, v2)
    local x = v1.x + v2.x
    local y = v1.y + v2.y
    if v1.z then
        local z = v1.z + (v2.z and v2.z or 0)
        return {x = x, y = y, z = z}
    end
    return {x = x, y = y}
end
function VectorUtil.subtract(self, v1, v2)
    local x = v1.x - v2.x
    local y = v1.y - v2.y
    if v1.z then
        local z = v1.z - (v2.z and v2.z or 0)
        return {x = x, y = y, z = z}
    end
    return {x = x, y = y}
end
function VectorUtil.mult(self, v1, v2)
    local x = v1.x * v2.x
    local y = v1.y * v2.y
    if v1.z then
        local z = v1.z * (v2.z and v2.z or 0)
        return {x = x, y = y, z = z}
    end
    return {x = x, y = y}
end
function VectorUtil.multScalar(self, v1, scalar)
    local x = v1.x * scalar
    local y = v1.y * scalar
    if v1.z then
        local z = v1.z * scalar
        return {x = x, y = y, z = z}
    end
    return {x = x, y = y}
end
function VectorUtil.getRandomXY(self, v1, bound)
    local x = v1.x + GetRandomInt(-bound, bound)
    local y = v1.y + GetRandomInt(-bound, bound)
    return {x = x, y = y}
end
function VectorUtil.getVector(self, data)
    if data == nil then
        return nil
    end
    if LangUtil:isString(data) and __TS__StringEndsWith(data, "]") then
        local solarLineInfo = data
        local indexOf = (string.find(solarLineInfo, "[", nil, true) or 0) - 1
        if indexOf <= 0 then
            print(("线变量不存在:<" .. tostring(data)) .. ">...可在太阳rpg编辑器中双击地形画此变量名对应的线!")
            return nil
        end
        local solarLineName = __TS__StringSubstring(solarLineInfo, 0, indexOf)
        local solarLineIndex = tonumber(__TS__StringSubstring(solarLineInfo, indexOf + 1, #solarLineInfo - 1))
        do
            local function ____catch(e)
                print(("线变量不存在:<" .. tostring(data)) .. ">...可在太阳rpg编辑器中双击地形画此变量名对应的线!")
            end
            local ____try, ____hasReturned, ____returnValue = pcall(function()
                local _require = require
                local ____exports = _require(solarLineName)
                local key, lineVals = next(____exports)
                local vectors = lineVals
                if solarLineIndex >= #vectors then
                    log.errorWithTraceBack((("线变量长度不足![" .. tostring(data)) .. "]当前线变量最大索引为:") .. tostring(#vectors - 1))
                    return true, nil
                end
                return true, vectors[solarLineIndex + 1]
            end)
            if not ____try then
                ____hasReturned, ____returnValue = ____catch(____hasReturned)
            end
            if ____hasReturned then
                return ____returnValue
            end
        end
    elseif data.x and data.y then
        return data
    end
    return nil
end
return ____exports
