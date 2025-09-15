/** @noSelfInFile **/
import { Handle } from "./handle";
import { Widget } from "./widget";
export class Destructable extends Widget {
    // @ts-ignore
    handle;
    constructor(objectId, x, y, z, face, scale, varation) {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateDestructableZ(objectId, x, y, z, face, scale, varation));
        }
    }
    set invulnerable(flag) {
        SetDestructableInvulnerable(this.handle, flag);
    }
    get invulnerable() {
        return IsDestructableInvulnerable(this.handle);
    }
    get life() {
        return GetDestructableLife(this.handle);
    }
    set life(value) {
        SetDestructableLife(this.handle, value);
    }
    get maxLife() {
        return GetDestructableMaxLife(this.handle);
    }
    set maxLife(value) {
        SetDestructableMaxLife(this.handle, value);
    }
    get name() {
        return GetDestructableName(this.handle);
    }
    get occluderHeight() {
        return GetDestructableOccluderHeight(this.handle);
    }
    set occluderHeight(value) {
        SetDestructableOccluderHeight(this.handle, value);
    }
    get typeId() {
        return GetDestructableTypeId(this.handle);
    }
    get x() {
        return GetDestructableX(this.handle);
    }
    get y() {
        return GetDestructableY(this.handle);
    }
    destroy() {
        RemoveDestructable(this.handle);
    }
    heal(life, birth) {
        DestructableRestoreLife(this.handle, life, birth);
    }
    kill() {
        KillDestructable(this.handle);
    }
    queueAnim(whichAnimation) {
        QueueDestructableAnimation(this.handle, whichAnimation);
    }
    setAnim(whichAnimation) {
        SetDestructableAnimation(this.handle, whichAnimation);
    }
    setAnimSpeed(speedFactor) {
        SetDestructableAnimationSpeed(this.handle, speedFactor);
    }
    show(flag) {
        ShowDestructable(this.handle, flag);
    }
    static fromEvent() {
        return this.fromHandle(GetTriggerDestructable());
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
