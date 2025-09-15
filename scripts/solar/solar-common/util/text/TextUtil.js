/**
 * 776京
 * 215.6涧
 * 10**38
 * 1、万：10的四次方。
 * 2、亿：10的八次方。
 * 3、兆：10的12次方。
 * 4、京：10的16次方。
 * 5、垓：10的20次方。
 * 6、秭：10的24次方。
 * 7、壤：10的28次方。
 */
export default class TextUtil {
    static config = {
        //中文单位 以万跨度 排列
        cnUnit: ["万", "亿", "兆", "京", "垓", "秭", "穰", "沟", "涧", "正", "载", "极", "恒", "阿", "那", "不", "大",
            "万大", "亿大", "兆大", "京大", "垓大", "秭大", "穰大", "沟大", "涧大", "正大", "载大"],
        cnUnit2: ["万", "亿", "兆", "京", "垓E", "秭F", "穰G", "沟F", "涧G", "正H", "载I", "极J", "恒K", "阿L", "那M", "N", "大O",
            "万大P", "亿大Q", "兆大R", "京大S", "垓大T", "秭大U", "穰大V", "沟大W", "涧大X", "正大Y", "载大Z"],
        cnUnit3: ["万", "亿", "兆", "京", "五", "六", "七", "八", "九", "十", "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十"],
        // cnUnit: ["万", "亿", "兆", "京", "垓", "秭", "穰", "沟", "涧", "正", "载", "极", "恒河沙", "阿僧祇", "那由他", "不可思议", "无量大数"],
        // cnUnit: ["万A", "亿B", "兆C", "京D", "垓E", "秭F", "穰G", "沟F", "涧G", "正H", "载I", "极J", "恒河沙K", "阿僧祇L", "那由他M", "不可思议N", "无量大数O"]
    };
    /**
     * 根据数字转汉字表示
     */
    static toCn(digit) {
        let chnNum = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"];
        let chnNumUnit = ["", "十", "百", "千", "万", "十", "百", "千", "亿"];
        let tmp = "";
        let chnString = "";
        let zero = true;
        let unitIndex = 0;
        let isTen = false;
        if (digit > 9 && digit < 20) {
            isTen = true;
        }
        while (digit > 0) {
            let num = digit % 10;
            if (num === 0) {
                if (!zero) {
                    zero = true;
                    chnString = chnNum[num] + chnString;
                }
            }
            else {
                zero = false;
                if (isTen && unitIndex == 1) {
                    tmp = "";
                }
                else {
                    tmp = chnNum[num];
                }
                tmp += chnNumUnit[unitIndex];
                chnString = tmp + chnString;
            }
            unitIndex++;
            digit = math.floor(digit / 10);
        }
        return chnString;
    }
    /**
     * 将数字转换为中文单位的数字
     * @param num
     * @param keepDecimalPoint 保留小数位
     * @param maxDigit 最大数字显示位数 不得小于4
     */
    static toCnUnit(num, keepDecimalPoint = true, maxDigit = 4) {
        let cnUnit = "";
        let index = 0;
        for (; index < TextUtil.config.cnUnit.length; index++) {
            if (math.abs(num) < 10000) {
                break;
            }
            num = num / 10000;
            cnUnit = TextUtil.config.cnUnit[index];
        }
        if (!keepDecimalPoint) {
            num = math.floor(num);
        }
        else {
            let numStr = num + "";
            let indexOf = numStr.indexOf(".");
            if (indexOf < maxDigit) {
                numStr = numStr.substring(0, maxDigit + 1);
                if (numStr.endsWith(".000") || numStr.endsWith(".00") || numStr.endsWith(".0")) {
                    numStr = numStr.substring(0, indexOf);
                }
                return numStr + cnUnit;
            }
            else if (indexOf == maxDigit) {
                num = math.floor(num);
            }
        }
        return num + cnUnit;
    }
    /**
     * 将小数转换为百分比
     * @param num
     * @param decimalPrecision
     */
    static toPercentage(num, decimalPrecision = 0) {
        if (num == null) {
            return "0%";
        }
        num *= 100;
        if (decimalPrecision == 0) {
            return math.floor(num) + "%";
        }
        let percentageStr = num + "";
        let pointIndex = percentageStr.indexOf(".");
        if (pointIndex >= 0 && (percentageStr.length - pointIndex) > decimalPrecision) {
            return percentageStr.substring(0, pointIndex + decimalPrecision + 1) + "%";
        }
        return percentageStr + "%";
    }
    /**
     * 移除一个文本的 |cxxx颜色
     * @param value
     */
    static removeColors(value) {
        if (value == null) {
            return value;
        }
        else {
            let color;
            while (value.indexOf("|c") >= 0) {
                color = value.substring(value.indexOf("|c"), value.indexOf("|c") + 10);
                value = value.replaceAll(color, "");
            }
            while (value.indexOf("|C") >= 0) {
                color = value.substring(value.indexOf("|C"), value.indexOf("|C") + 10);
                value = value.replaceAll(color, "");
            }
            value = value.replaceAll("|r", "");
            return value;
        }
    }
    static leftPad(value, totalLength, pad) {
        for (let i = totalLength - value.length; i > 0; --i) {
            value = pad + value;
        }
        return value;
    }
    static rightPad(value, totalLength, pad) {
        for (let i = totalLength - value.length; i > 0; --i) {
            value = value + pad;
        }
        return value;
    }
}
