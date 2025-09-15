/**
 * @brief 恢复单位生命值
 */
import BaseUtil from "@/util/BaseUtil";
import GroupUtil from "@/util/unit/GroupUtil";
export default class UnitRegenLifeUtil {
    /**恢复指定单位的生命值*/
    static regenUnitLife(whichUnit, value, effectArt = "Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdx") {
        if (effectArt != null) {
            let effectHandle = AddSpecialEffect(effectArt, GetUnitX(whichUnit), GetUnitY(whichUnit));
            DestroyEffect(effectHandle);
        }
        let life = GetUnitState(whichUnit, UNIT_STATE_LIFE);
        let maxLife = GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE);
        SetUnitState(whichUnit, UNIT_STATE_LIFE, math.min(life + value, maxLife));
    }
    /**恢复指定单位周围友军的生命值*/
    static regenAllyUnitsLife(whichUnit, value, isPercentage, range, casterArt, effectArt, duration, interval) {
        let effectHandle = AddSpecialEffect(casterArt ?? '', GetUnitX(whichUnit), GetUnitY(whichUnit));
        DestroyEffect(effectHandle);
        let groupHandle = CreateGroup();
        let regenFunc = function () {
            GroupClear(groupHandle);
            if (range) {
                GroupEnumUnitsInRange(groupHandle, GetUnitX(whichUnit), GetUnitY(whichUnit), range, null);
            }
            else {
                GroupEnumUnitsInRect(groupHandle, bj_mapInitialPlayableArea, null);
            }
            GroupUtil.for(groupHandle, unitHandle => {
                if (IsUnitAlly(unitHandle, GetOwningPlayer(whichUnit)) && IsUnitAliveBJ(unitHandle)) {
                    let effectHandle = AddSpecialEffect(effectArt ?? '', GetUnitX(unitHandle), GetUnitY(unitHandle));
                    DestroyEffect(effectHandle);
                    let maxLife = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE);
                    let life = GetUnitState(unitHandle, UNIT_STATE_LIFE);
                    let addLife = isPercentage ? (maxLife * value) : value;
                    SetUnitState(unitHandle, UNIT_STATE_LIFE, math.min(life + addLife, maxLife));
                }
            });
        };
        regenFunc();
        if (!duration || duration <= 0) {
            DestroyGroup(groupHandle);
            return;
        }
        let timeout = interval ?? 1.0;
        BaseUtil.onTimer(timeout, count => {
            regenFunc();
            if (timeout * count >= duration) {
                DestroyGroup(groupHandle);
                return false;
            }
            return true;
        });
    }
}
