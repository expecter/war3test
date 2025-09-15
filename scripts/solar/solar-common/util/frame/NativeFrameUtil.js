export default class NativeFrameUtil {
    /*** 获取金币文本 */
    static getGoldText() {
        return DzSimpleFontStringFindByName("ResourceBarGoldText", 0);
    }
    /*** 获取木材文本 */
    static getLumberText() {
        return DzSimpleFontStringFindByName("ResourceBarLumberText", 0);
    }
    /*** 获取人口文本 */
    static getSupplyText() {
        return DzSimpleFontStringFindByName("ResourceBarSupplyText", 0);
    }
    /*** 获取物品名称 */
    static getItemName() {
        return DzSimpleFontStringFindByName("SimpleItemNameValue", 3);
    }
    /*** 获取物品说明*/
    static getItemTips() {
        return DzSimpleFontStringFindByName("SimpleItemDescriptionValue", 3);
    }
    /*** 单位状态攻击面板 */
    static getUnitStatePanel() {
        return DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 0);
    }
    /*** 英雄面板父对象*/
    static getHeroStatePanel() {
        return DzSimpleFrameFindByName("SimpleInfoPanelIconHeroText", 6);
    }
    /*** 英雄主属性父对象*/
    static getHeroPanel() {
        return DzSimpleFrameFindByName("SimpleInfoPanelIconHero", 6);
    }
    /*** 获取单位名称*/
    static getUnitName() {
        return DzSimpleFontStringFindByName("SimpleNameValue", 0);
    }
    /*** 获取英雄称谓*/
    static getUnitClass() {
        return DzSimpleFontStringFindByName("SimpleClassValue", 0);
    }
    /*** 获取单位攻击图标*/
    static getUnitAttackIcon(index) {
        return DzSimpleTextureFindByName("InfoPanelIconBackdrop", index);
    }
    /*** 单位攻击标签*/
    static getUnitAttackLabel(index) {
        return DzSimpleFontStringFindByName("InfoPanelIconLabel", index);
    }
    /*** 单位攻击数值*/
    static getUnitAttackValue(index) {
        return DzSimpleFontStringFindByName("InfoPanelIconValue", index);
    }
    /*** 获取单位护甲图标*/
    static getUnitArmorIcon() {
        return DzSimpleTextureFindByName("InfoPanelIconBackdrop", 2);
    }
    /*** 单位护甲标签*/
    static getUnitArmorLabel() {
        return DzSimpleFontStringFindByName("InfoPanelIconLabel", 2);
    }
    /*** 单位护甲数值*/
    static getUnitArmorValue() {
        return DzSimpleFontStringFindByName("InfoPanelIconValue", 2);
    }
    /*** 获取单位*/
    static getUnitAttack2Icon() {
        return DzSimpleTextureFindByName("InfoPanelIconBackdrop", 5);
    }
    /*** 英雄主属性图标*/
    static getHeroPanelIcon() {
        return DzSimpleTextureFindByName("InfoPanelIconHeroIcon", 6);
    }
    /*** 获取生命周期条*/
    static getProgressBar() {
        return DzSimpleFrameFindByName("SimpleProgressIndicator", 0);
    }
    /*** 获取英雄经验条*/
    static getHeroLevelBar() {
        return DzSimpleFrameFindByName("SimpleHeroLevelBar", 0);
    }
    /*** 英雄属性数值*/
    static getHeroStrValue() {
        return DzSimpleFontStringFindByName("InfoPanelIconHeroStrengthValue", 6);
    }
    static getHeroAgiValue() {
        return DzSimpleFontStringFindByName("InfoPanelIconHeroAgilityValue", 6);
    }
    static getHeroIntValue() {
        return DzSimpleFontStringFindByName("InfoPanelIconHeroIntellectValue", 6);
    }
    /*** 英雄属性标签*/
    static getHeroStrLabel() {
        return DzSimpleFontStringFindByName("InfoPanelIconHeroStrengthLabel", 6);
    }
    static getHeroAgiLabel() {
        return DzSimpleFontStringFindByName("InfoPanelIconHeroAgilityLabel", 6);
    }
    static getHeroIntLabel() {
        return DzSimpleFontStringFindByName("InfoPanelIconHeroIntellectLabel", 6);
    }
    /*** 英雄属性标签 带参数  */
    static getHeroStateLabel(index) {
        if (index == 1) {
            return NativeFrameUtil.getHeroStrLabel();
        }
        else if (index == 2) {
            return NativeFrameUtil.getHeroAgiLabel();
        }
        else if (index == 3) {
            return NativeFrameUtil.getHeroIntLabel();
        }
        return 0;
    }
    /*** 英雄属性数值 带参数 */
    static getHeroStateValue(index) {
        if (index == 1) {
            return NativeFrameUtil.getHeroStrValue();
        }
        else if (index == 2) {
            return NativeFrameUtil.getHeroAgiValue();
        }
        else if (index == 3) {
            return NativeFrameUtil.getHeroIntValue();
        }
        return 0;
    }
    /*** 单位信息面板 */
    static getUnitDetail() {
        return DzSimpleFrameFindByName("SimpleInfoPanelUnitDetail", 0);
    }
    /**
     * 遍历原生右下角的12个按钮图标
     * @param callBack
     */
    static forCommandBarButtons(callBack) {
        for (let x = 0; x <= 3; x++) {
            for (let y = 0; y <= 2; y++) {
                let cmdButton = DzFrameGetCommandBarButton(y, x);
                callBack(cmdButton, x, y);
            }
        }
    }
}
