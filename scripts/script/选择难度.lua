local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 5,["13"] = 6,["15"] = 8,["16"] = 8,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 8,["21"] = 8,["22"] = 8,["23"] = 8,["24"] = 8,["26"] = 4});
local ____exports = {}
local ____DialogUtil = require("solar.solar-common.util.game.DialogUtil")
local DialogUtil = ____DialogUtil.default
____exports.default = __TS__Class()
local _____9009_62E9_96BE_5EA6 = ____exports.default
_____9009_62E9_96BE_5EA6.name = "选择难度"
function _____9009_62E9_96BE_5EA6.prototype.____constructor(self)
    if isDebug then
        se:emit("选择难度", 0)
    else
        DialogUtil:show(
            0,
            "选择难度",
            function(____, index)
                se:emit("选择难度", index)
            end,
            "简单",
            "中等",
            "困难"
        )
    end
end
return ____exports
