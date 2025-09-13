local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 8,["18"] = 8,["19"] = 8,["21"] = 8,["22"] = 17,["23"] = 17,["24"] = 17,["26"] = 17,["27"] = 17,["29"] = 18,["30"] = 19,["31"] = 19,["32"] = 19,["33"] = 20,["34"] = 20,["35"] = 20,["36"] = 20,["37"] = 20,["38"] = 20,["39"] = 20,["42"] = 26,["45"] = 22,["46"] = 23,["47"] = 24,["48"] = 24,["49"] = 24,["50"] = 24,["51"] = 24,["52"] = 24,["53"] = 24,["59"] = 19,["60"] = 19,["61"] = 17,["62"] = 32,["63"] = 33,["64"] = 34,["66"] = 36,["67"] = 38,["68"] = 39,["69"] = 40,["70"] = 41,["71"] = 42,["72"] = 43,["73"] = 44,["74"] = 45,["75"] = 46,["76"] = 47,["77"] = 48,["79"] = 43,["80"] = 51,["81"] = 53,["83"] = 56,["84"] = 57,["85"] = 32,["86"] = 64,["87"] = 65,["88"] = 66,["89"] = 67,["90"] = 68,["91"] = 69,["92"] = 70,["93"] = 71,["95"] = 73,["96"] = 74,["98"] = 76,["99"] = 77,["101"] = 79,["102"] = 80,["103"] = 81,["104"] = 83,["105"] = 81,["106"] = 85,["107"] = 86,["108"] = 87,["110"] = 89,["111"] = 85,["112"] = 91,["113"] = 93,["114"] = 64,["115"] = 97,["116"] = 99,["117"] = 100,["118"] = 101,["120"] = 103,["122"] = 97,["123"] = 9,["124"] = 10,["125"] = 111});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____FourCC = require("solar.solar-common.common.FourCC")
local FourCC = ____FourCC.default
local ____SolarEvent = require("solar.solar-common.common.SolarEvent")
local SolarEvent = ____SolarEvent.default
local ____SupportReload = require("solar.solar-common.decorator.SupportReload")
local SupportReload = ____SupportReload.default
local ____ObjectTemplateUtil = require("solar.solar-common.util.object.ObjectTemplateUtil")
local ObjectTemplateUtil = ____ObjectTemplateUtil.default
____exports.default = __TS__Class()
local SolarGlobalVars = ____exports.default
SolarGlobalVars.name = "SolarGlobalVars"
function SolarGlobalVars.prototype.____constructor(self)
end
function SolarGlobalVars.init(self, ____debug, egp_enable)
    if ____debug == nil then
        ____debug = isDebug
    end
    if egp_enable == nil then
        egp_enable = ____debug
    end
    ____exports.default:printLogo()
    se:onPlayerChat(
        "-sl-v",
        function()
            DisplayTimedTextToPlayer(
                GetLocalPlayer(),
                0,
                0,
                10,
                "当前游戏的太阳TS框架版本号为:" .. tostring(_sl_version)
            )
            do
                local function ____catch(e)
                    print(e)
                end
                local ____try, ____hasReturned = pcall(function()
                    require("_SLA_temp")
                    local _SL_version_info = "编译版本号:" .. tostring(_G._SL_version_info)
                    DisplayTimedTextToPlayer(
                        GetLocalPlayer(),
                        0,
                        0,
                        10,
                        _SL_version_info
                    )
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
    )
end
function SolarGlobalVars.init0(self)
    if ____exports.default.isInit then
        return true
    end
    ____exports.default.isInit = true
    _G._sl_funs = {}
    _sl_funs.borrowTemplate = ObjectTemplateUtil.borrowTemplate
    _sl_funs.returnTemplate = ObjectTemplateUtil.returnTemplate
    _G.FourCC = FourCC.string2id
    _G.id2string = FourCC.id2string
    _G.asyncExec = function(asyncPlayer, fun)
        if asyncPlayer == GetLocalPlayer() then
            local old = isAsync
            isAsync = true
            fun(nil)
            isAsync = old
        end
    end
    if isSolarIndieGame == nil then
        isSolarIndieGame = false
    end
    ____exports.default:initBaseVars()
    return true
end
function SolarGlobalVars.initBaseVars(self)
    gameName = "太阳TS地图"
    _sl_version = 6.41
    isBigAttributeMode = false
    handleReuseMinTime = 2.99
    isAsync = false
    if settings == nil then
        settings = {fontPath = "Fonts\\dfst-m3u.ttf"}
    end
    if gv == nil then
        gv = {}
    end
    if globals == nil then
        globals = _G
    end
    db = DataBase
    sd = DataBase.sd
    _G.deleteKey = function(obj, key)
        obj[key] = nil
    end
    _G.IsHandle = function(h)
        if h == nil or h == 0 then
            return false
        end
        return true
    end
    se = __TS__New(SolarEvent)
    _G.SupportReload = SupportReload
end
function SolarGlobalVars.printLogo(self)
    print(____exports.default.logoText)
    if isSolarIndieGame then
        print("太阳TS框架版本(独立游戏):" .. tostring(_sl_version))
    else
        print("太阳TS框架版本:" .. tostring(_sl_version))
    end
end
SolarGlobalVars.isInit = false
SolarGlobalVars.justInvoke = ____exports.default:init0()
SolarGlobalVars.logoText = (((((("\n     ________      ________     ___          ________     ________\n" .. "    |\\   ____\\    |\\   __  \\   |\\  \\        |\\   __  \\   |\\   __  \\\n") .. "    \\ \\  \\___|_   \\ \\  \\|\\  \\  \\ \\  \\       \\ \\  \\|\\  \\  \\ \\  \\|\\  \\\n") .. "     \\ \\_____  \\   \\ \\  \\\\\\  \\  \\ \\  \\       \\ \\   __  \\  \\ \\   _  _\\\n") .. "      \\|____|\\  \\   \\ \\  \\\\\\  \\  \\ \\  \\       \\ \\  \\ \\  \\  \\ \\  \\\\  \\|\n") .. "        ____\\_\\  \\   \\ \\  \\\\\\  \\  \\ \\  \\____   \\ \\  \\ \\  \\  \\ \\  \\\\  \\\n") .. "       |\\_________\\   \\ \\_______\\  \\ \\_______\\  \\ \\__\\ \\__\\  \\ \\__\\\\ _\\\n") .. "       \\|_________|    \\|_______|   \\|_______|   \\|__|\\|__|   \\|__|\\|__|\n"
return ____exports
