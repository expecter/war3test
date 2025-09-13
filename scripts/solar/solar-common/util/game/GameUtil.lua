local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 3,["13"] = 9,["14"] = 9,["15"] = 9,["17"] = 9,["18"] = 9,["20"] = 10,["21"] = 11,["22"] = 11,["23"] = 11,["24"] = 11,["25"] = 11,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 13,["31"] = 10,["32"] = 9,["33"] = 21,["34"] = 21,["35"] = 21,["37"] = 21,["38"] = 21,["40"] = 22,["41"] = 23,["42"] = 24,["43"] = 25,["45"] = 22,["46"] = 21,["47"] = 33,["48"] = 33,["49"] = 33,["51"] = 34,["52"] = 34,["53"] = 34,["54"] = 34,["55"] = 34,["56"] = 34,["57"] = 35,["58"] = 33,["59"] = 42,["60"] = 43,["61"] = 42,["62"] = 51,["63"] = 51,["64"] = 51,["66"] = 51,["67"] = 51,["69"] = 52,["70"] = 53,["71"] = 51,["72"] = 61,["73"] = 61,["74"] = 61,["76"] = 62,["77"] = 63,["78"] = 63,["79"] = 63,["80"] = 63,["81"] = 63,["82"] = 63,["83"] = 62,["84"] = 65,["85"] = 66,["86"] = 67,["88"] = 61,["89"] = 76,["90"] = 76,["91"] = 76,["93"] = 77,["94"] = 77,["95"] = 77,["96"] = 77,["97"] = 77,["98"] = 77,["99"] = 77,["100"] = 77,["101"] = 77,["102"] = 76,["103"] = 83,["105"] = 84,["106"] = 84,["107"] = 85,["108"] = 86,["109"] = 87,["111"] = 84,["114"] = 83,["115"] = 97,["116"] = 98,["117"] = 99,["118"] = 97});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local GameUtil = ____exports.default
GameUtil.name = "GameUtil"
function GameUtil.prototype.____constructor(self)
end
function GameUtil.victorys(self, msg, endGame)
    if msg == nil then
        msg = "游戏胜利!"
    end
    if endGame == nil then
        endGame = true
    end
    PlayerUtil:forPlayingPlayers(function(____, player)
        DisplayTimedTextToPlayer(
            player,
            0,
            0,
            30,
            msg
        )
        if endGame then
            CustomVictoryBJ(player, true, true)
        end
    end)
end
function GameUtil.defeats(self, msg, endGame)
    if msg == nil then
        msg = "游戏失败!"
    end
    if endGame == nil then
        endGame = true
    end
    PlayerUtil:forPlayingPlayers(function(____, player)
        DisplayTextToPlayer(player, 0, 0, msg)
        if endGame then
            CustomDefeatBJ(player, msg)
        end
    end)
end
function GameUtil.gameOver(self, msg)
    if msg == nil then
        msg = "游戏结束!"
    end
    DisplayTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        msg
    )
    PauseAllUnitsBJ(true)
end
function GameUtil.closeWorldFogBoundary(self)
    EnableWorldFogBoundary(false)
end
function GameUtil.setTimeOfDay(self, timeOfDay, scale)
    if timeOfDay == nil then
        timeOfDay = 12
    end
    if scale == nil then
        scale = 0
    end
    SetFloatGameState(GAME_STATE_TIME_OF_DAY, timeOfDay)
    SetTimeOfDayScale(scale)
end
function GameUtil.openFullMapView(self, maskEnableOff)
    if maskEnableOff == nil then
        maskEnableOff = false
    end
    PlayerUtil:forPlayingPlayers(function(____, p)
        CreateFogModifierRectBJ(
            true,
            p,
            FOG_OF_WAR_VISIBLE,
            GetPlayableMapRect()
        )
    end)
    FogEnableOff()
    if maskEnableOff then
        FogMaskEnableOff()
    end
end
function GameUtil.setTerrainFog(self, zstart, zend)
    if zend == nil then
        zend = zstart + 1000
    end
    SetTerrainFogEx(
        0,
        zstart,
        zend,
        0.5,
        0,
        0,
        0
    )
end
function GameUtil.openComputerPlayerGivesBounty(self)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_COMPUTER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                SetPlayerState(tempPlayer, PLAYER_STATE_GIVES_BOUNTY, 1)
            end
            i = i + 1
        end
    end
end
function GameUtil.getTerrainHeight(self, x, y)
    MoveLocation(tempLocation, x, y)
    return GetLocationZ(tempLocation)
end
return ____exports
