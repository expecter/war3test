local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 5,["12"] = 6,["15"] = 9,["16"] = 11,["17"] = 12,["19"] = 17,["20"] = 18,["22"] = 20,["23"] = 21,["25"] = 23,["26"] = 24,["28"] = 26,["29"] = 27,["31"] = 29,["32"] = 30,["34"] = 32,["35"] = 33,["37"] = 35,["38"] = 36,["40"] = 38,["41"] = 39,["43"] = 41,["44"] = 42,["46"] = 44,["47"] = 45,["49"] = 5,["50"] = 3});
local ____exports = {}
____exports.default = __TS__Class()
local KKImplementEmbedJapi = ____exports.default
KKImplementEmbedJapi.name = "KKImplementEmbedJapi"
function KKImplementEmbedJapi.prototype.____constructor(self)
end
function KKImplementEmbedJapi.init(self)
    if ____exports.default.is_init then
        return
    end
    ____exports.default.is_init = true
    if GetStoreTarget == nil then
        _G.GetStoreTarget = DzGetActivePatron
    end
    if GetFps == nil then
        _G.GetFps = DzGetFPS
    end
    if ShowFpsText == nil then
        _G.ShowFpsText = DzToggleFPS
    end
    if SetUnitMoveType == nil then
        _G.SetUnitMoveType = DzSetUnitMoveType
    end
    if SetUnitName == nil then
        _G.SetUnitName = DzSetUnitName
    end
    if SetUnitProperName == nil then
        _G.SetUnitProperName = DzSetUnitProperName
    end
    if SetUnitMissileModel == nil then
        _G.SetUnitMissileModel = DzSetUnitMissileModel
    end
    if SetUnitPortrait == nil then
        _G.SetUnitPortrait = DzSetUnitPortrait
    end
    if SetUnitPressUIVisible == nil then
        _G.SetUnitPressUIVisible = DzSetUnitPreselectUIVisible
    end
    if FrameSetViewPort == nil then
        _G.FrameSetViewPort = DzFrameSetClip
    end
    if EXSetItemColor == nil then
        _G.EXSetItemColor = DzItemSetVertexColor
    end
end
KKImplementEmbedJapi.is_init = false
return ____exports
