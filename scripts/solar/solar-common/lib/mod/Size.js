/**
 * @brief 尺寸
 */
export default class Size {
    width;
    height;
    constructor(w = 0.0, h = 0.0) {
        this.width = w;
        this.height = h;
    }
    equals(another) {
        return math.abs(this.width - another.width) < 0.000001 && math.abs(this.height - another.height) < 0.000001;
    }
    static ZERO = new Size(0, 0);
}
