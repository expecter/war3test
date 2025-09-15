export default class DebugSgpUtil {
    static _sl_onCreateUnitListeners = [];
    static _sl_onCreateItemListeners = [];
    static _sl_onCreateAbilityUnitListeners = [];
    static _sl_customMenus = [];
    static _sl_customMenuActions = {};
    /**
     * 添加自定义的菜单项
     * 请在地图游戏开始1.5秒内添加 之后添加的数据不会被刷新到太阳按钮上
     * editorActionCommand 会在点击onAction回调之前在编辑器里执行 并且将执行的结果传入onAction的参数列表
     */
    static addCustomMenu(menuName, onAction, category = "基础", editorActionCommand, editorActionCommandParams) {
        let categoryMenu = null;
        for (let temp of DebugSgpUtil._sl_customMenus) {
            if (temp.name == category) {
                categoryMenu = temp;
                break;
            }
        }
        if (!categoryMenu) {
            categoryMenu = {
                name: category,
                menuItems: []
            };
            DebugSgpUtil._sl_customMenus.push(categoryMenu);
        }
        //
        categoryMenu.menuItems.push({
            name: menuName,
            editorActionCommand: editorActionCommand,
            editorActionCommandParams: editorActionCommandParams
        });
        let key = category + "_sl_" + menuName;
        DebugSgpUtil._sl_customMenuActions[key] = onAction;
    }
    static addCustomMenu_SelectUnitIds(menuName, onAction, category = "单位测试") {
        DebugSgpUtil.addCustomMenu(menuName, onAction, category, "ObjectSelectPanel", "unit");
    }
    static addCustomMenu_SelectItemIds(menuName, onAction, category = "物品测试") {
        DebugSgpUtil.addCustomMenu(menuName, onAction, category, "ObjectSelectPanel", "unit");
    }
    static addCustomMenu_SelectAbilityIds(menuName, onAction, category = "技能测试") {
        DebugSgpUtil.addCustomMenu(menuName, onAction, category, "ObjectSelectPanel", "unit");
    }
    /**
     *
     * @param menuName 菜单名字
     * @param onAction 点击后的回调
     * @param category 菜单分类
     * @param allOptionStrs 所有字符串选项
     */
    static addCustomMenu_SelectCustomStrs(menuName, onAction, category, allOptionStrs) {
        DebugSgpUtil.addCustomMenu(menuName, onAction, category, "CustomStrsPanel", allOptionStrs);
    }
    /**
     * 在左上角太阳按钮右键点击创建单位物编后会回调此方法
     * 添加创建单位的监听
     * @param listener
     */
    static addOnCreateUnitListener(listener) {
        DebugSgpUtil._sl_onCreateUnitListeners.push(listener);
    }
    /**
     * 创建物品物编时的回调
     * @param listener
     */
    static addOnCreateItemListener(listener) {
        DebugSgpUtil._sl_onCreateItemListeners.push(listener);
    }
    /**
     * 创建携带技能的单位
     * @param listener
     */
    static addOnCreateAbilityUnitListener(listener) {
        DebugSgpUtil._sl_onCreateAbilityUnitListeners.push(listener);
    }
}
