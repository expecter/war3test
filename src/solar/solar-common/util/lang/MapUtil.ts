export default class MapUtil {


    /**
     *  属性对象相加
     *  base = base + _addVal
     */
    static addNumber(base: any, _addVal: any): void {
        if (!_addVal) {
            return
        }
        for (let key in _addVal) {
            if (typeof _addVal[key] == "number") {
                base[key] = (base[key] as number ?? 0) + (_addVal[key] as number)
            }
        }
    }

    /**
     *  属性对象减去
     *  base = base - _subtractVal
     */
    static subtractNumber(base: any, _subtractVal: any): void {
        if (!_subtractVal) {
            return
        }
        for (let key in _subtractVal) {
            if (typeof _subtractVal[key] == "number") {
                base[key] = (base[key] as number ?? 0) - (_subtractVal[key] as number)
            }
        }
    }

    /**
     *  属性对象缩放
     *  attribute * scale
     */
    static multiply(base: any, scale: number, store?: any): AppAttribute {
        if (!base) {
            return
        }
        if (scale == 0) {
            return {}
        }
        if (store == null) {
            store = {}
        }
        for (let key in base) {
            if (typeof base[key] == "number") {
                store[key] = (base[key] as number ?? 0) * scale;
            }
        }
        return store;
    }

    /**
     *  属性对象是否拥有足够条件的数值
     *  base = base + _addVal
     */
    static hasEnoughNumber(base: any, conditionVal: any): boolean {
        if (!conditionVal) {
            return true;
        }
        if (base == null) {
            return false;
        }
        for (let key in conditionVal) {
            if (typeof conditionVal[key] == "number") {
                if ((base[key] as number ?? 0) < (conditionVal[key] as number)) {
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
    static map2String(map: any, separator: string = " ") {
        let str = "";
        for (let mapKey in map) {
            if (str.length > 0) {
                str += " "
            }
            str = str + mapKey + separator + tostring(map[mapKey])
        }
        return str;
    }

}