local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 5,["16"] = 7,["17"] = 6,["18"] = 10,["19"] = 11,["20"] = 12,["21"] = 13,["22"] = 14,["23"] = 15,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 15,["28"] = 15,["29"] = 15,["30"] = 16,["31"] = 16,["32"] = 16,["33"] = 16,["34"] = 17,["35"] = 18,["37"] = 11,["38"] = 10});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272 = require("state.基础.开局选择英雄角色")
local _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272 = _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272.default
____exports.default = __TS__Class()
local AutoTest = ____exports.default
AutoTest.name = "AutoTest"
function AutoTest.prototype.____constructor(self)
    self:autoSelectHero()
end
function AutoTest.prototype.autoSelectHero(self)
    PlayerUtil:forPlayingPlayers(function(____, player)
        if GetPlayerController(player) == MAP_CONTROL_USER then
            local unitIds = RandomUtil.getRandomKeysByWeight(_____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272.cfg.optionSize, _____5F00_5C40_9009_62E9_82F1_96C4_89D2_8272.cfg.unitIdWeights)
            local loc = GetPlayerStartLocationLoc(player)
            local unit = CreateUnit(
                player,
                unitIds[1],
                GetLocationX(loc),
                GetLocationY(loc),
                0
            )
            print(
                "选择的英雄",
                GetPlayerId(player)
            )
            se:emit("选择英雄", unit)
            sd(nil, player).hero = unit
        end
    end)
end
return ____exports
