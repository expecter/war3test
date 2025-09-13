local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 8,["13"] = 8,["14"] = 8,["16"] = 8,["17"] = 13,["18"] = 14,["19"] = 16,["20"] = 17,["21"] = 18,["22"] = 19,["23"] = 20,["24"] = 21,["25"] = 22,["26"] = 23,["27"] = 16,["28"] = 25,["29"] = 26,["30"] = 13,["31"] = 29,["32"] = 30,["33"] = 31,["34"] = 31,["35"] = 31,["36"] = 32,["37"] = 31,["38"] = 31,["39"] = 34,["40"] = 35,["41"] = 36,["42"] = 37,["44"] = 39,["46"] = 29,["47"] = 44,["48"] = 45,["51"] = 48,["52"] = 49,["54"] = 44,["55"] = 53,["56"] = 54,["59"] = 57,["60"] = 58,["61"] = 59,["65"] = 53,["66"] = 65,["67"] = 66,["70"] = 69,["71"] = 70,["72"] = 71,["76"] = 65,["77"] = 77,["78"] = 78,["79"] = 79,["81"] = 81,["82"] = 82,["84"] = 84,["85"] = 86,["86"] = 90,["89"] = 94,["90"] = 77,["91"] = 10});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local DebugConfigUtil = ____exports.default
DebugConfigUtil.name = "DebugConfigUtil"
function DebugConfigUtil.prototype.____constructor(self)
end
function DebugConfigUtil.checkBug(self)
    ____exports.default.noIdInfo = {}
    ActorTypeUtil:forAllActorTypes(function(____, actorType)
        ____exports.default:checkIdMap(actorType.id .. "掉落", actorType.bountyItems)
        ____exports.default:checkIdMap(actorType.id .. "死亡诞生", actorType.afterDeathBirthUnits)
        ____exports.default:checkIdList(actorType.id .. "售卖物品", actorType.sellItems)
        ____exports.default:checkIdList(actorType.id .. "技能", actorType.abilities)
        ____exports.default:checkIdList(actorType.id .. "建造列表", actorType.builds)
        ____exports.default:checkIdList(actorType.id .. "升级", actorType.upgradeUnits)
        ____exports.default:checkIdList(actorType.id .. "训练", actorType.trainUnits)
    end)
    se:emit("checkBug")
    ____exports.default:printInfo()
end
function DebugConfigUtil.printInfo(self)
    local info = ""
    LangUtil:forEachSort(
        ____exports.default.noIdInfo,
        function(____, k, v)
            info = info .. ((tostring(v) .. "引用的[") .. tostring(k)) .. "]类型不存在!|n\r\n"
        end
    )
    if #info > 0 then
        PlayerUtil:message("|cffff0000发现bug了!请查看报错日志!")
        print(info)
        log.errorWithTraceBack(info)
    else
        PlayerUtil:message("|cff00ff00排查bug完毕!未发现bug!")
    end
end
function DebugConfigUtil.checkId(self, title, id)
    if id == nil then
        return
    end
    if not ____exports.default:hasId(id) then
        ____exports.default.noIdInfo[id] = title
    end
end
function DebugConfigUtil.checkIdList(self, title, ids)
    if ids == nil then
        return
    end
    for ____, id in ipairs(ids) do
        if not ____exports.default:hasId(id) then
            ____exports.default.noIdInfo[id] = title
            return
        end
    end
end
function DebugConfigUtil.checkIdMap(self, title, idMap)
    if idMap == nil then
        return
    end
    for id in pairs(idMap) do
        if not ____exports.default:hasId(id) then
            ____exports.default.noIdInfo[id] = title
            return
        end
    end
end
function DebugConfigUtil.hasId(self, id)
    if id == nil then
        return false
    end
    if ActorTypeUtil:hasActorType(id) then
        return true
    end
    if _g_objs.unit then
        if _g_objs.unit[id] or _g_objs.item[id] or _g_objs.ability[id] then
            return true
        end
    end
    return false
end
DebugConfigUtil.noIdInfo = {}
return ____exports
