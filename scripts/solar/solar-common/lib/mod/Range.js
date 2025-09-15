/**
 * @brief 范围
 */
import Vec2 from "./Vec2";
export default class Range {
    /**原点(左下角)坐标*/
    origin;
    /**尺寸*/
    size;
    constructor(x = 0.0, y = 0.0, w = 0.0, h = 0.0) {
        this.set(x, y, w, h);
    }
    /**
     * @brief 将区域转化为范围
     * @param whichRect 哪一个区域
     * @returns
     */
    static fromRect(whichRect) {
        let minX = GetRectMinX(whichRect);
        let minY = GetRectMinY(whichRect);
        let maxX = GetRectMaxX(whichRect);
        let maxY = GetRectMaxY(whichRect);
        let x = minX;
        let y = minY;
        let width = maxX - minX;
        let height = maxY - minY;
        return new Range(x, y, width, height);
    }
    equals(another) {
        return this.origin.equals(another.origin) && this.size.equals(another.size);
    }
    maxX() {
        return this.origin.x + this.size.width;
    }
    midX() {
        return this.origin.x + this.size.width / 2.0;
    }
    minX() {
        return this.origin.x;
    }
    maxY() {
        return this.origin.y + this.size.height;
    }
    midY() {
        return this.origin.y + this.size.height / 2.0;
    }
    minY() {
        return this.origin.y;
    }
    containsPoint(point) {
        return (point.x >= this.minX() && point.x <= this.maxX() && point.y >= this.minY() && point.y <= this.maxY());
    }
    intersectsRange(another) {
        return !(this.maxX() < another.minX() || another.maxX() < this.minX() || this.maxY() < another.minY() || another.maxY() < this.minY());
    }
    intersectsCircle(center, radius) {
        let rectangleCenter = new Vec2(this.midX(), this.midY());
        let w = this.size.width / 2;
        let h = this.size.height / 2;
        let dx = math.abs(center.x - rectangleCenter.x);
        let dy = math.abs(center.y - rectangleCenter.y);
        if (dx > (radius + w) || dy > (radius + h))
            return false;
        let circleDistance = new Vec2(math.abs(center.x - this.origin.x - w), math.abs(center.y - this.origin.y - h));
        if (circleDistance.x <= (w))
            return true;
        if (circleDistance.y <= (h))
            return true;
        let cornerDistanceSq = math.pow(circleDistance.x - w, 2) + math.pow(circleDistance.y - h, 2);
        return (cornerDistanceSq <= (math.pow(radius, 2)));
    }
    merge(another) {
        let minX = math.min(this.minX(), another.minX());
        let minY = math.min(this.minY(), another.minY());
        let maxX = math.max(this.maxX(), another.maxX());
        let maxY = math.max(this.maxY(), another.maxY());
        this.set(minX, minY, maxX - minX, maxY - minY);
    }
    set(x, y, w, h) {
        this.origin.x = x;
        this.origin.y = y;
        this.size.width = w;
        this.size.height = h;
    }
    setRange(range) {
        this.origin.x = range.origin.x;
        this.origin.y = range.origin.y;
        this.size.width = range.size.width;
        this.size.height = range.size.height;
    }
    static ZERO = new Range(0, 0, 0, 0);
}
