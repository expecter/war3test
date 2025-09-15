local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 19,["8"] = 31,["9"] = 35,["10"] = 37,["11"] = 38});
local ____exports = {}
local _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272 = require("state.基础.开局选择英雄角色")
local _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272 = _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272.default
____exports.data = {{key_name = "备选项数量", value = 3, ["#<%1%>#"] = "    开局选择英雄角色.cfg.optionSize = 3"}, {key_name = "默认可重随次数", value = 1, ["#<%1%>#"] = "    开局选择英雄角色.cfg.freeRefreshCount = 1"}}
____exports["d_开局选择英雄角色"] = ____exports.data
function ____exports.default(self)
    _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272.cfg.optionSize = 3
    _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272.cfg.freeRefreshCount = 1
end
return ____exports
