import STimer from "@/STimer";
import DamageType from "@/DamageType";
import WeaponType from "@/WeaponType";
import GameUtil from "@/GameUtil";
import DamageUtil from "@/DamageUtil";
import MathUtil from "@/MathUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
/**
 * 投射物
 */
export default class Projectile {
    /** 来源单位 或伤害来源单位 */
    source;
    /** 目标单位 */
    target;
    /** 伤害名字 用于统计伤害 */
    damageName;
    /** 投射物特效模型路径 */
    projectileModelPath;
    /** 投射物特效模型 */
    projectileModel;
    /** 投射物特效模型大小缩放 */
    projectileModelScale = 1;
    /** 投射物特效模型 距离地面的高度 */
    projectileHeight = 50;
    /** 颜色rgb max=255 */
    colorR = 255;
    colorG = 255;
    colorB = 255;
    /** 透明度 max=255 */
    alpha = 255;
    speed = 1000;
    /** 已经飞行的时间 */
    _sl_lifeTime = 0;
    /** 已经飞行的距离 */
    _sl_distance = 0;
    /** 最大飞行的时间 0=无限时间*/
    lifeTimeMax = 0;
    /** 最大飞行距离 0=无限远*/
    distanceMax = 0;
    /** 当前运动器所在位置 运行后这些值会动态变化 初始可以手动指定这个值 达到从指定xy开始发射*/
    x;
    y;
    sTimer = new STimer();
    /** 更新间隔 */
    updateInterval = 0.03;
    /** 造成伤害 **/
    damage = 0;
    damageTypeId = DamageType.s_法术;
    weaponTypeID = WeaponType.T0_WHOKNOWS;
    attackType = ATTACK_TYPE_CHAOS;
    /** 当投射物击中目标 */
    onHitTarget;
    /** 是否已完成(已结束或销毁了) */
    done = false;
    constructor(source, target, damage = 0, projectileModelPath = "Abilities\\Weapons\\RocketMissile\\RocketMissile.mdx", onHitTarget) {
        this.source = source;
        this.target = target;
        this.projectileModelPath = projectileModelPath;
        this.damage = damage;
        this.onHitTarget = onHitTarget;
        //检查参数 以避免不必要的bug排查
        if (!IsHandle(this.source)) {
            log.errorWithTraceBack("投射物发射源单位不能为空!");
            return;
        }
        if (!IsHandle(this.target)) {
            log.errorWithTraceBack("投射物目标单位不能为空!");
            return;
        }
        //创建模型
        this.x = GetUnitX(this.source);
        this.y = GetUnitY(this.source);
    }
    init() {
        if (this.projectileModel == null && this.projectileModelPath != null) {
            this.projectileModel = AddSpecialEffect(settings.isEffectDisplay == false ? "" : this.projectileModelPath, GetUnitX(this.source), GetUnitY(this.source));
        }
        EXSetEffectSize(this.projectileModel, this.projectileModelScale);
        if (EXSetEffectColor) {
            EXSetEffectColor(this.projectileModel, DzGetColor(this.colorR, this.colorG, this.colorB, this.alpha));
        }
        else if (DzSetEffectVertexColor) {
            DzSetEffectVertexColor(this.projectileModel, DzGetColor(this.colorR, this.colorG, this.colorB, this.alpha));
        }
    }
    stop() {
        this.done = true;
    }
    start() {
        //
        this.init();
        let angleBetweenCoords = MathUtil.angleBetweenCoords(this.x, this.y, GetUnitX(this.target), GetUnitY(this.target));
        EXEffectMatRotateZ(this.projectileModel, angleBetweenCoords);
        this.sTimer.start(this.updateInterval, () => {
            if (this.done) {
                this.destroy();
                return;
            }
            this._sl_lifeTime += this.updateInterval;
            if (this.lifeTimeMax > 0 && this._sl_lifeTime > this.lifeTimeMax) {
                this.destroy();
            }
            if (this.distanceMax > 0 && this._sl_distance > this.distanceMax) {
                this.destroy();
            }
            this.update();
        }, true);
    }
    destroy() {
        this.done = true;
        this.sTimer?.destroy();
        DestroyEffect(this.projectileModel);
    }
    update() {
        let tx = GetUnitX(this.target);
        let ty = GetUnitY(this.target);
        let sx = this.x;
        let sy = this.y;
        let dtsx = tx - sx;
        let dtsy = ty - sy;
        let c = Math.sqrt((dtsx * dtsx) + (dtsy * dtsy));
        let d1x = dtsx / c;
        let d1y = dtsy / c;
        let travelDistance = Math.min(c, this.speed * this.updateInterval);
        let doneTemp = c <= travelDistance;
        if (doneTemp) {
            travelDistance = c;
        }
        this._sl_distance += travelDistance;
        let dx = d1x * travelDistance;
        let dy = d1y * travelDistance;
        this.x = this.x + dx;
        this.y = this.y + dy;
        //更新投射物特效显示
        EXSetEffectXY(this.projectileModel, this.x, this.y);
        EXSetEffectZ(this.projectileModel, GameUtil.getTerrainHeight(this.x, this.y) + this.projectileHeight);
        if (doneTemp && !this.done) {
            this.onHitTarget?.(this);
            //判断一下伤害目标是否活着 否则就不造成伤害了
            if (this.damage > 0 && UnitAlive(this.target)) {
                if (this.damageName) {
                    DamageRecordUtil.damage(this.damageName, this.source, this.target, this.damage, this.damageTypeId, this.weaponTypeID, true, false, this.attackType);
                }
                else {
                    DamageUtil.damage(this.source, this.target, this.damage, this.damageTypeId, this.weaponTypeID, true, false, this.attackType);
                }
            }
            this.done = true;
        }
    }
}
