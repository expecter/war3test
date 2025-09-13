local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 9,["7"] = 9,["8"] = 11,["9"] = 11,["10"] = 11,["12"] = 11,["13"] = 17,["14"] = 18,["15"] = 17,["16"] = 21,["17"] = 22,["18"] = 23,["19"] = 23,["20"] = 23,["21"] = 24,["22"] = 23,["23"] = 23,["24"] = 26,["26"] = 28,["27"] = 29,["28"] = 30,["30"] = 32,["31"] = 33,["32"] = 34,["34"] = 36,["35"] = 37,["36"] = 38,["38"] = 40,["39"] = 41,["41"] = 43,["42"] = 21,["43"] = 51,["44"] = 52,["45"] = 53,["46"] = 53,["47"] = 53,["48"] = 54,["49"] = 53,["50"] = 53,["51"] = 56,["53"] = 58,["54"] = 59,["55"] = 60,["56"] = 61,["58"] = 63,["59"] = 64,["60"] = 65,["62"] = 67,["63"] = 68,["64"] = 69,["66"] = 71,["67"] = 51,["68"] = 80,["69"] = 81,["70"] = 82,["71"] = 83,["73"] = 85,["74"] = 80,["75"] = 93,["76"] = 94,["77"] = 95,["78"] = 96,["80"] = 98,["81"] = 93,["82"] = 106,["83"] = 107,["84"] = 108,["86"] = 110,["87"] = 111,["88"] = 112,["90"] = 114,["91"] = 106});
local ____exports = {}
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
____exports.default = __TS__Class()
local HandleUtil = ____exports.default
HandleUtil.name = "HandleUtil"
function HandleUtil.prototype.____constructor(self)
end
function HandleUtil.isUnitHandle(self, h)
    return ____exports.default:isHandleType(h, "+w3u")
end
function HandleUtil.isHandleType(self, h, handleType)
    if not isDebug then
        SingletonUtil:executeOnce(
            "HandleUtil:isHandleType",
            function()
                BJDebugMsg("正式环境无法使用HandleUtil.isHandleType")
            end
        )
        return true
    end
    local info = handledef(h)
    if info == nil then
        return false
    end
    if info.reference <= 0 then
        log.errorWithTraceBack("警告：你的Handle引用为0，可能会发生使用过时的handle情况，请排查使用handle的逻辑.")
        return false
    end
    if info.type == nil or info.type == "" then
        log.errorWithTraceBack("警告：你的Handle数据已被底层回收!请实时获取handle,不要使用过时的handle")
        return false
    end
    if info.type == handleType then
        return true
    end
    return false
end
function HandleUtil.isEmptyType(self, h)
    if not isDebug then
        SingletonUtil:executeOnce(
            "HandleUtil:isEmptyType",
            function()
                BJDebugMsg("正式环境无法使用HandleUtil.isEmptyType")
            end
        )
        return true
    end
    local info = handledef(h)
    if info == nil then
        log.errorWithTraceBack("警告：你的Handle定义为空。请检查handle是否正确")
        return true
    end
    if info.reference <= 0 then
        log.errorWithTraceBack("警告：你的Handle引用为0，可能会发生使用过时的handle情况，请排查使用handle的逻辑.")
        return false
    end
    if info.type == nil or info.type == "" then
        log.errorWithTraceBack("警告：你的Handle数据已被底层回收!请实时获取handle,不要使用过时的handle")
        return true
    end
    return false
end
function HandleUtil.getHandleRef(self, h)
    local info = handledef(h)
    if info == nil then
        return 0
    end
    return info.reference
end
function HandleUtil.getHandleType(self, h)
    local info = handledef(h)
    if info == nil then
        return nil
    end
    return info.type
end
function HandleUtil.isOkHandle(self, h)
    if h == nil then
        return false
    end
    local hid = h
    if hid >= 1048575 and hid <= handlemax() then
        return true
    end
    return false
end
return ____exports
