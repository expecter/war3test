local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 11,["28"] = 11,["29"] = 12,["30"] = 12,["31"] = 13,["32"] = 13,["33"] = 14,["34"] = 14,["35"] = 15,["36"] = 15,["37"] = 16,["38"] = 16,["39"] = 17,["40"] = 17,["41"] = 18,["42"] = 18,["43"] = 20,["44"] = 21,["45"] = 22,["46"] = 23,["47"] = 24,["48"] = 25,["49"] = 26,["50"] = 27,["51"] = 28,["52"] = 29,["53"] = 30,["54"] = 32,["55"] = 32,["56"] = 32,["58"] = 32,["59"] = 42,["60"] = 42,["61"] = 42,["63"] = 42,["64"] = 42,["66"] = 43,["69"] = 46,["70"] = 48,["71"] = 49,["72"] = 50,["73"] = 51,["74"] = 53,["75"] = 54,["77"] = 56,["80"] = 59,["82"] = 61,["83"] = 62,["84"] = 42,["85"] = 65,["86"] = 66,["89"] = 73,["90"] = 74,["91"] = 75,["92"] = 76,["94"] = 79,["95"] = 81,["96"] = 82,["98"] = 85,["99"] = 86,["101"] = 89,["102"] = 65,["103"] = 93,["104"] = 94,["105"] = 95,["107"] = 97,["108"] = 99,["111"] = 101,["114"] = 104,["115"] = 105,["116"] = 106,["118"] = 108,["119"] = 110,["120"] = 110,["121"] = 110,["122"] = 112,["123"] = 113,["124"] = 114,["126"] = 116,["127"] = 110,["128"] = 110,["129"] = 124,["130"] = 141,["131"] = 144,["132"] = 146,["133"] = 148,["134"] = 150,["135"] = 151,["136"] = 152,["137"] = 153,["138"] = 154,["139"] = 155,["140"] = 155,["142"] = 156,["143"] = 93,["144"] = 160,["145"] = 162,["147"] = 164,["148"] = 165,["150"] = 168,["154"] = 160,["155"] = 175,["156"] = 176,["157"] = 177,["158"] = 179,["159"] = 180,["160"] = 179,["161"] = 183,["162"] = 184,["163"] = 186,["164"] = 187,["165"] = 188,["167"] = 191,["168"] = 193,["169"] = 194,["170"] = 195,["172"] = 200,["173"] = 201,["174"] = 175,["175"] = 205,["176"] = 206,["177"] = 207,["178"] = 208,["179"] = 209,["180"] = 210,["181"] = 211,["182"] = 212,["183"] = 215,["184"] = 216,["185"] = 217,["186"] = 218,["187"] = 219,["188"] = 220,["189"] = 221,["190"] = 223,["191"] = 225,["192"] = 226,["193"] = 225,["194"] = 229,["195"] = 230,["196"] = 231,["197"] = 232,["200"] = 235,["201"] = 237,["202"] = 238,["205"] = 242,["206"] = 230,["207"] = 244,["208"] = 245,["209"] = 246,["210"] = 247,["213"] = 250,["214"] = 252,["215"] = 253,["218"] = 256,["219"] = 245,["220"] = 258,["221"] = 259,["225"] = 262,["226"] = 262,["227"] = 263,["228"] = 264,["232"] = 262,["235"] = 258,["236"] = 270,["237"] = 272,["238"] = 273,["239"] = 270,["240"] = 276,["241"] = 278,["242"] = 279,["244"] = 276,["245"] = 282,["246"] = 283,["247"] = 284,["248"] = 285,["249"] = 286,["250"] = 287,["251"] = 283,["252"] = 290,["253"] = 291,["254"] = 292,["256"] = 294,["257"] = 295,["258"] = 296,["260"] = 298,["261"] = 290,["262"] = 205,["263"] = 33,["264"] = 34,["265"] = 35});
local ____exports = {}
local ____SolveLuaAsyn = require("solar.solar-wc3.lib.compatible.SolveLuaAsyn")
local SolveLuaAsyn = ____SolveLuaAsyn.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____EmbedJapi = require("solar.solar-wc3.lib.compatible.EmbedJapi")
local EmbedJapi = ____EmbedJapi.default
local ____DzApiHelper = require("solar.solar-wc3.lib.compatible.DzApiHelper")
local DzApiHelper = ____DzApiHelper.default
local ____Constant = require("solar.solar-common.constant.Constant")
local Constant = ____Constant.default
local ____Log = require("solar.solar-wc3.common.Log")
local Log = ____Log.default
local ____Develop = require("solar.solar-wc3.common.Develop")
local Develop = ____Develop.default
local ____Es = require("solar.solar-wc3.lib.compatible.Es")
local Es = ____Es.default
local ____ErrorMsgHelper = require("solar.solar-common.common.ErrorMsgHelper")
local ErrorMsgHelper = ____ErrorMsgHelper.default
local ____IDAdapter = require("solar.solar-wc3.lib.compatible.IDAdapter")
local IDAdapter = ____IDAdapter.default
local ____YDWE = require("solar.solar-wc3.lib.compatible.YDWE")
local YDWE = ____YDWE.default
local ____SolarDataClearState = require("solar.solar-common.attribute.SolarDataClearState")
local SolarDataClearState = ____SolarDataClearState.default
local ____YiYiEnv = require("solar.solar-wc3.lib.compatible.yiyi.YiYiEnv")
local YiYiEnv = ____YiYiEnv.default
local ____SolarReload = require("solar.solar-common.common.SolarReload")
local SolarReload = ____SolarReload.default
local ____SolarGlobalVars = require("solar.solar-common.common.SolarGlobalVars")
local SolarGlobalVars = ____SolarGlobalVars.default
local ____KKImplementEmbedJapi = require("solar.solar-wc3.lib.compatible.kk.KKImplementEmbedJapi")
local KKImplementEmbedJapi = ____KKImplementEmbedJapi.default
local ____ErrorFrame = require("solar.solar-common.common.ErrorFrame")
local ErrorFrame = ____ErrorFrame.default
local ____KKApiHelper = require("solar.solar-wc3.lib.compatible.kk.KKApiHelper")
local KKApiHelper = ____KKApiHelper.default
local CJ = require("jass.common")
local globals = require("jass.globals")
local japi = require("jass.japi")
local ai = require("jass.ai")
local slk = require("jass.slk")
local runtime = require("jass.runtime")
local jConsole = require("jass.console")
local jDebug = require("jass.debug")
local jMessage = require("jass.message")
local storm = require("jass.storm")
_G.log = __TS__New(Log)
____exports.default = __TS__Class()
local GlobalVars = ____exports.default
GlobalVars.name = "GlobalVars"
function GlobalVars.prototype.____constructor(self)
end
function GlobalVars.init(self, ____debug, egp_enable)
    if ____debug == nil then
        ____debug = isDebug
    end
    if egp_enable == nil then
        egp_enable = ____debug
    end
    if _G.GlobalVars_init then
        return
    end
    SolarGlobalVars:init(____debug, egp_enable)
    _G.isDebug = ____debug
    Develop._sl_egp_enable = egp_enable
    if isDebug then
        Develop:open()
        if DzTriggerRegisterSyncData then
            SolarReload:init()
        else
            log.debug("本地Dzapi环境不存在！未启动热加载模块！请检查配置的we是否支持扩展api!")
        end
    else
        Develop:close()
    end
    ErrorFrame:init()
    _G.GlobalVars_init = true
end
function GlobalVars.initOnMain(self)
    if ____exports.default._sl_isInitOnMain then
        return
    end
    InitBlizzardGlobals()
    if isEmbedJapi then
        EmbedJapi:initInEnd()
        print("初始化内置Japi环境")
    end
    SolveLuaAsyn.init()
    if is_11Platform then
        YiYiEnv:initInEnd()
    end
    if DzGetActivePatron ~= nil then
        KKImplementEmbedJapi:init()
    end
    ____exports.default._sl_isInitOnMain = true
end
function GlobalVars.init0(self)
    if ____exports.default.isInit then
        return true
    end
    ____exports.default.isInit = true
    _G._require = require
    do
        pcall(function()
            require("env_vars")
        end)
    end
    isDebug = storm.load(tostring(local_map_dir_path) .. "/src/App.ts") ~= nil and storm.load("war3mapunits.doo") ~= nil
    if isDebug then
        runtime.console = true
    end
    ____exports.default:initBaseLuaEnv()
    setmetatable(
        _ENV,
        {__index = function(_, key)
            local result = japi[key] or CJ[key] or ai[key] or jDebug[key] or jMessage[key] or globals[key] or DzApiHelper[key] or KKApiHelper[key]
            if result then
                _ENV[key] = result
            end
            return result
        end}
    )
    _g_objs = slk
    ____exports.default:initBaseVars()
    require("blizzard")
    require("solar_addons")
    SolveLuaAsyn.SolveMathAsyn()
    BaseUtil.init()
    Constant:init()
    IDAdapter.init()
    YDWE:_sl_init()
    SolarDataClearState:_sl_hookClearHandle()
    if DzLoadToc ~= nil then
        DzLoadToc("solar_asset\\ui\\base.toc")
    end
    return true
end
function GlobalVars.set2G(self, obj)
    for gk in pairs(obj) do
        do
            if "table" == gk then
                goto __continue21
            end
            _G[gk] = obj[gk]
        end
        ::__continue21::
    end
end
function GlobalVars.initBaseLuaEnv(self)
    Es:init()
    targetLanguage = "lua"
    _G.print = function(...)
        jConsole.write(...)
    end
    runtime.error_handle = ErrorMsgHelper.error_handle
    runtime.handle_level = 0
    isEmbedJapi = japi.GetPluginVersion ~= nil
    if isEmbedJapi then
        EmbedJapi:init()
    end
    isEmbedBrowser = japi.InitHtml5Plugin ~= nil
    is_11Platform = japi.EXNetIsYYHighLadder ~= nil
    if is_11Platform then
        YiYiEnv:init()
    end
    require("_sl_base")
    require("json")
end
function GlobalVars.initBaseVars(self)
    isBigAttributeMode = false
    StrHpBonus = S2R(_g_objs.misc.Misc.StrHitPointBonus)
    AgiDefenseBonus = S2R(_g_objs.misc.Misc.AgiDefenseBonus)
    IntManaBonus = S2R(_g_objs.misc.Misc.IntManaBonus)
    PrimaryAttackBonus = S2R(_g_objs.misc.Misc.StrAttackBonus)
    ArmorReducesDamageFactor = S2R(_g_objs.misc.Misc.DefenseArmor)
    PawnItemRate = S2R(_g_objs.misc.Misc.PawnItemRate or "0.5")
    tempLocation = Location(0, 0)
    tempRect = Rect(0, 0, 1, 1)
    tempGroup = CreateGroup()
    _tempGroup = CreateGroup()
    _sl_tempGroup1 = CreateGroup()
    _sl_tempGroup2 = CreateGroup()
    _sl_tempGroup3 = CreateGroup()
    _G.globals = globals
    _G.UnitAlive = function(unit)
        return GetUnitState(unit, UNIT_STATE_LIFE) > 0.405 and not IsUnitType(unit, UNIT_TYPE_DEAD)
    end
    local old_handle_ref = handle_ref
    _G.handle_ref = function(h)
        if not IsHandle(h) then
            log.errorWithTraceBack("无法增加一个空handle的引用!")
            return
        end
        local defInfo = handledef(h)
        if not defInfo.reference or defInfo.reference <= 0 then
            log.errorWithTraceBack(("无法增加一个0引用的handle的引用!请提前增加引用。" .. "因为此handle已经是空闲的handle了，马上就会被底层重用了！") .. tostring(defInfo and defInfo.reference))
            return
        end
        old_handle_ref(h)
    end
    local old_handle_unref = handle_unref
    _G.handle_unref = function(h)
        if not IsHandle(h) then
            log.errorWithTraceBack("无法减少一个空handle的引用!")
            return
        end
        local defInfo = handledef(h)
        if not defInfo.reference or defInfo.reference <= 0 then
            log.errorWithTraceBack("无法减少一个0引用的handle的引用!请提前使用handle_ref增加引用!" .. tostring(defInfo and defInfo.reference))
            return
        end
        old_handle_unref(h)
    end
    _G.handle_clearref = function(h)
        if not IsHandle(h) then
            return
        end
        do
            local i = 0
            while i < 10000 do
                if handledef(h).reference > 0 then
                    handle_unref(h)
                else
                    return
                end
                i = i + 1
            end
        end
    end
    _G.char2number = function(char)
        local t = string
        return t.byte(char, 1)
    end
    _G.deleteKey = function(obj, key)
        if obj then
            obj[key] = nil
        end
    end
    local oldUnitDropItemSlot = UnitDropItemSlot
    _G.UnitDropItemSlot = function(whichUnit, whichItem, slot)
        gv.isUnitDropItemSlotExecIng = true
        local b = oldUnitDropItemSlot(whichUnit, whichItem, slot)
        gv.isUnitDropItemSlotExecIng = false
        return b
    end
    _G.HttpRequest = function(url, post, onResult)
        if post_message then
            return post_message(url, post, onResult)
        else
            local info = "此函数暂时未兼容你的脚本环境!"
            print(info)
            onResult(info)
        end
        return false
    end
end
GlobalVars.isInit = false
GlobalVars._sl_isInitOnMain = false
GlobalVars.justInvoke = ____exports.default:init0()
return ____exports
