/** @noSelfInFile **/
import { Handle } from "./handle";
export class TimerDialog extends Handle {
    constructor(t) {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateTimerDialog(t.handle));
        }
    }
    get display() {
        return IsTimerDialogDisplayed(this.handle);
    }
    set display(display) {
        TimerDialogDisplay(this.handle, display);
    }
    destroy() {
        DestroyTimerDialog(this.handle);
    }
    setSpeed(speedMultFactor) {
        TimerDialogSetSpeed(this.handle, speedMultFactor);
    }
    setTimeRemaining(value) {
        TimerDialogSetRealTimeRemaining(this.handle, value);
    }
    setTitle(title) {
        TimerDialogSetTitle(this.handle, title);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
