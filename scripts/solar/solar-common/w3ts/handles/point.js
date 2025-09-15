/** @noSelfInFile **/
import { Handle } from "./handle";
/**
 * @deprecated  推荐使用xy坐标 不要使用点 以提高性能 和不用排泄点
 */
export class Point extends Handle {
    constructor(x, y) {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(Location(x, y));
        }
    }
    get x() {
        return GetLocationX(this.handle);
    }
    set x(value) {
        MoveLocation(this.handle, value, this.y);
    }
    get y() {
        return GetLocationY(this.handle);
    }
    set y(value) {
        MoveLocation(this.handle, this.x, value);
    }
    /**
     * This function is asynchronous. The values it returns are not guaranteed synchronous between each player.
     * If you attempt to use it in a synchronous manner, it may cause a desync.
     */
    get z() {
        return GetLocationZ(this.handle);
    }
    destroy() {
        RemoveLocation(this.handle);
    }
    setPosition(x, y) {
        MoveLocation(this.handle, x, y);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
