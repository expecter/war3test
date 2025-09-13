local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 7,["12"] = 7,["13"] = 7,["14"] = 7,["15"] = 10,["16"] = 7,["17"] = 12,["18"] = 14,["19"] = 15,["21"] = 17,["22"] = 18,["24"] = 10,["25"] = 22,["26"] = 7,["27"] = 24,["28"] = 25,["29"] = 26,["30"] = 27,["31"] = 28,["32"] = 22,["33"] = 31,["34"] = 32,["35"] = 33,["36"] = 31,["37"] = 36,["38"] = 37,["39"] = 38,["40"] = 36,["41"] = 41,["42"] = 42,["43"] = 43,["44"] = 41,["45"] = 47,["46"] = 48,["47"] = 48,["48"] = 49,["49"] = 48,["50"] = 48,["51"] = 48,["52"] = 47,["53"] = 54,["54"] = 55,["55"] = 54});
local ____exports = {}
local ____FrameControl = require("solar.solar-common.framex.control.FrameControl")
local FrameControl = ____FrameControl.default
local ____TextAlign = require("solar.solar-common.constant.TextAlign")
local TextAlign = ____TextAlign.default
____exports.default = __TS__Class()
local Button = ____exports.default
Button.name = "Button"
__TS__ClassExtends(Button, FrameControl)
function Button.prototype.____constructor(self, text, onClick)
    FrameControl.prototype.____constructor(self)
    self:init()
    if text then
        self:setText(text)
    end
    if onClick then
        self:setOnClick(onClick)
    end
end
function Button.prototype.init(self)
    FrameControl.prototype.init(self)
    self:getBackgroundImageFrame().visible = false
    self:getImageFrame().visible = false
    self:getTextFrame():setTextAlignment(TextAlign.center)
    self:getTextFrame().visible = false
    self:getButtonFrame(true, true)
end
function Button.prototype.setBackgroundImage(self, imagePath)
    self:getBackgroundImageFrame():setTexture(imagePath)
    self:getBackgroundImageFrame().visible = true
end
function Button.prototype.setImage(self, imagePath)
    self:getImageFrame():setTexture(imagePath)
    self:getImageFrame().visible = true
end
function Button.prototype.setText(self, text)
    self:getTextFrame():setText(text)
    self:getTextFrame().visible = true
end
function Button.prototype.setOnClick(self, callback)
    self:getButtonFrame():setOnClick(
        function()
            callback(nil)
        end,
        false
    )
end
function Button.prototype.setDisable(self, disable)
    self:getDisableFrame().visible = disable
end
return ____exports
