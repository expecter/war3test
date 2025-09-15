import FrameNode from "@/FrameNode";
import ArrayUtil from "@/ArrayUtil";
export default class FrameParent extends FrameNode {
    children = [];
    constructor() {
        super();
    }
    attachChild(...node) {
        this.children.push(...node);
        this.layout();
    }
    attachChilds(nodes) {
        this.children.push(...nodes);
        this.layout();
    }
    detachChild(node) {
        if (node == null) {
            return false;
        }
        return ArrayUtil.removeElement(this.children, node);
    }
    detachAllChildren() {
        this.children = [];
    }
    layout() {
        for (let i = 0; i < this.children.length; i++) {
            let child = this.children[i];
            if (child instanceof FrameParent) {
                child.layout();
            }
        }
    }
}
