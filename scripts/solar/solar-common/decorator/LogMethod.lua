local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 8,["13"] = 9,["14"] = 10,["15"] = 11,["17"] = 13,["18"] = 14,["19"] = 15,["20"] = 16,["21"] = 16,["22"] = 17,["23"] = 17,["24"] = 17,["25"] = 17,["26"] = 16,["27"] = 16,["28"] = 16,["29"] = 19,["30"] = 20,["31"] = 6});
local ____exports = {}
local ____DebugUtil = require("solar.solar-common.util.debug.DebugUtil")
local DebugUtil = ____DebugUtil.default
local execCountMap = {}
function ____exports.default(self, method, context)
    return function(____, ...)
        local args = {...}
        local execCount = execCountMap[context.name] or 1
        execCountMap[context.name] = execCount + 1
        local info = ((("No" .. tostring(execCount)) .. ".") .. tostring(context.name)) .. "( "
        for ____, arg in ipairs(args) do
            info = info .. tostring(arg) .. " , "
        end
        info = info .. ")"
        print(info)
        local result = nil
        DebugUtil.countExecuteTime(
            function()
                result = method(
                    nil,
                    table.unpack(args)
                )
            end,
            tostring(context.name)
        )
        print_r(result)
        return result
    end
end
return ____exports
