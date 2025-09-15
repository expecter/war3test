import * as React from "@/tsx";
import { Frame } from "@/frame";
import InputUtil from "@/InputUtil";
export default class UIFollowMouse {
    _backdrop = new Frame();
    static _instance = null;
    static getInstance() {
        if (!UIFollowMouse._instance) {
            UIFollowMouse._instance = new UIFollowMouse();
        }
        return UIFollowMouse._instance;
    }
    getBackdrop() {
        return this._backdrop;
    }
    setTexture(texture) {
        this._backdrop.setTexture(texture);
    }
    setVisible(flag) {
        this._backdrop.setVisible(flag);
    }
    removeMouseMoveEvent() {
        InputUtil.removeMouseMoveEvent('UIFollowMouse');
    }
    constructor() {
        React.render(this.draw(), DzGetGameUI());
        InputUtil.onMouseMoveEvent(() => {
            let x = RAbsBJ(0.80 * (I2R(DzGetMouseXRelative()) / I2R(DzGetClientWidth())));
            let y = RAbsBJ(0.60 - (0.60 * (I2R(DzGetMouseYRelative()) / I2R(DzGetClientHeight()))));
            this._backdrop.clearPoints();
            this._backdrop.setAbsPoint(4, x, y);
        }, 'UIFollowMouse');
    }
    draw() {
        return (React.createElement("div", { size: { width: 0.001, height: 0.001 }, visible: true },
            React.createElement("backdrop", { position: { x: 0.000, y: 0.000 }, size: { width: 0.030, height: 0.040 }, visible: false, texture: 'ReplaceableTextures\\CommandButtons\\BTNDispelMagic.blp', ref: this._backdrop })));
    }
}
