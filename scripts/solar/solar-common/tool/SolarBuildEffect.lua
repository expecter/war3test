local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 6,["11"] = 7,["12"] = 8,["13"] = 9,["14"] = 10,["15"] = 15,["16"] = 16,["17"] = 17,["18"] = 18,["19"] = 19,["20"] = 22,["21"] = 24,["22"] = 25,["23"] = 26,["24"] = 27,["25"] = 13,["26"] = 32,["27"] = 33,["28"] = 32,["29"] = 36,["30"] = 36,["31"] = 36,["33"] = 37,["34"] = 38,["35"] = 39,["36"] = 41,["37"] = 42,["38"] = 44,["39"] = 45,["40"] = 47,["41"] = 48,["42"] = 50,["43"] = 51,["44"] = 36,["45"] = 54,["46"] = 55,["47"] = 56,["48"] = 57,["49"] = 58,["50"] = 59,["51"] = 60,["54"] = 54,["55"] = 68,["56"] = 68,["57"] = 68,["59"] = 68,["60"] = 68,["62"] = 69,["63"] = 69,["65"] = 69,["66"] = 69,["68"] = 70,["69"] = 71,["70"] = 72,["71"] = 73,["72"] = 68,["73"] = 3,["74"] = 4});
local ____exports = {}
____exports.default = __TS__Class()
local SolarBuildEffect = ____exports.default
SolarBuildEffect.name = "SolarBuildEffect"
function SolarBuildEffect.prototype.____constructor(self)
    self.tempBuildEffect = nil
    self.pathTipLeftTopEffect = nil
    self.pathTipRightTopEffect = nil
    self.pathTipLeftBottomEffect = nil
    self.pathTipRightBottomEffect = nil
    self.tempBuildEffect = AddSpecialEffect("", 0, 0)
    self.pathTipLeftTopEffect = AddSpecialEffect("", 0, 0)
    self.pathTipRightTopEffect = AddSpecialEffect("", 0, 0)
    self.pathTipLeftBottomEffect = AddSpecialEffect("", 0, 0)
    self.pathTipRightBottomEffect = AddSpecialEffect("", 0, 0)
    EXEffectMatRotateZ(self.tempBuildEffect, 270)
    EXSetEffectSize(self.pathTipLeftTopEffect, 0.5)
    EXSetEffectSize(self.pathTipRightTopEffect, 0.5)
    EXSetEffectSize(self.pathTipLeftBottomEffect, 0.5)
    EXSetEffectSize(self.pathTipRightBottomEffect, 0.5)
end
function SolarBuildEffect.prototype.setBuildEffectModelPath(self, tempBuildEffectPath)
    SetUnitModel(self.tempBuildEffect, tempBuildEffectPath)
end
function SolarBuildEffect.prototype.setBuildXY(self, x, y, z)
    if z == nil then
        z = 0
    end
    EXSetEffectXY(self.tempBuildEffect, x, y)
    EXSetEffectZ(self.tempBuildEffect, z)
    local gap = 32
    EXSetEffectXY(self.pathTipLeftTopEffect, x - gap, y + gap)
    EXSetEffectZ(self.pathTipLeftTopEffect, z)
    EXSetEffectXY(self.pathTipRightTopEffect, x + gap, y + gap)
    EXSetEffectZ(self.pathTipRightTopEffect, z)
    EXSetEffectXY(self.pathTipLeftBottomEffect, x - gap, y - gap)
    EXSetEffectZ(self.pathTipLeftBottomEffect, z)
    EXSetEffectXY(self.pathTipRightBottomEffect, x + gap, y - gap)
    EXSetEffectZ(self.pathTipRightBottomEffect, z)
end
function SolarBuildEffect.prototype.setVisible(self, visible)
    EXSetEffectVisible(self.tempBuildEffect, visible)
    EXSetEffectVisible(self.pathTipLeftTopEffect, visible)
    EXSetEffectVisible(self.pathTipRightTopEffect, visible)
    EXSetEffectVisible(self.pathTipLeftBottomEffect, visible)
    EXSetEffectVisible(self.pathTipRightBottomEffect, visible)
    if visible then
    else
    end
end
function SolarBuildEffect.prototype.setCanBuild(self, canBuild, canBuild_LeftTop, canBuild_RightTop, canBuild_LeftBottom, canBuild_RightBottom)
    if canBuild_LeftTop == nil then
        canBuild_LeftTop = canBuild
    end
    if canBuild_RightTop == nil then
        canBuild_RightTop = canBuild
    end
    if canBuild_LeftBottom == nil then
        canBuild_LeftBottom = canBuild
    end
    if canBuild_RightBottom == nil then
        canBuild_RightBottom = canBuild
    end
    SetUnitModel(self.pathTipLeftTopEffect, canBuild_LeftTop and ____exports.default.canBuildEffectPath or ____exports.default.cannotBuildEffectPath)
    SetUnitModel(self.pathTipRightTopEffect, canBuild_RightTop and ____exports.default.canBuildEffectPath or ____exports.default.cannotBuildEffectPath)
    SetUnitModel(self.pathTipLeftBottomEffect, canBuild_LeftBottom and ____exports.default.canBuildEffectPath or ____exports.default.cannotBuildEffectPath)
    SetUnitModel(self.pathTipRightBottomEffect, canBuild_RightBottom and ____exports.default.canBuildEffectPath or ____exports.default.cannotBuildEffectPath)
end
SolarBuildEffect.canBuildEffectPath = "solar_asset\\model\\grid_green.mdx"
SolarBuildEffect.cannotBuildEffectPath = "solar_asset\\model\\grid_red.mdx"
return ____exports
