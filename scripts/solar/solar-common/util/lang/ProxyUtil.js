/**
 *  拦截对象的 属性值 访问和设置
 */
export default class ProxyUtil {
    static objProxys = new Map();
    /**
     * 添加一个访问处理器
     * @param obj
     * @param handler
     */
    static addGetHandler(obj, handler) {
        if (targetLanguage != "lua") {
            print("暂未实现");
            return;
        }
        ProxyUtil.getObjProxy(obj).getHandlers.push(handler);
    }
    /**
     * 添加一个赋值处理器
     * @param obj
     * @param handler
     */
    static addSetHandler(obj, handler) {
        if (targetLanguage != "lua") {
            print("暂未实现");
            return;
        }
        ProxyUtil.getObjProxy(obj).setHandlers.push(handler);
    }
    /**
     * 添加一个对象的属性值改变的 监听器
     * @param obj
     * @param handler
     */
    static addValueChangeListener(obj, key, handler) {
        if (targetLanguage != "lua") {
            print("暂未实现");
            return;
        }
        let lastVal = obj[key];
        ProxyUtil.getObjProxy(obj).setHandlers.push((obj, key2, val) => {
            if (key != key2) {
                return;
            }
            if (val != lastVal) {
                handler(lastVal, val);
            }
            lastVal = val;
        });
    }
    static getObjProxy(obj) {
        let objProxy = ProxyUtil.objProxys.get(obj);
        if (objProxy != null) {
            return objProxy;
        }
        objProxy = {
            //将监控对象的数据复制到代理对象
            vals: { ...obj },
            getHandlers: [],
            setHandlers: [],
        };
        //清空监控对象的数据
        for (let objKey in obj) {
            delete obj[objKey];
        }
        setmetatable(obj, {
            __index: function (_, k) {
                let result = null;
                for (let handler of objProxy.getHandlers) {
                    result = handler(_, k);
                }
                if (result != null) {
                    return result;
                }
                return objProxy.vals[k];
            },
            __newindex: function (_, k, v) {
                let result = null;
                for (let handler of objProxy.setHandlers) {
                    result = handler(_, k, v);
                }
                if (result == null) {
                    result = v;
                }
                objProxy.vals[k] = result;
            },
            __pairs: function () {
                return function (_, k) {
                    return next(objProxy.vals, k);
                };
            },
            __len: function () {
                if (objProxy.vals[1] == null) {
                    return 0;
                }
                for (let i = 2; i < 1000000; i++) {
                    if (objProxy.vals[i] == null) {
                        return i;
                    }
                }
            },
        });
        ProxyUtil.objProxys.set(obj, objProxy);
        return objProxy;
    }
}
