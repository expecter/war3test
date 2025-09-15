/**
 * @name  文件工具
 * @brief 处理本地文件读写
 */
export default class FileUtil {
    /**从文件中读取数据*/
    static getDataFromFile(filePath) {
        let [file] = io.open(filePath, "r+");
        if (!file)
            return null;
        let jsonDataStr = file.read("*a");
        let data = JSON.parse(jsonDataStr);
        file.close();
        return data;
    }
    /**写入数据到文件中(会覆盖掉同名文件中的数据)*/
    static writeToFile(data, filePath) {
        let jsonDataStr = JSON.stringify(data);
        let [file] = io.open(filePath, "w+");
        file.write(jsonDataStr);
        file.close();
    }
    /**获取文件扩展名*/
    static getFileExtension(filePath) {
        let fileExtension = '';
        //let index: number = filePath.lastIndexOf('.');   
        let index = -1;
        for (let i = filePath.length - 1; i >= 0; i--) {
            if ('.' == filePath[i]) {
                index = i;
                break;
            }
        }
        if (-1 != index) {
            fileExtension = filePath.substring(index);
        }
        return fileExtension;
    }
    /**获取文件名*/
    static getFilename(filePath, containExtension = true) {
        let filename = '';
        let index = -1;
        for (let i = filePath.length - 1; i >= 0; i--) {
            if ('\\' == filePath[i]) {
                index = i;
                break;
            }
        }
        if (-1 != index) {
            filename = filePath.substring(index + 1);
        }
        if (containExtension) {
            return filename;
        }
        index = -1;
        for (let i = filename.length - 1; i >= 0; i--) {
            if ('.' == filename[i]) {
                index = i;
                break;
            }
        }
        if (-1 != index) {
            filename = filename.substring(0, index);
        }
        return filename;
    }
}
