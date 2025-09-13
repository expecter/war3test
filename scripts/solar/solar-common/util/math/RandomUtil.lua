local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 4,["15"] = 12,["16"] = 13,["17"] = 12,["18"] = 21,["19"] = 22,["20"] = 21,["21"] = 31,["22"] = 32,["23"] = 31,["24"] = 40,["25"] = 41,["26"] = 40,["27"] = 52,["28"] = 53,["30"] = 54,["31"] = 54,["32"] = 55,["34"] = 55,["36"] = 55,["37"] = 55,["38"] = 55,["40"] = 55,["41"] = 56,["42"] = 54,["45"] = 58,["46"] = 59,["47"] = 60,["48"] = 61,["50"] = 63,["51"] = 64,["52"] = 65,["54"] = 67,["55"] = 52,["56"] = 77,["57"] = 80,["59"] = 81,["60"] = 81,["61"] = 82,["62"] = 83,["63"] = 84,["65"] = 86,["68"] = 81,["71"] = 90,["72"] = 91,["73"] = 92,["75"] = 94,["76"] = 77,["77"] = 103,["78"] = 103,["79"] = 104,["80"] = 105,["81"] = 106,["82"] = 107,["85"] = 110,["86"] = 111,["87"] = 112,["88"] = 113,["89"] = 114,["90"] = 115,["94"] = 119,["95"] = 103,["96"] = 129,["97"] = 130,["98"] = 129,["99"] = 136,["100"] = 137,["101"] = 136,["102"] = 144,["103"] = 145,["104"] = 144,["105"] = 152,["106"] = 153,["107"] = 152,["108"] = 5});
local ____exports = {}
local ____Random = require("solar.solar-common.tool.Random")
local Random = ____Random.default
____exports.default = __TS__Class()
local RandomUtil = ____exports.default
RandomUtil.name = "RandomUtil"
function RandomUtil.prototype.____constructor(self)
end
function RandomUtil.nextInt(min, max)
    return GetRandomInt(min, max)
end
function RandomUtil.nextReal(min, max)
    return GetRandomReal(min, max)
end
function RandomUtil.nextLocalInt(min, max)
    return math.floor(____exports.default.nextLocalReal(min, max) + 0.5)
end
function RandomUtil.nextLocalReal(min, max)
    return ____exports.default._SL_Random:nextReal(min, max)
end
function RandomUtil.getRandomElementByObjArrays(needkeyCount, weightKey, objArray)
    local indexAndWeight = {}
    do
        local i = 0
        while i < #objArray do
            local ____opt_0 = objArray[i + 1]
            if ____opt_0 ~= nil then
                ____opt_0 = ____opt_0[weightKey]
            end
            local ____opt_0_2 = ____opt_0
            if ____opt_0_2 == nil then
                ____opt_0_2 = 0
            end
            local weight = ____opt_0_2
            indexAndWeight[i] = weight
            i = i + 1
        end
    end
    local keys = ____exports.default.getRandomKeysByWeight(needkeyCount, indexAndWeight)
    local result = {}
    for ____, key in ipairs(keys) do
        result[#result + 1] = objArray[key + 1]
    end
    if #result < needkeyCount then
        print("getRandomElementByObjArrays: 没有找到足够的元素")
        return result
    end
    return result
end
function RandomUtil.getRandomKeysByWeight(needkeyCount, ...)
    local result = {}
    do
        local i = 0
        while i < 1000000 do
            local one = ____exports.default.getRandomKeyByWeight(...)
            if not __TS__ArrayIncludes(result, one) then
                result[#result + 1] = one
            end
            if #result >= needkeyCount then
                break
            end
            i = i + 1
        end
    end
    if #result < needkeyCount then
        print("getRandomKeysByWeight: 没有找到足够的元素")
        return result
    end
    return result
end
function RandomUtil.getRandomKeyByWeight(...)
    local objAndWeights = {...}
    local max = 0
    for ____, objAndWeight in ipairs(objAndWeights) do
        for objAndWeightKey in pairs(objAndWeight) do
            max = max + objAndWeight[objAndWeightKey]
        end
    end
    local ri = ____exports.default.nextReal(0, max)
    for ____, objAndWeight in ipairs(objAndWeights) do
        for objAndWeightKey in pairs(objAndWeight) do
            ri = ri - objAndWeight[objAndWeightKey]
            if ri <= 0 then
                return objAndWeightKey
            end
        end
    end
    return nil
end
function RandomUtil.isInChance(chance)
    return GetRandomReal(0, 1) < chance
end
function RandomUtil.randomAngle()
    return GetRandomReal(0, 360)
end
function RandomUtil.randomPercent()
    return GetRandomReal(0, 1)
end
function RandomUtil.randomBool()
    return GetRandomInt(0, 100) < 50
end
RandomUtil._SL_Random = __TS__New(Random)
return ____exports
