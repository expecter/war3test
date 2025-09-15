import BaseUtil from "@/util/BaseUtil";
export default class WarningUtil {
    // static warningModelPath = "Abilities\\Spells\\NightElf\\TrueshotAura\\TrueshotAura.mdx";
    // static warningModelPath = "Abilities\Spells\Undead\VampiricAura\VampiricAura.mdx";
    static warningModelPath = "Abilities\\Spells\\Orc\\CommandAura\\CommandAuraTarget.mdx";
    /**模型尺寸*/
    static warningModelSize = 100.0;
    /**在指定单位范围内显示数个不重合的预警框*/
    static warningsInRange(whichUnit, duration, range, smallRange = 200, count = 8, callback, effectArt) {
        let points = [];
        let scale = smallRange / this.warningModelSize;
        for (let index = 0; index < 1000000; index++) {
            let distance = GetRandomReal(0.0, range);
            let angle = GetRandomReal(0.0, 360.0);
            let point = { x: 0, y: 0 };
            point.x = GetUnitX(whichUnit) + distance * CosBJ(angle);
            point.y = GetUnitY(whichUnit) + distance * SinBJ(angle);
            let intersect = false;
            if (points.length > 0) {
                for (let p of points) {
                    let dx = point.x - p.x;
                    let dy = point.y - p.y;
                    let distance = math.sqrt(dx * dx + dy * dy);
                    if (distance < smallRange) {
                        intersect = true;
                        break;
                    }
                }
            }
            if (!intersect) {
                points.push(point);
            }
            if (points.length >= count)
                break;
        }
        for (let p of points) {
            let effectHandle = AddSpecialEffect(effectArt ?? WarningUtil.warningModelPath, p.x, p.y);
            EXEffectMatScale(effectHandle, scale, scale, scale);
            BaseUtil.runLater(duration, () => {
                DestroyEffect(effectHandle);
                if (callback) {
                    callback(p.x, p.y);
                }
            });
        }
    }
    /**在指定单位处显示一个预警框*/
    static warningAtPoint(whichUnit, duration, range = 1000, callback, effectArt) {
        let x = GetUnitX(whichUnit);
        let y = GetUnitY(whichUnit);
        let angle = GetUnitFacing(whichUnit);
        let scale = range / this.warningModelSize;
        let effectHandle = AddSpecialEffect(effectArt ?? WarningUtil.warningModelPath, x, y);
        EXEffectMatScale(effectHandle, scale, scale, scale);
        EXEffectMatRotateZ(effectHandle, angle);
        BaseUtil.runLater(duration, () => {
            DestroyEffect(effectHandle);
            if (callback) {
                callback(x, y);
            }
        });
    }
    /**在指定单位前方显示数个直线型预警框*/
    static warningsFacing(whichUnit, duration, length = 1000, width = 100, callback, effectArt) {
        let trigX = GetUnitX(whichUnit);
        let trigY = GetUnitY(whichUnit);
        let angle = GetUnitFacing(whichUnit);
        let distance = width / 2;
        let scale = width / this.warningModelSize;
        BaseUtil.onTimer(0.03, () => {
            if (distance < length) {
                let x = trigX + distance * CosBJ(angle);
                let y = trigY + distance * SinBJ(angle);
                let effectHandle = AddSpecialEffect(effectArt ?? WarningUtil.warningModelPath, x, y);
                EXEffectMatScale(effectHandle, scale, scale, scale);
                EXEffectMatRotateZ(effectHandle, angle);
                BaseUtil.runLater(duration, () => {
                    DestroyEffect(effectHandle);
                    if (callback) {
                        callback(x, y);
                    }
                });
            }
            else {
                return false;
            }
            distance += width;
            return true;
        });
    }
    /**在指定单位前方显示数个扇型预警框*/
    static warningsSector(whichUnit, duration, length = 1000, maxAngle = 120, interval, callback, effectArt) {
        let trigX = GetUnitX(whichUnit);
        let trigY = GetUnitY(whichUnit);
        let trigFacing = GetUnitFacing(whichUnit);
        let distance = 50;
        let scale = 100 / this.warningModelSize;
        let func1 = function (angle) {
            let x = trigX + distance * CosBJ(angle);
            let y = trigY + distance * SinBJ(angle);
            let effectHandle = AddSpecialEffect(effectArt ?? WarningUtil.warningModelPath, x, y);
            EXEffectMatScale(effectHandle, scale, scale, scale);
            EXEffectMatRotateZ(effectHandle, angle);
            BaseUtil.runLater(duration, () => {
                DestroyEffect(effectHandle);
                if (callback) {
                    callback(x, y);
                }
            });
        };
        let func2 = function () {
            func1(trigFacing);
            let delta = 2 * math.asin(50.0 / distance);
            for (let angle = trigFacing - delta; angle >= trigFacing - maxAngle / 2.0; angle -= delta) {
                func1(angle);
            }
            for (let angle = trigFacing + delta; angle <= trigFacing + maxAngle / 2.0; angle += delta) {
                func1(angle);
            }
        };
        if (interval) {
            BaseUtil.onTimer(interval, () => {
                if (distance < length) {
                    func2();
                }
                else {
                    return false;
                }
                distance += 100;
                return true;
            });
        }
        else {
            for (; distance < length; distance += 100) {
                func2();
            }
        }
    }
}
