/**
 * @brief  数学计算工具
 */
export default class AlgorithmUtil {
    /**检测数组中是否包含元素*/
    static contains(item, arr) {
        for (const i of arr) {
            if (i == item)
                return true;
        }
        return false;
    }
    /**
     * @brief 获取位于同一个圆上的数个点的坐标组
     * @param radius 圆的半径
     * @param x 圆心的x坐标
     * @param y 圆心的y坐标
     * @param count 点的数量
     * @param isRandom 是否随机点在圆上的位置
     * @returns 位于同一个圆上的数个点的坐标组
     */
    static getPointsOnCircle(radius, x, y, count, isRandom = true) {
        let points = [];
        for (let index = 0; index < count; index++) {
            let angle = isRandom ? GetRandomReal(0, 360) : index * (360.0 / count);
            let xx = x + radius * CosBJ(angle);
            let yy = y + radius * SinBJ(angle);
            points.push({ x: xx, y: yy });
        }
        return points;
    }
    /**
     * @brief 获取圆内随机一个点的坐标
     * @param radius 圆的半径
     * @param x 圆心的x坐标
     * @param y 圆心的y坐标
     * @returns 圆内随机一个点的坐标
     */
    static getRandomPointInsideCircle(radius, x, y) {
        let angle = GetRandomReal(0.0, 360.0);
        let distance = GetRandomReal(0.0, radius);
        let point = { x: 0, y: 0 };
        ;
        point.x = x + distance * CosBJ(angle);
        point.y = y + distance * SinBJ(angle);
        return point;
    }
    /**
     * @brief 获取大圆圆内随机多个不重合小圆的圆心坐标
     * @param R 大圆的半径
     * @param x 大圆圆心的x坐标
     * @param y 大圆圆心的y坐标
     * @param r 小圆的半径
     * @returns 圆内随机一个点的坐标
     */
    static getRandomPointsInsideCircle(R, x, y, r, count) {
        let points = [];
        for (let index = 0; index < 1000000; index++) {
            let point = this.getRandomPointInsideCircle(R, x, y);
            let intersect = false;
            if (points.length > 0) {
                for (let p of points) {
                    let dx = point.x - p.x;
                    let dy = point.y - p.y;
                    let distance = math.sqrt(dx * dx + dy * dy);
                    if (distance < 2 * r) {
                        intersect = true;
                        break;
                    }
                }
            }
            if (!intersect) {
                points.push(point);
            }
            if (points.length >= count)
                break;
        }
        return points;
    }
    /**
     * @brief 获取矩形区域内尽可能多的不相交圆的中心坐标
     * @param radius 圆的半径
     * @param whichRect 哪一个矩形区域
     * @returns
     */
    static getCircleCenterPointsInsideRect(radius, whichRect) {
        let points = [];
        let minX = GetRectMinX(whichRect);
        let minY = GetRectMinY(whichRect);
        let maxX = GetRectMaxX(whichRect);
        let maxY = GetRectMaxY(whichRect);
        for (let x = minX + radius; x <= maxX - radius; x += 2 * radius) {
            for (let y = minY + radius; x <= maxY - radius; y += 2 * radius) {
                points.push({ x: x, y: y });
            }
        }
        return points;
    }
}
