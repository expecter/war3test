local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 10,["13"] = 11,["14"] = 11,["15"] = 11,["16"] = 26,["17"] = 14,["18"] = 14,["19"] = 14,["20"] = 15,["21"] = 16,["22"] = 17,["23"] = 18,["24"] = 19,["25"] = 27,["26"] = 28,["27"] = 29,["28"] = 29,["29"] = 26,["30"] = 32,["31"] = 33,["32"] = 33,["33"] = 32,["34"] = 39,["35"] = 40,["36"] = 40,["37"] = 40,["38"] = 40,["39"] = 40,["40"] = 39,["41"] = 46,["42"] = 47,["43"] = 46,["44"] = 51,["45"] = 52,["46"] = 53,["49"] = 56,["52"] = 60,["53"] = 60,["55"] = 61,["56"] = 61,["57"] = 62,["58"] = 61,["61"] = 60,["62"] = 60,["63"] = 60,["64"] = 65,["65"] = 51,["66"] = 69,["67"] = 70,["68"] = 71,["70"] = 71,["72"] = 72,["73"] = 73,["74"] = 74,["75"] = 69,["76"] = 80,["77"] = 81,["78"] = 80,["79"] = 12});
local ____exports = {}
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
local ____ErrorMsgHelper = require("solar.solar-common.common.ErrorMsgHelper")
local ErrorMsgHelper = ____ErrorMsgHelper.default
local index = 0
____exports.default = __TS__Class()
local SolarTrigger = ____exports.default
SolarTrigger.name = "SolarTrigger"
function SolarTrigger.prototype.____constructor(self, actionFunc, solarTriggers)
    local ____index_1 = index
    index = ____index_1 + 1
    self.uuid = "stri" .. tostring(____index_1)
    self.enable = true
    self.onDestroy = nil
    self.actionFuncs = {}
    self.solarTriggers = nil
    self._sl_isDestroyed = false
    self:addAction(actionFunc)
    self.solarTriggers = solarTriggers
    local ____self_solarTriggers_0 = self.solarTriggers
    ____self_solarTriggers_0[#____self_solarTriggers_0 + 1] = self
end
function SolarTrigger.prototype.addAction(self, actionFunc)
    local ____self_actionFuncs_2 = self.actionFuncs
    ____self_actionFuncs_2[#____self_actionFuncs_2 + 1] = actionFunc
end
function SolarTrigger.prototype.removeAction(self, actionFunc)
    __TS__ArraySplice(
        self.actionFuncs,
        __TS__ArrayIndexOf(self.actionFuncs, actionFunc),
        1
    )
end
function SolarTrigger.prototype.removeActions(self)
    self.actionFuncs = {}
end
function SolarTrigger.prototype.exec(self, data)
    ____exports.default._sl_TriggeringSolarTrigger = self
    if self._sl_isDestroyed then
        return
    end
    if self.enable == false then
        return
    end
    xpcall(
        function()
            do
                local i = #self.actionFuncs - 1
                while i >= 0 do
                    self.actionFuncs[i + 1](self, data)
                    i = i - 1
                end
            end
        end,
        ErrorMsgHelper.error_handle
    )
    ____exports.default._sl_TriggeringSolarTrigger = nil
end
function SolarTrigger.prototype.destroy(self)
    self._sl_isDestroyed = true
    local ____opt_3 = self.onDestroy
    if ____opt_3 ~= nil then
        ____opt_3(self)
    end
    self.actionFuncs = nil
    ArrayUtil:removeElement(self.solarTriggers, self)
    self.solarTriggers = nil
end
function SolarTrigger.getTriggeringSolarTrigger(self)
    return ____exports.default._sl_TriggeringSolarTrigger
end
SolarTrigger._sl_TriggeringSolarTrigger = nil
return ____exports
