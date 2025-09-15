/**
 * @brief 向前方发出一道波(剑气...)对经过的单位造成伤害
 */
import BaseUtil from "@/util/BaseUtil";
import GroupUtil from "@/util/unit/GroupUtil";
export default class WaveUtil {
    /**冲击波*/
    static wave(whichUnit, damageValue, art, maxDistance = 600.0, angle = GetUnitFacing(whichUnit), callback) {
        let triggerX = GetUnitX(whichUnit);
        let triggerY = GetUnitY(whichUnit);
        let effectHandle = AddSpecialEffect(art, triggerX, triggerY);
        EXEffectMatRotateZ(effectHandle, angle);
        handle_ref(effectHandle);
        let groupHandle = CreateGroup();
        let damagedUnitGroup = CreateGroup();
        let delta = 20;
        let sumDistance = 0;
        handle_ref(whichUnit);
        BaseUtil.onTimer(0.02, () => {
            let x = EXGetEffectX(effectHandle) + delta * CosBJ(angle);
            let y = EXGetEffectY(effectHandle) + delta * SinBJ(angle);
            EXSetEffectXY(effectHandle, x, y);
            GroupClear(groupHandle);
            GroupEnumUnitsInRange(groupHandle, x, y, 128, null);
            GroupUtil.for(groupHandle, unitHandle => {
                if (IsUnitAliveBJ(unitHandle) && IsUnitEnemy(unitHandle, GetOwningPlayer(whichUnit)) && !IsUnitInGroup(unitHandle, damagedUnitGroup)) {
                    GroupAddUnit(damagedUnitGroup, unitHandle);
                    UnitDamageTarget(whichUnit, unitHandle, damageValue, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, null);
                }
            });
            sumDistance += delta;
            if (sumDistance >= maxDistance) {
                handle_unref(effectHandle);
                DestroyEffect(effectHandle);
                if (callback) {
                    callback(whichUnit, x, y);
                }
                handle_unref(whichUnit);
                DestroyGroup(groupHandle);
                DestroyGroup(damagedUnitGroup);
                return false;
            }
            return true;
        });
    }
}
