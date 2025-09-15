/** @noSelfInFile **/
import { Handle } from "./handle";
export class FogModifier extends Handle {
    constructor(forWhichPlayer, whichState, centerX, centerY, radius, useSharedVision, afterUnits) {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateFogModifierRadius(forWhichPlayer.handle, whichState, centerX, centerY, radius, useSharedVision, afterUnits));
        }
    }
    /**
     * 删除可见度修正器
     */
    destroy() {
        DestroyFogModifier(this.handle);
    }
    /**
     * 允许可见度修正器
     */
    start() {
        FogModifierStart(this.handle);
    }
    /**
     * 禁止可见度修正器
     */
    stop() {
        FogModifierStop(this.handle);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
    static fromRect(forWhichPlayer, whichState, where, useSharedVision, afterUnits) {
        return this.fromHandle(CreateFogModifierRect(forWhichPlayer.handle, whichState, where.handle, useSharedVision, afterUnits));
    }
}
