local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 3,["11"] = 5,["12"] = 6,["13"] = 6,["14"] = 6,["15"] = 6,["16"] = 6,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 5});
local ____exports = {}
local ____DebugSgpUtil = require("solar.solar-common.util.debug.DebugSgpUtil")
local DebugSgpUtil = ____DebugSgpUtil.default
function ____exports.default(self, menuName, category, editorActionCommand, editorActionCommandParams)
    if category == nil then
        category = "基础"
    end
    return function(self, method, context)
        DebugSgpUtil:addCustomMenu(
            menuName,
            method,
            category,
            editorActionCommand,
            editorActionCommandParams
        )
        return method
    end
end
return ____exports
