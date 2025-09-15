/** @noSelf **/
export default class DestructableUtil {
    static lastDestructables = [];
    /**
     * 在指定区域是否有装饰物
     * @param centerX
     * @param centerY
     * @param radius
     * @param destructableId
     */
    static hasDestructableInRect(centerX, centerY, radius, destructableId) {
        tempBoolean = false;
        tempNumber = FourCC(destructableId);
        //使用命名函数
        SetRect(tempRect, centerX - radius, centerY - radius, centerX + radius, centerY + radius);
        //使用命名函数
        EnumDestructablesInRect(tempRect, null, DestructableUtil._HasDestructableInRectActionFunc);
        return tempBoolean;
    }
    /**
     * 获取区域内的一个可破坏物
     * @param centerX
     * @param centerY
     * @param radius
     */
    static getDestructableInRect(centerX, centerY, radius) {
        DestructableUtil.getDestructablesInRect(centerX, centerY, radius);
        if (DestructableUtil.lastDestructables && DestructableUtil.lastDestructables.length > 0) {
            return DestructableUtil.lastDestructables[0];
        }
        return null;
    }
    /**
     * 获取区域内的所有可破坏物
     * @param centerX
     * @param centerY
     * @param radius
     */
    static getDestructablesInRect(centerX, centerY, radius) {
        DestructableUtil.lastDestructables = [];
        SetRect(tempRect, centerX - radius, centerY - radius, centerX + radius, centerY + radius);
        //使用命名函数
        EnumDestructablesInRect(tempRect, null, DestructableUtil._GetDestructableInRectActionFunc);
        return DestructableUtil.lastDestructables;
    }
    static _HasDestructableInRectActionFunc() {
        if (GetDestructableTypeId(GetEnumDestructable()) == tempNumber) {
            tempBoolean = true;
        }
    }
    static _GetDestructableInRectActionFunc() {
        DestructableUtil.lastDestructables.push(GetEnumDestructable());
    }
}
