local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 11,["24"] = 11,["25"] = 12,["26"] = 12,["27"] = 13,["28"] = 13,["29"] = 14,["30"] = 14,["31"] = 15,["32"] = 15,["33"] = 19,["34"] = 21,["35"] = 21,["36"] = 21,["38"] = 26,["39"] = 26,["40"] = 26,["41"] = 26,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 36,["46"] = 39,["47"] = 42,["48"] = 43,["49"] = 44,["50"] = 45,["51"] = 48,["52"] = 52,["53"] = 52,["54"] = 52,["55"] = 53,["56"] = 55,["57"] = 52,["58"] = 52,["59"] = 58,["60"] = 60,["61"] = 23,["62"] = 69,["63"] = 69,["64"] = 69,["65"] = 71,["66"] = 73,["67"] = 74,["68"] = 73,["70"] = 78,["72"] = 69,["73"] = 69});
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
local _____9009_62E9_96BE_5EA6 = require("script.选择难度")
local _____9009_62E9_96BE_5EA6 = _____9009_62E9_96BE_5EA6.default
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
    se:on(
        "选择难度",
        function(index)
            settings.gameDifficulty = index
            StateInit(nil)
        end
    )
    __TS__New(_____9009_62E9_96BE_5EA6)
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
