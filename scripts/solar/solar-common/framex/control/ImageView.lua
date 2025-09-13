local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 6,["10"] = 6,["11"] = 6,["12"] = 6,["14"] = 6,["15"] = 11,["16"] = 9,["17"] = 14,["18"] = 6,["19"] = 16,["20"] = 17,["21"] = 14,["22"] = 20,["23"] = 21,["24"] = 22,["25"] = 20,["26"] = 25,["27"] = 26,["28"] = 27,["29"] = 25,["30"] = 31,["31"] = 32,["32"] = 31});
local ____exports = {}
local ____FrameControl = require("solar.solar-common.framex.control.FrameControl")
local FrameControl = ____FrameControl.default
____exports.default = __TS__Class()
local ImageView = ____exports.default
ImageView.name = "ImageView"
__TS__ClassExtends(ImageView, FrameControl)
function ImageView.prototype.____constructor(self)
    FrameControl.prototype.____constructor(self)
    self:init()
end
function ImageView.prototype.init(self)
    FrameControl.prototype.init(self)
    self:getBackgroundImageFrame().visible = false
    self:getImageFrame().visible = false
end
function ImageView.prototype.setBackgroundImage(self, imagePath)
    self:getBackgroundImageFrame():setTexture(imagePath)
    self:getBackgroundImageFrame().visible = true
end
function ImageView.prototype.setImage(self, imagePath)
    self:getImageFrame():setTexture(imagePath)
    self:getImageFrame().visible = true
end
function ImageView.prototype.setDisable(self, disable)
    self:getDisableFrame().visible = disable
end
return ____exports
