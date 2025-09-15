export default class VmUtil {
    /**
     * 地图文件里是否拥有某资源（某文件）
     * @param resourcePath
     */
    static hasResource(resourcePath) {
        let [file] = io.open(resourcePath, "r");
        if (file) {
            return true;
        }
        return false;
    }
    /**
     * 从地图文件里读取字符串内容
     * @param strResourcePath
     */
    static getResourceAsString(strResourcePath) {
        let [file] = io.open(strResourcePath, "rb");
        if (!file) {
            return;
        }
        let str = file.read("*a");
        file.close();
        return str;
    }
    /**
     * 从地图文件里读取Json内容
     * @param jsonResourcePath
     */
    static getResourceAsJson(jsonResourcePath) {
        return JSON.parse(VmUtil.getResourceAsString(jsonResourcePath));
    }
    /**
     * 手动触发一次垃圾回收 以减少脚本引擎内存占用
     */
    static gc() {
        collectgarbage("collect");
    }
    /**
     * 写文件
     * @param filename
     * @param content
     */
    static writeFile(filename, content) {
        let [file] = io.open(filename, "wb");
        file.write(content);
        file.close();
    }
}
