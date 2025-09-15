import NumberUtil from "@/NumberUtil";
/**
 * 演员id等表格id 通常为方便人记忆的中文长字符
 * 存档时可以使用此工具映射短id以节省存储
 */
/** @noSelf **/
export default class ShortIDUtil {
    static shortIdFullIdMap = {};
    static fullIdShortIdMap = {};
    /**
     * 计算 演员id 的 id哈希短编码
     * @param full_id
     */
    static calculateShortId(full_id) {
        let stringHash = Math.abs(StringHash(full_id));
        return NumberUtil.toUnsignedString(stringHash, 62);
    }
    /**
     * 演员id转 id短编码
     * @param full_id
     */
    static fullId2shortId(full_id) {
        let shortId = ShortIDUtil.fullIdShortIdMap[full_id];
        if (shortId == null) {
            shortId = ShortIDUtil.calculateShortId(full_id);
            ShortIDUtil.fullIdShortIdMap[full_id] = shortId;
            if (ShortIDUtil.shortIdFullIdMap[shortId]) {
                log.errorWithTraceBack("fullId2shortId映射冲突:[" + ShortIDUtil.shortIdFullIdMap[shortId] + "]和[" + full_id + "]都映射到短id:" + shortId);
            }
            ShortIDUtil.shortIdFullIdMap[shortId] = full_id;
        }
        return shortId;
    }
    /**
     * id短编码 转完整的演员id
     * @param shortId
     */
    static shortId2fullId(shortId) {
        return ShortIDUtil.shortIdFullIdMap[shortId];
    }
}
