import Pane from "@/Pane";
import FramePoint from "@/FramePoint";
export default class VBox extends Pane {
    _spacing;
    constructor(spacing, ...children) {
        super();
        this.spacing = spacing;
        this.attachChilds(children);
    }
    get spacing() {
        return this._spacing;
    }
    set spacing(value) {
        this._spacing = value;
    }
    layout() {
        for (let i = 0; i < this.children.length; i++) {
            let child = this.children[i];
            child.rootFrame.setParent(this.rootFrame.handle);
            child.rootFrame.clearPoints();
            if (i == 0) {
                child.rootFrame.setPoint(FramePoint.top, this.rootFrame.handle, FramePoint.top, 0, 0);
            }
            else {
                child.rootFrame.setPoint(FramePoint.top, this.children[i - 1].rootFrame.handle, FramePoint.bottomRight, 0, this._spacing);
            }
        }
        super.layout();
    }
}
