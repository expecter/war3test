import Projectile from "@/Projectile";
import DamageType from "@/DamageType";
import WeaponType from "@/WeaponType";
import SelectUtil from "@/SelectUtil";
import UnitStateUtil from "@/UnitStateUtil";
/**
 * 弹跳弹道投射物(类似闪电链)
 */
export default class BounceMissileController {
    unit;
    range = 600;
    /** 投射物 速度 */
    speed = 1000;
    loopCount = 5;
    /** 已经击中过的单位 */
    hitUnitList = [];
    //伤害公式不为空的时候会自动造成公式算法的伤害
    damageStateFormula;
    damageName;
    projectileModelPath;
    /** 投射物特效模型大小缩放 */
    projectileModelScale = 1;
    /** 颜色rgb max=255 */
    colorR = 255;
    colorG = 255;
    colorB = 255;
    /** 透明度 max=255 */
    alpha = 255;
    damageTypeId = DamageType.T4_NORMAL;
    weaponTypeID = WeaponType.T0_WHOKNOWS;
    attackType = ATTACK_TYPE_CHAOS;
    /** 当更新时 */
    onUpdate;
    /** 当准备发射追踪投射物时 返回false取消发射 返回true继续*/
    onBeforeLaunchMissile;
    /** 当发射追踪投射物时 可在这里修改具体的 */
    onLaunchMissile;
    onHitTarget;
    //
    _isDestroy = false;
    constructor(unit, projectileModelPath = "Abilities\\Weapons\\SentinelMissile\\SentinelMissile.mdx", damageStateFormula, onHitTarget) {
        this.unit = unit;
        this.projectileModelPath = projectileModelPath;
        this.damageStateFormula = damageStateFormula;
        this.onHitTarget = onHitTarget;
    }
    launch() {
        let x = GetUnitX(this.unit);
        let y = GetUnitY(this.unit);
        let lastHitUnit = null;
        if (this.hitUnitList.length > 0) {
            lastHitUnit = this.hitUnitList[this.hitUnitList.length - 1];
            x = GetUnitX(lastHitUnit);
            y = GetUnitY(lastHitUnit);
        }
        let enemyUnitList = SelectUtil.getEnemyUnitsInRangeOrderByDistance(this.unit, this.range, x, y);
        if (enemyUnitList == null || enemyUnitList.length == 0) {
            return;
        }
        //
        if (enemyUnitList.length == 1 && enemyUnitList[0] == lastHitUnit) {
            //不能自己弹射自己 必须要有其他单位才行
            return;
        }
        //按距离 由近到远
        let targetUnit = null;
        for (let enemyUnit of enemyUnitList) {
            if (enemyUnit != lastHitUnit && !this.hitUnitList.includes(enemyUnit)) {
                //选择一个最近的新单位弹射
                targetUnit = enemyUnit;
                break;
            }
        }
        if (targetUnit == null) {
            //选择一个最近的已经弹射过的单位弹射
            for (let enemyUnit of enemyUnitList) {
                if (enemyUnit != lastHitUnit) {
                    //选择一个最近的新单位弹射
                    targetUnit = enemyUnit;
                    break;
                }
            }
        }
        if (targetUnit == null) {
            //正常不会走到这里 但是多判断一下总没有坏处 保守稳定大于0.1纳秒性能！
            return;
        }
        this.hitUnitList.push(targetUnit);
        //准备发射导弹
        if (this.onBeforeLaunchMissile) {
            let b = this.onBeforeLaunchMissile(this, targetUnit);
            //检查是否在监听里销毁了此类
            if (this._isDestroy) {
                return;
            }
            if (b == false) {
                return;
            }
        }
        //发射导弹
        let damage = 0;
        if (this.damageStateFormula) {
            damage = UnitStateUtil.calculateStateFormula(this.damageStateFormula, this.unit, targetUnit);
        }
        let projectile = new Projectile(this.unit, targetUnit, damage, this.projectileModelPath, this.onHitTarget);
        projectile.damageName = this.damageName;
        projectile.speed = this.speed;
        projectile.projectileModelScale = this.projectileModelScale;
        projectile.colorR = this.colorR;
        projectile.colorG = this.colorG;
        projectile.colorB = this.colorB;
        projectile.alpha = this.alpha;
        projectile.damageTypeId = this.damageTypeId;
        projectile.weaponTypeID = this.weaponTypeID;
        projectile.attackType = this.attackType;
        //手动设置发射点
        if (lastHitUnit != null) {
            projectile.x = GetUnitX(lastHitUnit);
            projectile.y = GetUnitY(lastHitUnit);
        }
        if (this.hitUnitList.length < this.loopCount) {
            //递归自己
            projectile.onHitTarget = p => {
                this.launch();
            };
        }
        //
        if (this.onLaunchMissile) {
            this.onLaunchMissile(this, projectile);
            //检查是否在监听里销毁了此类
            if (this._isDestroy) {
                return;
            }
        }
        projectile.start();
        return projectile;
    }
    destroy() {
        this._isDestroy = true;
    }
}
