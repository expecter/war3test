/** @noSelfInFile **/
import { Handle } from "./handle";
export class Rectangle extends Handle {
    constructor(minX, minY, maxX, maxY) {
        let mapMinX = GetRectMinX(bj_mapInitialPlayableArea);
        let mapMinY = GetRectMinY(bj_mapInitialPlayableArea);
        let mapMaxX = GetRectMaxX(bj_mapInitialPlayableArea);
        let mapMaxY = GetRectMaxY(bj_mapInitialPlayableArea);
        minX = math.max(minX, mapMinX);
        minY = math.max(minY, mapMinY);
        maxX = math.min(maxX, mapMaxX);
        maxY = math.min(maxY, mapMaxY);
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(Rect(minX, minY, maxX, maxY));
        }
    }
    /**
     * 区域中心的 X 坐标
     */
    get centerX() {
        return GetRectCenterX(this.handle);
    }
    /**
     * 区域中心的 Y 坐标
     */
    get centerY() {
        return GetRectCenterY(this.handle);
    }
    /**
     * 区域最大 X 坐标
     */
    get maxX() {
        return GetRectMaxX(this.handle);
    }
    /**
     * 区域最大 Y 坐标
     */
    get maxY() {
        return GetRectMaxY(this.handle);
    }
    /**
     * 区域最小 X 坐标
     */
    get minX() {
        return GetRectMinX(this.handle);
    }
    /**
     * 区域最小 Y 坐标
     */
    get minY() {
        return GetRectMinY(this.handle);
    }
    /**
     * 删除矩形区域 [R]
     */
    destroy() {
        RemoveRect(this.handle);
    }
    /**
     * 遍历区域内的可破坏物
     * @param filter
     * @param actionFunc
     */
    enumDestructables(filter, actionFunc) {
        EnumDestructablesInRect(this.handle, filter, actionFunc);
    }
    /**
     * 遍历区域内的物品
     * @param filter
     * @param actionFunc
     */
    enumItems(filter, actionFunc) {
        EnumItemsInRect(this.handle, filter, actionFunc);
    }
    /**
     * 移动
     */
    move(newCenterX, newCenterY) {
        MoveRectTo(this.handle, newCenterX, newCenterY);
    }
    /**
     * 移动到点
     */
    movePoint(newCenterPoint) {
        MoveRectToLoc(this.handle, newCenterPoint.handle);
    }
    /**
     * 设置矩形区域(指定坐标) [R]
     */
    setRect(minX, minY, maxX, maxY) {
        SetRect(this.handle, minX, minY, maxX, maxY);
    }
    /**
     * 设置矩形区域(指定点) [R]
     */
    setRectFromPoint(min, max) {
        SetRectFromLoc(this.handle, min.handle, max.handle);
    }
}
