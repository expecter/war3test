/** @noSelfInFile **/
import { Handle } from "./handle";
export class Region extends Handle {
    constructor() {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateRegion());
        }
    }
    /**
     * 添加单元点(指定坐标) [R]
     */
    addCell(x, y) {
        RegionAddCell(this.handle, x, y);
    }
    /**
     * 添加单元点(指定点) [R]
     */
    addCellPoint(whichPoint) {
        RegionAddCellAtLoc(this.handle, whichPoint.handle);
    }
    /**
     * 添加区域 [R]
     */
    addRect(r) {
        RegionAddRect(this.handle, r.handle);
    }
    /**
     * 移除单元点(指定坐标) [R]
     */
    clearCell(x, y) {
        RegionClearCell(this.handle, x, y);
    }
    /**
     * 移除单元点(指定点) [R]
     */
    clearCellPoint(whichPoint) {
        RegionClearCellAtLoc(this.handle, whichPoint.handle);
    }
    /**
     * 移除区域 [R]
     */
    clearRect(r) {
        RegionClearRect(this.handle, r.handle);
    }
    /**
     * 包含坐标
     */
    containsCoords(x, y) {
        return IsPointInRegion(this.handle, x, y);
    }
    /**
     * 包含点
     */
    containsPoint(whichPoint) {
        IsLocationInRegion(this.handle, whichPoint.handle);
    }
    /**
     * 单位检查
     */
    containsUnit(whichUnit) {
        return IsUnitInRegion(this.handle, whichUnit.handle);
    }
    /**
     * 删除不规则区域 [R]
     */
    destroy() {
        RemoveRegion(this.handle);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
