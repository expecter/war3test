/** @noSelfInFile **/
import { Handle } from "./handle";
export class TextTag extends Handle {
    constructor() {
        if (Handle.initFromHandle()) {
            super();
            return;
        }
        let textTagHandle = CreateTextTag();
        if (textTagHandle) {
            super(textTagHandle);
        }
    }
    /**
     * 销毁漂浮文字 [R]
     */
    destroy() {
        DestroyTextTag(this.handle);
    }
    /**
     * 设置已存在时间 [R]
     */
    setAge(age) {
        SetTextTagAge(this.handle, age);
    }
    /**
     * 改变颜色 [R]
     */
    setColor(red, green, blue, alpha) {
        SetTextTagColor(this.handle, red, green, blue, alpha);
    }
    /**
     * 设置消逝时间点
     * @param fadepoint
     */
    setFadepoint(fadepoint) {
        SetTextTagFadepoint(this.handle, fadepoint);
    }
    /**
     * 设置显示时间
     * @param lifespan
     */
    setLifespan(lifespan) {
        SetTextTagLifespan(this.handle, lifespan);
    }
    /**
     * 设置永久显示
     * @param flag
     */
    setPermanent(flag) {
        SetTextTagPermanent(this.handle, flag);
    }
    /**
     * 改变位置(坐标) [R]
     */
    setPos(x, y, heightOffset) {
        SetTextTagPos(this.handle, x, y, heightOffset);
    }
    /**
     * 改变位置(单位点) [R]
     */
    setPosUnit(u, heightOffset) {
        SetTextTagPosUnit(this.handle, u.handle, heightOffset);
    }
    /**
     * 暂停/恢复
     * 暂停状态暂停漂浮文字的移动和生命计时.
     * @param flag
     */
    setSuspended(flag) {
        SetTextTagSuspended(this.handle, flag);
    }
    /**
     * 改变文字内容 [R]
     */
    setText(s, height, adjustHeight = false) {
        if (adjustHeight) {
            height = height * 0.0023;
        }
        SetTextTagText(this.handle, s, height);
    }
    /**
     * 设置速率 [R]
     */
    setVelocity(xvel, yvel) {
        SetTextTagVelocity(this.handle, xvel, yvel);
    }
    /**
     * 设置速率(角度)[R]
     */
    setVelocityAngle(speed, angle) {
        const vel = speed * 0.071 / 128;
        this.setVelocity(vel * Cos(angle * 0.017), vel * Sin(angle * 0.017));
    }
    /**
     * 显示/隐藏 (所有玩家) [R]
     */
    setVisible(flag) {
        SetTextTagVisibility(this.handle, flag);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
