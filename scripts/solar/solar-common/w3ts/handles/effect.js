/** @noSelfInFile **/
import { Handle } from "./handle";
export class Effect extends Handle {
    /**特效对象 */
    _data;
    get data() {
        if (!this._data) {
            this._data = {};
        }
        return this._data;
    }
    set data(value) {
        this._data = value;
    }
    constructor(modelName, a, b) {
        if (Handle.initFromHandle()) {
            super();
        }
        else if (typeof a === "number" && typeof b === "number") {
            super(AddSpecialEffect(modelName, a, b));
        }
        else if (typeof a !== "number" && typeof b === "string") {
            super(AddSpecialEffectTarget(modelName, a.handle, b));
        }
    }
    // public get scale() {
    //   return BlzGetSpecialEffectScale(this.handle);
    // }
    //
    // public set scale(scale: number) {
    //   BlzSetSpecialEffectScale(this.handle, scale);
    // }
    /**
     * Warning: asynchronous
     */
    // public get x() {
    //   return BlzGetLocalSpecialEffectX(this.handle);
    // }
    //
    // public set x(x: number) {
    //   BlzSetSpecialEffectX(this.handle, x);
    // }
    /**
     * Warning: asynchronous
     */
    // public get y() {
    //   return BlzGetLocalSpecialEffectY(this.handle);
    // }
    //
    // public set y(y: number) {
    //   BlzSetSpecialEffectY(this.handle, y);
    // }
    //
    // /**
    //  * Warning: asynchronous
    //  */
    // public get z() {
    //   return BlzGetLocalSpecialEffectZ(this.handle);
    // }
    //
    // public set z(z: number) {
    //   BlzSetSpecialEffectZ(this.handle, z);
    // }
    //
    // public addSubAnimation(subAnim: subanimtype) {
    //   BlzSpecialEffectAddSubAnimation(this.handle, subAnim);
    // }
    //
    // public clearSubAnimations() {
    //   BlzSpecialEffectClearSubAnimations(this.handle);
    // }
    // public playAnimation(animType: animtype) {
    //   BlzPlaySpecialEffect(this.handle, animType);
    // }
    //
    // public playWithTimeScale(animType: animtype, timeScale: number) {
    //   BlzPlaySpecialEffectWithTimeScale(this.handle, animType, timeScale);
    // }
    //
    // public removeSubAnimation(subAnim: subanimtype) {
    //   BlzSpecialEffectRemoveSubAnimation(this.handle, subAnim);
    // }
    //
    // public resetScaleMatrix() {
    //   BlzResetSpecialEffectMatrix(this.handle);
    // }
    //
    // public setAlpha(alpha: number) {
    //   BlzSetSpecialEffectAlpha(this.handle, alpha);
    // }
    //
    // public setColor(red: number, green: number, blue: number) {
    //   BlzSetSpecialEffectColor(this.handle, red, green, blue);
    // }
    //
    // public setColorByPlayer(whichPlayer: MapPlayer) {
    //   BlzSetSpecialEffectColorByPlayer(this.handle, whichPlayer.handle);
    // }
    //
    // public setHeight(height: number) {
    //   BlzSetSpecialEffectHeight(this.handle, height);
    // }
    //
    // public setOrientation(yaw: number, pitch: number, roll: number) {
    //   BlzSetSpecialEffectOrientation(this.handle, yaw, pitch, roll);
    // }
    // public setPitch(pitch: number) {
    //   BlzSetSpecialEffectPitch(this.handle, pitch);
    // }
    //
    // public setPoint(p: Point) {
    //   BlzSetSpecialEffectPositionLoc(this.handle, p.handle);
    // }
    //
    // public setPosition(x: number, y: number, z: number) {
    //   BlzSetSpecialEffectPosition(this.handle, x, y, z);
    // }
    //
    // public setRoll(roll: number) {
    //   BlzSetSpecialEffectRoll(this.handle, roll);
    // }
    //
    // public setScaleMatrix(x: number, y: number, z: number) {
    //   BlzSetSpecialEffectMatrixScale(this.handle, x, y, z);
    // }
    //
    // public setTime(value: number) {
    //   BlzSetSpecialEffectTime(this.handle, value);
    // }
    //
    // public setTimeScale(timeScale: number) {
    //   BlzSetSpecialEffectTimeScale(this.handle, timeScale);
    // }
    // public setYaw(y: number) {
    //   BlzSetSpecialEffectYaw(this.handle, y);
    // }
    /**
     * 新建特效(创建到坐标)
     */
    static createEffect(modelName, x, y) {
        return new Effect(modelName, x, y);
    }
    /**
     * 新建特效(绑定到单位)
     */
    static createEffectTarget(modelName, a, b) {
        return new Effect(modelName, a, b);
    }
    /**
     * 设置特效大小
     */
    set effectSize(size) {
        EXSetEffectSize(this.handle, size);
        this.data.size = size;
    }
    /**
     * 获取特效大小
     */
    get effectSize() {
        let size = this.data.size;
        if (!size) {
            size = EXGetEffectSize(this.handle);
        }
        return size;
    }
    /**
     * 设置特效粒子大小
     */
    set effectPariticleSize(size) {
        if (SetPariticle2Size) {
            SetPariticle2Size(this.handle, size);
        }
        this.data.Parsize = size;
    }
    /**
     * 获取特效粒子大小
     */
    get effectPariticleSize() {
        let size = this.data.Parsize;
        if (!size) {
            size = 0;
        }
        return size;
    }
    /**
     * 设置特效高度
     */
    set effectZ(Z) {
        EXSetEffectZ(this.handle, Z);
        this.data.z = Z;
    }
    /**
     * 获取特效高度
     */
    get effectZ() {
        let z = this.data.z;
        if (!z) {
            z = EXGetEffectZ(this.handle);
        }
        return z;
    }
    /**
     * 设置特效播放速度
     */
    set effectSpeed(Speed) {
        EXSetEffectSpeed(this.handle, Speed);
        this.data.Speed = Speed;
    }
    /**
     * 获取特效播放速度
     */
    get effectSpeed() {
        return this.data.Speed;
    }
    /**
     * 设置特效颜色
     */
    set effectColor(Color) {
        EXSetEffectColor(this.handle, Color);
        this.data.color = Color;
    }
    /**
     * 获取特效颜色
     */
    get effectColor() {
        let Color = this.data.color;
        if (!Color) {
            Color = EXGetEffectColor(this.handle);
        }
        return Color;
    }
    /**
     * 设置迷雾可见特效
     */
    set effectFogVisible(fogvisible) {
        EXSetEffectFogVisible(this.handle, fogvisible);
        this.data.fogvisible = fogvisible;
    }
    /**
     * 获取特效迷雾可见情况
     */
    get effectFogVisible() {
        return this.data.fogvisible;
    }
    /**
     * 设置特效可见
     */
    set effectVisible(visible) {
        EXSetEffectVisible(this.handle, visible);
        this.data.visible = visible;
    }
    /**
     * 设置特效可见
     */
    get effectVisible() {
        return this.data.visible;
    }
    /**
     * 设置特效Z轴旋转
     */
    set effectRotateZ(z) {
        this.reset();
        EXEffectMatRotateZ(this.handle, z);
        this.data.rotateZ = z;
    }
    /**
     * 获取特效Z轴旋转
     */
    get effectRotateZ() {
        return this.data.rotateZ;
    }
    /**
     * 设置特效X轴旋转
     */
    set effectRotateX(x) {
        EXEffectMatRotateX(this.handle, x);
        this.data.rotateX = x;
    }
    /**
     * 获取特效X轴旋转
     */
    get effectRotateX() {
        return this.data.rotateX;
    }
    /**
     * 设置特效Y轴旋转
     */
    set effectRotateY(y) {
        EXEffectMatRotateY(this.handle, y);
        this.data.rotateY = y;
    }
    /**
     * 获取特效Y轴旋转
     */
    get effectRotateY() {
        return this.data.rotateY;
    }
    /**
     * 移动特效到XY
     */
    setEffectXY(x, y) {
        EXSetEffectXY(this.handle, x, y);
        this.data.x = x;
        this.data.y = y;
    }
    /**
     * 获取特效XY轴
     */
    getEffectXY() {
        let xy = { x: this.data.x, y: this.data.y };
        if (!xy.x) {
            xy.x = EXGetEffectX(this.handle);
        }
        if (!xy.y) {
            xy.y = EXGetEffectY(this.handle);
        }
        return xy;
    }
    /**
     * 设置特效绑定handle
     */
    setBindEffect(han, node) {
        BindEffect(han, node, this.handle);
        this.data.binding = han;
    }
    /**
     * 获取特效绑定的handle
     */
    getBindEffect() {
        return this.data.binding;
    }
    /**
     * 解除特效绑定
     */
    unBindEffect() {
        UnBindEffect(this.handle);
        this.data.binding = null;
    }
    /**
     * 设置特效播放动画
     */
    setEffectAnimation(aon) {
        EXSetEffectAnimation(this.handle, aon);
    }
    /**
     * 特效重置（清空特效旋转与缩放）
     */
    reset() {
        EXEffectMatReset(this.handle);
        this.data.size = 1;
        this.data.rotateX = 0;
        this.data.rotateY = 0;
        this.data.rotateZ = 0;
    }
    /**
     * 摧毁特效
     */
    destroy() {
        DestroyEffect(this.handle);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
