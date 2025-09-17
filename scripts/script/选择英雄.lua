local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 7,["17"] = 7,["18"] = 7,["20"] = 22,["21"] = 22,["22"] = 22,["23"] = 23,["24"] = 24,["25"] = 25,["27"] = 23,["28"] = 22,["29"] = 22,["30"] = 21,["31"] = 31,["32"] = 32,["33"] = 34,["35"] = 35,["36"] = 35,["37"] = 36,["38"] = 35,["41"] = 38,["42"] = 39,["43"] = 40,["44"] = 41,["46"] = 43,["47"] = 44,["49"] = 46,["50"] = 46,["51"] = 46,["52"] = 46,["53"] = 47,["54"] = 48,["56"] = 50,["58"] = 46,["59"] = 46,["60"] = 46,["62"] = 31,["63"] = 56,["64"] = 57,["65"] = 58,["66"] = 58,["67"] = 58,["68"] = 58,["69"] = 58,["70"] = 58,["71"] = 58,["72"] = 59,["73"] = 60,["74"] = 56,["75"] = 14});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DialogUtil = require("solar.solar-common.util.game.DialogUtil")
local DialogUtil = ____DialogUtil.default
local ____ObjectDataUtil = require("solar.solar-common.util.object.ObjectDataUtil")
local ObjectDataUtil = ____ObjectDataUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
____exports.default = __TS__Class()
local _____9009_62E9_82F1_96C4 = ____exports.default
_____9009_62E9_82F1_96C4.name = "选择英雄"
function _____9009_62E9_82F1_96C4.prototype.____constructor(self)
    BaseUtil.runLater(
        ____exports.default.cfg.timeOut,
        function()
            PlayerUtil:forPlayingPlayers(function(____, player)
                if GetPlayerController(player) == MAP_CONTROL_USER then
                    ____exports.default:showDialog(player)
                end
            end)
        end
    )
end
function _____9009_62E9_82F1_96C4.showDialog(self, player)
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
    if isAuto then
        ____exports.default:SelectHero(player, unitIds[1])
    else
        DialogUtil:show(
            GetPlayerId(player),
            "选择角色",
            function(____, i, text)
                if i == #unitIds then
                    ____exports.default:showDialog(player)
                else
                    ____exports.default:SelectHero(player, unitIds[i + 1])
                end
            end,
            table.unpack(buttonTexts)
        )
    end
end
function _____9009_62E9_82F1_96C4.SelectHero(self, player, key)
    local loc = GetPlayerStartLocationLoc(player)
    local unit = CreateUnit(
        player,
        key,
        GetLocationX(loc),
        GetLocationY(loc),
        0
    )
    se:emit("选择英雄", unit)
    sd(nil, player).hero = unit
end
_____9009_62E9_82F1_96C4.cfg = {unitIdWeights = {}, optionSize = 3, freeRefreshCount = 1, timeOut = 0.2}
return ____exports
