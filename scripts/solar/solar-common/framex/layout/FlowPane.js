import Pane from "@/Pane";
import FramePoint from "@/FramePoint";
export default class FlowPane extends Pane {
    hgap = 0;
    vgap = 0;
    constructor(hgap, vgap) {
        super();
        this.setSize(0.5, 0.3);
        if (hgap) {
            this.hgap = hgap;
        }
        if (vgap) {
            this.vgap = vgap;
        }
    }
    layout() {
        let maxWidth = this.rootFrame.width;
        let startX = 0;
        let startY = 0;
        for (let i = 0; i < this.children.length; i++) {
            let child = this.children[i];
            if ((startX + child.rootFrame.width) > maxWidth) {
                startY = startY + child.rootFrame.height + this.vgap;
                startX = 0;
            }
            child.rootFrame.setParent(this.rootFrame.handle);
            child.rootFrame.clearPoints();
            child.rootFrame.setPoint(FramePoint.topLeft, this.rootFrame.handle, FramePoint.topLeft, startX, -startY);
            //
            startX = startX + child.rootFrame.width + this.hgap;
        }
        super.layout();
    }
}
