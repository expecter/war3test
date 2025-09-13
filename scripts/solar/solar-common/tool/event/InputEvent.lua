local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 5,["16"] = 5,["18"] = 10,["19"] = 8,["24"] = 21,["32"] = 28,["40"] = 35,["48"] = 42,["56"] = 50,["57"] = 50,["58"] = 50,["59"] = 50,["67"] = 57,["68"] = 57,["69"] = 57,["70"] = 57});
local ____exports = {}
local ____player = require("solar.solar-common.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local InputEvent = ____exports.default
InputEvent.name = "InputEvent"
function InputEvent.prototype.____constructor(self)
end
InputEvent.instance = __TS__New(____exports.default)
__TS__SetDescriptor(
    InputEvent.prototype,
    "triggerPlayer",
    {get = function(self)
        return GetLocalPlayer()
    end},
    true
)
__TS__SetDescriptor(
    InputEvent.prototype,
    "triggerPlayerObj",
    {get = function(self)
        return MapPlayer:fromHandle(GetLocalPlayer())
    end},
    true
)
__TS__SetDescriptor(
    InputEvent.prototype,
    "triggerPlayerId",
    {get = function(self)
        return GetPlayerId(GetLocalPlayer())
    end},
    true
)
__TS__SetDescriptor(
    InputEvent.prototype,
    "triggerPlayerName",
    {get = function(self)
        return GetPlayerName(GetLocalPlayer())
    end},
    true
)
__TS__SetDescriptor(
    InputEvent.prototype,
    "triggerPlayerSolarData",
    {get = function(self)
        return DataBase:getPlayerSolarData(
            GetLocalPlayer(),
            false
        )
    end},
    true
)
__TS__SetDescriptor(
    InputEvent.prototype,
    "triggerPlayerAttribute",
    {get = function(self)
        return AttributeUtil:getPlayerAttribute(
            GetLocalPlayer(),
            false
        )
    end},
    true
)
return ____exports
