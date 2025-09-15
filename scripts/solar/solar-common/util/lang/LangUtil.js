/**
 * 编程语言工具
 */
export default class LangUtil {
    static getIntId(id) {
        if (id && typeof id == "string") {
            id = FourCC(id);
        }
        return id;
    }
    static getStringId(id) {
        if (id && typeof id == "string") {
            return id;
        }
        return id2string(id);
    }
    /**
     * 判断是否是数字
     * @param obj
     */
    static isNumber(obj) {
        if (typeof obj == "number") {
            return true;
        }
    }
    /**
     * 判断是否是字符串
     * @param obj
     */
    static isString(obj) {
        if (typeof obj == "string") {
            return true;
        }
    }
    /**
     * 判断是否是布尔
     * @param obj
     */
    static isBoolean(obj) {
        if (typeof obj == "boolean") {
            return true;
        }
    }
    /**
     * 判断是否是函数
     * @param obj
     */
    static isFunction(obj) {
        if (typeof obj == "function") {
            return true;
        }
    }
    /**
     * 判断是否是对象
     * @param obj
     */
    static isObject(obj) {
        if (typeof obj == "object") {
            return true;
        }
    }
    /**
     * 判断是否是空对象
     */
    static isEmptyObject(obj) {
        for (let i in obj) {
            return false;
        }
        return true;
    }
    /**
     * 判断对象的key数量
     */
    static getObjectKeyCount(obj) {
        let count = 0;
        for (let i in obj) {
            count++;
        }
        return count;
    }
    /**
     * 清空对象
     */
    static clearObject(obj) {
        if (obj) {
            for (let k in obj) {
                obj[k] = null;
                delete obj[k];
            }
        }
        return true;
    }
    // static isTable(obj: any) {
    //     if (typeof obj == "table") {
    //         return true;
    //     }
    // }
    //
    // static isUserData(obj: any) {
    //     if (typeof obj == "userdata") {
    //         return true;
    //     }
    // }
    /**
     * 移除集合中的元素
     * @param set
     * @param ele
     */
    static removeSetElement(set, ele) {
        for (let key in set) {
            if (set[key] == ele) {
                deleteKey(set, key);
                return true;
            }
        }
        return false;
    }
    /**
     * 遍历集合中的元素
     * @param set
     * @param callback
     */
    static forEach(set, callback) {
        for (let key in set) {
            callback(key, set[key]);
        }
    }
    /**
     * 排序遍历集合中的元素
     * @param set
     * @param callback
     * @param compareFn
     */
    static forEachSort(set, callback, compareFn) {
        let keys = [];
        for (let key in set) {
            keys.push(key);
        }
        keys.sort(compareFn);
        for (let key of keys) {
            callback(key, set[key]);
        }
    }
    /**
     * 浮点数 四舍五入 转为字符串
     * @param num
     * @param fractionDigits
     */
    static toFixed(num, fractionDigits = 3) {
        // @ts-ignore
        let stringTs = string;
        return stringTs.format("%." + fractionDigits + "f", num);
    }
}
