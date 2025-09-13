local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 7,["12"] = 7,["13"] = 7,["14"] = 7,["15"] = 9,["16"] = 7,["17"] = 11,["18"] = 13,["19"] = 14,["21"] = 16,["22"] = 17,["24"] = 9,["25"] = 21,["26"] = 7,["27"] = 23,["28"] = 24,["29"] = 25,["30"] = 21,["31"] = 28,["32"] = 29,["33"] = 30,["34"] = 28,["35"] = 33,["36"] = 34,["37"] = 35,["38"] = 33,["39"] = 39,["40"] = 40,["41"] = 40,["42"] = 41,["43"] = 40,["44"] = 40,["45"] = 40,["46"] = 39,["47"] = 46,["48"] = 47,["49"] = 46});
local ____exports = {}
local ____FrameControl = require("solar.solar-common.framex.control.FrameControl")
local FrameControl = ____FrameControl.default
local ____TextAlign = require("solar.solar-common.constant.TextAlign")
local TextAlign = ____TextAlign.default
____exports.default = __TS__Class()
local Label = ____exports.default
Label.name = "Label"
__TS__ClassExtends(Label, FrameControl)
function Label.prototype.____constructor(self, text, onClick)
    FrameControl.prototype.____constructor(self)
    self:init()
    if text then
        self:setText(text)
    end
    if onClick then
        self:setOnClick(onClick)
    end
end
function Label.prototype.init(self)
    FrameControl.prototype.init(self)
    self:getBackgroundImageFrame().visible = false
    self:getTextFrame():setTextAlignment(TextAlign.center)
    self:getTextFrame().visible = false
end
function Label.prototype.setBackgroundImage(self, imagePath)
    self:getBackgroundImageFrame():setTexture(imagePath)
    self:getBackgroundImageFrame().visible = true
end
function Label.prototype.setText(self, text)
    self:getTextFrame():setText(text)
    self:getTextFrame().visible = true
end
function Label.prototype.setOnClick(self, callback)
    self:getButtonFrame():setOnClick(
        function()
            callback(nil)
        end,
        false
    )
end
function Label.prototype.setDisable(self, disable)
    self:getDisableFrame().visible = disable
end
return ____exports
