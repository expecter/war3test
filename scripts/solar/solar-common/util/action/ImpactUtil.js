/**
 * @brief 向前方冲撞对经过的单位造成伤害
 */
import BaseUtil from "@/util/BaseUtil";
import GroupUtil from "@/util/unit/GroupUtil";
export default class ImpactUtil {
    /**冲撞*/
    static impact(whichUnit, damageValue, maxDistance = 600.0, angle = GetUnitFacing(whichUnit), callback) {
        let groupHandle = CreateGroup();
        let damagedUnitGroup = CreateGroup();
        let delta = 20;
        let sumDistance = 0;
        handle_ref(whichUnit);
        SetUnitPathing(whichUnit, false);
        BaseUtil.onTimer(0.02, () => {
            let x = GetUnitX(whichUnit) + delta * CosBJ(angle);
            let y = GetUnitY(whichUnit) + delta * SinBJ(angle);
            if (!IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)) {
                SetUnitPosition(whichUnit, x, y);
            }
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
                SetUnitPathing(whichUnit, true);
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
