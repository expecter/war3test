/** @noSelfInFile **/
import { Handle } from "./handle";
export class Widget extends Handle {
    get life() {
        return GetWidgetLife(this.handle);
    }
    set life(value) {
        SetWidgetLife(this.handle, value);
    }
    get x() {
        return GetWidgetX(this.handle);
    }
    get y() {
        return GetWidgetY(this.handle);
    }
    static fromEvent() {
        return this.fromHandle(GetTriggerWidget());
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
