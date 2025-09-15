local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 7,["17"] = 7,["18"] = 7,["20"] = 22,["21"] = 22,["22"] = 22,["23"] = 23,["24"] = 25,["25"] = 23,["26"] = 22,["27"] = 22,["28"] = 21,["29"] = 32,["30"] = 35,["31"] = 37,["33"] = 38,["34"] = 38,["35"] = 39,["36"] = 38,["39"] = 41,["40"] = 42,["41"] = 43,["42"] = 44,["44"] = 47,["45"] = 47,["46"] = 47,["47"] = 47,["48"] = 48,["49"] = 49,["51"] = 51,["52"] = 52,["53"] = 52,["54"] = 52,["55"] = 52,["56"] = 52,["57"] = 52,["58"] = 52,["59"] = 53,["60"] = 54,["62"] = 47,["63"] = 47,["64"] = 47,["65"] = 32,["66"] = 14});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____DialogUtil = require("solar.solar-common.util.game.DialogUtil")
local DialogUtil = ____DialogUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____ObjectDataUtil = require("solar.solar-common.util.object.ObjectDataUtil")
local ObjectDataUtil = ____ObjectDataUtil.default
____exports.default = __TS__Class()
local _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272 = ____exports.default
_____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272.name = "开局选择英雄角色"
function _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272.prototype.____constructor(self)
    BaseUtil.runLater(
        ____exports.default.cfg.timeOut,
        function()
            PlayerUtil:forPlayingPlayers(function(____, player)
                ____exports.default:showDialog(player)
            end)
        end
    )
end
function _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272.showDialog(self, player)
    local buttonTexts = {}
    local unitIds = RandomUtil.getRandomKeysByWeight(____exports.default.cfg.optionSize, ____exports.default.cfg.unitIdWeights)
    do
        local i = 0
        while i < #unitIds do
            buttonTexts[#buttonTexts + 1] = ObjectDataUtil:getUnitName(unitIds[i + 1])
            i = i + 1
        end
    end
    local d = sd(nil, player)
    d["开局选择英雄角色随机次数"] = (d["开局选择英雄角色随机次数"] or 0) + 1
    if d["开局选择英雄角色随机次数"] <= ____exports.default.cfg.freeRefreshCount then
        buttonTexts[#buttonTexts + 1] = "【|cff00ff00重随|r】"
    end
    DialogUtil:show(
        GetPlayerId(player),
        "选择角色",
        function(____, i, text)
            if i == #unitIds then
                ____exports.default:showDialog(player)
            else
                local loc = GetPlayerStartLocationLoc(player)
                local unit = CreateUnit(
                    player,
                    unitIds[i + 1],
                    GetLocationX(loc),
                    GetLocationY(loc),
                    0
                )
                se:emit("选择英雄", unit)
                sd(nil, player).hero = unit
            end
        end,
        table.unpack(buttonTexts)
    )
end
_____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272.cfg = {unitIdWeights = {}, optionSize = 3, freeRefreshCount = 1, timeOut = 0.2}
return ____exports
