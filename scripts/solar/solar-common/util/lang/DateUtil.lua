local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringReplaceAll = ____lualib.__TS__StringReplaceAll
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["12"] = 1,["13"] = 7,["14"] = 8,["15"] = 9,["16"] = 11,["17"] = 12,["19"] = 14,["20"] = 7,["21"] = 22,["22"] = 23,["23"] = 24,["24"] = 25,["25"] = 26,["26"] = 29,["27"] = 29,["28"] = 29,["29"] = 29,["30"] = 29,["31"] = 29,["32"] = 29,["33"] = 29,["34"] = 37,["35"] = 38,["36"] = 22,["37"] = 46,["38"] = 46,["39"] = 46,["41"] = 47,["42"] = 46,["43"] = 57,["44"] = 58,["45"] = 57,["46"] = 64,["47"] = 65,["48"] = 64,["49"] = 50});
local ____exports = {}
____exports.default = __TS__Class()
local DateUtil = ____exports.default
DateUtil.name = "DateUtil"
function DateUtil.prototype.____constructor(self)
end
function DateUtil.getGameStartTime(self)
    local gameStartTime = DzAPI_Map_GetGameStartTime()
    if gameStartTime == 0 and isDebug then
        print("使用本地时间!")
        return math.ceil((os.time() + 50) / 100) * 100
    end
    return gameStartTime
end
function DateUtil.parseDate(self, yyyy_mm_dd_H_M_S_DateStr)
    local yyyy_mm_dd_H_M_S = __TS__StringReplaceAll(yyyy_mm_dd_H_M_S_DateStr, "-", "_")
    yyyy_mm_dd_H_M_S = __TS__StringReplaceAll(yyyy_mm_dd_H_M_S, " ", "_")
    yyyy_mm_dd_H_M_S = __TS__StringReplaceAll(yyyy_mm_dd_H_M_S, ":", "_")
    local yyyy_mm_dd_H_M_SArray = __TS__StringSplit(yyyy_mm_dd_H_M_S, "_")
    local dataInfo = {
        year = tonumber(yyyy_mm_dd_H_M_SArray[1]),
        month = tonumber(yyyy_mm_dd_H_M_SArray[2]),
        day = tonumber(yyyy_mm_dd_H_M_SArray[3]),
        hour = tonumber(yyyy_mm_dd_H_M_SArray[4]),
        min = tonumber(yyyy_mm_dd_H_M_SArray[5]),
        sec = tonumber(yyyy_mm_dd_H_M_SArray[6])
    }
    local timeNum = os.time(dataInfo)
    return timeNum
end
function DateUtil.dateTimeToString(self, dateTime, format)
    if format == nil then
        format = "%Y-%m-%d %H:%M:%S"
    end
    return os.date(format, dateTime)
end
function DateUtil.getWeekNumber(self, dateTime)
    return math.ceil(dateTime / ____exports.default.oneWeekTime)
end
function DateUtil.getGameMinutes(self)
    return math.floor(_g_time / 60000)
end
DateUtil.oneWeekTime = 60 * 60 * 24 * 7
return ____exports
