import ListFileUtil from "../game/ListFileUtil";
export default class XlsxDataUtil {
    static idObjMap = {};
    /**id 与 数据所在表格数组的索引 第一行数据为0*/
    static idIndexMap = {};
    /**
     *
     * @param xlsxDirPath 表格lua的根目录路径
     */
    static registerDataByXlsxDir(xlsxDirPath = "scripts\\xlsx") {
        ListFileUtil.requireDir(xlsxDirPath, (luaPath, requireResult) => {
            XlsxDataUtil.registerData(requireResult?.data);
        });
    }
    /**
     * 注册一个xlsx编译后的data 数据列表  数据对象需包括id
     * @param data
     */
    static registerData(data) {
        if (data) {
            for (let i = 0; i < data.length; i++) {
                let datum = data[i];
                if (datum && datum.id) {
                    XlsxDataUtil.idObjMap[datum.id] = datum;
                    XlsxDataUtil.idIndexMap[datum.id] = i;
                }
            }
        }
    }
    /**
     * 根据注册的 xlsx编译后的data 的id  获取对应的行 对象
     * @param id
     */
    static getDataById(id) {
        return XlsxDataUtil.idObjMap[id];
    }
    /**
     * 根据注册的 xlsx编译后的data 的id  获取对应的行 数组索引
     * @param id
     */
    static getDataIndexById(id) {
        return XlsxDataUtil.idIndexMap[id];
    }
}
