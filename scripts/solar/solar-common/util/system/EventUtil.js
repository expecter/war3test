/** @noSelfInFile */
import mitt from '@/lib/mitt';
const emitter = mitt();
/**
 * 事件总线工具
 * 用作逻辑解耦
 * @deprecated see se.on() se.emit
 */
export default class EventUtil {
    /**
     * 注册一个事件接收器
     * @param type
     * @param handler
     */
    static on(type, handler) {
        emitter.on(type, handler);
    }
    /**
     * 发布一个事件
     * @param type
     * @param data
     */
    static emit(type, data) {
        emitter.emit(type, data);
    }
    /**
     * 清除所有注册的事件
     */
    static clear() {
        emitter.all.clear();
    }
}
