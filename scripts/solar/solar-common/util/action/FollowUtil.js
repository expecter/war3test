/**
 * @brief 一个单位跟随另一个单位
 */
import BaseUtil from '@//util/BaseUtil';
import MathUtil from '@//util/math/MathUtil';
import { OrderId } from "@/w3ts/globals/order";
export default class FollowUtil {
    /**跟随*/
    static follow(pet, captain, timeout = 1.0, guardRanger = 200, returnRanger = 300, outRanger = 400, probability = 1.0) {
        handle_ref(pet);
        handle_ref(captain);
        BaseUtil.onTimer(timeout, () => {
            let captainX = GetUnitX(captain);
            let captainY = GetUnitY(captain);
            let petX = GetUnitX(pet);
            let petY = GetUnitY(pet);
            let distance = MathUtil.distanceBetweenPoints(petX, petY, captainX, captainY);
            let range = guardRanger;
            if (IsUnitAliveBJ(pet) && UnitAlive(captain)) {
                if (distance < range) {
                    if (!OrderId2String(GetUnitCurrentOrder(pet)) && GetRandomReal(0.0, 1.0) < probability) {
                        let randomDistance = GetRandomReal(0, distance);
                        let randomAngle = GetRandomReal(0, 360);
                        let x = GetUnitX(captain) + randomDistance * CosBJ(randomAngle);
                        let y = GetUnitY(captain) + randomDistance * SinBJ(randomAngle);
                        IssuePointOrder(pet, OrderId2String(OrderId.Patrol), x, y);
                    }
                }
                else {
                    range = returnRanger;
                    if (distance < range) {
                        if (!OrderId2String(GetUnitCurrentOrder(pet))) {
                            IssuePointOrder(pet, OrderId2String(OrderId.Patrol), GetUnitX(captain), GetUnitY(captain));
                        }
                    }
                    else {
                        range = outRanger;
                        if (distance != 0 && distance > range) {
                            SetUnitPosition(pet, GetUnitX(captain), GetUnitY(captain));
                            let effectHandle = AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl", captain, "chest");
                            DestroyEffect(effectHandle);
                        }
                        else {
                            IssuePointOrder(pet, OrderId2String(OrderId.Move), GetUnitX(captain), GetUnitY(captain));
                        }
                    }
                }
            }
            else {
                IssuePointOrder(pet, OrderId2String(OrderId.Attack), GetUnitX(captain), GetUnitY(captain));
                handle_unref(pet);
                handle_unref(captain);
                return false;
            }
            return true;
        });
    }
}
