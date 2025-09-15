/** @noSelfInFile **/
import { Handle } from "./handle";
import { Point } from "./point";
export class Camera {
    constructor() {
    }
    /**
     * 显示/隐藏 滤镜
     * @param flag
     */
    static set visible(flag) {
        DisplayCineFilter(flag);
    }
    /**
     * 显示/隐藏 滤镜
     * @param flag
     */
    static get visible() {
        return IsCineFilterDisplayed();
    }
    /**
     * 获取相机边界最小X
     */
    static get boundMinX() {
        return GetCameraBoundMinX();
    }
    /**
     * 获取相机边界最小y
     */
    static get boundMinY() {
        return GetCameraBoundMinY();
    }
    /**
     * 获取相机边界最大x
     */
    static get boundMaxX() {
        return GetCameraBoundMaxX();
    }
    /**
     * 获取相机边界最大y
     */
    static get boundMaxY() {
        return GetCameraBoundMaxY();
    }
    /**
     * 当前摄象机的目标的 X 坐标
     */
    static get targetX() {
        return GetCameraTargetPositionX();
    }
    /**
     * 当前摄象机的目标的 Y 坐标
     */
    static get targetY() {
        return GetCameraTargetPositionY();
    }
    /**
     * 当前摄象机的目标的 Z 坐标
     */
    static get targetZ() {
        return GetCameraTargetPositionZ();
    }
    /**
     * 当前摄象机的位置的 X 坐标
     */
    static get eyeX() {
        return GetCameraEyePositionX();
    }
    /**
     * 当前摄象机的位置的 Y 坐标
     */
    static get eyeY() {
        return GetCameraEyePositionY();
    }
    /**
     * 当前摄象机的位置的 Z 坐标
     */
    static get eyeZ() {
        return GetCameraEyePositionZ();
    }
    /**
     * 当前照相机的位置
     */
    static get eyePoint() {
        return GetCameraEyePositionLoc();
    }
    /**
     * 当前摄象机的目标
     */
    static get targetPoint() {
        return Point.fromHandle(GetCameraTargetPositionLoc());
    }
    /**
     * 设置镜头属性(所有玩家)(限时) [R]
     */
    static adjustField(whichField, offset, duration) {
        AdjustCameraField(whichField, offset, duration);
    }
    /**
     * EndCinematicScene
     */
    static endCinematicScene() {
        EndCinematicScene();
    }
    /**
     * 强制电影字幕
     */
    static forceCinematicSubtitles(flag) {
        ForceCinematicSubtitles(flag);
    }
    /**
     * 获取镜头边距
     */
    static getMargin(whichMargin) {
        return GetCameraMargin(whichMargin);
    }
    /**
     * 平移镜头
     */
    static pan(x, y, zOffsetDest) {
        if (!zOffsetDest) {
            PanCameraTo(x, y);
        }
        else {
            PanCameraToWithZ(x, y, zOffsetDest);
        }
    }
    /**
     * 平移镜头(所有玩家)(限时) [R]
     */
    static panTimed(x, y, duration, zOffsetDest) {
        if (!zOffsetDest) {
            PanCameraToTimed(x, y, duration);
        }
        else {
            PanCameraToTimedWithZ(x, y, zOffsetDest, duration);
        }
    }
    /**
     * 重置游戏镜头(所有玩家) [R]
     */
    static reset(duration) {
        ResetToGameCamera(duration);
    }
    /**
     * 设置可用镜头区域(所有玩家) [R]
     */
    static setBounds(x1, y1, x2, y2, x3, y3, x4, y4) {
        SetCameraBounds(x1, y1, x2, y2, x3, y3, x4, y4);
    }
    /**
     * 锁定镜头到单位(固定镜头源)(所有玩家) [R]
     */
    static setCameraOrientController(whichUnit, xOffset, yOffset) {
        SetCameraOrientController(whichUnit, xOffset, yOffset);
    }
    /**
     * 设置电影过滤器混合模式
     * @param whichMode
     */
    static setCineFilterBlendMode(whichMode) {
        SetCineFilterBlendMode(whichMode);
    }
    /**
     * 设置电影过滤器持续时间
     * @param duration
     */
    static setCineFilterDuration(duration) {
        SetCineFilterDuration(duration);
    }
    /**
     * 设置电影过滤器结束颜色
     * @param red
     * @param green
     * @param blue
     * @param alpha
     */
    static setCineFilterEndColor(red, green, blue, alpha) {
        SetCineFilterEndColor(red, green, blue, alpha);
    }
    /**
     * 设置电影过滤器结束UV
     * @param minU
     * @param minV
     * @param maxU
     * @param maxV
     */
    static setCineFilterEndUV(minU, minV, maxU, maxV) {
        SetCineFilterEndUV(minU, minV, maxU, maxV);
    }
    /**
     * 设置电影过滤器开始颜色
     * @param red
     * @param green
     * @param blue
     * @param alpha
     */
    static setCineFilterStartColor(red, green, blue, alpha) {
        SetCineFilterStartColor(red, green, blue, alpha);
    }
    /**
     * 设置电影过滤器开始UV
     * @param minU
     * @param minV
     * @param maxU
     * @param maxV
     */
    static setCineFilterStartUV(minU, minV, maxU, maxV) {
        SetCineFilterStartUV(minU, minV, maxU, maxV);
    }
    /**
     * 设置电影过滤器纹理映射标志
     * @param whichFlags
     */
    static setCineFilterTexMapFlags(whichFlags) {
        SetCineFilterTexMapFlags(whichFlags);
    }
    /**
     * 设置电影过滤器纹理
     * @param fileName
     */
    static setCineFilterTexture(fileName) {
        SetCineFilterTexture(fileName);
    }
    // public static setCinematicAudio(cinematicAudio: boolean) {
    //   SetCinematicAudio(cinematicAudio);
    // }
    /**
     * 播放电影镜头(所有玩家) [R]
     */
    static setCinematicCamera(cameraModelFile) {
        SetCinematicCamera(cameraModelFile);
    }
    /**
     * 设置电影场景
     * @param portraitUnitId
     * @param color
     * @param speakerTitle
     * @param text
     * @param sceneDuration
     * @param voiceoverDuration
     * @constructor
     */
    static SetCinematicScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration) {
        SetCinematicScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration);
    }
    // public static setDepthOfFieldScale(scale: number) {
    //   CameraSetDepthOfFieldScale(scale);
    // }
    /**
     * 设置镜头属性(所有玩家)(限时) [R]
     */
    static setField(whichField, value, duration) {
        SetCameraField(whichField, value, duration);
    }
    // public static setFocalDistance(distance: number) {
    //   CameraSetFocalDistance(distance);
    // }
    /**
     * Camera API
     */
    static setPos(x, y) {
        SetCameraPosition(x, y);
    }
    /**
     * 指定点旋转镜头(所有玩家)(弧度)(限时) [R]
     */
    static setRotateMode(x, y, radiansToSweep, duration) {
        SetCameraRotateMode(x, y, radiansToSweep, duration);
    }
    /**
     * 相机设置平滑因子
     * @param factor
     */
    static setSmoothingFactor(factor) {
        CameraSetSmoothingFactor(factor);
    }
    /**
     * 摇晃镜头源(所有玩家) [R]
     */
    static setSourceNoise(mag, velocity, vertOnly = false) {
        CameraSetSourceNoiseEx(mag, velocity, vertOnly);
    }
    /**
     * 锁定镜头到单位(所有玩家) [R]
     */
    static setTargetController(whichUnit, xOffset, yOffset, inheritOrientation) {
        SetCameraTargetController(whichUnit, xOffset, yOffset, inheritOrientation);
    }
    /**
     * 摇晃镜头目标(所有玩家) [R]
     */
    static setTargetNoise(mag, velocity, vertOnly = false) {
        CameraSetTargetNoiseEx(mag, velocity, vertOnly);
    }
    /**
     * 停止播放镜头(所有玩家) [R]
     */
    static stop() {
        StopCamera();
    }
}
export class CameraSetup extends Handle {
    constructor() {
        super(Handle.initFromHandle() ? undefined : CreateCameraSetup());
    }
    /**
     * 摄象机的目标
     */
    get destPoint() {
        return CameraSetupGetDestPositionLoc(this.handle);
    }
    /**
     * 摄象机的目标x
     */
    get destX() {
        return CameraSetupGetDestPositionX(this.handle);
    }
    /**
     * 摄象机的目标x
     */
    set destX(x) {
        CameraSetupSetDestPosition(this.handle, x, this.destY, 0);
    }
    /**
     * 摄象机的目标y
     */
    get destY() {
        return CameraSetupGetDestPositionY(this.handle);
    }
    /**
     * 摄象机的目标y
     */
    set destY(y) {
        CameraSetupSetDestPosition(this.handle, this.destX, y, 0);
    }
    // public set label(label: string) {
    //   BlzCameraSetupSetLabel(this.handle, label);
    // }
    //
    // public get label() {
    //   return BlzCameraSetupGetLabel(this.handle);
    // }
    /**
     * 摄象机的目标
     */
    apply(doPan, panTimed) {
        CameraSetupApply(this.handle, doPan, panTimed);
    }
    /**
     * 应用镜头(指定玩家)(限时)
     * @param doPan
     * @param forceDuration
     */
    applyForceDuration(doPan, forceDuration) {
        CameraSetupApplyForceDuration(this.handle, doPan, forceDuration);
    }
    // public applyForceDurationSmooth(doPan: boolean, forcedDuration: number, easeInDuration: number, easeOutDuration: number, smoothFactor: number) {
    //   BlzCameraSetupApplyForceDurationSmooth(this.handle, doPan, forcedDuration, easeInDuration, easeOutDuration, smoothFactor);
    //
    // }
    /**
     * CameraSetupApplyForceDurationWithZ
     * @param doPan
     * @param forceDuration
     */
    applyForceDurationZ(zDestOffset, forceDuration) {
        CameraSetupApplyForceDurationWithZ(this.handle, zDestOffset, forceDuration);
    }
    /**
     * 相机设置应用于Z
     * @param doPan
     * @param forceDuration
     */
    applyZ(zDestOffset) {
        CameraSetupApplyWithZ(this.handle, zDestOffset);
    }
    /**
     * 镜头属性(指定镜头) [R]
     */
    getField(whichField) {
        return CameraSetupGetField(this.handle, whichField);
    }
    /**
     * 镜头属性(指定镜头) [R]
     */
    setDestPos(x, y, duration) {
        CameraSetupSetDestPosition(this.handle, x, y, duration);
    }
    /**
     * 摄像头设置属性
     */
    setField(whichField, value, duration) {
        CameraSetupSetField(this.handle, whichField, value, duration);
    }
    /**
     * 从handle获取封装类
     */
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
