/**
 * @brief (还有问题)
 */
import BaseUtil from "@/util/BaseUtil";
import MathUtil from "@/util/math/MathUtil";
import VestUtil from "@/util/unit/VestUtil";
export default class EjectionUtil {
    /**弹射*/
    static ejection(whichUnit, targetUnit, model) {
        let triggerX = GetUnitX(whichUnit);
        let triggerY = GetUnitY(whichUnit);
        let vestHandle = VestUtil.SunCreateVestByUnit(whichUnit, triggerX, triggerY, model, 1, 0);
        handle_ref(vestHandle);
        handle_ref(whichUnit);
        handle_ref(targetUnit);
        let v = 10.0;
        let i = 10;
        let max = 500;
        BaseUtil.onTimer(0.02, count => {
            max--;
            let vestX = GetUnitX(vestHandle);
            let vestY = GetUnitY(vestHandle);
            let targetX = GetUnitX(targetUnit);
            let targetY = GetUnitY(targetUnit);
            let angle = MathUtil.angleBetweenCoords(vestX, vestY, targetX, targetY);
            let x = vestX + 30.0 * CosBJ(angle);
            let y = vestY + 30.0 * SinBJ(angle);
            SetUnitFacing(vestHandle, angle);
            SetUnitPosition(vestHandle, x, y);
            let distance = MathUtil.distanceBetweenPoints(x, y, targetX, targetY);
            if (distance <= 50.0) {
                i--;
                if (i > 0) {
                    UnitDamageTargetBJ(whichUnit, targetUnit, v, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL);
                    DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", targetUnit, "chest"));
                    SetUnitLifeBJ(whichUnit, (GetUnitState(whichUnit, UNIT_STATE_LIFE) + (0.03 * (GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE) - GetUnitState(whichUnit, UNIT_STATE_LIFE)))));
                }
            }
            return true;
        });
    }
}
