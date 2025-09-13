local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 2,["11"] = 2,["12"] = 5});
local ____exports = {}
function ____exports.default(self, method, context)
    se:on(
        "_sl_重载脚本",
        function(data)
            method(nil)
        end
    )
    return method
end
return ____exports
