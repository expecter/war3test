local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 5,["12"] = 3,["13"] = 3,["14"] = 7,["15"] = 2});
local ____exports = {}
function ____exports.default(self, chatMessage)
    return function(self, method, context)
        se:onPlayerChat(
            chatMessage,
            function()
                print("onPlayerChat测试:" .. tostring(context.name))
                method(nil)
            end
        )
        return method
    end
end
return ____exports
