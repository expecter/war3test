/**走马灯*/
import * as React from "@/w3ts/tsx";
import { Frame } from "@/frame";
import BaseUtil from "@/BaseUtil";
import FramePoint from "@/FramePoint";
import StringUtil from "@/StringUtil";
export default class UIMarquee {
    _root = new Frame();
    _backdrop = new Frame();
    _text = new Frame();
    _textString = '';
    _anchorPoint = FramePoint.center;
    constructor(text = '') {
        React.render(this.draw(), DzGetGameUI());
        this.setText(text);
        this._root.setVisible(false);
        this._backdrop.setPoints(this._text.current, 0.005, 0.005);
    }
    /**逐个打印文本*/
    startPrint() {
        let index = 0;
        let displayString = '';
        this._text.setText(displayString);
        this._root.setVisible(true);
        let length = StringUtil.getLength(this._textString);
        BaseUtil.onTimer(0.20, () => {
            index++;
            if (index <= length) {
                if (index <= 24) {
                    displayString += StringUtil.getCharAtIndex(this._textString, index);
                    this._text.setText(displayString);
                }
                else {
                    displayString = StringUtil.subString(this._textString, index - 23, index);
                    this._text.setText(displayString);
                }
                return true;
            }
            return false;
        });
    }
    /**设置文本*/
    setText(text) {
        this._textString = text;
        this._text.setText(text);
    }
    /**设置文本宽度*/
    setTextWidth(width) {
        let height = this._text?.props?.size?.height ?? 0;
        this._text.setSize(width, height);
    }
    /**设置文本宽度*/
    getTextWidth() {
        return this._text?.props?.size?.width ?? 0.20;
    }
    /**获取最多显示字符数*/
    getMaxChars() {
        return R2I(120 * this.getTextWidth());
    }
    /**设置背景是否显示*/
    setBackgroundVisible(flag) {
        this._backdrop.setVisible(flag);
    }
    /**设置锚点*/
    setAnchorPoint(anchorPoint) {
        this._anchorPoint = anchorPoint;
    }
    /**设置位置*/
    setPosition(x, y) {
        this._text.clearPoints();
        this._text.setAbsPoint(this._anchorPoint, x, y);
    }
    draw() {
        return (React.createElement("div", { size: { width: 0.001, height: 0.001 }, ref: this._root, visible: true },
            React.createElement("backdrop", { id: "backdrop", ref: this._backdrop, texture: 'UI\\Widgets\\ToolTips\\Human\\human-tooltip-background.blp' }),
            React.createElement("text", { id: "text", position: { x: 0.4, y: 0.3 }, size: { width: 0.20, height: 0.00 }, ref: this._text, text: '', textAlignment: TEXTALIGN_RIGHT, font: { fileName: "ZITI.TTF", height: 0.012, flags: 0 } })));
    }
}
