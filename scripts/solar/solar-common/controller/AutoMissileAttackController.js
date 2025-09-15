import Projectile from "@/Projectile";
import STimer from "@/STimer";
import DamageType from "@/DamageType";
import WeaponType from "@/WeaponType";
import AttributeUtil from "@/AttributeUtil";
import SelectUtil from "@/SelectUtil";
import MathUtil from "@/MathUtil";
import UnitStateUtil from "@/UnitStateUtil";
/**
 * 自动弹道攻击 (比如凤凰火焰)
 */
export default class AutoMissileAttackController {
    static defaultRangeMaxLimit = 3000;
    static minCd = 0.05;
    unit;
    rangeMaxLimit;
    range = 1000;
    /** 扩展的范围 实际范围=range+extRange 方便组装范围控制逻辑 如A杖类型的物品 提高部分技能的范围 */
    extRange = 0;
    coolDown = 1;
    /** 投射物 速度 */
    speed = 1000;
    /** 最终弹道目标数量上限  targetCount+属性弹道附加 的效果会受到此值限制*/
    realTargetCountMaxLimit;
    targetCount = 1;
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
    damageTypeId = DamageType.s_法术;
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
    sTimer = new STimer();
    _isDestroy = false;
    //上次发射时间
    _lastLaunchTime = 0;
    constructor(unit, projectileModelPath = "Abilities\\Weapons\\RocketMissile\\RocketMissile.mdx", damageStateFormula, onHitTarget) {
        this.unit = unit;
        this.projectileModelPath = projectileModelPath;
        this.damageStateFormula = damageStateFormula;
        this.onHitTarget = onHitTarget;
    }
    start(minCd = AutoMissileAttackController.minCd) {
        this.sTimer.start(AutoMissileAttackController.minCd, () => {
            if (this._isDestroy) {
                this.sTimer.destroy();
                return;
            }
            //
            if (!UnitStateUtil.isAlive(this.unit)) {
                return;
            }
            //
            this.onUpdate?.(this);
            //
            let autoMissileAttackSpeed = AttributeUtil.getUnitAttribute(this.unit, false)?.autoMissileAttackSpeed || 0;
            let cd = this.coolDown / (autoMissileAttackSpeed + 1);
            //判断是否在cd中
            if (_g_time - this._lastLaunchTime < (cd * 1000)) {
                return;
            }
            //准备发射
            this.doLaunchMissile();
            this._lastLaunchTime = _g_time;
        }, true);
    }
    getRealRange() {
        let range = this.range + this.extRange;
        let unitAttribute = AttributeUtil.getUnitAttribute(this.unit, false);
        if (unitAttribute) {
            if (unitAttribute.autoMissileAttackRange) {
                range += unitAttribute.autoMissileAttackRange;
            }
            if (unitAttribute.autoMissileAttackRange_p) {
                range *= (1 + unitAttribute.autoMissileAttackRange_p);
            }
        }
        range = math.min(range, this.rangeMaxLimit || AutoMissileAttackController.defaultRangeMaxLimit);
        return range;
    }
    getRealTargetCount() {
        let targetCount = this.targetCount;
        let unitAttribute = AttributeUtil.getUnitAttribute(this.unit, false);
        if (unitAttribute) {
            if (unitAttribute.autoMissileAttackTargetCount) {
                targetCount += unitAttribute.autoMissileAttackTargetCount;
            }
        }
        if (this.realTargetCountMaxLimit && targetCount > this.realTargetCountMaxLimit) {
            return this.realTargetCountMaxLimit;
        }
        return targetCount;
    }
    doLaunchMissile() {
        let range = this.getRealRange();
        let enemyUnits = SelectUtil.getEnemyUnitsInRange(this.unit, range);
        if (enemyUnits == null || enemyUnits.length == 0) {
            return;
        }
        let x = GetUnitX(this.unit);
        let y = GetUnitY(this.unit);
        //按距离 由近到远
        enemyUnits.sort((a, b) => {
            let aD = MathUtil.distanceBetweenPoints(x, y, GetUnitX(a), GetUnitY(a));
            let bD = MathUtil.distanceBetweenPoints(x, y, GetUnitX(b), GetUnitY(b));
            return aD - bD;
        });
        let realTargetCount = this.getRealTargetCount();
        for (let i = 0; i < realTargetCount && i < enemyUnits.length; i++) {
            let targetUnit = enemyUnits[i];
            //准备发射导弹
            if (this.onBeforeLaunchMissile) {
                let b = this.onBeforeLaunchMissile(this, targetUnit);
                //检查是否在监听里销毁了此类
                if (this._isDestroy) {
                    return;
                }
                if (b == false) {
                    continue;
                }
            }
            //发射导弹
            let damage = 0;
            if (this.damageStateFormula) {
                damage = UnitStateUtil.calculateStateFormula(this.damageStateFormula, this.unit, targetUnit);
            }
            let projectile = new Projectile(this.unit, targetUnit, damage, this.projectileModelPath, this.onHitTarget);
            projectile.speed = this.speed;
            projectile.damageName = this.damageName;
            projectile.projectileModelScale = this.projectileModelScale;
            projectile.colorR = this.colorR;
            projectile.colorG = this.colorG;
            projectile.colorB = this.colorB;
            projectile.alpha = this.alpha;
            //
            if (this.onLaunchMissile) {
                this.onLaunchMissile(this, projectile);
                //检查是否在监听里销毁了此类
                if (this._isDestroy) {
                    return;
                }
            }
            projectile.start();
        }
    }
    destroy() {
        this._isDestroy = true;
        this.sTimer.destroy();
    }
}
