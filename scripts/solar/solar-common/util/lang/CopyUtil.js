/**
 * @brief 拷贝工具
 */
export default class CopyUtil {
    /**浅拷贝*/
    static shallowCopy(obj) {
        const newObj = {};
        for (const key of Object.keys(obj)) {
            newObj[key] = obj[key];
        }
        return newObj;
    }
    /**深拷贝*/
    static deepCopy(obj, maxDeep = 10) {
        assert(maxDeep >= 0, this.name);
        if (!obj)
            return obj;
        switch (typeof obj) {
            case "object":
                if (obj instanceof Map) {
                    const map = new Map();
                    for (let [_key, _value] of obj) {
                        map.set(_key, this.deepCopy(_value, maxDeep - 1));
                    }
                    return map;
                }
                if (obj instanceof Set) {
                    const set = new Set();
                    for (let valueElement of obj) {
                        set.add(this.deepCopy(valueElement, maxDeep - 1));
                    }
                    return set;
                }
                if (obj instanceof Array) {
                    const array = Array(obj.length);
                    for (let i = 0; i < obj.length; i++) {
                        array[i] = this.deepCopy(obj[i], maxDeep - 1);
                    }
                    return array;
                }
                // 其它类型均当做普通对象处理
                const object = {};
                for (let key of Object.keys(obj)) {
                    object[key] = this.deepCopy(obj[key], maxDeep - 1);
                }
                return object;
            case "function":
                return undefined;
            case "bigint":
                return undefined;
            case "symbol":
                return undefined;
            default:
                return obj;
        }
    }
}
