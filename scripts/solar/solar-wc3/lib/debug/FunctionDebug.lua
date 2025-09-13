local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 5,["12"] = 6,["15"] = 9,["16"] = 12,["17"] = 13,["18"] = 14,["19"] = 15,["21"] = 18,["22"] = 13,["23"] = 20,["24"] = 21,["25"] = 22,["26"] = 23,["28"] = 25,["29"] = 21,["30"] = 27,["31"] = 28,["32"] = 29,["33"] = 30,["35"] = 32,["36"] = 28,["37"] = 5,["38"] = 3});
local ____exports = {}
____exports.default = __TS__Class()
local FunctionDebug = ____exports.default
FunctionDebug.name = "FunctionDebug"
function FunctionDebug.prototype.____constructor(self)
end
function FunctionDebug.init(self)
    if ____exports.default.is_init then
        return
    end
    ____exports.default.is_init = true
    local oldTriggerSleepAction = TriggerSleepAction
    _G.TriggerSleepAction = function(timeout)
        if require("jass.runtime").sleep ~= true then
            log.errorWithTraceBack("TriggerSleepAction等待函数在lua中不受支持，请使用计时器替换执行逻辑!")
        end
        oldTriggerSleepAction(timeout)
    end
    local oldTriggerWaitForSound = TriggerWaitForSound
    _G.TriggerWaitForSound = function(s, offset)
        if require("jass.runtime").sleep ~= true then
            log.errorWithTraceBack("TriggerWaitForSound等待声音函数在lua中不受支持，请使用计时器替换执行逻辑!")
        end
        oldTriggerWaitForSound(s, offset)
    end
    local oldTriggerSyncReady = TriggerSyncReady
    _G.TriggerSyncReady = function()
        if require("jass.runtime").sleep ~= true then
            log.errorWithTraceBack("TriggerSyncReady等待函数在lua中不受支持，请使用计时器替换执行逻辑!")
        end
        oldTriggerSyncReady()
    end
end
FunctionDebug.is_init = false
return ____exports
