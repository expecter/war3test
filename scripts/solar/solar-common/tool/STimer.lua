local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 6,["8"] = 6,["11"] = 9,["12"] = 11,["13"] = 11,["14"] = 11,["16"] = 14,["17"] = 14,["18"] = 14,["19"] = 15,["20"] = 16,["21"] = 17,["22"] = 18,["23"] = 19,["24"] = 20,["25"] = 21,["26"] = 22,["27"] = 23,["28"] = 24,["29"] = 26,["30"] = 44,["31"] = 45,["32"] = 46,["34"] = 48,["35"] = 44,["36"] = 52,["37"] = 53,["40"] = 56,["43"] = 59,["44"] = 61,["45"] = 63,["46"] = 64,["47"] = 65,["48"] = 66,["49"] = 67,["50"] = 68,["52"] = 71,["54"] = 74,["55"] = 74,["56"] = 75,["57"] = 74,["58"] = 74,["59"] = 74,["61"] = 79,["62"] = 52,["63"] = 109,["64"] = 110,["65"] = 109,["66"] = 113,["67"] = 114,["68"] = 115,["69"] = 113,["70"] = 121,["71"] = 122,["72"] = 123,["73"] = 121,["74"] = 129,["75"] = 130,["76"] = 131,["77"] = 132,["78"] = 133,["79"] = 129,["80"] = 139,["81"] = 140,["82"] = 141,["83"] = 142,["84"] = 143,["85"] = 144,["86"] = 145,["87"] = 139,["88"] = 154,["89"] = 155,["90"] = 156,["91"] = 157,["93"] = 159,["94"] = 160,["95"] = 161,["97"] = 164,["98"] = 166,["99"] = 168,["100"] = 154,["101"] = 178,["102"] = 179,["103"] = 180,["104"] = 181,["105"] = 182,["106"] = 183,["109"] = 186,["110"] = 178,["111"] = 189,["112"] = 190,["113"] = 191,["114"] = 192,["115"] = 193,["116"] = 194,["118"] = 196,["119"] = 189,["120"] = 199,["121"] = 200,["122"] = 201,["123"] = 202,["124"] = 203,["126"] = 206,["128"] = 199,["133"] = 34,["141"] = 41,["150"] = 86,["152"] = 94,["153"] = 95,["154"] = 96,["155"] = 97,["156"] = 98,["159"] = 102,["160"] = 103,["165"] = 176});
local ____exports = {}
local ____ErrorMsgHelper = require("solar.solar-common.common.ErrorMsgHelper")
local ErrorMsgHelper = ____ErrorMsgHelper.default
---
-- @noSelf *
local index = 0
____exports.default = __TS__Class()
local STimer = ____exports.default
STimer.name = "STimer"
function STimer.prototype.____constructor(self)
    local ____index_0 = index
    index = ____index_0 + 1
    self.uuid = ____index_0
    self._elapsed = 0
    self.interval = 0
    self._callCount = 0
    self.loopCount = 1
    self.isPause = false
    self._timeout = 0
    self._isDestroy = false
    self.periodic = false
    self.lastUpdateTime = 0
    self.handlerFunc = nil
end
function STimer.prototype.setLoopCount(self, loopCount)
    if loopCount == 0 then
        log.errorWithTraceBack("不能设置循环次数为0!")
    end
    self.loopCount = loopCount
end
function STimer.prototype.update(self)
    if self._isDestroy then
        return
    end
    if self.isPause then
        return
    end
    local tpf = _g_time - self.lastUpdateTime
    self.interval = self.interval + tpf
    if self.interval >= self._timeout then
        self._callCount = self._callCount + 1
        self.interval = 0
        self._elapsed = self._elapsed + self._timeout
        if not self.periodic and self._callCount >= self.loopCount then
            self:destroy()
        else
            ____exports.default:_sl_addSTimer2TimeCallBack(self._timeout, self)
        end
        xpcall(
            function()
                self.handlerFunc(self)
            end,
            ErrorMsgHelper.error_handle
        )
    end
    self.lastUpdateTime = _g_time
end
function STimer.prototype.isDestroy(self)
    return self._isDestroy
end
function STimer.prototype.destroy(self)
    self._isDestroy = true
    return self
end
function STimer.prototype.pause(self)
    self.isPause = true
    return self
end
function STimer.prototype.resume(self)
    self.isPause = false
    self:reset()
    ____exports.default:_sl_addSTimer2TimeCallBack(self._timeout, self)
    return self
end
function STimer.prototype.reset(self)
    self._elapsed = 0
    self.interval = 0
    self._callCount = 0
    self.isPause = false
    self._isDestroy = false
    self.lastUpdateTime = 0
end
function STimer.prototype.start(self, timeoutS, handlerFunc, periodic)
    self.handlerFunc = handlerFunc
    if periodic ~= nil then
        self.periodic = periodic
    end
    if timeoutS == 0 then
        handlerFunc(self)
        return self
    end
    self._timeout = math.floor(timeoutS * 100 + 0.5) * 10
    ____exports.default:_sl_addSTimer2TimeCallBack(self._timeout, self)
    return self
end
function STimer._sl_getSTimerCount(self)
    local count = 0
    for timeCallBackKey in pairs(____exports.default.timeCallBack) do
        local callBackArray = ____exports.default.timeCallBack[timeCallBackKey]
        if callBackArray then
            count = count + #callBackArray
        end
    end
    return count
end
function STimer._sl_addSTimer2TimeCallBack(self, timeout, sTimer)
    local callBackTime = _g_time + timeout
    local callBackArray = ____exports.default.timeCallBack[callBackTime]
    if callBackArray == nil then
        callBackArray = {}
        ____exports.default.timeCallBack[callBackTime] = callBackArray
    end
    callBackArray[#callBackArray + 1] = sTimer
end
function STimer._sl_OnTime()
    local callBackArray = ____exports.default.timeCallBack[_g_time]
    if callBackArray then
        for ____, callBackArrayElement in ipairs(callBackArray) do
            callBackArrayElement:update()
        end
        ____exports.default.timeCallBack[_g_time] = nil
    end
end
__TS__SetDescriptor(
    STimer.prototype,
    "elapsed",
    {get = function(self)
        return self._elapsed
    end},
    true
)
__TS__SetDescriptor(
    STimer.prototype,
    "remaining",
    {get = function(self)
        return self._timeout - self._elapsed
    end},
    true
)
__TS__SetDescriptor(
    STimer.prototype,
    "timeout",
    {
        get = function(self)
            return self._timeout
        end,
        set = function(self, timeMS)
            timeMS = math.floor(timeMS / 10 + 0.5) * 10
            if timeMS < 10 then
                log.errorWithTraceBack("计时器间隔不得低于0.01毫秒")
                self:destroy()
                return
            end
            self.lastUpdateTime = -timeMS
            self._timeout = timeMS
        end
    },
    true
)
STimer.timeCallBack = {}
return ____exports
