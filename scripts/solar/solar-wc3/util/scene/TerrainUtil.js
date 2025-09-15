import RectUtil from "@/RectUtil";
export default class TerrainUtil {
    static MAX_RANGE = 10;
    //
    static isTerrainLand(x, y) {
        return IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY);
    }
    static isTerrainDeepWater(x, y) {
        return !IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) && IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY);
    }
    static isTerrainShallowWater(x, y) {
        return !IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) && !IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) && IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY);
    }
    static isTerrainPlatform(x, y) {
        return !IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) && !IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) && !IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY);
    }
    static isTerrainBuildAble(x, y) {
        return !IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) && !IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY);
    }
    static isTerrainWalkable(x, y) {
        let rect = RectUtil.GetRectFromCircle(x, y, 64);
        let whichItem = CreateItem('wolg', 0, 0);
        let hideItems = [];
        let hidMax = 0;
        SetItemVisible(whichItem, false);
        EnumItemsInRect(rect.handle, null, () => {
            if (IsItemVisible(GetEnumItem())) {
                hideItems[hidMax] = GetEnumItem();
                SetItemVisible(hideItems[hidMax], false);
                hidMax++;
            }
        });
        SetItemPosition(whichItem, x, y);
        let itemX = GetItemX(whichItem);
        let itemY = GetItemY(whichItem);
        SetItemVisible(whichItem, false);
        rect.destroy();
        while (hidMax > 0) {
            hidMax--;
            SetItemVisible(hideItems[hidMax], true);
            hideItems[hidMax] = null;
        }
        return (itemX - x) * (itemX - x) + (itemY - y) * (itemY - y) <= TerrainUtil.MAX_RANGE * TerrainUtil.MAX_RANGE && !IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY);
    }
    /**
     * 提高地形
     * @param x
     * @param y
     * @param x2
     * @param y2
     * @param height
     */
    static raiseTerrain(x, y, x2, y2, height) {
        let y0 = y;
        let r = 32.00;
        while (true) {
            if (x > x2)
                break;
            y = y0;
            while (true) {
                if (y > y2)
                    break;
                TerrainDeformCrater(x, y, r, -height, 1, true);
                y = y + r;
            }
            x = x + r;
        }
    }
    /**
     * 提高地形
     * @param x
     * @param y
     * @param height
     */
    static raiseTerrainTile(x, y, height) {
        TerrainDeformCrater(x, y, 1, -height, 0.01, true);
    }
}
