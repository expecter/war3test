local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 3,["7"] = 3,["8"] = 4,["9"] = 4,["10"] = 5,["11"] = 5,["12"] = 16,["13"] = 16,["14"] = 16,["16"] = 16,["17"] = 36,["18"] = 37,["19"] = 38,["20"] = 39,["21"] = 40,["23"] = 42,["24"] = 36,["25"] = 49,["26"] = 50,["27"] = 50,["28"] = 49,["29"] = 54,["30"] = 55,["31"] = 56,["32"] = 57,["34"] = 59,["35"] = 60,["36"] = 61,["37"] = 63,["38"] = 64,["39"] = 65,["40"] = 66,["41"] = 67,["44"] = 71,["45"] = 71,["46"] = 71,["47"] = 71,["48"] = 72,["49"] = 73,["50"] = 74,["52"] = 77,["53"] = 78,["54"] = 79,["58"] = 83,["59"] = 85,["60"] = 86,["61"] = 88,["62"] = 89,["63"] = 90,["64"] = 91,["66"] = 93,["67"] = 93,["68"] = 93,["69"] = 93,["70"] = 94,["71"] = 94,["72"] = 95,["73"] = 100,["74"] = 102,["75"] = 103,["79"] = 108,["80"] = 109,["81"] = 110,["83"] = 112,["84"] = 113,["85"] = 114,["86"] = 115,["89"] = 118,["90"] = 54,["91"] = 121,["92"] = 122,["95"] = 125,["96"] = 127,["97"] = 128,["99"] = 131,["100"] = 132,["101"] = 133,["102"] = 134,["103"] = 135,["104"] = 134,["106"] = 138,["107"] = 139,["108"] = 140,["109"] = 142,["111"] = 144,["112"] = 138,["114"] = 148,["115"] = 149,["116"] = 150,["117"] = 151,["118"] = 152,["119"] = 153,["120"] = 154,["121"] = 155,["124"] = 158,["125"] = 151,["127"] = 161,["128"] = 162,["129"] = 163,["130"] = 164,["131"] = 165,["134"] = 168,["135"] = 161,["138"] = 121,["139"] = 20,["140"] = 23,["141"] = 26,["142"] = 29});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ActorTypeBuildUtil = require("solar.solar-common.actor.util.ActorTypeBuildUtil")
local ActorTypeBuildUtil = ____ActorTypeBuildUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
____exports.default = __TS__Class()
local MessageUtil = ____exports.default
MessageUtil.name = "MessageUtil"
function MessageUtil.prototype.____constructor(self)
end
function MessageUtil.addHookEventCallBack(self, ____type, callBack)
    local callBacks = ____exports.default.hookEventCallBacks[____type]
    if callBacks == nil then
        callBacks = {}
        ____exports.default.hookEventCallBacks[____type] = callBacks
    end
    callBacks[#callBacks + 1] = callBack
end
function MessageUtil.addWindowEventCallBack(self, callBack)
    local ____exports_default_windowEventCallBacks_0 = ____exports.default.windowEventCallBacks
    ____exports_default_windowEventCallBacks_0[#____exports_default_windowEventCallBacks_0 + 1] = callBack
end
function MessageUtil._sl_onHookMsg(self, msg)
    local ____type = msg.type
    if ____type == nil then
        return true
    end
    if ____type == "key_down" then
        ____exports.default._sl_lastReleaseItem = nil
    elseif ____type == "mouse_ability" and msg.ability ~= nil then
        if (1096114805 == msg.ability or 1095262837 == msg.ability) and msg.code == 1 then
            local unitIdStr = id2string(msg.order)
            local zwActorType = ActorTypeBuildUtil.zwId2UnitIdMap[unitIdStr]
            if zwActorType and ActorTypeBuildUtil:isLocalPlayerActorUnitTypeDisableState(zwActorType.id) then
                return false
            end
        else
            local actor = ActorAbilityUtil:getActorAbilityByBaseId(
                id2string(msg.ability),
                selection()
            )
            if actor ~= nil then
                if actor:isPassive() or actor:isDisable() or actor:isHide() then
                    return false
                end
                local b = actor:localClick(msg.code == 4 and 2 or 1, msg.x, msg.y)
                if b == false then
                    return false
                end
            end
        end
    elseif ____type == "mouse_item" then
        local order = msg.order
        local itemIndex = order - 852008
        if msg.code == 4 then
            ____exports.default._sl_lastReleaseItem = itemIndex
        elseif ____exports.default._sl_lastReleaseItem ~= nil then
            ____exports.default._sl_lastReleaseItem = nil
        end
        local item = UnitItemInSlot(
            selection(),
            itemIndex
        )
        local ____opt_1 = DataBase:getItemSolarData(item, false)
        local actor = ____opt_1 and ____opt_1._SL_solarActorItem
        if actor ~= nil then
            local b = actor:localClick(msg.code == 4 and 2 or 1, msg.x, msg.y)
            if b == false then
                return false
            end
        end
    end
    local hookEventCallBacks = ____exports.default.hookEventCallBacks[____type]
    if hookEventCallBacks == nil then
        return true
    end
    for ____, callBack in ipairs(hookEventCallBacks) do
        local f = callBack(msg)
        if f == false then
            return f
        end
    end
    return true
end
function MessageUtil._sl_init_message_hook(self)
    if ____exports.default._sl_isInitialized then
        return
    end
    ____exports.default._sl_isInitialized = true
    if isEmbedJapi == false and isDebug then
        print("提示：部分we注册message.hook事件会导致释放技能崩溃!(标准ydwe不会！)")
    end
    local message = require("jass.message")
    local hook = message.hook
    if hook == nil then
        message.hook = function(msg)
            return ____exports.default:_sl_onHookMsg(msg)
        end
    else
        message.hook = function(msg)
            local flag = ____exports.default:_sl_onHookMsg(msg)
            if flag == false then
                return flag
            end
            return hook(msg)
        end
    end
    if isEmbedJapi then
        local oldWindowEventCallBack = _G.WindowEventCallBack
        if oldWindowEventCallBack == nil then
            _G.WindowEventCallBack = function(eventId)
                for ____, windowEventCallBack in ipairs(____exports.default.windowEventCallBacks) do
                    local flag = windowEventCallBack(eventId)
                    if flag == true then
                        return true
                    end
                end
                return false
            end
        else
            _G.WindowEventCallBack = function(eventId)
                for ____, windowEventCallBack in ipairs(____exports.default.windowEventCallBacks) do
                    local flag = windowEventCallBack(eventId)
                    if flag == true then
                        return true
                    end
                end
                return oldWindowEventCallBack(eventId)
            end
        end
    end
end
MessageUtil.hookEventCallBacks = {}
MessageUtil.windowEventCallBacks = {}
MessageUtil._sl_isInitialized = false
MessageUtil._sl_lastReleaseItem = nil
return ____exports
