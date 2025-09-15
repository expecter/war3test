import { OrderId as OrderIdMap } from "@/w3ts/globals/order";
import { AbilityOrder } from "@sl-wc3/lib/core/base_object/AbilityObjectIdOrder";
/**
 * 设置技能
 */
export default class AbilityOrderUtil {
    /**
     * 获取技能命令
     * @param abilityIdStr
     * @param type
     */
    static getOrder(abilityIdStr) {
        if (!_g_objs.ability[abilityIdStr]) {
            return 0;
        }
        let code = _g_objs.ability[abilityIdStr].code;
        if (code == 'ANcl') {
            let order = _g_objs.ability[abilityIdStr].DataF1;
            if (!order) {
                return 0;
            }
            return OrderIdMap[order] || OrderId(order);
        }
        return AbilityOrder[code] || 0;
    }
    ;
}
