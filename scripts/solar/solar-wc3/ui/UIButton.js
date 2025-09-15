/**按钮*/
import * as React from "@/tsx";
import { Frame } from "@/frame";
import FramePoint from "@/FramePoint";
export default class UIButton {
    _root = new Frame();
    _backdrop = new Frame();
    _text = new Frame();
    _button = new Frame();
    _callback = null;
    _anchorPoint = FramePoint.center;
    _zoomScale = 0.1;
    setVisible(flag) {
        this._root.setVisible(flag);
    }
    setTexture(texture) {
        this._backdrop.setTexture(texture);
    }
    getTexture() {
        return this._backdrop.props.texture;
    }
    setText(text) {
        this._text.setText(text);
    }
    setAnchorPoint(anchorPoint) {
        this._anchorPoint = anchorPoint;
    }
    setPosition(x, y) {
        this._backdrop.clearPoints();
        this._backdrop.setAbsPoint(this._anchorPoint, x, y);
    }
    getPosition() {
        let x = this._backdrop.props.position['x'];
        let y = this._backdrop.props.position['y'];
        return { x: x, y: y };
    }
    setContentSize(width, height) {
        this._backdrop.setSize(width, height);
    }
    getContentSize() {
        let width = this._backdrop?.props?.size?.width ?? 0.00;
        let height = this._backdrop?.props?.size?.height ?? 0.00;
        return { width: width, height: height };
    }
    setScale(scale) {
        this._backdrop.setScale(scale);
    }
    getScale() {
        return this._backdrop?.props?.scale ?? 1.0;
    }
    setZoomScale(scale) {
        this._zoomScale = scale;
    }
    getZoomScale() {
        return this._zoomScale;
    }
    setCallback(callback) {
        this._callback = callback;
    }
    constructor(texture = '') {
        React.render(this.draw(), DzGetGameUI());
        this.setTexture(texture);
        this._button.addOnMouseDown(() => {
            this.setScale(1.0 + this._zoomScale);
        });
        this._button.addOnMouseUp(() => {
            this.setScale(1.0);
        });
    }
    onClick() {
        if (this._callback) {
            this._callback();
        }
    }
    draw() {
        return (React.createElement("div", { size: { width: 0.001, height: 0.001 }, ref: this._root, visible: true },
            React.createElement("backdrop", { id: "backdrop", position: { x: 0.4, y: 0.3 }, size: { width: 0.03, height: 0.04 }, ref: this._backdrop, texture: '' },
                React.createElement("text", { id: "text", ref: this._text, text: '', textAlignment: TEXTALIGN_CENTER, font: { fileName: "ZITI.TTF", height: 0.012, flags: 0 } }),
                React.createElement("button", { id: "button", ref: this._button, onClick: () => this.onClick() }))));
    }
}
