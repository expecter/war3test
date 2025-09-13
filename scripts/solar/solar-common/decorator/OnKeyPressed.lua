local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 5,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 7,["12"] = 8,["13"] = 9,["14"] = 7,["15"] = 7,["16"] = 11,["17"] = 6});
local ____exports = {}
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
function ____exports.default(self, key)
    return function(self, method, context)
        InputUtil:onKeyPressed(
            key,
            function()
                print("OnKeyPressed测试:" .. tostring(context.name))
                method(nil)
            end
        )
        return method
    end
end
return ____exports
