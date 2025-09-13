local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 9,["10"] = 10,["11"] = 11,["12"] = 12,["13"] = 13,["14"] = 12});
local ____exports = {}
local ____DebugVmUtil = require("solar.solar-common.util.debug.DebugVmUtil")
local DebugVmUtil = ____DebugVmUtil.default
local ____SolarReload = require("solar.solar-common.common.SolarReload")
local SolarReload = ____SolarReload.default
function ____exports.default(self, config)
    local loadedKey = DebugVmUtil:getRequireModName(3)
    SolarReload.reloadFileConfig[loadedKey] = config or ({})
    return function(self, clazz, context)
        return clazz
    end
end
return ____exports
