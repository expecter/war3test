/** @noSelfInFile **/
import { Handle } from "./handle";
import { Unit } from "./unit";
import GroupUtil from "../../util/unit/GroupUtil";
export class Group extends Handle {
    constructor() {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateGroup());
        }
    }
    // public addGroupFast(addGroup: Group): number {
    //   return BlzGroupAddGroupFast(this.handle, addGroup.handle);
    // }
    /**
     * 添加单位 [R]
     */
    addUnit(whichUnit) {
        GroupAddUnit(this.handle, whichUnit.handle);
    }
    /**
     * 清除
     */
    clear() {
        GroupClear(this.handle);
    }
    /**
     * 删除单位组 [R]
     */
    destroy() {
        DestroyGroup(this.handle);
    }
    /**
     * 选取单位添加到单位组(坐标)
     */
    enumUnitsInRange(x, y, radius, filter) {
        GroupEnumUnitsInRange(this.handle, x, y, radius, filter);
    }
    /**
     * 选取单位添加到单位组(坐标)(不建议使用)
     */
    enumUnitsInRangeCounted(x, y, radius, filter, countLimit) {
        GroupEnumUnitsInRangeCounted(this.handle, x, y, radius, filter, countLimit);
    }
    /**
     * 选取单位添加到单位组(点)
     */
    enumUnitsInRangeOfPoint(whichPoint, radius, filter) {
        GroupEnumUnitsInRangeOfLoc(this.handle, whichPoint.handle, radius, filter);
    }
    /**
     * 选取单位添加到单位组(点)(不建议使用)
     */
    enumUnitsInRangeOfPointCounted(whichPoint, radius, filter, countLimit) {
        GroupEnumUnitsInRangeOfLocCounted(this.handle, whichPoint.handle, radius, filter, countLimit);
    }
    /**
     * 匹配范围单位
     */
    enumUnitsInRect(r, filter) {
        GroupEnumUnitsInRect(this.handle, r, filter);
    }
    /**
     * 匹配范围单位 [countLimit 上限]
     */
    enumUnitsInRectCounted(r, filter, countLimit) {
        GroupEnumUnitsInRectCounted(this.handle, r.handle, filter, countLimit);
    }
    /**
     * 通过玩家匹配单位
     */
    enumUnitsOfPlayer(whichPlayer, filter) {
        GroupEnumUnitsOfPlayer(this.handle, whichPlayer.handle, filter);
    }
    /**
     * 通过单位类型匹配单位
     */
    enumUnitsOfType(unitName, filter) {
        GroupEnumUnitsOfType(this.handle, unitName, filter);
    }
    /**
     * 通过单位类型匹配单位 [countLimit 上限]
     */
    enumUnitsOfTypeCounted(unitName, filter, countLimit) {
        GroupEnumUnitsOfTypeCounted(this.handle, unitName, filter, countLimit);
    }
    /**
     * 选取单位添加到单位组(点)(不建议使用)
     */
    enumUnitsSelected(whichPlayer, radius, filter) {
        GroupEnumUnitsSelected(this.handle, whichPlayer.handle, filter);
    }
    /**
     * 选取所有单位在单位组做 多动作
     * @deprecated 请使用GroupUtil.for  以减少内存泄漏
     */
    for(callback) {
        ForGroup(this.handle, callback);
    }
    /**
     * 太阳for 保留原group 内的单位
     * @param whichGroup
     * @param callback
     */
    forSL(callback) {
        GroupUtil.forSL(this.handle, callback);
    }
    /**
     * 单位组中第一个单位
     */
    get first() {
        return Unit.fromHandle(FirstOfGroup(this.handle));
    }
    // public get size(): number {
    //   return BlzGroupGetSize(this.handle);
    // }
    //
    // public getUnitAt(index: number): Unit {
    //   return Unit.fromHandle(BlzGroupUnitAt(this.handle, index));
    // }
    /**
     * 单位在 单位组
     */
    hasUnit(whichUnit) {
        return IsUnitInGroup(whichUnit.handle, this.handle);
    }
    /**
     * 发布命令(指定坐标) [R]
     */
    orderCoords(order, x, y) {
        if (typeof order === "string") {
            GroupPointOrder(this.handle, order, x, y);
        }
        else {
            GroupPointOrderById(this.handle, order, x, y);
        }
    }
    /**
     * 发送单位组命令到 没有目标
     */
    orderImmediate(order) {
        if (typeof order === "string") {
            GroupImmediateOrder(this.handle, order);
        }
        else {
            GroupImmediateOrderById(this.handle, order);
        }
    }
    /**
     * 发送单位组命令到 点
     */
    orderPoint(order, whichPoint) {
        if (typeof order === "string") {
            GroupPointOrderLoc(this.handle, order, whichPoint.handle);
        }
        else {
            GroupPointOrderByIdLoc(this.handle, order, whichPoint.handle);
        }
    }
    /**
     * 发送单位组命令到 单位
     */
    orderTarget(order, targetWidget) {
        if (typeof order === "string") {
            GroupTargetOrder(this.handle, order, targetWidget.handle);
        }
        else {
            GroupTargetOrderById(this.handle, order, targetWidget.handle);
        }
    }
    // public removeGroupFast(removeGroup: Group): number {
    //   return BlzGroupRemoveGroupFast(this.handle, removeGroup.handle);
    // }
    //
    // public removeUnit(whichUnit: Unit): boolean {
    //   return GroupRemoveUnit(this.handle, whichUnit.handle);
    // }
    /**
     * 从handle获取单位组封装类
     */
    static fromHandle(handle) {
        return this.getObject(handle);
    }
    /**
     * 选取的单位
     */
    static getEnumUnit() {
        return Unit.fromHandle(GetEnumUnit());
    }
    /**
     * 匹配的单位
     */
    static getFilterUnit() {
        return Unit.fromHandle(GetFilterUnit());
    }
}
