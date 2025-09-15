export default class MultiboardUtil {
    /**
     *
     * @param mb
     * @param callback
     * @param row 0开始
     * @param column 0开始
     */
    static forMultiboardItems(mb, callback, row, column) {
        //MultiboardUtil
        if (row && column) {
            let mbitem = MultiboardGetItem(mb, row, column);
            callback(mbitem, row, column);
            MultiboardReleaseItem(mbitem);
        }
        else {
            let maxRows = MultiboardGetRowCount(mb);
            let maxCols = MultiboardGetColumnCount(mb);
            for (let r = 0; r < maxRows; r++) {
                for (let c = 0; c < maxCols; c++) {
                    let mbitem = MultiboardGetItem(mb, r, c);
                    callback(mbitem, r, c);
                    MultiboardReleaseItem(mbitem);
                }
            }
        }
    }
    /**
     *
     * @param mb
     * @param row
     * @param column
     * @param width 0-0.8
     */
    static setItemWidth(mb, row, column, width) {
        let mbitem = MultiboardGetItem(mb, row, column);
        MultiboardSetItemWidth(mbitem, width);
        MultiboardReleaseItem(mbitem);
    }
    /**
     *
     * @param mb
     * @param row
     * @param column
     * @param value
     */
    static setItemValue(mb, row, column, value) {
        let mbitem = MultiboardGetItem(mb, row, column);
        MultiboardSetItemValue(mbitem, value);
        MultiboardReleaseItem(mbitem);
    }
    /**
     *
     * @param mb
     * @param row
     * @param column
     * @param red
     * @param green
     * @param blue
     * @param alpha
     */
    static setItemColor(mb, row, column, red, green, blue, alpha) {
        let mbitem = MultiboardGetItem(mb, row, column);
        MultiboardSetItemValueColor(mbitem, red, green, blue, alpha);
        MultiboardReleaseItem(mbitem);
    }
}
