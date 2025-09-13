local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["13"] = 1,["14"] = 9,["15"] = 9,["16"] = 10,["17"] = 11,["19"] = 13,["20"] = 14,["22"] = 16,["23"] = 17,["24"] = 18,["26"] = 20,["27"] = 21,["29"] = 22,["30"] = 23,["32"] = 26,["34"] = 28,["35"] = 28,["36"] = 29,["37"] = 30,["40"] = 28,["43"] = 34,["44"] = 35,["49"] = 38,["50"] = 9,["51"] = 47,["52"] = 48,["53"] = 49,["54"] = 50,["56"] = 52,["57"] = 47,["58"] = 59,["59"] = 60,["60"] = 61,["62"] = 63,["63"] = 59,["64"] = 69,["65"] = 70,["66"] = 71,["68"] = 73,["69"] = 74,["71"] = 76,["73"] = 77,["74"] = 77,["75"] = 78,["76"] = 79,["77"] = 80,["78"] = 81,["79"] = 82,["82"] = 77,["85"] = 86,["86"] = 69,["87"] = 95,["89"] = 96,["90"] = 96,["91"] = 97,["92"] = 98,["93"] = 99,["94"] = 100,["95"] = 96,["98"] = 102,["99"] = 95,["100"] = 111,["101"] = 112,["102"] = 113,["104"] = 115,["105"] = 116,["106"] = 117,["107"] = 118,["109"] = 120,["110"] = 111,["111"] = 128,["112"] = 129,["113"] = 130,["115"] = 132,["116"] = 128,["117"] = 139,["118"] = 140,["121"] = 143,["122"] = 144,["124"] = 139,["125"] = 154,["126"] = 155,["130"] = 158,["131"] = 158,["132"] = 159,["133"] = 160,["134"] = 158,["137"] = 154});
local ____exports = {}
____exports.default = __TS__Class()
local ArrayUtil = ____exports.default
ArrayUtil.name = "ArrayUtil"
function ArrayUtil.prototype.____constructor(self)
end
function ArrayUtil.selectByWhere(self, dataArray, ...)
    local keyAndSelectVal = {...}
    if dataArray == nil or #dataArray == 0 then
        return dataArray
    end
    if keyAndSelectVal == nil or #keyAndSelectVal == 0 then
        return dataArray
    end
    if #keyAndSelectVal % 2 ~= 0 then
        log.errorWithTraceBack("查询参数和值必须成对传入!")
        return dataArray
    end
    local result = {}
    for ____, data in ipairs(dataArray) do
        do
            if data == nil then
                goto __continue7
            end
            local isOk = true
            do
                local i = 0
                while i < #keyAndSelectVal - 1 do
                    if data[keyAndSelectVal[i + 1]] ~= keyAndSelectVal[i + 1 + 1] then
                        isOk = false
                        break
                    end
                    i = i + 2
                end
            end
            if isOk then
                result[#result + 1] = data
            end
        end
        ::__continue7::
    end
    return result
end
function ArrayUtil.getPropertyVals(self, array, key)
    local result = {}
    for ____, arrayElement in ipairs(array) do
        result[#result + 1] = arrayElement[key]
    end
    return result
end
function ArrayUtil.randomElement(self, array)
    if array == nil or #array == 0 then
        return nil
    end
    return array[GetRandomInt(0, #array - 1) + 1]
end
function ArrayUtil.randomElements(self, array, resultMaxSize)
    if array == nil or #array == 0 then
        return nil
    end
    if #array <= resultMaxSize then
        return {table.unpack(array)}
    end
    local result = {}
    do
        local i = 0
        while i < 1000000 do
            local randomElement = array[GetRandomInt(0, #array - 1) + 1]
            if not __TS__ArrayIncludes(result, randomElement) then
                result[#result + 1] = randomElement
                if #result >= resultMaxSize then
                    return result
                end
            end
            i = i + 1
        end
    end
    return result
end
function ArrayUtil.shuffle(self, array)
    do
        local i = #array - 1
        while i >= 0 do
            local randomIndex = math.floor(math.random() * (i + 1))
            local itemAtIndex = array[randomIndex + 1]
            array[randomIndex + 1] = array[i + 1]
            array[i + 1] = itemAtIndex
            i = i - 1
        end
    end
    return array
end
function ArrayUtil.removeElement(self, array, deleteElement)
    if array == nil or deleteElement == nil then
        return false
    end
    local indexOf = __TS__ArrayIndexOf(array, deleteElement)
    if indexOf >= 0 then
        __TS__ArraySplice(array, indexOf, 1)
        return true
    end
    return false
end
function ArrayUtil.removeElementByIndex(self, array, index)
    if array == nil or index >= #array then
        return nil
    end
    return __TS__ArraySplice(array, index, 1)
end
function ArrayUtil.clear(self, array)
    if array == nil then
        return
    end
    for key in pairs(array) do
        deleteKey(array, key)
    end
end
function ArrayUtil.forEach(self, array, callbackfn)
    if array == nil or callbackfn == nil then
        return
    end
    do
        local i = #array - 1
        while i >= 0 do
            local value = array[i + 1]
            callbackfn(nil, value, i)
            i = i - 1
        end
    end
end
return ____exports
