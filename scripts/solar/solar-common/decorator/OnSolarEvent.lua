local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 3,["15"] = 3,["16"] = 6,["17"] = 2});
local ____exports = {}
function ____exports.default(self, ____type)
    return function(self, method, context)
        se:on(
            ____type,
            function(event, solarTrigger)
                method(
                    nil,
                    table.unpack(event)
                )
            end
        )
        return method
    end
end
return ____exports
