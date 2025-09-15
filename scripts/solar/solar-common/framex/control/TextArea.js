import FrameControl from "@/FrameControl";
import TextAlign from "@/TextAlign";
export default class TextArea extends FrameControl {
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
        this.getTextAreaFrame().setTextAlignment(TextAlign.topLeft);
        this.getTextAreaFrame().visible = false;
    }
    setBackgroundImage(imagePath) {
        this.getBackgroundImageFrame().setTexture(imagePath);
        this.getBackgroundImageFrame().visible = true;
    }
    setText(text) {
        this.getTextAreaFrame().setText(text);
        this.getTextAreaFrame().visible = true;
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
