local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 7,["8"] = 7,["9"] = 7,["11"] = 7,["12"] = 13,["13"] = 13,["14"] = 13,["16"] = 14,["17"] = 15,["19"] = 17,["20"] = 13,["21"] = 20,["22"] = 22,["23"] = 22,["24"] = 22,["25"] = 22,["26"] = 20,["27"] = 29,["28"] = 29,["29"] = 29,["31"] = 30,["32"] = 31,["35"] = 34,["36"] = 35,["37"] = 36,["38"] = 36,["39"] = 36,["40"] = 37,["41"] = 38,["42"] = 39,["43"] = 36,["44"] = 36,["45"] = 29,["46"] = 49,["47"] = 50,["48"] = 51,["51"] = 54,["52"] = 55,["53"] = 56,["54"] = 56,["55"] = 56,["56"] = 57,["57"] = 58,["58"] = 60,["59"] = 61,["60"] = 56,["61"] = 56,["62"] = 49,["63"] = 76,["64"] = 77,["65"] = 78,["68"] = 81,["69"] = 82,["70"] = 83,["71"] = 84,["72"] = 84,["73"] = 84,["74"] = 85,["75"] = 86,["76"] = 88,["77"] = 90,["78"] = 91,["79"] = 92,["80"] = 93,["82"] = 95,["83"] = 97,["86"] = 101,["87"] = 102,["88"] = 103,["89"] = 104,["90"] = 105,["92"] = 107,["93"] = 108,["95"] = 110,["96"] = 112,["97"] = 84,["98"] = 84,["99"] = 76,["100"] = 119,["101"] = 119,["102"] = 119,["104"] = 120,["105"] = 121,["106"] = 122,["107"] = 123,["109"] = 124,["110"] = 124,["111"] = 125,["112"] = 126,["113"] = 127,["115"] = 129,["116"] = 130,["117"] = 135,["118"] = 135,["119"] = 135,["120"] = 135,["121"] = 124,["124"] = 119,["125"] = 8,["126"] = 69});
local ____exports = {}
____exports.default = __TS__Class()
local SyncUtil = ____exports.default
SyncUtil.name = "SyncUtil"
function SyncUtil.prototype.____constructor(self)
end
function SyncUtil.syncData(key, data)
    if data == nil then
        data = ""
    end
    if #data > ____exports.default.data_length_max then
        log.error("同步数据的长度超过976!可能会无法同步成功！")
    end
    DzSyncData(key, data)
end
function SyncUtil.syncObjData(key, data)
    DzSyncData(
        key,
        JSON:stringify(data)
    )
end
function SyncUtil.onSyncData(key, actionFunc, isServer)
    if isServer == nil then
        isServer = false
    end
    if isAsync then
        log.errorWithTraceBack("不能在异步中调用此方法！请在同步方法中执行！")
        return
    end
    local trigger = CreateTrigger()
    DzTriggerRegisterSyncData(trigger, key, isServer)
    TriggerAddAction(
        trigger,
        function()
            local triggerPlayer = DzGetTriggerSyncPlayer()
            local data = DzGetTriggerSyncData()
            actionFunc(nil, triggerPlayer, data)
        end
    )
end
function SyncUtil.onSyncObjData(key, actionFunc)
    if isAsync then
        log.errorWithTraceBack("不能在异步中调用此方法！请在同步方法中执行！")
        return
    end
    local trigger = CreateTrigger()
    DzTriggerRegisterSyncData(trigger, key, false)
    TriggerAddAction(
        trigger,
        function()
            local triggerPlayer = DzGetTriggerSyncPlayer()
            local dataStr = DzGetTriggerSyncData()
            local data = JSON:parse(dataStr)
            actionFunc(nil, triggerPlayer, data)
        end
    )
end
function SyncUtil.onSyncBigData(key, actionFunc)
    if isAsync then
        log.errorWithTraceBack("不能在异步中调用此方法！请在同步方法中执行！")
        return
    end
    key = "SL:BD:" .. key
    local trigger = CreateTrigger()
    DzTriggerRegisterSyncData(trigger, key, false)
    TriggerAddAction(
        trigger,
        function()
            local triggerPlayer = DzGetTriggerSyncPlayer()
            local dataStr = DzGetTriggerSyncData()
            local dataPacket = JSON:parse(dataStr)
            local keyDataPackets = ____exports.default.bigDataBuffer[key]
            if not keyDataPackets then
                keyDataPackets = {}
                ____exports.default.bigDataBuffer[key] = keyDataPackets
            end
            keyDataPackets[#keyDataPackets + 1] = dataPacket
            if #keyDataPackets < dataPacket.t then
                return
            end
            local bigData = ""
            local index = 0
            for ____, keyDataPacket in ipairs(keyDataPackets) do
                if keyDataPacket.i ~= index then
                    print((("数据包错乱:No." .. tostring(index)) .. " = ") .. tostring(keyDataPacket.i))
                end
                bigData = bigData .. keyDataPacket.d
                index = index + 1
            end
            actionFunc(nil, triggerPlayer, bigData)
            ____exports.default.bigDataBuffer[key] = {}
        end
    )
end
function SyncUtil.syncBigData(key, data)
    if data == nil then
        data = ""
    end
    key = "SL:BD:" .. key
    local oneDataMaxSize = ____exports.default.data_length_max - 276
    local length = #data
    local keyLength = math.floor(length / oneDataMaxSize) + 1
    do
        local i = 0
        while i < keyLength do
            local endIndex = (i + 1) * oneDataMaxSize
            if endIndex > length then
                endIndex = length
            end
            local oneData = __TS__StringSubstring(data, i * oneDataMaxSize, endIndex)
            local dataPacket = {i = i, t = keyLength, d = oneData}
            DzSyncData(
                key,
                JSON:stringify(dataPacket)
            )
            i = i + 1
        end
    end
end
SyncUtil.data_length_max = 976
SyncUtil.bigDataBuffer = {}
return ____exports
