import FrameControl from "@/FrameControl";
import TextAlign from "@/TextAlign";
/**
 * 如未正常显示ui 请检测是否设置了 setSize 和位置
 */
export default class Label extends FrameControl {
    constructor(text, onClick) {
        super();
        this.init();
        //
        if (text) {
            this.setText(text);
        }
        if (onClick) {
            this.setOnClick(onClick);
        }
    }
    init() {
        super.init();
        this.getBackgroundImageFrame().visible = false;
        this.getTextFrame().setTextAlignment(TextAlign.center);
        this.getTextFrame().visible = false;
    }
    setBackgroundImage(imagePath) {
        this.getBackgroundImageFrame().setTexture(imagePath);
        this.getBackgroundImageFrame().visible = true;
    }
    setText(text) {
        this.getTextFrame().setText(text);
        this.getTextFrame().visible = true;
    }
    setOnClick(callback) {
        this.getButtonFrame().setOnClick(() => {
            callback();
        }, false);
    }
    setDisable(disable) {
        this.getDisableFrame().visible = disable;
    }
}
