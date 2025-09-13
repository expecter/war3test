local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 7,["8"] = 8,["9"] = 8,["10"] = 9,["11"] = 9,["12"] = 10,["13"] = 10,["14"] = 11,["15"] = 11,["16"] = 12,["17"] = 12,["18"] = 13,["19"] = 13,["20"] = 15,["21"] = 17,["22"] = 17,["23"] = 17,["25"] = 28,["26"] = 26,["27"] = 32,["28"] = 33,["31"] = 36,["32"] = 38,["33"] = 40,["34"] = 42,["37"] = 47,["38"] = 49,["39"] = 51,["40"] = 55,["41"] = 55,["42"] = 55,["43"] = 56,["44"] = 57,["45"] = 58,["46"] = 59,["47"] = 60,["48"] = 60,["49"] = 60,["50"] = 60,["51"] = 60,["52"] = 60,["53"] = 60,["54"] = 55,["55"] = 55,["56"] = 63,["57"] = 63,["58"] = 63,["59"] = 64,["60"] = 64,["61"] = 64,["62"] = 65,["63"] = 66,["64"] = 67,["65"] = 65,["66"] = 69,["67"] = 64,["68"] = 64,["69"] = 63,["70"] = 63,["71"] = 32,["72"] = 77,["73"] = 80,["74"] = 81,["75"] = 82,["76"] = 82,["77"] = 84,["78"] = 84,["79"] = 86,["80"] = 87,["81"] = 86,["82"] = 89,["83"] = 90,["84"] = 89,["85"] = 93,["86"] = 94,["87"] = 93,["89"] = 99,["90"] = 100,["91"] = 102,["92"] = 104,["93"] = 105,["94"] = 104,["95"] = 108,["96"] = 109,["97"] = 108,["98"] = 112,["99"] = 113,["100"] = 114,["102"] = 116,["104"] = 112,["105"] = 121,["106"] = 122,["107"] = 121,["108"] = 126,["109"] = 128,["110"] = 130,["111"] = 131,["112"] = 132,["113"] = 133,["114"] = 126,["115"] = 136,["116"] = 137,["117"] = 136,["118"] = 139,["119"] = 140,["120"] = 139,["121"] = 145,["122"] = 146,["123"] = 145,["124"] = 151,["125"] = 152,["126"] = 151,["127"] = 155,["128"] = 156,["129"] = 157,["131"] = 159,["132"] = 161,["133"] = 162,["135"] = 165,["136"] = 155,["137"] = 168,["138"] = 169,["139"] = 170,["141"] = 172,["142"] = 173,["143"] = 168,["144"] = 176,["145"] = 177,["146"] = 178,["147"] = 176,["148"] = 183,["151"] = 192,["154"] = 185,["155"] = 186,["156"] = 187,["158"] = 189,["165"] = 183,["166"] = 199,["167"] = 199,["168"] = 205,["169"] = 206,["170"] = 205,["171"] = 222,["172"] = 223,["173"] = 222,["174"] = 226,["175"] = 227,["176"] = 226,["177"] = 233,["178"] = 234,["179"] = 235,["181"] = 237,["182"] = 233,["183"] = 239,["184"] = 240,["185"] = 241,["187"] = 243,["188"] = 239,["189"] = 77,["190"] = 18,["191"] = 21});
local ____exports = {}
local YiYiBase = require("solar.solar-wc3.lib.compatible.yiyi.YiYiApi")
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____DateUtil = require("solar.solar-common.util.lang.DateUtil")
local DateUtil = ____DateUtil.default
local CJ = require("jass.common")
____exports.default = __TS__Class()
local YiYiImplementDz = ____exports.default
YiYiImplementDz.name = "YiYiImplementDz"
function YiYiImplementDz.prototype.____constructor(self)
    ____exports.default:init()
end
function YiYiImplementDz.init(self)
    if ____exports.default.is_init then
        return
    end
    ____exports.default.is_init = true
    for gk in pairs(YiYiBase) do
        if __TS__StringStartsWith(gk, "YDWE") or __TS__StringStartsWith(gk, "YY") or __TS__StringStartsWith(gk, "Player") then
            _G[gk] = YiYiBase[gk]
        end
    end
    local hook = require("jass.hook")
    ____exports.default:_sl_implementDz(_G)
    ____exports.default:_sl_implementDz(hook)
    se:playerChat(
        "-maplv",
        function(pl)
            local level = DzAPI_Map_GetMapLevel(pl)
            local _tt = DataBase:getPlayerSolarData(pl, true)._tt or 0
            local info = (("你的地图经验为:" .. tostring(_tt)) .. "; 地图等级为:") .. tostring(level)
            print(info)
            DisplayTimedTextToPlayer(
                pl,
                0,
                0,
                10,
                info
            )
        end
    )
    BaseUtil.runLater(
        1800,
        function()
            BaseUtil.onTimer(
                300,
                function()
                    PlayerUtil:forPlayingPlayers(function(____, player)
                        local _tt = (DataBase:getPlayerSolarData(player)._tt or 0) + math.floor(_g_time / 1000 / 60)
                        ArchiveUtil:set(player, "_tt", _tt)
                    end)
                    return true
                end
            )
        end
    )
end
function YiYiImplementDz._sl_implementDz(self, env)
    env.DzAPI_Map_GetServerValue = YiYiBase.YDWERPGGetRemoteData
    env.DzAPI_Map_SaveServerValue = YiYiBase.YDWESaveRemoteData
    env.KKApiBeginBatchSaveArchive = function()
    end
    env.KKApiEndBatchSaveArchive = function()
    end
    env.KKApiAddBatchSaveArchive = function(whichPlayer, key, value, caseInsensitive)
        YiYiBase.YDWESaveRemoteData(whichPlayer, key, value)
    end
    env.DzAPI_Map_FlushStoredMission = function(whichPlayer, key)
        YiYiBase.YDWESaveRemoteData(whichPlayer, key, "")
    end
    env.GetPlayerServerValueSuccess = function(whichPlayer)
        return true
    end
    --- 获取游戏开始时间
    local startTime = EXNetGetTime()
    local dzGameStartTime = DateUtil:parseDate(startTime)
    dzGameStartTime = math.floor((dzGameStartTime + 5) / 10) * 10
    env.DzAPI_Map_GetGameStartTime = function()
        return dzGameStartTime
    end
    env.DzAPI_Map_GetMapConfig = function(key)
        return YDWERPGGetMapConfig(key)
    end
    env.GetPlayerName = function(pl)
        if EXGetPlayerRealName then
            return EXGetPlayerRealName(pl)
        else
            return CJ.GetPlayerName(pl)
        end
    end
    env.GetGuildName = function(pl)
        return ""
    end
    env.DzAPI_Map_GetMapLevel = function(pl)
        ArchiveUtil:getAllArchive(pl)
        local _tt = DataBase:getPlayerSolarData(pl, true)._tt or 0
        local th = math.floor(_tt / 60)
        local lv = math.floor(math.sqrt(th))
        return 1 + lv
    end
    env.DzAPI_Map_MapsTotalPlayed = function(pl)
        return 1
    end
    env.DzAPI_Map_GetMapLevelRank = function(pl)
        return 0
    end
    env.DzAPI_Map_PlayedGames = function(pl)
        return 1
    end
    env.DzAPI_Map_Returns = function(pl)
        return false
    end
    env.DzAPI_Map_HasMallItem = function(pl, key)
        if key == nil then
            return false
        end
        key = ____exports.default.config.keyMap[key] or key
        if YDWERPGBillingHasStatus(pl, key) then
            return true
        end
        return YDWERPGBillingGetItem(pl, key) > 0
    end
    env.DzAPI_Map_GetMallItemCount = function(pl, key)
        if key == nil then
            return 0
        end
        key = ____exports.default.config.keyMap[key] or key
        return YDWERPGBillingGetItem(pl, key)
    end
    env.DzAPI_Map_ConsumeMallItem = function(pl, key, num)
        key = ____exports.default.config.keyMap[key] or key
        return EXNetUseItem(pl, key, num)
    end
    env.DzAPI_Map_Stat_SetStat = function(pl, key, val)
        do
            local function ____catch(e)
                print(e)
            end
            local ____try, ____hasReturned = pcall(function()
                local num = tonumber(val)
                if LangUtil:isNumber(num) then
                    YDWERPGSetKey(pl, key, num)
                else
                    log.errorWithTraceBack("设置房间显示数据 (11平台只能设置数字)")
                end
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
    end
    env.DzAPI_Map_OrpgTrigger = function(pl, key)
    end
    env.DzAPI_Map_GetServerArchiveDrop = function(pl, key)
        return ""
    end
    env.DzAPI_Map_GetForumData = function(pl, whichData)
        return 0
    end
    env.DzAPI_Map_ContinuousCount = function(pl, id)
        return 0
    end
    env.RequestExtraIntegerData = function(dataType, whichPlayer, param1, param2, param3, param4, param5, param6)
        if dataType == 41 then
            return DzAPI_Map_GetMallItemCount(whichPlayer, param1)
        end
        return 0
    end
    env.RequestExtraBooleanData = function(dataType, whichPlayer, param1, param2, param3, param4, param5, param6)
        if dataType == 42 then
            return DzAPI_Map_ConsumeMallItem(whichPlayer, param1, param4)
        end
        return false
    end
end
YiYiImplementDz.is_init = false
YiYiImplementDz.config = {keyMap = {}}
return ____exports
