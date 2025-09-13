local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 11,["24"] = 11,["25"] = 12,["26"] = 12,["27"] = 13,["28"] = 13,["29"] = 14,["30"] = 14,["31"] = 17,["32"] = 19,["33"] = 19,["34"] = 19,["36"] = 24,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 24,["42"] = 24,["43"] = 34,["44"] = 37,["45"] = 40,["46"] = 41,["47"] = 42,["48"] = 43,["49"] = 46,["50"] = 49,["51"] = 52,["52"] = 21,["53"] = 61,["54"] = 61,["55"] = 61,["56"] = 63,["57"] = 65,["58"] = 66,["59"] = 65,["61"] = 70,["63"] = 61,["64"] = 61});
local ____exports = {}
local ____GlobalVars = require("solar.solar-wc3.common.GlobalVars")
local GlobalVars = ____GlobalVars.default
local ____AppTest = require("AppTest")
local AppTest = ____AppTest.default
local ____StateInit = require("StateInit")
local StateInit = ____StateInit.default
local ____StateConfigInit = require("StateConfigInit")
local StateConfigInit = ____StateConfigInit.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____SolarDataClearState = require("solar.solar-common.attribute.SolarDataClearState")
local SolarDataClearState = ____SolarDataClearState.default
local ____UnitAttributeState = require("solar.solar-common.attribute.UnitAttributeState")
local UnitAttributeState = ____UnitAttributeState.default
local ____SolarDamageState = require("solar.solar-common.attribute.SolarDamageState")
local SolarDamageState = ____SolarDamageState.default
local ____ItemAttributeState = require("solar.solar-common.attribute.ItemAttributeState")
local ItemAttributeState = ____ItemAttributeState.default
local ____PlayerAttributeState = require("solar.solar-common.attribute.PlayerAttributeState")
local PlayerAttributeState = ____PlayerAttributeState.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____SolarActorState = require("solar.solar-common.actor.SolarActorState")
local SolarActorState = ____SolarActorState.default
GlobalVars:init()
____exports.default = __TS__Class()
local App = ____exports.default
App.name = "App"
function App.prototype.____constructor(self)
    DisplayTimedTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        60,
        "TS:App!"
    )
    StateConfigInit(nil)
    __TS__New(SolarDataClearState)
    __TS__New(SolarDamageState)
    __TS__New(ItemAttributeState)
    __TS__New(PlayerAttributeState)
    __TS__New(UnitAttributeState)
    __TS__New(SolarActorState)
    StateInit(nil)
    __TS__New(AppTest)
end
BaseUtil.runLater(
    0.01,
    function()
        if isEmbedJapi then
            PlayerUtil:onUsersUidReady(function()
                __TS__New(____exports.default)
            end)
        else
            __TS__New(____exports.default)
        end
    end
)
return ____exports
