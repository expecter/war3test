local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 11,["11"] = 11,["12"] = 11,["14"] = 11,["15"] = 15,["16"] = 16,["17"] = 17,["18"] = 18,["19"] = 15,["20"] = 21,["21"] = 22,["22"] = 23,["24"] = 25,["25"] = 26,["26"] = 27,["27"] = 28,["28"] = 29,["31"] = 32,["32"] = 33,["33"] = 34,["34"] = 37,["35"] = 38,["37"] = 40,["39"] = 42,["40"] = 44,["41"] = 45,["42"] = 46,["44"] = 48,["45"] = 49,["46"] = 21,["47"] = 12});
local ____exports = {}
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
____exports.default = __TS__Class()
local PlatRandomNumUtil = ____exports.default
PlatRandomNumUtil.name = "PlatRandomNumUtil"
function PlatRandomNumUtil.prototype.____constructor(self)
end
function PlatRandomNumUtil.getRandomNumber(self, whichPlayer, key)
    local nowIndex = ArchiveUtil:get(whichPlayer, "i_" .. key) or 0
    local realKey = (tostring(nowIndex) .. "X") .. key
    return PlatUtil:getBackendLogicIntResult(whichPlayer, realKey)
end
function PlatRandomNumUtil.updateRandomNumber(self, whichPlayer, key, groupkey)
    if not IsHandle(whichPlayer) then
        return false
    end
    local limitKey = (tostring(GetPlayerId(whichPlayer)) .. "_") .. key
    if ____exports.default.limitKey[limitKey] == true then
        log.errorWithTraceBack("一局游戏中不能更新2次随机数!")
        if not isDebug then
            return false
        end
    end
    ____exports.default.limitKey[limitKey] = true
    local nowIndex = ArchiveUtil:get(whichPlayer, "i_" .. key) or 0
    local realKey = (tostring(nowIndex) .. "X") .. key
    if nowIndex == 0 or nowIndex == "0" or nowIndex == "" then
        nowIndex = 1
    else
        nowIndex = 0
    end
    ArchiveUtil:set(whichPlayer, "i_" .. key, nowIndex)
    if not PlatUtil:checkBackendLogicExists(whichPlayer, realKey) then
        PlatUtil:requestBackendLogic(whichPlayer, "0X" .. key, groupkey)
        return PlatUtil:requestBackendLogic(whichPlayer, "1X" .. key, groupkey)
    end
    PlatUtil:removeBackendLogicResult(whichPlayer, realKey)
    return PlatUtil:requestBackendLogic(whichPlayer, realKey, groupkey)
end
PlatRandomNumUtil.limitKey = {}
return ____exports
