/**
 * @brief 射击一个物体(箭矢...)对目标单位造成伤害
 */
import BaseUtil from "@/util/BaseUtil";
import MathUtil from "@/util/math/MathUtil";
export default class ShootUtil {
    /**射击物体*/
    static shoot(whichUnit, targetUnit, damageValue, damageType, maxDistance, missileart, callback) {
        if (!IsHandle(whichUnit) || !IsHandle(targetUnit))
            return;
        let triggerX = GetUnitX(whichUnit);
        let triggerY = GetUnitY(whichUnit);
        let targetX = GetUnitX(targetUnit);
        let targetY = GetUnitY(targetUnit);
        let model = missileart ?? 'Abilities\\Weapons\\Arrow\\ArrowMissile.mdl';
        let angle = MathUtil.angleBetweenCoords(triggerX, triggerY, targetX, targetY);
        let distance = maxDistance ?? MathUtil.distanceBetweenPoints(triggerX, triggerY, targetX, targetY);
        let effectHandle = AddSpecialEffect(model, triggerX, triggerY);
        EXEffectMatRotateZ(effectHandle, angle);
        handle_ref(effectHandle);
        let delta = 20;
        let shootDistance = 0;
        handle_ref(whichUnit);
        BaseUtil.onTimer(0.02, () => {
            let x = EXGetEffectX(effectHandle) + delta * CosBJ(angle);
            let y = EXGetEffectY(effectHandle) + delta * SinBJ(angle);
            EXSetEffectXY(effectHandle, x, y);
            shootDistance += delta;
            if (shootDistance >= distance) {
                handle_unref(effectHandle);
                DestroyEffect(effectHandle);
                if (IsUnitAliveBJ(targetUnit) && IsUnitEnemy(targetUnit, GetOwningPlayer(whichUnit))) {
                    UnitDamageTarget(whichUnit, targetUnit, damageValue, false, false, ATTACK_TYPE_PIERCE, damageType ?? DAMAGE_TYPE_UNIVERSAL, null);
                }
                if (callback) {
                    callback(whichUnit, targetUnit);
                }
                handle_unref(whichUnit);
                return false;
            }
            return true;
        });
    }
}
