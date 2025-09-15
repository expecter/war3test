/** @noSelfInFile **/
import { Handle } from "./handle";
export class MultiboardItem extends Handle {
    constructor(board, x, y) {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(MultiboardGetItem(board.handle, x - 1, y - 1));
        }
    }
    /**
     * 删除多面板项目 [R]
     */
    destroy() {
        MultiboardReleaseItem(this.handle);
    }
    /**
     * 设置指定项目图标 [R]
     */
    setIcon(icon) {
        MultiboardSetItemIcon(this.handle, icon);
    }
    /**
     * 设置指定项目显示风格 [R]
     */
    setStyle(showValue, showIcon) {
        MultiboardSetItemStyle(this.handle, showValue, showIcon);
    }
    /**
     * 设置指定项目文本 [R]
     */
    setValue(val) {
        MultiboardSetItemValue(this.handle, val);
    }
    /**
     * 设置指定项目颜色 [R]
     */
    setValueColor(red, green, blue, alpha) {
        MultiboardSetItemValueColor(this.handle, red, green, blue, alpha);
    }
    /**
     * 设置指定项目宽度 [R]
     */
    setWidth(width) {
        MultiboardSetItemWidth(this.handle, width);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
export class Multiboard extends Handle {
    constructor() {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateMultiboard());
        }
    }
    /**
     * 获得多列面板 的列数
     */
    get columns() {
        return MultiboardGetColumnCount(this.handle);
    }
    /**
     * 改变多列面板'列数'
     */
    set columns(count) {
        MultiboardSetColumnCount(this.handle, count);
    }
    /**
     * 多列面板 是已显示的
     */
    get displayed() {
        return IsMultiboardDisplayed(this.handle);
    }
    /**
     * 获得多列面板 的行数
     */
    get rows() {
        return MultiboardGetRowCount(this.handle);
    }
    /**
     * 改变多列面板'行数'
     */
    set rows(count) {
        MultiboardSetRowCount(this.handle, count);
    }
    /**
     * 改变 多列面板 标题
     */
    set title(label) {
        MultiboardSetTitleText(this.handle, label);
    }
    /**
     * 多列面板 的标题
     */
    get title() {
        return MultiboardGetTitleText(this.handle);
    }
    /**
     * 清除 多列面板
     */
    clear() {
        MultiboardClear(this.handle);
    }
    /**
     * 新建 多列面板项目
     */
    createItem(x, y) {
        return new MultiboardItem(this, x, y);
    }
    /**
     * 销毁
     */
    destroy() {
        DestroyMultiboard(this.handle);
    }
    /**
     * 显示
     */
    display(show) {
        MultiboardDisplay(this.handle, show);
    }
    /**
     * 最大/最小化 [R]
     */
    minimize(flag) {
        MultiboardMinimize(this.handle, flag);
    }
    /**
     * 多列面板 是最小化的
     */
    minimized() {
        return IsMultiboardMinimized(this.handle);
    }
    /**
     * 设置所有项目图标 [R]
     */
    setItemsIcons(icon) {
        MultiboardSetItemsIcon(this.handle, icon);
    }
    /**
     * 设置所有项目显示风格 [R]
     */
    setItemsStyle(showValues, showIcons) {
        MultiboardSetItemsStyle(this.handle, showValues, showIcons);
    }
    /**
     * 设置所有项目文本 [R]
     */
    setItemsValue(value) {
        MultiboardSetItemsValue(this.handle, value);
    }
    /**
     * 设置所有项目颜色 [R]
     */
    setItemsValueColor(red, green, blue, alpha) {
        MultiboardSetItemsValueColor(this.handle, red, green, blue, alpha);
    }
    /**
     * 设置所有项目宽度 [R]
     */
    setItemsWidth(width) {
        MultiboardSetItemsWidth(this.handle, width);
    }
    /**
     * 设置标题颜色 [R]
     */
    setTitleTextColor(red, green, blue, alpha) {
        MultiboardSetTitleTextColor(this.handle, red, green, blue, alpha);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
    /**
     * 显示/隐藏多面板模式 [R]
     */
    static suppressDisplay(flag) {
        MultiboardSuppressDisplay(flag);
    }
}
