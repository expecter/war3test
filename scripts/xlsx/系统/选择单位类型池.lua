local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 18,["8"] = 18,["9"] = 18,["10"] = 18,["11"] = 18,["12"] = 18,["13"] = 18,["14"] = 18,["15"] = 18,["16"] = 18,["17"] = 18,["18"] = 18,["19"] = 18,["20"] = 18,["21"] = 18,["22"] = 18,["23"] = 18,["24"] = 18,["25"] = 18,["26"] = 18,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 18,["31"] = 18,["32"] = 18,["33"] = 18,["34"] = 18,["35"] = 18,["36"] = 18,["37"] = 132,["38"] = 136,["39"] = 138,["40"] = 139,["41"] = 140});
local ____exports = {}
local _____9009_62E9_82F1_96C4 = require("script.选择英雄")
local _____9009_62E9_82F1_96C4 = _____9009_62E9_82F1_96C4.default
____exports.data = {
    {id = "Ecen", weight = 1},
    {id = "Edem", weight = 1},
    {id = "Ekee", weight = 1},
    {id = "Ekgg", weight = 1},
    {id = "Emns", weight = 1},
    {id = "Emoo", weight = 1},
    {id = "Ewar", weight = 1},
    {id = "Hamg", weight = 1},
    {id = "Hapm", weight = 1},
    {id = "Hart", weight = 1},
    {id = "Hblm", weight = 1},
    {id = "Hjai", weight = 1},
    {id = "Hmbr", weight = 1},
    {id = "Hvsh", weight = 1},
    {id = "Hvwd", weight = 1},
    {id = "Nal2", weight = 1},
    {id = "Nbbc", weight = 1},
    {id = "Nbrn", weight = 1},
    {id = "Nbst", weight = 1},
    {id = "Nfir", weight = 1},
    {id = "Nmag", weight = 1},
    {id = "Nngs", weight = 1},
    {id = "Npbm", weight = 1},
    {id = "Npld", weight = 1},
    {id = "Nrob", weight = 1},
    {id = "Nsjs", weight = 1},
    {id = "Ocb2", weight = 1},
    {id = "Odrt", weight = 1}
}
____exports["d_选择单位类型池"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            _____9009_62E9_82F1_96C4.cfg.unitIdWeights[datum.id] = datum.weight
        end
    end
end
return ____exports
