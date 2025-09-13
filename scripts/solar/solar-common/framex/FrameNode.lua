local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 7,["11"] = 7,["12"] = 7,["13"] = 13,["14"] = 10,["15"] = 11,["16"] = 15,["17"] = 16,["18"] = 17,["19"] = 13,["20"] = 24,["21"] = 25,["22"] = 24,["23"] = 28,["24"] = 29,["25"] = 28,["26"] = 40,["27"] = 41,["30"] = 44,["31"] = 45,["32"] = 46,["34"] = 48,["36"] = 50,["37"] = 40,["42"] = 21,["51"] = 37,["53"] = 32,["54"] = 33});
local ____exports = {}
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
____exports.default = __TS__Class()
local FrameNode = ____exports.default
FrameNode.name = "FrameNode"
function FrameNode.prototype.____constructor(self, parent)
    self._sl_Frames = {}
    self._sl_isDestroyed = false
    self.rootFrame = __TS__New(Frame, "BACKDROP", nil, parent)
    self.rootFrame:setTexture("UI\\Widgets\\EscMenu\\Human\\blank-background.blp")
    self.rootFrame:setSize(0.04, 0.04)
end
function FrameNode.prototype.setSize(self, width, height)
    self.rootFrame:setSize(width, height)
end
function FrameNode.prototype.setAbsPoint(self, point, x, y)
    self.rootFrame:setAbsPoint(point, x, y)
end
function FrameNode.prototype.destroy(self)
    if self._sl_isDestroyed then
        return
    end
    if self._sl_Frames ~= nil then
        for ____, frame in ipairs(self._sl_Frames) do
            frame:destroy()
        end
        self._sl_Frames = nil
    end
    self._sl_isDestroyed = true
end
__TS__SetDescriptor(
    FrameNode.prototype,
    "handle",
    {get = function(self)
        return self.rootFrame.handle
    end},
    true
)
__TS__SetDescriptor(
    FrameNode.prototype,
    "visible",
    {
        get = function(self)
            return self.rootFrame.visible
        end,
        set = function(self, flag)
            self.rootFrame.visible = flag
        end
    },
    true
)
return ____exports
