local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 11,["26"] = 12,["27"] = 13,["28"] = 15,["29"] = 15,["30"] = 15,["32"] = 15,["33"] = 23,["34"] = 25,["35"] = 26,["36"] = 27,["37"] = 28,["38"] = 29,["39"] = 30,["40"] = 30,["41"] = 30,["42"] = 30,["43"] = 30,["44"] = 30,["45"] = 30,["49"] = 33,["50"] = 34,["51"] = 35,["54"] = 39,["55"] = 40,["56"] = 41,["57"] = 42,["58"] = 43,["59"] = 44,["60"] = 45,["61"] = 46,["63"] = 48,["65"] = 50,["66"] = 51,["67"] = 52,["68"] = 53,["69"] = 54,["70"] = 55,["71"] = 51,["73"] = 59,["76"] = 64,["77"] = 65,["80"] = 61,["81"] = 62,["87"] = 68,["88"] = 68,["89"] = 68,["90"] = 69,["93"] = 76,["96"] = 71,["97"] = 74,["104"] = 68,["105"] = 68,["106"] = 81,["107"] = 82,["108"] = 82,["109"] = 82,["110"] = 82,["111"] = 82,["112"] = 83,["113"] = 84,["114"] = 83,["115"] = 87,["116"] = 88,["117"] = 88,["118"] = 88,["119"] = 88,["120"] = 88,["121"] = 89,["122"] = 90,["123"] = 89,["124"] = 93,["125"] = 94,["126"] = 95,["127"] = 96,["128"] = 23,["129"] = 101,["130"] = 102,["131"] = 103,["132"] = 104,["133"] = 105,["134"] = 101,["135"] = 109,["136"] = 110,["137"] = 109,["138"] = 16,["139"] = 17,["140"] = 21});
local ____exports = {}
local ____Log = require("solar.solar-wc3.common.Log")
local Log = ____Log.default
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____player = require("solar.solar-common.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____ClosureCounter = require("solar.solar-wc3.lib.debug.ClosureCounter")
local ClosureCounter = ____ClosureCounter.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____FrameDebug = require("solar.solar-wc3.lib.debug.FrameDebug")
local FrameDebug = ____FrameDebug.default
local ____HandleDebug = require("solar.solar-wc3.lib.debug.HandleDebug")
local HandleDebug = ____HandleDebug.default
local ____DebugGameUtil = require("solar.solar-common.util.debug.DebugGameUtil")
local DebugGameUtil = ____DebugGameUtil.default
local ____FunctionDebug = require("solar.solar-wc3.lib.debug.FunctionDebug")
local FunctionDebug = ____FunctionDebug.default
local runtime = require("jass.runtime")
local jDebug = require("jass.debug")
local jass = require("jass.common")
____exports.default = __TS__Class()
local Develop = ____exports.default
Develop.name = "Develop"
function Develop.prototype.____constructor(self)
end
function Develop.open(self)
    runtime.debugger = ____exports.default.debuggerPort
    runtime.console = true
    isDebug = true
    if not DzTriggerRegisterSyncData then
        print("本地开发环境DzApi不存在!请检查编辑器与相关辅助程序是否安装正确(请使用推荐的版本),加入QQ群941442872了解更多信息！")
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            5,
            "当前环境无完整Japi！"
        )
    end
    do
        pcall(function()
            require("_SLA_temp")
            local _SL_version_info = "编译版本号:" .. tostring(_G._SL_version_info)
            print(_SL_version_info)
        end)
    end
    if isEmbedJapi then
        local pv = tostring(GetPluginVersion())
        if _G.CreateDoodad then
            pv = pv .. "_sp3"
        elseif _G.DzGetPlayerSelectedHero then
            pv = pv .. "_sp2"
        elseif _G.GetRealSelectItem then
            pv = pv .. "_sp1"
        end
        print("内置Japi版本=" .. pv)
    end
    if ____exports.default.isSocketDebug then
        pcall(function()
            local dbg = require("debugger")
            dbg:io("listen:127.0.0.1:" .. tostring(____exports.default.debuggerPort))
            dbg:start()
            print("启动Lua Socket调试 " .. tostring(____exports.default.debuggerPort))
        end)
    end
    local _require = require
    do
        local function ____catch(e)
            print(e)
            print("提示：更新此地图太阳TS框架可以启用编辑器调试工具插件!")
        end
        local ____try, ____hasReturned = pcall(function()
            local RunConfigMainClass = _require("_sre._sl_egp.main.RunConfigMain").default
            __TS__New(RunConfigMainClass)
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    BaseUtil.runLater(
        0.01,
        function()
            if ____exports.default._sl_egp_enable then
                do
                    local function ____catch(e)
                        print("提示：更新此地图太阳TS框架可以启用编辑器调试工具插件!")
                    end
                    local ____try, ____hasReturned = pcall(function()
                        PACKAGE.path = ((((tostring(local_map_dir_path or "") .. "scripts\\?.lua;") .. tostring(local_map_dir_path or "")) .. "\\?.lua;") .. tostring(PACKAGE.path)) .. ";_sre\\?.lua;"
                        _require("_sl_egp._sl_egp")
                    end)
                    if not ____try then
                        ____catch(____hasReturned)
                    end
                end
            end
        end
    )
    local trigger = __TS__New(Trigger)
    trigger:registerPlayerChatEvent(
        MapPlayer:fromIndex(0),
        "d",
        true
    )
    trigger:addAction(function()
        ____exports.default:showDebugInfo()
    end)
    local trigger2 = __TS__New(Trigger)
    trigger2:registerPlayerChatEvent(
        MapPlayer:fromIndex(0),
        "stop",
        true
    )
    trigger2:addAction(function()
        log.debug("暂停Lua垃圾回收:" .. tostring(collectgarbage("stop")))
    end)
    ClosureCounter:init()
    FrameDebug:init()
    HandleDebug:init()
    FunctionDebug:init()
end
function Develop.close(self)
    runtime.console = false
    isDebug = false
    Log.enable = false
    Log.enablePrint = false
end
function Develop.showDebugInfo(self)
    log.debug(DebugGameUtil:getDebugInfo())
end
Develop.debuggerPort = 4279
Develop.isSocketDebug = false
Develop._sl_egp_enable = true
return ____exports
