/**
 * @brief 坐标
 */
export default class Vec2 {
    x;
    y;
    static EPSILON = 0.000001;
    constructor(x = 0.0, y = 0.0) {
        this.set(x, y);
    }
    static fromLocation(location) {
        let x = GetLocationX(location);
        let y = GetLocationY(location);
        return new Vec2(x, y);
    }
    static clamp(value, from, to) {
        if (from > to) {
            from = from + to;
            to = from - to;
            from = from - to;
        }
        return value < from ? from : value < to ? value : to;
    }
    /**
     * @brief 转换坐标到点
     * @returns
     */
    toLocation() {
        return Location(this.x, this.y);
    }
    /**
     * @brief 计算两个坐标的距离
     * @param another 另一个坐标
     * @returns
     */
    distance(another) {
        let dx = another.x - this.x;
        let dy = another.y - this.y;
        return math.sqrt(dx * dx + dy * dy);
    }
    /**
     * @brief 计算到另一个坐标的角度
     * @param another 另一个坐标
     * @returns
     */
    angle(another) {
        return math.deg(math.atan2(another.y - this.y, another.x - this.x));
    }
    /**
     * @brief 极坐标位移点
     * @param distance 距离
     * @param angle 角度
     * @returns
     */
    polarProjection(distance, angle) {
        let x = this.x + distance * math.cos(angle);
        let y = this.y + distance * math.sin(angle);
        return new Vec2(x, y);
    }
    equals(another) {
        return math.abs(this.x - another.x) < Vec2.EPSILON && math.abs(this.y - another.y) < Vec2.EPSILON;
    }
    normalize() {
        let n = this.x * this.x + this.y * this.y;
        if (n == 1.0)
            return;
        n = math.sqrt(n);
        n = 1.0 / n;
        this.x *= n;
        this.y *= n;
    }
    smooth(target, elapsedTime, responseTime) {
        if (elapsedTime > 0) {
            this.x += (target.x - this.x) * (elapsedTime / (elapsedTime + responseTime));
            this.y += (target.y - this.y) * (elapsedTime / (elapsedTime + responseTime));
        }
    }
    /**
     * @brief 计算两个坐标的叉积
     * @param another 另一个坐标
     * @returns
     */
    cross(another) {
        return this.x * another.y - this.y * another.x;
    }
    /**
     * @brief 计算坐标的垂线,逆时针旋转90度
     * @returns
     */
    perp() {
        return new Vec2(-this.y, this.x);
    }
    /**
     * @brief 计算坐标的垂线,顺时针旋转90度
     * @returns
     */
    rPerp() {
        return new Vec2(this.y, -this.x);
    }
    /**
     * @brief 计算两个坐标的中点
     * @param another 另一个坐标
     * @returns
     */
    midpoint(another) {
        return new Vec2((this.x + another.x) / 2.0, (this.y + another.y) / 2.0);
    }
    compOp(func) {
        return new Vec2(func(this.x), func(this.y));
    }
    /**
     * 将坐标夹在两坐标之间
     * @param from
     * @param to
     * @returns
     */
    clampPoint(from, to) {
        return new Vec2(Vec2.clamp(this.x, from.x, to.x), Vec2.clamp(this.y, from.y, to.y));
    }
    set(x, y) {
        this.x = x;
        this.y = y;
    }
    setVec2(point) {
        this.x = point.x;
        this.y = point.y;
    }
    static ZERO = new Vec2(0, 0);
    static ONE = new Vec2(1, 1);
    static UNIT_X = new Vec2(1, 0);
    static UNIT_Y = new Vec2(0, 1);
}
