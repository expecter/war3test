import FrameControl from "@/FrameControl";
/**
 * 如未正常显示ui 请检测是否设置了 setSize 和位置
 */
export default class ImageView extends FrameControl {
    constructor() {
        super();
        this.init();
    }
    init() {
        super.init();
        this.getBackgroundImageFrame().visible = false;
        this.getImageFrame().visible = false;
    }
    setBackgroundImage(imagePath) {
        this.getBackgroundImageFrame().setTexture(imagePath);
        this.getBackgroundImageFrame().visible = true;
    }
    setImage(imagePath) {
        this.getImageFrame().setTexture(imagePath);
        this.getImageFrame().visible = true;
    }
    setDisable(disable) {
        this.getDisableFrame().visible = disable;
    }
}
