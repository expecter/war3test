import { Frame } from "@/frame";
/**
 * 如未正常显示ui 请检测是否设置了 setSize 和位置
 */
export default class FrameNode {
    /** ui */
    rootFrame;
    _sl_Frames = [];
    _sl_isDestroyed = false;
    constructor(parent) {
        // this.rootFrame = new Frame("FRAME", null, null) //会阻挡鼠标点击到地面
        this.rootFrame = new Frame("BACKDROP", null, parent); //不会阻挡鼠标点击到地面
        this.rootFrame.setTexture('UI\\Widgets\\EscMenu\\Human\\blank-background.blp');
        this.rootFrame.setSize(0.04, 0.04);
    }
    get handle() {
        return this.rootFrame.handle;
    }
    setSize(width, height) {
        this.rootFrame.setSize(width, height);
    }
    setAbsPoint(point, x, y) {
        this.rootFrame.setAbsPoint(point, x, y);
    }
    set visible(flag) {
        this.rootFrame.visible = flag;
    }
    get visible() {
        return this.rootFrame.visible;
    }
    destroy() {
        if (this._sl_isDestroyed) {
            return;
        }
        if (this._sl_Frames != null) {
            for (let frame of this._sl_Frames) {
                frame.destroy();
            }
            this._sl_Frames = null;
        }
        this._sl_isDestroyed = true;
    }
}
