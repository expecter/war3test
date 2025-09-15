/** @noSelfInFile **/
import DataBase from "@/DataBase";
import AsyncUtil from "@/AsyncUtil";
import Cache from "@/Cache";
import FramePoint from "@/FramePoint";
import InputUtil from "@/InputUtil";
import BaseUtil from "@/BaseUtil";
import SolarEvent from "@/SolarEvent";
import ArrayUtil from "@/ArrayUtil";
export class Frame {
    static _sl_cache = new Cache();
    current = 0;
    type = "";
    //缓存数据 要保证这里的数据是真实的Frame的数据 即所有修改frame的值都通过此类修改。否则访问这里的值可能不准确
    propsTemp = null;
    constructor(frameOrFrameType, name, parent, template, id) {
        if (!frameOrFrameType) { //创建一个空的Frame 然后自行设置current的 值
            return;
        }
        const type = typeof frameOrFrameType;
        if (type == "number") { //如果名字不存在 说明是包装一个已有的frame
            this.current = frameOrFrameType;
            Frame._sl_cache.put("handle:" + this.current, this);
            return;
        }
        if (!name) {
            name = "Solar:Frame:" + AsyncUtil.getUUIDAsync();
        }
        if (!parent) {
            parent = DzGetGameUI();
        }
        if (!template) {
            template = "";
        }
        if (!id) {
            id = 0;
        }
        this.type = frameOrFrameType;
        if (frameOrFrameType == "MODEL") {
            //内置才有这个api
            this.current = FrameAddModel(parent);
        }
        else {
            this.current = DzCreateFrameByTagName(frameOrFrameType, name, parent, template, id);
        }
        Frame._sl_cache.put("handle:" + this.current, this);
    }
    get props() {
        if (!this.propsTemp) { //初始化一个空的props
            if (this.current == 0) {
                this.propsTemp = { size: {}, position: { relative: 0, x: 0, y: 0 }, visible: true, scale: 1 };
            }
            else {
                this.propsTemp = {
                    size: {
                        width: 0,
                        height: 0
                    },
                    position: {
                        relative: DzFrameGetParent(this.current),
                        x: 0,
                        y: 0
                    },
                    visible: true,
                    scale: 1
                };
            }
        }
        return this.propsTemp;
    }
    set props(obj) {
        this.propsTemp = obj;
    }
    get solarData() {
        return DataBase.getDataByTypeId("_SL_Frame", tostring(this.current));
    }
    set solarData(obj) {
        DataBase.setDataByTypeId("_SL_Frame", tostring(this.current), obj);
    }
    get handle() {
        return this.current;
    }
    set alpha(alpha) {
        DzFrameSetAlpha(this.current, alpha);
    }
    get alpha() {
        return DzFrameGetAlpha(this.current);
    }
    // public get children() {
    //     const count = this.childrenCount;
    //     const output: Frame[] = [];
    //     for (let i = 0; i < count; i++) {
    //         output.push(this.getChild(i));
    //     }
    //     return output;
    // }
    //
    // public get childrenCount() {
    //     return DzFrameGetChildrenCount(this.current);
    // }
    /**设置窗体禁用/启用 */
    set enabled(flag) {
        DzFrameSetEnable(this.current, flag);
    }
    /**获取控件是否启用 */
    get enabled() {
        return DzFrameGetEnable(this.current);
    }
    set height(height) {
        this.props.size.height = height;
        if (this.current != 0) {
            DzFrameSetSize(this.current, this.width, height);
        }
    }
    get height() {
        if (this.current == 0) {
            return this.props.size.height;
        }
        return DzFrameGetHeight(this.current);
    }
    set parent(parent) {
        DzFrameSetParent(this.current, parent);
    }
    get parent() {
        return DzFrameGetParent(this.current);
    }
    set text(text) {
        this.setText(text);
    }
    get text() {
        return this.getText();
    }
    set textSizeLimit(size) {
        DzFrameSetTextSizeLimit(this.current, size);
    }
    get textSizeLimit() {
        return DzFrameGetTextSizeLimit(this.current);
    }
    set value(value) {
        DzFrameSetValue(this.current, value);
    }
    get value() {
        return DzFrameGetValue(this.current);
    }
    /**显示/隐藏窗体 */
    set visible(flag) {
        this.props.visible = flag;
        DzFrameShow(this.current, flag);
    }
    get visible() {
        return this.props.visible;
    }
    set width(width) {
        this.props.size.width = width;
        DzFrameSetSize(this.current, width, this.height);
    }
    get width() {
        return this.props.size.width;
    }
    cageMouse(enable) {
        DzFrameCageMouse(this.current, enable);
        return this;
    }
    /**
     * 清除描点
     */
    clearPoints() {
        DzFrameClearAllPoints(this.current);
        return this;
    }
    /**销毁窗体 */
    destroy() {
        DzDestroyFrame(this.current);
        this.solarData = null;
        return this;
    }
    // public getChild(index: number) {
    //     return Frame.fromHandle(DzFrameGetChild(this.current, index));
    // }
    /**设置窗体绝对位置 */
    setAbsPoint(point, x, y) {
        let pointObj = this.getPoint();
        if (!pointObj) {
            pointObj = { point: point, relative: DzGetGameUI(), relativePoint: FramePoint.bottomLeft, x, y };
            this.props.position = pointObj;
        }
        pointObj.x = x;
        pointObj.y = y;
        DzFrameSetAbsolutePoint(this.current, point, x, y);
        return this;
    }
    /**设置所有锚点到目标窗体上 */
    setAllPoints(relative) {
        DzFrameSetAllPoints(this.current, relative);
        return this;
    }
    /**设置透明度（0-255） */
    setAlpha(alpha) {
        DzFrameSetAlpha(this.current, alpha);
        return this;
    }
    /**设置窗体禁用/启用 */
    setEnabled(flag) {
        DzFrameSetEnable(this.current, flag);
        return this;
    }
    /**设置焦点 */
    setFocus(flag) {
        DzFrameSetFocus(this.current, flag);
        return this;
    }
    /**
     * 设置字体,原生字体 "Fonts\\dfst-m3u.ttf"
     * @param height 字体大小(0.0001 - 0.026)
     * @param filename 路径名称
     * @param flags 默认填0
     */
    setFont(height, filename = "Fonts\\dfst-m3u.ttf", flags = 0) {
        DzFrameSetFont(this.current, filename, height, flags);
        this.props.font = { fileName: filename, height: height, flags: flags };
        return this;
    }
    /**
     * 获取字体
     */
    getFontName() {
        return this.props.font?.fileName;
    }
    /**
     * 获取字体大小
     */
    getFontSize() {
        return this.props.font?.height;
    }
    /**
     * 设置高度
     * @param height
     */
    setHeight(height) {
        this.setSize(this.width, height);
        return this;
    }
    /**
     * 设置宽度
     * @param width
     */
    setWidth(width) {
        this.setSize(width, this.height);
        return this;
    }
    /**
     * 设置窗体大小 文本传入-1可以自适应大小
     * @param width
     * @param height
     */
    setSize(width, height) {
        this.props.size.width = width;
        this.props.size.height = height;
        DzFrameSetSize(this.current, width, height);
        return this;
    }
    /**
     * 设置字体间距
     */
    setTextFontSpacing(fontSpacing) {
        FrameSetTextFontSpacing(this.current, fontSpacing);
        this.props.fontSpacing = fontSpacing;
    }
    /**
     * 获取字体间距
     */
    getFontSpacing() {
        return this.props.fontSpacing;
    }
    /**
     * 设置对齐方式
     * 2左上对齐  17中上对齐  33右上对齐
     * 3左中对齐  19中中对齐  35右中对齐
     * 5左下对齐  21中下对齐  37右下对齐
     */
    setTextAlignment(alignment) {
        DzFrameSetTextAlignment(this.current, alignment);
        this.props.textAlignment = alignment;
    }
    /**
     * 获取对齐方式
     */
    getTextAlignment() {
        return this.props.textAlignment;
    }
    /**
     * 设置ui优先级 (不是显示层级 只是ui点击优先级)
     * @param level
     */
    setLevel(level) {
        FrameSetLevel(this.current, level);
        return this;
    }
    /**
     * 设置控件视口
     */
    setFramePort(p2) {
        FrameSetViewPort(this.current, p2);
    }
    /**
     * 设置最小值与最大值
     */
    setMinMaxValue(minValue, maxValue) {
        DzFrameSetMinMaxValue(this.current, minValue, maxValue);
        this.props.minMaxValue = { min: minValue, max: maxValue };
        return this;
    }
    /**
     * 获取最小值与最大值
     */
    getMinMaxValue() {
        return this.props.minMaxValue;
    }
    /**
     * 设置模型（支持Sprite、Model、StatusBar）
     */
    setModel(modelFile, modelType = 0, flag = 0) {
        DzFrameSetModel(this.current, modelFile, modelType, flag);
        this.props.model = { modelFile: modelFile };
        return this;
    }
    /**
     * 获取模型
     */
    getModel() {
        return this.props.model.modelFile;
    }
    setParent(parent) {
        DzFrameSetParent(this.current, parent);
        return this;
    }
    setPoint(pointObjOrPoint, relative, relativePoint, x, y) {
        if (pointObjOrPoint == null) {
            return this;
        }
        if (typeof pointObjOrPoint == "number") {
            let point = pointObjOrPoint;
            DzFrameSetPoint(this.current, point, relative, relativePoint, x || 0, y || 0);
            this.props.position = { point, relative, relativePoint, x: x || 0, y: y || 0 };
        }
        else {
            let pointObj = pointObjOrPoint;
            if (!pointObj.relative) {
                return this;
            }
            DzFrameSetPoint(this.current, pointObj.point, pointObj.relative, pointObj.relativePoint, pointObj.x, pointObj.y);
            this.props.position = {
                point: pointObj.point, relative: pointObj.relative, relativePoint: pointObj.relativePoint, x: pointObj.x, y: pointObj.y
            };
        }
        return this;
    }
    /**
     * 设置到相对窗口的中心
     * @param relative
     */
    setPoint2Center(relative) {
        this.setPoint(FramePoint.center, relative, FramePoint.center, 0, 0);
    }
    /**
     * 获取瞄准信息
     */
    getPoint() {
        return this.props.position;
    }
    /**
     * 获取 相对 跟随UI
     */
    getRelative() {
        let p = this.props.position;
        return p?.relative;
    }
    /**
     * 获取窗体 相对 偏移
     */
    getRelativeXY() {
        let p = this.props.position;
        if (!p) {
            return null;
        }
        return { x: p.x, y: p.y };
    }
    /**
     * 设置跟随到相对节点的大小 通常用于背景自适应文本的ui （自动根据文本长度变化大小）
     * @param relative
     * @param widthGap
     * @param heightGap
     */
    setPoints(relative, widthGap, heightGap = widthGap) {
        DzFrameSetPoint(this.current, FRAMEPOINT_TOPLEFT, relative, FRAMEPOINT_TOPLEFT, -widthGap, heightGap);
        DzFrameSetPoint(this.current, FRAMEPOINT_BOTTOMRIGHT, relative, FRAMEPOINT_BOTTOMRIGHT, widthGap, -heightGap);
        return this;
    }
    getScale() {
        return this.props.scale;
    }
    setScale(scale) {
        this.props.scale = scale;
        DzFrameSetScale(this.current, scale);
        return this;
    }
    /**
     * 设置动画
     * @param animId
     * @param autocast
     */
    setSpriteAnimate(animId, autocast) {
        DzFrameSetAnimate(this.current, animId, autocast);
        return this;
    }
    /**
     * 播放模型指定动作
     */
    setAnimationByIndex(animId) {
        FrameSetAnimationByIndex(this.current, animId);
        return this;
    }
    /**
     * 设置ui模型贴图
     */
    setFrameModelTexture(path) {
        FrameSetModelTexture(this.current, path, 1);
        this.props.modelTexture = path;
    }
    /**
     * 获取ui模型贴图
     */
    getFrameModelTexture() {
        return this.props.modelTexture;
    }
    /**
     * 设置ui模型2
     */
    setModel2(path) {
        FrameSetModel2(this.current, path, 0);
    }
    /**
     * 设置ui模型的镜头位置
     */
    setModelCameraSource(x, y, z) {
        FrameSetModelCameraSource(this.current, x, y, z);
    }
    /**
     * 设置ui模型的镜头目标
     */
    setModelCameraTarget(x, y, z) {
        FrameSetModelCameraTarget(this.current, x, y, z);
    }
    /**
     * 设置ui模型的动作
     */
    setModelPlayAnimation(animName) {
        FramePlayAnimation(this.current, animName, "");
    }
    /**
     * 设置ui模型的X坐标
     */
    setModelX(x) {
        FrameSetModelX(this.current, x);
    }
    /**
     * 设置ui模型的Y坐标
     */
    setModelY(y) {
        FrameSetModelY(this.current, y);
    }
    /**
     * 设置ui模型的Z坐标
     */
    setModelZ(z) {
        FrameSetModelZ(this.current, z);
    }
    setStepSize(stepSize) {
        DzFrameSetStepValue(this.current, stepSize);
        return this;
    }
    /**
     * 设置文字（支持EditBox, TextFrame, TextArea, SimpleFontString、GlueEditBoxWar3、SlashChatBox、TimerTextFrame、TextButtonFrame、GlueTextButton）
     *  */
    setText(text) {
        this.props.text = text;
        DzFrameSetText(this.current, text);
        return this;
    }
    getText() {
        return DzFrameGetText(this.current);
    }
    setTextColor(rOrColor, g, b) {
        if (b != null) {
            rOrColor = 255 * 0x1000000 + rOrColor * 0x10000 + g * 0x100 + b;
        }
        DzFrameSetTextColor(this.current, rOrColor);
        return this;
    }
    setTextSizeLimit(size) {
        DzFrameSetTextSizeLimit(this.current, size);
        return this;
    }
    /**
     * 设置UI 贴图
     * @param texFile
     * @param flag
     */
    setTexture(texFile, flag = 0) {
        DzFrameSetTexture(this.current, texFile, flag);
        this.props.texture = texFile;
        return this;
    }
    /**
     * 获取UI贴图
     */
    getTexture() {
        return this.props.texture;
    }
    /**
     * 创建一个背景图 并返回这个背景Frame
     * @param texFile
     * @param flag
     */
    addBackgroundImage(texFile, flag = 0) {
        let backdropFrame = new Frame("BACKDROP", Frame.getRandomName(), this.current);
        backdropFrame.setTexture(texFile, flag);
        backdropFrame.setAllPoints(this.current);
        this.backdropFrame = backdropFrame;
        return backdropFrame;
    }
    /**
     * 创建一个文本 并返回这个文本Frame
     * (文本也有鼠标事件 会阻挡之前的父Frame的鼠标相关事件)
     * @param text
     */
    addTextFrame(text) {
        let frame = new Frame("TEXT", Frame.getRandomName(), this.current);
        frame.setText(text);
        frame.setAllPoints(this.current);
        this.textFrame = frame;
        return frame;
    }
    setTooltip(tooltip) {
        DzFrameSetTooltip(this.current, tooltip);
        return this;
    }
    setValue(value) {
        DzFrameSetValue(this.current, value);
        return this;
    }
    /**设置颜色（支持SimpleStatusBar） */
    setVertexColor(color) {
        DzFrameSetVertexColor(this.current, color);
        return this;
    }
    /**显示/隐藏窗体 */
    setVisible(flag) {
        this.props.visible = flag;
        DzFrameShow(this.current, flag);
        return this;
    }
    /**
     * 设置模型大小（内置缩放）
     * eJapi
     */
    setModelSize(size) {
        if (FrameSetModelSize) {
            FrameSetModelSize(this.current, size);
        }
        this.props.modelSize = size;
    }
    /**
     * 获取模型大小
     */
    getModelSize() {
        return this.props.modelSize;
    }
    /**
     * 设置模型粒子大小
     * eJapi
     */
    set setModelPariticleSize(size) {
        FrameSetModelPariticle2Size(this.current, size);
        this.props.modelPariticleSize = size;
    }
    /**
     * 设置模型粒子大小
     */
    get getModelPariticleSize() {
        return this.props.modelPariticleSize;
    }
    /**
     * 设置模型动画播放速度
     */
    setModelSpeed(Speed) {
        FrameSetModelSpeed(this.current, Speed);
        this.props.modelSpeed = Speed;
    }
    /**
     * 获取模型动画播放速度
     */
    getModelSpeed() {
        return this.props.modelSpeed;
    }
    /**
     * 设置模型播放进度
     */
    setAnimateOffset(offset) {
        DzFrameSetAnimateOffset(this.current, offset);
        this.props.animateOffset = offset;
    }
    /**
     * 设置模型播放进度
     */
    getAnimateOffset() {
        return this.props.animateOffset;
    }
    /**
     * 设置UI忽视点击
     */
    setIgnoreTrackEvent(ign) {
        FrameSetIgnoreTrackEvents(this.current, ign);
    }
    /**
     * 设置UI贴图为透明贴图
     */
    setTexture2Transparent() {
        this.setTexture('UI\\Widgets\\EscMenu\\Human\\blank-background.blp');
    }
    /**
     * 设置UI对应贴图UI
     */
    set backdropFrame(frame) {
        this.props.backdropFrame = frame;
    }
    /**
     * 获取UI对应贴图UI
     */
    get backdropFrame() {
        return this.props.backdropFrame;
    }
    /**
     * 设置UI对应文字UI
     */
    set textFrame(frame) {
        this.props.textFrame = frame;
    }
    /**
     * 获取UI对应文字UI
     */
    get textFrame() {
        return this.props.textFrame;
    }
    /**
     * 事件
     */
    /**
     * 设置回调：点击事件
     */
    setOnClick(callback, sync = false) {
        this.setEventCallback(FRAMEEVENT_CONTROL_CLICK, callback, sync);
    }
    /**
     * 添加回调：点击事件
     */
    addOnClick(callback, sync = false) {
        this.addEventCallback(FRAMEEVENT_CONTROL_CLICK, callback, sync);
    }
    /**
     * 添加回调：右键按下事件
     */
    addOnMouseRightDown(callback) {
        let current = this.current;
        InputUtil.onMouseRightButtonPressed(() => {
            let focusUiId = DzGetMouseFocus();
            if (focusUiId == current) {
                callback();
            }
        });
    }
    /**
     * 添加回调：右键释放事件
     */
    addOnMouseRightUp(callback) {
        let current = this.current;
        InputUtil.onMouseRightButtonReleased(() => {
            let focusUiId = DzGetMouseFocus();
            if (focusUiId == current) {
                callback();
            }
        });
    }
    /**
     * 设置回调：双击事件
     */
    setOnDoubleClick(callback, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_DOUBLECLICK, callback, sync);
    }
    /**
     * 添加回调：双击事件
     */
    addOnDoubleClick(callback, sync = false) {
        this.addEventCallback(FRAMEEVENT_MOUSE_DOUBLECLICK, callback, sync);
    }
    /**
     * 设置回调：鼠标进入
     */
    setOnMouseEnter(callback, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_ENTER, callback, sync);
    }
    /**
     * 添加回调： 鼠标进入
     */
    addOnMouseEnter(callback, sync = false) {
        this.addEventCallback(FRAMEEVENT_MOUSE_ENTER, callback, sync);
    }
    /**
     * 设置回调：鼠标离开
     */
    setOnMouseLeave(callback, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_LEAVE, callback, sync);
    }
    /**
     * 添加回调：鼠标离开
     */
    addOnMouseLeave(callback, sync = false) {
        this.addEventCallback(FRAMEEVENT_MOUSE_LEAVE, callback, sync);
    }
    /**
     * 设置回调：鼠标按下
     * @deprecated  see addOnMouseDown
     */
    setOnMouseDown(callback, sync = false) {
        //原生的貌似不生效
        this.setEventCallback(FRAMEEVENT_MOUSE_DOWN, callback, sync);
    }
    /**
     * 添加回调：鼠标按下
     * (内部以模拟 生效)
     */
    addOnMouseDown(callback) {
        this.addEventCallback(FRAMEEVENT_MOUSE_DOWN, callback, false);
    }
    /**
     * 设置回调：鼠标释放
     */
    setOnMouseUp(callback, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_UP, callback, sync);
    }
    /**
     * 添加回调：鼠标释放
     */
    addOnMouseUp(callback, sync = false) {
        this.addEventCallback(FRAMEEVENT_MOUSE_UP, callback, sync);
    }
    /**
     * 设置回调：鼠标滚轮
     */
    setOnMouseWheel(callback, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_WHEEL, callback, sync);
    }
    /**
     * 添加回调：鼠标滚轮
     */
    addOnMouseWheel(callback, sync = false) {
        this.addEventCallback(FRAMEEVENT_MOUSE_WHEEL, callback, sync);
    }
    /**
     * 设置UI回调事件 会覆盖之前设置的回调
     */
    setEventCallback(event, callback, sync = false) {
        if (sync && isAsync) {
            log.errorWithTraceBack("无法在异步中注册同步方法！请在同步方法中执行！");
            return;
        }
        //检查是否已替换
        let array = Frame._sl_cache.get(this.current + "aecb" + event);
        if (array) {
            log.errorWithTraceBack("你之前已经使用addEventCallback添加了此事件!请再次使用addEventCallback 以禁用此警告");
            array.push(callback);
        }
        else {
            //正常设置
            if (sync == false) {
                const key = "onFrameEvent:" + event;
                let solarTriggers = SolarEvent.getFrameDataEventHandler(this.current, key, false);
                ArrayUtil.clear(solarTriggers);
                se.onFrameEvent(this.handle, event, callback);
            }
            else {
                DzFrameSetScriptByCode(this.current, event, callback, sync);
            }
        }
    }
    /**
     * 添加UI回调事件
     */
    addEventCallback(event, callback, sync = false) {
        if (sync && isAsync) {
            log.errorWithTraceBack("无法在异步中注册同步方法！请在同步方法中执行！");
            return;
        }
        let array = Frame._sl_cache.get(this.current + "aecb" + event, () => {
            let array_temp = [];
            if (event == FRAMEEVENT_MOUSE_DOWN) { //原生的貌似不生效 这里模拟一下
                let current = this.current;
                InputUtil.onMouseLeftButtonPressed(() => {
                    let focusUiId = DzGetMouseFocus();
                    if (focusUiId == current) {
                        for (let cb of array_temp) {
                            cb();
                        }
                    }
                });
                return array_temp;
            }
            if (sync == false) {
                se.onFrameEvent(this.handle, event, () => {
                    for (let cb of array_temp) {
                        cb();
                    }
                });
            }
            else {
                DzFrameSetScriptByCode(this.current, event, () => {
                    for (let cb of array_temp) {
                        cb();
                    }
                }, sync);
            }
            return array_temp;
        });
        array.push(callback);
    }
    /**
     * 扩展的事件
     */
    /**
     * 右键 拖放物品事件
     * 需保证frame是最上层的UI 即鼠标在窗口上时通过DzGetMouseFocus()能获得此UI
     */
    _sl_FrameEvent_RightDragInit;
    /**可手动修改此值 为false 提前结束拖拽*/
    startDrag = false;
    _sl_FrameEvent_startDragTime;
    _sl_onRightDragStart;
    /**
     * 右键 拖放UI事件 开始
     */
    setOnRightDragStart(onRightDragStart) {
        this._sl_InitRightDragEvent(this);
        this._sl_onRightDragStart = onRightDragStart;
    }
    _sl_onRightDragOver;
    /**
     * 右键 拖放UI事件 拖拽中
     */
    setOnRightDragOver(onRightDragOver) {
        this._sl_InitRightDragEvent(this);
        this._sl_onRightDragOver = onRightDragOver;
    }
    _sl_onRightDragEnd;
    /**
     * 右键 拖放UI事件 拖拽结束
     */
    setOnRightDragEnd(onRightDragEnd) {
        this._sl_InitRightDragEvent(this);
        this._sl_onRightDragEnd = onRightDragEnd;
    }
    /**
     * 获取 拖放UI事件 拖拽结束 回调函数
     */
    getOnRightDragEnd() {
        return this._sl_onRightDragEnd;
    }
    _sl_onRightDragDrop;
    /**
     * 右键 拖放UI事件 拖放下ondrop
     */
    setOnRightDragDrop(onRightDragDrop) {
        this._sl_InitRightDragEvent(this);
        this._sl_onRightDragDrop = onRightDragDrop;
    }
    static fromEvent() {
        return this.fromHandle(DzGetTriggerUIEventFrame());
    }
    /**
     * 添加 鼠标左键拖拽事件 回调
     * @param onDrag
     */
    addOnDragOver(onDrag) {
        let f = this;
        this.addOnMouseDown(() => {
            f.startDrag = true;
            let bX = InputUtil.getMouseSceneX();
            let bY = InputUtil.getMouseSceneY();
            let startDragX = InputUtil.getMouseSceneX();
            let startDragY = InputUtil.getMouseSceneY();
            BaseUtil.onTimer(0.03, () => {
                if (!f.startDrag) {
                    return false;
                }
                let screenX = DzGetMouseX();
                let screenY = DzGetMouseY();
                let sceneX = InputUtil.getMouseSceneX();
                let sceneY = InputUtil.getMouseSceneY();
                let x = 0;
                let y = 0;
                let point = f.getPoint();
                if (point?.x && point.y) {
                    x = sceneX - point.x;
                    y = sceneY - point.y;
                }
                onDrag({
                    x,
                    y,
                    deltaX: sceneX - bX,
                    deltaY: sceneY - bY,
                    sceneX,
                    sceneY,
                    screenX,
                    screenY,
                    startDragX,
                    startDragY,
                });
                bX = sceneX;
                bY = sceneY;
                return true;
            });
        });
        InputUtil.onMouseLeftButtonReleased(() => {
            f.startDrag = false;
        });
    }
    /**
     * solar 内部事件系统
     */
    _sl_InitRightDragEvent(frame) {
        if (this._sl_FrameEvent_RightDragInit == true) {
            return;
        }
        this._sl_FrameEvent_RightDragInit = true;
        let MouseMoveEventKey = "RightDrag_" + frame.current;
        //
        let bX = InputUtil.getMouseSceneX();
        let bY = InputUtil.getMouseSceneY();
        let onMouseMoveEventCallBack = function () {
            if (!frame.startDrag) {
                InputUtil.removeMouseMoveEvent(MouseMoveEventKey);
                return;
            }
            let screenX = DzGetMouseX();
            let screenY = DzGetMouseY();
            let sceneX = InputUtil.getMouseSceneX();
            let sceneY = InputUtil.getMouseSceneY();
            frame._sl_onRightDragOver?.({
                x: 0,
                y: 0,
                deltaX: sceneX - bX,
                deltaY: sceneY - bY,
                sceneX,
                sceneY,
                screenX,
                screenY,
                startDragX: bX,
                startDragY: bY,
            });
            return;
        };
        //
        frame.addOnMouseRightUp(() => {
            if (frame.startDrag) { //如果已是拖拽状态 则退出取消拖拽
                frame.startDrag = false;
                return;
            }
            if (time - (frame._sl_FrameEvent_startDragTime || 0) < 500) { //短时间内 不能重复触发拖放
                return;
            }
            frame.startDrag = true;
            frame._sl_onRightDragStart?.();
            if (frame.startDrag) { //可能再 start事件里 又取消了拖放 所以这里再判断一下
                bX = InputUtil.getMouseSceneX();
                bY = InputUtil.getMouseSceneY();
                InputUtil.onMouseMoveEvent(onMouseMoveEventCallBack, MouseMoveEventKey);
            }
        });
        //
        InputUtil.onMouseRightButtonPressed(() => {
            if (frame.startDrag) {
                frame._sl_FrameEvent_startDragTime = time;
                frame._sl_onRightDragEnd?.();
                frame.startDrag = false;
            }
        });
        //放下
        InputUtil.onMouseLeftButtonPressed(() => {
            if (frame.startDrag) {
                frame._sl_FrameEvent_startDragTime = time;
                if (frame._sl_onRightDragDrop) {
                    let mouseFocus = DzGetMouseFocus();
                    let targetFrame = Frame.fromHandle(mouseFocus, true);
                    frame._sl_onRightDragDrop(targetFrame);
                }
                else {
                    frame.getOnRightDragEnd()?.();
                }
                frame.startDrag = false;
            }
        });
    }
    /**
     *
     * @param handle
     * @param onlyCache 是否只从已缓存的Frame中获取 默认为false 不存在时会新建Frame
     */
    static fromHandle(handle, onlyCache = false) {
        if (onlyCache) {
            return Frame._sl_cache.get("handle:" + handle);
        }
        else {
            return Frame._sl_cache.get("handle:" + handle, () => new Frame(handle));
        }
    }
    static fromName(name, createContext) {
        return this.fromHandle(DzFrameFindByName(name, createContext));
    }
    static loadTOC(filename) {
        return DzLoadToc(filename);
    }
    /**
     * helper
     */
    static getRandomName() {
        return "Solar:Frame:" + AsyncUtil.getUUIDAsync();
    }
    /**
     * 创建一个FRAME 可当做FRAME 父容器 以管理子FRAME
     */
    static createFrame(parent) {
        return new Frame("FRAME", null, parent);
    }
    /**
     * 创建一个背景
     */
    static createBackDrop(parent) {
        return new Frame("BACKDROP", null, parent);
    }
    /**
     * 创建一个文本ui
     * (文本也有鼠标事件 会阻挡之前的父Frame的鼠标相关事件)
     */
    static createTEXT(parent) {
        return new Frame("TEXT", null, parent);
    }
    /**
     * 创建一个带阴影的 文本ui
     */
    static createShadowTEXT(parent) {
        return new Frame("TEXT", null, parent, "_sl_shadowtext");
    }
    /**
     * 创建一个文本ui
     */
    static createTEXTWithBorderBackDrop(parent) {
        //
        let bdFrame = new Frame("BACKDROP", null, parent, "_sl_border_backdrop", 0);
        let textFrame = Frame.createTEXT(parent);
        textFrame.backdropFrame = bdFrame;
        bdFrame.setPoints(textFrame.current, 0.01, 0.01);
        return textFrame;
    }
    /**
     * 创建一个带声音的文字按钮
     */
    static createGLUETEXTBUTTON(parent) {
        return new Frame("GLUETEXTBUTTON", null, parent);
    }
    /**
     * 创建一个按钮
     * (ScoreScreenTabButtonTemplate 模板自带高亮效果)
     */
    static createBUTTON(parent) {
        return new Frame("BUTTON", null, parent, "ScoreScreenTabButtonTemplate");
    }
    /**
     * 创建一个带声音按钮
     */
    static createGLUEBUTTON(parent) {
        return new Frame("GLUEBUTTON", null, parent, "ScoreScreenTabButtonTemplate");
    }
    /**
     * 创建一个文字按钮
     */
    static createTEXTBUTTON(parent) {
        return new Frame("TEXTBUTTON", null, parent);
    }
    /**
     * 创建一个文本域
     */
    static createTEXTAREA(parent) {
        return new Frame("TEXTAREA", null, parent);
    }
    /**
     * 新建模型UI
     */
    static createSPRITE(parent) {
        return new Frame("SPRITE", null, parent);
    }
    /**
     * 新建模型Ui
     */
    static createMODEL(parent) {
        return new Frame("MODEL", null, parent);
    }
}
