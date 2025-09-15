import FrameCallbackUtil from "@/util/frame/FrameCallbackUtil";
import AbilityUtil from "./AbilityUtil";
import KeyCode from "@/constant/KeyCode";
import LangUtil from "@/LangUtil";
export default class AbilityButtonUtil {
    static qwerKeyCodes = [KeyCode.VK_Q, KeyCode.VK_W, KeyCode.VK_E, KeyCode.VK_R];
    static qwerKeyNames = ["Q", "W", "E", "R"];
    /**
     *
     *  只能设置的按钮位置 为ture时  不会被没有设置位置的顶用
     * （以防止 设置技能的位置时  后面的未设置位置的 跑到前面的空位置去了）
     * 如果只有 WE 技能可设置 则buttonFixeds = [false, true, true, false];
     *
     */
    static onlySetButtons = [false, false, false, false];
    static _sl_bottomButtonArray = null;
    /**
     * 整数技能的id  与技能位置的 映射关系
     * 技能排序时 可以从这里获得技能的位置
     *
     * 注意这个数据是异步的 每个玩家都不一样
     *
     */
    static abilityIdButtonXMap = {};
    /**
     * 同步的技能数据 可做同步计算
     */
    static syncAbilityIdButtonXMap = {};
    /**
     * 设置技能底部按钮x位置
     * 只能QWER使用 本地玩家使用
     *
     * 注意单位 不能拥有相同位置的技能 否则会重叠按钮
     * @param unit
     * @param abilityIdStr
     * @param x
     */
    static setAbilityBottomButtonXAndHotKey(unit, abilityIdStr, x) {
        let player = GetOwningPlayer(unit);
        let keyCode = AbilityButtonUtil.qwerKeyCodes[x];
        AbilityUtil.setUnitAbilityHotkey(unit, abilityIdStr, keyCode, false);
        AbilityUtil.setUnitAbilityName(unit, abilityIdStr, _g_objs.ability[abilityIdStr].Name + "(" + AbilityButtonUtil.qwerKeyNames[x] + ")", true);
        return AbilityButtonUtil.setAbilityBottomButtonX(abilityIdStr, x, player);
    }
    /**
     * 设置技能底部按钮x位置
     * 只能QWER使用 本地玩家使用
     *
     * 注意单位 不能拥有相同位置的技能 否则会重叠按钮
     * @param abilityIdStr
     * @param x
     * @param player
     */
    static setAbilityBottomButtonX(abilityIdStr, x, player) {
        abilityIdStr = LangUtil.getIntId(abilityIdStr);
        let sABXMPD = AbilityButtonUtil.syncAbilityIdButtonXMap[GetPlayerId(player)];
        if (!sABXMPD) {
            sABXMPD = {};
            AbilityButtonUtil.syncAbilityIdButtonXMap[GetPlayerId(player)] = sABXMPD;
        }
        sABXMPD[abilityIdStr] = x;
        if (player != GetLocalPlayer()) {
            return;
        }
        AbilityButtonUtil._sl_init_bottomButton_system();
        AbilityButtonUtil.abilityIdButtonXMap[abilityIdStr] = x;
    }
    static _sl_isInitialized = false;
    static _sl_init_bottomButton_system() {
        if (AbilityButtonUtil._sl_isInitialized) {
            return;
        }
        AbilityButtonUtil._sl_bottomButtonArray = [
            DzFrameGetCommandBarButton(2, 0),
            DzFrameGetCommandBarButton(2, 1),
            DzFrameGetCommandBarButton(2, 2),
            DzFrameGetCommandBarButton(2, 3),
        ];
        for (let index = 0; index < 4; index++) {
            const uiid = AbilityButtonUtil._sl_bottomButtonArray[index];
            DzFrameClearAllPoints(uiid);
        }
        AbilityButtonUtil._sl_resetBottomButton();
        FrameCallbackUtil.addFrameSetUpdateCallback(AbilityButtonUtil._sl_refreshButton);
        AbilityButtonUtil._sl_isInitialized = true;
    }
    static lastFrameSelection = null;
    static lastNoAbility = false;
    static _sl_refreshButton() {
        //没有自定义的qwer 则可能选择了其他界面
        let noQwer = true;
        let xwz = [
            AbilityButtonUtil.onlySetButtons[0], AbilityButtonUtil.onlySetButtons[1],
            AbilityButtonUtil.onlySetButtons[2], AbilityButtonUtil.onlySetButtons[3]
        ];
        let frameSelection = selection();
        //当前帧 隐藏所有按钮
        if (frameSelection != AbilityButtonUtil.lastFrameSelection) {
            AbilityButtonUtil._sl_hideBottomButton();
            AbilityButtonUtil.lastFrameSelection = frameSelection;
            return;
        }
        AbilityButtonUtil.lastFrameSelection = frameSelection;
        let add = [];
        let noAbility = true; //没有技能 选择编队时也会没有技能 选择魔法书时最下排只有关闭按钮 也没有技能
        for (let index = 0; index < 4; index++) {
            const [skid] = button(index, 2);
            if (skid == 0 || !skid) {
                continue;
            }
            noAbility = false;
            const uiid = AbilityButtonUtil._sl_bottomButtonArray[index];
            /**
             * 注意单位 不能拥有相同位置的技能 否则会重叠按钮
             */
            const realButtonX = AbilityButtonUtil.abilityIdButtonXMap[skid];
            if (realButtonX) {
                xwz[realButtonX] = true;
                noQwer = false;
                DzFrameSetPoint(uiid, 8, DzGetGameUI(), 8, realButtonX * 0.0435 - 0.144, 0.007);
            }
            else {
                add.push(uiid);
            }
        }
        //无技能时  只隐藏一帧以防止图标闪动 (防止选择魔法书类型时 隐藏了关闭按钮)
        if (noAbility && !AbilityButtonUtil.lastNoAbility) {
            AbilityButtonUtil._sl_hideBottomButton();
            AbilityButtonUtil.lastNoAbility = noAbility;
            return;
        }
        AbilityButtonUtil.lastNoAbility = noAbility;
        //设置未设置技能位置
        for (const uiid of add) {
            let bol = true;
            for (let index = 0; index < xwz.length; index++) {
                if (!xwz[index]) {
                    bol = false;
                    xwz[index] = true;
                    DzFrameSetPoint(uiid, 8, DzGetGameUI(), 8, index * 0.0435 - 0.144, 0.007);
                    break;
                }
            }
            if (bol) {
                break;
            }
        }
        if (noQwer) {
            AbilityButtonUtil._sl_resetBottomButton();
        }
    }
    static _sl_hideBottomButton() {
        for (let index = 0; index < 4; index++) {
            const uiid = AbilityButtonUtil._sl_bottomButtonArray[index];
            DzFrameSetPoint(uiid, 8, DzGetGameUI(), 8, -1, -1);
        }
    }
    //重置UI
    static _sl_resetBottomButton() {
        for (let index = 0; index < 4; index++) {
            const uiid = AbilityButtonUtil._sl_bottomButtonArray[index];
            DzFrameSetPoint(uiid, 8, DzGetGameUI(), 8, index * 0.0435 - 0.144, 0.007);
        }
    }
    /**
     * addons
     */
    static hotKeys = ["Z", "X", "C", "V", "A", "S", "D", "F", "Q", "W", "E", "R"];
    /**
     * 根据1-12的技能位置编号  返回对应位置的快捷键
     * @param num
     */
    static getHotKeyByNumber(num) {
        if (num < 1) {
            return AbilityButtonUtil.hotKeys[0];
        }
        else if (num > 12) {
            return AbilityButtonUtil.hotKeys[11];
        }
        return AbilityButtonUtil.hotKeys[num - 1];
    }
    /**
     * 根据按钮的序号 1-12
     * 从左到右 从上到下 左上角为1(0,0) 右下角为12(3,2)
     * 获得 技能原始xy坐标
     */
    static getPosByNumber(number) {
        if (number < 1 || number > 12) {
            return { x: 0, y: -11 };
        }
        let x = (number - 1) % 4;
        let y = Math.floor((number - 1) / 4);
        return { x: x, y: y };
    }
    static getNumberByPos(xOrPos, y) {
        if (xOrPos == null) {
            return 0;
        }
        let x = 0;
        if (y == null) {
            x = xOrPos.x;
            y = xOrPos.y;
        }
        else {
            x = xOrPos;
        }
        return y * 4 + x + 1;
    }
    static getPos(xOrPosOrNum, y) {
        let x = 0;
        if (y == null) {
            if (LangUtil.isNumber(xOrPosOrNum)) {
                if (xOrPosOrNum == -1) {
                    return { x: 0, y: -11 };
                }
                let x = (xOrPosOrNum - 1) % 4;
                let y = Math.floor((xOrPosOrNum - 1) / 4);
                return { x: x, y: y };
            }
            else {
                return xOrPosOrNum;
            }
        }
        else {
            x = xOrPosOrNum;
        }
        return { x, y };
    }
    /**
     * 根据屏幕位置获取技能的xy
     * (改过ui的可以重写此函数以兼容调用此函数的系统 AbilityButtonUtil.getPosBySceneXY = xxx)
     * @param sceneX
     * @param sceneY
     */
    static getPosBySceneXY(sceneX, sceneY) {
        let rY = 2 - Math.floor((sceneY - 0.01) / 0.041);
        if (rY < 0 || rY > 2) {
            return null;
        }
        let rX = Math.floor((sceneX - 0.618) / 0.0425);
        if (rX < 0 || rX > 3) {
            return null;
        }
        return { x: rX, y: rY };
    }
    static btnUIWidth = 0.04;
    static btnUIHeight = 0.04;
    static btnUIXGap = 0.0035;
    static btnUIYGap = 0.0035;
    static btnUIXMargin = 0.012;
    static btnUIYMargin = 0.007;
    /**
     * 根据技能图标按钮位置获得ui的xy位置 (描点为右下角对GameUI的右下角)
     * 使用示例:
     let uiPos = AbilityButtonUtil.getUIXYByPos(0, 0);
     DzFrameSetAbsolutePoint(ui, 8 , uiPos.x, uiPos.y)
     * @param x
     * @param y
     */
    static getUIXYByPos(x, y) {
        let uiX = 0.8 - (3 - x) * (AbilityButtonUtil.btnUIWidth + AbilityButtonUtil.btnUIXGap) - AbilityButtonUtil.btnUIXMargin;
        let uiY = (2 - y) * (AbilityButtonUtil.btnUIHeight + AbilityButtonUtil.btnUIYGap) + AbilityButtonUtil.btnUIYMargin;
        return { x: uiX, y: uiY };
    }
}
