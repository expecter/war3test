import { Rectangle } from "@/w3ts/handles/rect";
/** @noSelf **/
export default class RectUtil {
    /**
     * 用完记得rect.destroy() 排泄
     * @param centerX
     * @param centerY
     * @param radius
     * @constructor
     */
    static GetRectFromCircle(centerX, centerY, radius) {
        return new Rectangle(centerX - radius, centerY - radius, centerX + radius, centerY + radius);
    }
    /**
     * 创建区域
     * @param x
     * @param y
     * @param width
     * @param height
     */
    static createRect(x, y, width, height) {
        return Rect(x - width * 0.5, y - height * 0.5, x + width * 0.5, y + height * 0.5);
    }
    /**
     * 根据一组坐标的最小xy 和最大xy 创建矩形 (这些坐标可以通过太阳编辑器的画线获得)
     * @param vecs
     */
    static createRectByVecs(...vecs) {
        if (vecs == null || vecs.length < 2) {
            log.errorWithTraceBack("必须传入2个或以上的坐标点");
            return null;
        }
        let vs = RectUtil.getMinXYAndMaxXYByVecs(...vecs);
        return Rect(vs[0], vs[1], vs[2], vs[3]);
    }
    /**
     * 获取一组坐标的最小xy 和最大xy   (这些坐标可以通过太阳编辑器的画线获得)
     * @param vecs
     * 返回 [minX, minY, maxX, maxY]
     */
    static getMinXYAndMaxXYByVecs(...vecs) {
        if (vecs == null || vecs.length < 2) {
            log.errorWithTraceBack("必须传入2个或以上的坐标点");
            return null;
        }
        let minX = vecs[0].x;
        let minY = vecs[0].y;
        let maxX = vecs[0].x;
        let maxY = vecs[0].y;
        for (let i = 1; i < vecs.length; i++) {
            let vec = vecs[i];
            if (vec.x < minX) {
                minX = vec.x;
            }
            if (vec.x > maxX) {
                maxX = vec.x;
            }
            if (vec.y < minY) {
                minY = vec.y;
            }
            if (vec.y > maxY) {
                maxY = vec.y;
            }
        }
        return [minX, minY, maxX, maxY];
    }
    /**
     * 获取区域内随机坐标
     */
    static getRandomXYInRect(qy) {
        const x = GetRandomInt(GetRectMinX(qy), GetRectMaxX(qy));
        const y = GetRandomInt(GetRectMinY(qy), GetRectMaxY(qy));
        return { x: x, y: y };
    }
    /**
     * 获取区域内随机深海坐标
     */
    static getRandomDeepWaterXYInRect(region) {
        for (let i = 0; i < 1000000; i++) {
            let x = GetRandomInt(GetRectMinX(region), GetRectMaxX(region));
            let y = GetRandomInt(GetRectMinY(region), GetRectMaxY(region));
            if (!IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) && IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)) {
                return { x, y };
            }
        }
        return null;
    }
    /**
     * 获取区域内随机陆地坐标
     */
    static getRandomLandXYInRect(region) {
        for (let i = 0; i < 1000000; i++) {
            let x = GetRandomInt(GetRectMinX(region), GetRectMaxX(region));
            let y = GetRandomInt(GetRectMinY(region), GetRectMaxY(region));
            if (IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) &&
                !IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)) {
                return { x, y };
            }
        }
        return null;
    }
    /**
     * 获取区域内随机坐标x
     */
    static getRandomXInRect(qy) {
        return GetRandomInt(GetRectMinX(qy), GetRectMaxX(qy));
    }
    /**
     * 获取区域内随机坐标y
     */
    static getRandomYInRect(qy) {
        return GetRandomInt(GetRectMinY(qy), GetRectMaxY(qy));
    }
    /**
     * 点在区域范围内
     * @param r
     * @param x
     * @param y
     */
    static isContainsCoords(r, x, y) {
        return (GetRectMinX(r) <= x) && (x <= GetRectMaxX(r)) && (GetRectMinY(r) <= y) && (y <= GetRectMaxY(r));
    }
    /**
     * 点在可用区域范围内
     * @param r
     * @param x
     * @param y
     */
    static isInPlayableArea(x, y) {
        return (GetRectMinX(bj_mapInitialPlayableArea) <= x) && (x <= GetRectMaxX(bj_mapInitialPlayableArea))
            && (GetRectMinY(bj_mapInitialPlayableArea) <= y) && (y <= GetRectMaxY(bj_mapInitialPlayableArea));
    }
    /**
     * 获取矩形宽度
     * @param r
     */
    static getRectWidth(r) {
        return GetRectMaxX(r) - GetRectMinX(r);
    }
    /**
     * 获取矩形高度
     * @param r
     */
    static getRectHeight(r) {
        return GetRectMaxY(r) - GetRectMinY(r);
    }
}
