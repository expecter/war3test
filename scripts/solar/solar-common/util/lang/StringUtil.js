export default class StringUtil {
    /**
     * 是否是空的字符串
     * @param str
     */
    static isEmpty(str) {
        if (str == null || str == "") {
            return true;
        }
        return false;
    }
    /**
     * 是否 不是空的字符串
     * @param str
     */
    static notEmpty(str) {
        return !StringUtil.isEmpty(str);
    }
    /**
     * 返回一个以定点表示法表示数字的字符串。
     * @param num
     * @param fractionDigits
     */
    toFixed(num, fractionDigits = 2) {
        let stringTs = string;
        let lm = stringTs.format("%." + fractionDigits + "f", num);
        return lm;
    }
    /**获取字符的字节数*/
    static getBytes(char) {
        let code = string.byte(char);
        return StringUtil.getBytesByCode(code);
    }
    /**获取字符的字节数*/
    static getBytesByCode(code) {
        if (!code)
            return 0;
        if (code > 240) {
            return 4;
        }
        else if (code > 225) {
            return 3;
        }
        else if (code > 192) {
            return 2;
        }
        else {
            return 1;
        }
    }
    /**获取字符串的长度*/
    static getLength(str) {
        let length = 0;
        let currentIndex = 1;
        while (currentIndex <= str.length) {
            let code = string.byte(str, currentIndex);
            currentIndex = currentIndex + StringUtil.getBytesByCode(code);
            length++;
        }
        return length;
    }
    /**截取子字符串(索引从0开始) 支持utf8*/
    static subString(str, start, end) {
        let start_byte = utf8.offset(str, start + 1);
        let end_byte = utf8.offset(str, end + 1) - 1; // -- 注意这里是 end_char + 1 的偏移减一
        return string.sub(str, start_byte, end_byte);
        // let tempStr: string = str;
        // let byteStart: number = 1;
        // let byteEnd: number = -1;
        // let index: number = 0;
        // let bytes: number = 0;
        // end = end ?? str.length;
        // while (tempStr.length > 0) {
        //     if (index == start) {
        //         byteStart = bytes + 1;
        //     } else if (index == end) {
        //         byteEnd = bytes;
        //         break;
        //     }
        //     let code: number = string.byte(tempStr);
        //     bytes += StringUtil.getBytesByCode(code);
        //     tempStr = string.sub(str, bytes + 1);
        //     index++;
        // }
        // return string.sub(str, byteStart, byteEnd);
    }
    /**获取字符串(索引从0开始)*/
    static getCharAtIndex(str, index) {
        return StringUtil.subString(str, index, index);
    }
}
