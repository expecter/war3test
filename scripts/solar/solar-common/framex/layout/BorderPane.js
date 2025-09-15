import Pane from "@/Pane";
import FramePoint from "@/FramePoint";
export default class BorderPane extends Pane {
    _center;
    _top;
    _right;
    _bottom;
    _left;
    constructor(center) {
        super();
        if (center) {
            this.center = center;
        }
    }
    layout() {
        //one case
        if (this._top != null) {
            this._top.rootFrame.clearPoints();
            this._top.rootFrame.setPoint(FramePoint.top, this.rootFrame.handle, FramePoint.top, 0, 0);
        }
        //one case
        if (this._bottom != null) {
            this._bottom.rootFrame.clearPoints();
            this._bottom.rootFrame.setPoint(FramePoint.bottom, this.rootFrame.handle, FramePoint.bottom, 0, 0);
        }
        //one case
        if (this._left != null) {
            this._left.rootFrame.clearPoints();
            this._left.rootFrame.setPoint(FramePoint.left, this.rootFrame.handle, FramePoint.left, 0, 0);
        }
        //one case
        if (this._right != null) {
            this._right.rootFrame.clearPoints();
            this._right.rootFrame.setPoint(FramePoint.right, this.rootFrame.handle, FramePoint.right, 0, 0);
        }
        //one case
        if (this._center != null) {
            this._center.rootFrame.clearPoints();
            if (this._left == null) {
                this._center.rootFrame.setPoint(FramePoint.topLeft, this.rootFrame.handle, FramePoint.topLeft, 0, 0);
            }
            else {
                this._center.rootFrame.setPoint(FramePoint.topLeft, this._left.rootFrame.handle, FramePoint.topRight, 0, 0);
            }
            if (this._right == null) {
                this._center.rootFrame.setPoint(FramePoint.bottomRight, this.rootFrame.handle, FramePoint.bottomRight, 0, 0);
            }
            else {
                this._center.rootFrame.setPoint(FramePoint.bottomRight, this._right.rootFrame.handle, FramePoint.bottomLeft, 0, 0);
            }
        }
        super.layout();
    }
    get center() {
        return this._center;
    }
    set center(value) {
        this.detachChild(this._center);
        this._center = value;
        this.attachChild(value);
    }
    get top() {
        return this._top;
    }
    set top(value) {
        this.detachChild(this._top);
        this._top = value;
        this.attachChild(value);
    }
    get right() {
        return this._right;
    }
    set right(value) {
        this.detachChild(this._right);
        this._right = value;
        this.attachChild(value);
    }
    get bottom() {
        return this._bottom;
    }
    set bottom(value) {
        this.detachChild(this._bottom);
        this._bottom = value;
        this.attachChild(value);
    }
    get left() {
        return this._left;
    }
    set left(value) {
        this.detachChild(this._left);
        this._left = value;
        this.attachChild(value);
    }
}
