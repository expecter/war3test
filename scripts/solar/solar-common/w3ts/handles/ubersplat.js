/** @noSelfInFile **/
import { Handle } from "./handle";
export class Ubersplat extends Handle {
    constructor(x, y, name, red, green, blue, alpha, forcePaused, noBirthTime) {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateUbersplat(x, y, name, red, green, blue, alpha, forcePaused, noBirthTime));
        }
    }
    destroy() {
        DestroyUbersplat(this.handle);
    }
    finish() {
        FinishUbersplat(this.handle);
    }
    render(flag, always = false) {
        if (always) {
            SetUbersplatRenderAlways(this.handle, flag);
        }
        else {
            SetUbersplatRender(this.handle, flag);
        }
    }
    reset() {
        ResetUbersplat(this.handle);
    }
    show(flag) {
        ShowUbersplat(this.handle, flag);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
