/** @noSelfInFile **/
import { Handle } from "./handle";
export class Leaderboard extends Handle {
    constructor() {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateLeaderboard());
        }
    }
    /**
     * 添加玩家
     * @param label
     * @param value
     * @param p
     */
    addItem(label, value, p) {
        LeaderboardAddItem(this.handle, label, value, p.handle);
    }
    /**
     * 清空 [R]
     */
    clear() {
        LeaderboardClear(this.handle);
    }
    /**
     * 删除排行榜
     */
    destroy() {
        DestroyLeaderboard(this.handle);
    }
    /**
     * 显示/隐藏 [R]
     */
    display(flag = true) {
        LeaderboardDisplay(this.handle, flag);
    }
    /**
     * 是否显示排行榜
     */
    get displayed() {
        return IsLeaderboardDisplayed(this.handle);
    }
    /**
     * 行数
     */
    get itemCount() {
        return LeaderboardGetItemCount(this.handle);
    }
    /**
     * 排行榜设置大小（按项目计数）
     * @param count
     */
    set itemCount(count) {
        LeaderboardSetSizeByItemCount(this.handle, count);
    }
    /**
     * 排行榜获取玩家指数
     * @param p
     */
    getPlayerIndex(p) {
        return LeaderboardGetPlayerIndex(this.handle, p.handle);
    }
    /**
     * 排行榜有玩家项目
     * @param p
     */
    hasPlayerItem(p) {
        LeaderboardHasPlayerItem(this.handle, p.handle);
    }
    /**
     * 排行榜删除项目
     * @param index
     */
    removeItem(index) {
        LeaderboardRemoveItem(this.handle, index);
    }
    /**
     * 排行榜删除玩家项目
     * @param index
     */
    removePlayerItem(p) {
        LeaderboardRemovePlayerItem(this.handle, p.handle);
    }
    /**
     * 排行榜集合项目标签
     * @param item
     * @param label
     */
    setItemLabel(item, label) {
        LeaderboardSetItemLabel(this.handle, item, label);
    }
    /**
     * 排行榜设置项目标签颜色
     * @param item
     * @param red
     * @param green
     * @param blue
     * @param alpha
     */
    setItemLabelColor(item, red, green, blue, alpha) {
        LeaderboardSetItemLabelColor(this.handle, item, red, green, blue, alpha);
    }
    /**
     * 排行榜集合项目样式
     * @param item
     * @param showLabel
     * @param showValues
     * @param showIcons
     */
    setItemStyle(item, showLabel = true, showValues = true, showIcons = true) {
        LeaderboardSetItemStyle(this.handle, item, showLabel, showValues, showIcons);
    }
    /**
     * 排行榜设置项目值
     * @param item
     * @param value
     */
    setItemValue(item, value) {
        LeaderboardSetItemValue(this.handle, item, value);
    }
    /**
     * 排行榜设置项目值颜色
     * @param item
     * @param red
     * @param green
     * @param blue
     * @param alpha
     */
    setItemValueColor(item, red, green, blue, alpha) {
        LeaderboardSetItemValueColor(this.handle, item, red, green, blue, alpha);
    }
    /**
     * 设置文字颜色 [R]
     */
    setLabelColor(red, green, blue, alpha) {
        LeaderboardSetLabelColor(this.handle, red, green, blue, alpha);
    }
    /**
     * 设置玩家使用的排行榜 [R]
     */
    setPlayerBoard(p) {
        PlayerSetLeaderboard(p.handle, this.handle);
    }
    /**
     * 排行榜设置样式
     * @param showLabel
     * @param showNames
     * @param showValues
     * @param showIcons
     */
    setStyle(showLabel = true, showNames = true, showValues = true, showIcons = true) {
        LeaderboardSetStyle(this.handle, showLabel, showNames, showValues, showIcons);
    }
    /**
     * 设置数值颜色 [R]
     */
    setValueColor(red, green, blue, alpha) {
        LeaderboardSetValueColor(this.handle, red, green, blue, alpha);
    }
    /**
     * 根据标签排行
     * @param asc
     */
    sortByLabel(asc = true) {
        LeaderboardSortItemsByLabel(this.handle, asc);
    }
    /**
     * 根据玩家排行
     * @param asc
     */
    sortByPlayer(asc = true) {
        LeaderboardSortItemsByPlayer(this.handle, asc);
    }
    /**
     * 根据值排行
     * @param asc
     */
    sortByValue(asc = true) {
        LeaderboardSortItemsByValue(this.handle, asc);
    }
    /**
     * 设置标签
     * @param asc
     */
    set label(value) {
        LeaderboardSetLabel(this.handle, value);
    }
    /**
     * 标签
     * @param asc
     */
    get label() {
        return LeaderboardGetLabelText(this.handle);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
    static fromPlayer(p) {
        return this.fromHandle(PlayerGetLeaderboard(p.handle));
    }
}
