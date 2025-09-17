local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 5,["9"] = 5,["10"] = 5,["12"] = 8,["13"] = 10,["14"] = 8,["15"] = 6,["16"] = 16,["17"] = 17,["18"] = 18,["19"] = 19,["21"] = 22,["22"] = 22,["23"] = 22,["24"] = 22,["25"] = 23,["26"] = 22,["27"] = 22,["28"] = 22,["30"] = 16,["31"] = 32,["32"] = 33,["33"] = 32,["34"] = 36,["35"] = 36});
local ____exports = {}
local ____DialogUtil = require("solar.solar-common.util.game.DialogUtil")
local DialogUtil = ____DialogUtil.default
____exports.default = __TS__Class()
local _____9009_62E9_6280_80FD = ____exports.default
_____9009_62E9_6280_80FD.name = "选择技能"
function _____9009_62E9_6280_80FD.prototype.____constructor(self)
    se:onHeroLevelUp(function(unitEvent)
        self:SkillPanel(unitEvent)
    end)
end
function _____9009_62E9_6280_80FD.prototype.SkillPanel(self, unitEvent)
    local buttonTexts = {"test1", "test2"}
    local skillId = 0
    if isAuto then
    else
        DialogUtil:show(
            unitEvent.trigUnitOwnerId,
            "选择技能",
            function(____, i, text)
                self:LearnSkill(unitEvent.trigUnit, skillId)
            end,
            table.unpack(buttonTexts)
        )
    end
end
function _____9009_62E9_6280_80FD.prototype.LearnSkill(self, unit, skillId)
    SelectHeroSkill(unit, skillId)
end
function _____9009_62E9_6280_80FD.prototype.AutoSelectSkill(self)
end
return ____exports
