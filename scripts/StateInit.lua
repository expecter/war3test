local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 7,["16"] = 8,["17"] = 9,["18"] = 10,["20"] = 12});
local ____exports = {}
local ____AutoTest = require("script.AutoTest")
local AutoTest = ____AutoTest.default
local _____602A_7269_81EA_52A8_8FDB_653B = require("script.怪物自动进攻")
local _____602A_7269_81EA_52A8_8FDB_653B = _____602A_7269_81EA_52A8_8FDB_653B.default
local _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272 = require("state.基础.开局选择英雄角色")
local _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272 = _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272.default
local _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF = require("state.系统.单位自动创建系统")
local _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF = _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF.default
function ____exports.default(self)
    __TS__New(_____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF)
    __TS__New(_____602A_7269_81EA_52A8_8FDB_653B)
    if isDebug then
        __TS__New(AutoTest)
    else
        __TS__New(_____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272)
    end
end
return ____exports
