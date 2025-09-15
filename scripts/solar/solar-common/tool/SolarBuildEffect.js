export default class SolarBuildEffect {
    static canBuildEffectPath = "solar_asset\\model\\grid_green.mdx";
    static cannotBuildEffectPath = "solar_asset\\model\\grid_red.mdx";
    tempBuildEffect = null;
    pathTipLeftTopEffect = null;
    pathTipRightTopEffect = null;
    pathTipLeftBottomEffect = null;
    pathTipRightBottomEffect = null;
    constructor() {
        this.tempBuildEffect = AddSpecialEffect("", 0, 0);
        this.pathTipLeftTopEffect = AddSpecialEffect("", 0, 0);
        this.pathTipRightTopEffect = AddSpecialEffect("", 0, 0);
        this.pathTipLeftBottomEffect = AddSpecialEffect("", 0, 0);
        this.pathTipRightBottomEffect = AddSpecialEffect("", 0, 0);
        EXEffectMatRotateZ(this.tempBuildEffect, 270);
        //
        EXSetEffectSize(this.pathTipLeftTopEffect, 0.5);
        EXSetEffectSize(this.pathTipRightTopEffect, 0.5);
        EXSetEffectSize(this.pathTipLeftBottomEffect, 0.5);
        EXSetEffectSize(this.pathTipRightBottomEffect, 0.5);
    }
    setBuildEffectModelPath(tempBuildEffectPath) {
        SetUnitModel(this.tempBuildEffect, tempBuildEffectPath);
    }
    setBuildXY(x, y, z = 0) {
        EXSetEffectXY(this.tempBuildEffect, x, y);
        EXSetEffectZ(this.tempBuildEffect, z);
        let gap = 32;
        //one case
        EXSetEffectXY(this.pathTipLeftTopEffect, x - gap, y + gap);
        EXSetEffectZ(this.pathTipLeftTopEffect, z);
        //one case
        EXSetEffectXY(this.pathTipRightTopEffect, x + gap, y + gap);
        EXSetEffectZ(this.pathTipRightTopEffect, z);
        //one case
        EXSetEffectXY(this.pathTipLeftBottomEffect, x - gap, y - gap);
        EXSetEffectZ(this.pathTipLeftBottomEffect, z);
        //one case
        EXSetEffectXY(this.pathTipRightBottomEffect, x + gap, y - gap);
        EXSetEffectZ(this.pathTipRightBottomEffect, z);
    }
    setVisible(visible) {
        EXSetEffectVisible(this.tempBuildEffect, visible);
        EXSetEffectVisible(this.pathTipLeftTopEffect, visible);
        EXSetEffectVisible(this.pathTipRightTopEffect, visible);
        EXSetEffectVisible(this.pathTipLeftBottomEffect, visible);
        EXSetEffectVisible(this.pathTipRightBottomEffect, visible);
        if (visible) {
        }
        else {
        }
    }
    setCanBuild(canBuild, canBuild_LeftTop = canBuild, canBuild_RightTop = canBuild, canBuild_LeftBottom = canBuild, canBuild_RightBottom = canBuild) {
        SetUnitModel(this.pathTipLeftTopEffect, canBuild_LeftTop ? SolarBuildEffect.canBuildEffectPath : SolarBuildEffect.cannotBuildEffectPath);
        SetUnitModel(this.pathTipRightTopEffect, canBuild_RightTop ? SolarBuildEffect.canBuildEffectPath : SolarBuildEffect.cannotBuildEffectPath);
        SetUnitModel(this.pathTipLeftBottomEffect, canBuild_LeftBottom ? SolarBuildEffect.canBuildEffectPath : SolarBuildEffect.cannotBuildEffectPath);
        SetUnitModel(this.pathTipRightBottomEffect, canBuild_RightBottom ? SolarBuildEffect.canBuildEffectPath : SolarBuildEffect.cannotBuildEffectPath);
    }
}
