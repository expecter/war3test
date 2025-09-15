export default class MapUtil {
    /**
     *  属性对象相加
     *  base = base + _addVal
     */
    static addNumber(base, _addVal) {
        if (!_addVal) {
            return;
        }
        for (let key in _addVal) {
            if (typeof _addVal[key] == "number") {
                base[key] = (base[key] ?? 0) + _addVal[key];
            }
        }
    }
    /**
     *  属性对象减去
     *  base = base - _subtractVal
     */
    static subtractNumber(base, _subtractVal) {
        if (!_subtractVal) {
            return;
        }
        for (let key in _subtractVal) {
            if (typeof _subtractVal[key] == "number") {
                base[key] = (base[key] ?? 0) - _subtractVal[key];
            }
        }
    }
    /**
     *  属性对象缩放
     *  attribute * scale
     */
    static multiply(base, scale, store) {
        if (!base) {
            return;
        }
        if (scale == 0) {
            return {};
        }
        if (store == null) {
            store = {};
        }
        for (let key in base) {
            if (typeof base[key] == "number") {
                store[key] = (base[key] ?? 0) * scale;
            }
        }
        return store;
    }
    /**
     *  属性对象是否拥有足够条件的数值
     *  base = base + _addVal
     */
    static hasEnoughNumber(base, conditionVal) {
        if (!conditionVal) {
            return true;
        }
        if (base == null) {
            return false;
        }
        for (let key in conditionVal) {
            if (typeof conditionVal[key] == "number") {
                if ((base[key] ?? 0) < conditionVal[key]) {
                    return false;
                }
            }
        }
        return true;
    }
    /**
     * 转字符串
     * @param map
     * @param separator
     */
    static map2String(map, separator = " ") {
        let str = "";
        for (let mapKey in map) {
            if (str.length > 0) {
                str += " ";
            }
            str = str + mapKey + separator + tostring(map[mapKey]);
        }
        return str;
    }
}
