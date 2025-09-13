local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 4,["11"] = 6,["12"] = 6,["13"] = 6,["15"] = 6,["16"] = 13,["17"] = 14,["18"] = 15,["19"] = 16,["22"] = 18,["23"] = 19,["24"] = 13,["25"] = 27,["27"] = 28,["28"] = 28,["29"] = 29,["30"] = 30,["33"] = 33,["34"] = 34,["35"] = 28,["38"] = 27,["39"] = 48,["40"] = 48,["41"] = 48,["43"] = 49,["44"] = 50,["45"] = 51,["46"] = 52,["47"] = 53,["48"] = 54,["49"] = 55,["51"] = 51,["52"] = 58,["53"] = 59,["55"] = 61,["56"] = 62,["57"] = 48,["58"] = 72,["59"] = 72,["60"] = 72,["62"] = 72,["63"] = 72,["65"] = 73,["66"] = 74,["67"] = 75,["69"] = 77,["70"] = 78,["71"] = 79,["72"] = 80,["73"] = 81,["74"] = 82,["76"] = 84,["78"] = 86,["80"] = 89,["81"] = 89,["82"] = 89,["83"] = 90,["84"] = 91,["85"] = 89,["86"] = 89,["87"] = 93,["88"] = 72,["89"] = 107,["90"] = 108,["91"] = 109,["92"] = 110,["93"] = 111,["94"] = 107,["95"] = 115,["96"] = 116,["97"] = 115,["98"] = 119,["99"] = 121,["100"] = 122,["101"] = 119,["102"] = 8,["103"] = 99,["104"] = 104});
local ____exports = {}
local ____STimer = require("solar.solar-common.tool.STimer")
local STimer = ____STimer.default
time = 0
_g_time = 0
____exports.default = __TS__Class()
local BaseUtil = ____exports.default
BaseUtil.name = "BaseUtil"
function BaseUtil.prototype.____constructor(self)
end
function BaseUtil.getUUID()
    if isAsync then
        log.errorWithTraceBack("不能异步获取uuid。异步请使用AsyncUtil。getUUIDAsync()!")
        return nil
    end
    local ____exports_default_0, ____uuid_1 = ____exports.default, "uuid"
    ____exports_default_0[____uuid_1] = ____exports_default_0[____uuid_1] + 1
    return ____exports.default.uuid
end
function BaseUtil.SForGroup(whichGroup, callback)
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(whichGroup)
            if not IsHandle(unitHandle) then
                break
            end
            callback(nil, unitHandle)
            GroupRemoveUnit(whichGroup, unitHandle)
            i = i + 1
        end
    end
end
function BaseUtil.onTimer(timeOut, onTimerCall, immediately)
    if immediately == nil then
        immediately = false
    end
    local sTimer = __TS__New(STimer)
    local count = 0
    local function callBack()
        count = count + 1
        local ____repeat = onTimerCall(nil, count)
        if not ____repeat then
            sTimer:destroy()
        end
    end
    if immediately then
        callBack()
    end
    sTimer:start(timeOut, callBack, true)
    return sTimer
end
function BaseUtil.runLater(timeOut, callBack, loopCount, immediately)
    if loopCount == nil then
        loopCount = 1
    end
    if immediately == nil then
        immediately = false
    end
    local count = 0
    if loopCount < 1 then
        return nil
    end
    local sTimer = __TS__New(STimer)
    if immediately then
        count = count + 1
        callBack(count, loopCount)
        if loopCount == 1 then
            return sTimer
        end
        sTimer:setLoopCount(loopCount - 1)
    else
        sTimer:setLoopCount(loopCount)
    end
    sTimer:start(
        timeOut,
        function()
            count = count + 1
            callBack(count, loopCount)
        end
    )
    return sTimer
end
function BaseUtil._sl_OnTime()
    _g_time = _g_time + 10
    time = _g_time
    ____exports.default.time = _g_time
    STimer._sl_OnTime()
end
function BaseUtil.getGameTime()
    return _g_time / 1000
end
function BaseUtil.init()
    ____exports.default.centerTimer = CreateTimer()
    TimerStart(____exports.default.centerTimer, 0.01, true, ____exports.default._sl_OnTime)
end
BaseUtil.uuid = 1
BaseUtil.centerTimer = nil
BaseUtil.time = 0
return ____exports
