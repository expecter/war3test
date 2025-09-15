local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 32,["8"] = 33,["9"] = 33,["10"] = 33,["11"] = 33,["12"] = 33,["13"] = 33,["14"] = 33,["15"] = 32,["16"] = 45,["17"] = 45,["18"] = 45,["19"] = 45,["20"] = 45,["21"] = 45,["22"] = 32,["23"] = 57,["24"] = 61,["25"] = 63,["26"] = 64,["27"] = 65,["28"] = 65});
local ____exports = {}
local _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF = require("state.系统.单位自动创建系统")
local _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF = _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF.default
____exports.data = {{
    id = "dwzdcjxt001",
    unitId = "hfoo",
    owner = 11,
    loc = {x = 100, y = 0},
    creationTime = 0.01,
    count = 1,
    area = 200
}, {
    id = "au01",
    unitId = "au01",
    owner = 11,
    loc = {x = 100, y = 20},
    creationTime = 0.01,
    count = 1
}}
____exports["d_单位自动创建系统"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            local ____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF_config_0 = _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF.config
            ____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF_config_0[#____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF_config_0 + 1] = datum
        end
    end
end
return ____exports
