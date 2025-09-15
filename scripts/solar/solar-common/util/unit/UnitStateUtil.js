import BaseUtil from "@/BaseUtil";
import DataBase from "@/DataBase";
import MoveType from "@/MoveType";
import AbilityUtil from "@/AbilityUtil";
import ObjectDataUtil from "@/ObjectDataUtil";
import HeroUtil from "@/HeroUtil";
/**
 * 单位状态值工具
 */
export default class UnitStateUtil {
    /**
     * 最大生命值
     * @param unitHandle
     */
    static getMaxLife(unitHandle) {
        return GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE);
    }
    /**
     * 设置最大生命值
     * @param unitHandle
     * @param newVal
     */
    static setMaxLife(unitHandle, newVal) {
        SetUnitState(unitHandle, UNIT_STATE_MAX_LIFE, newVal);
    }
    /**
     * 添加最大生命值
     * @param unitHandle
     * @param addVal
     */
    static addMaxLife(unitHandle, addVal) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MAX_LIFE, addVal);
    }
    /**
     * 增加最大生命值与当前生命值
     * @param unitHandle
     */
    static addMaxLifeAndLife(unitHandle, addVal) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MAX_LIFE, addVal);
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_LIFE, addVal);
    }
    /**
     * 是否是活着的单位
     * @param unitHandle
     */
    static isAlive(unitHandle) {
        return UnitAlive(unitHandle);
    }
    /**
     * 生命值
     * @param unitHandle
     */
    static getLife(unitHandle) {
        return GetUnitState(unitHandle, UNIT_STATE_LIFE);
    }
    /**
     * 设置当前生命值
     * @param unitHandle
     * @param newVal
     */
    static setLife(unitHandle, newVal) {
        SetUnitState(unitHandle, UNIT_STATE_LIFE, newVal);
    }
    /**
     * 添加当前生命值 回血
     * @param unitHandle
     * @param addVal
     */
    static addLife(unitHandle, addVal) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_LIFE, addVal);
    }
    /**
     * 增加单位当前生命值 （按最大生命的比例）
     * p proportion 比例
     * @param unitHandle
     * @param proportion
     */
    static addUnitLifeByMaxLifeP(unitHandle, proportion) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_LIFE, GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE) * proportion);
    }
    /**
     * 最大魔法值
     * @param unitHandle
     */
    static getMaxMana(unitHandle) {
        return GetUnitState(unitHandle, UNIT_STATE_MAX_MANA);
    }
    /**
     * 设置最大魔法值
     * @param unitHandle
     * @param newVal
     */
    static setMaxMana(unitHandle, newVal) {
        SetUnitState(unitHandle, UNIT_STATE_MAX_MANA, newVal);
    }
    /**
     * 添加最大魔法值
     * @param unitHandle
     * @param addVal
     */
    static addMaxMana(unitHandle, addVal) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MAX_MANA, addVal);
    }
    /**
     * 增加最大魔法值与当前魔法值
     * @param unitHandle
     */
    static addMaxManaAndMana(unitHandle, addVal) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MAX_MANA, addVal);
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MANA, addVal);
    }
    /**
     * 魔法值
     * @param unitHandle
     */
    static getMana(unitHandle) {
        return GetUnitState(unitHandle, UNIT_STATE_MANA);
    }
    /**
     * 设置当前魔法值
     * @param unitHandle
     * @param newVal
     */
    static setMana(unitHandle, newVal) {
        SetUnitState(unitHandle, UNIT_STATE_MANA, newVal);
    }
    /**
     * 添加当前魔法值
     * @param unitHandle
     * @param addVal
     */
    static addMana(unitHandle, addVal) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MANA, addVal);
    }
    /**
     * 增加单位当前魔法值 （按最大魔法值的比例）
     * p proportion 比例
     * @param unitHandle
     * @param proportion
     */
    static addUnitManaByMaxManaP(unitHandle, proportion) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MANA, GetUnitState(unitHandle, UNIT_STATE_MAX_MANA) * proportion);
    }
    /**
     *  获取最大伤害
     */
    static getDamageMax(unitHandle) {
        return GetUnitState(unitHandle, UnitStateDamageMax);
    }
    /**
     *   基础伤害 （白字攻击+英雄主属性奖励的绿字攻击值）
     */
    static getDamageBase(unitHandle) {
        return GetUnitState(unitHandle, UnitStateDamageBase);
    }
    /**
     *  白字攻击
     */
    static setDamageBase(unitHandle, newVal) {
        if (!isBigAttributeMode) {
            newVal = Math.min(newVal, 21_0000_0000);
        }
        SetUnitState(unitHandle, UnitStateDamageBase, newVal);
    }
    /**
     * 添加白字攻击
     * @param unitHandle
     * @param addVal
     */
    static addDamageBase(unitHandle, addVal) {
        let newVal = GetUnitState(unitHandle, UnitStateDamageBase) + addVal;
        if (!isBigAttributeMode) {
            newVal = Math.min(newVal, 21_0000_0000);
        }
        SetUnitState(unitHandle, UnitStateDamageBase, newVal);
    }
    /**
     *  获取攻击范围
     */
    static getDamageRange(unitHandle) {
        return GetUnitState(unitHandle, UnitStateDamageRange);
    }
    /**
     * 设置攻击范围
     * @param unitHandle
     * @param newVal
     * @param syncAcquire 同步射程到主动攻击范围
     */
    static setDamageRange(unitHandle, newVal, syncAcquire = false) {
        SetUnitState(unitHandle, UnitStateDamageRange, newVal);
        if (syncAcquire) {
            SetUnitAcquireRange(unitHandle, newVal);
        }
        else if (GetUnitAcquireRange(unitHandle) < newVal) {
            //默认主动攻击范围必须大于攻击范围 才能保证攻击范围有效果
            SetUnitAcquireRange(unitHandle, newVal);
        }
    }
    /**
     * 添加攻击范围
     * @param unitHandle
     * @param addVal
     */
    static addDamageRange(unitHandle, addVal) {
        UnitStateUtil.setDamageRange(unitHandle, GetUnitState(unitHandle, UnitStateDamageRange) + addVal);
    }
    /**
     *  获取攻击间隔
     */
    static getDamageCool(unitHandle) {
        return GetUnitState(unitHandle, UnitStateDamageCool);
    }
    /**
     * 设置攻击间隔
     * @param unitHandle
     * @param newVal
     */
    static setDamageCool(unitHandle, newVal) {
        if (newVal < 0.001) {
            newVal = 0.001;
        }
        SetUnitState(unitHandle, UnitStateDamageCool, newVal);
    }
    /**
     *  增加攻击间隔(传入负数可减少攻击间隔 以提高攻击频率)
     */
    static addDamageCool(unitHandle, addVal) {
        let newVal = GetUnitState(unitHandle, UnitStateDamageCool) + addVal;
        if (newVal < 0.001) {
            newVal = 0.001;
        }
        SetUnitState(unitHandle, UnitStateDamageCool, newVal);
    }
    /**
     *  获取攻击速度  默认为1
     *  (ps: +1 = +100%攻击速度)
     */
    static getAttackSpeed(unitHandle) {
        return GetUnitState(unitHandle, UnitStateAttackSpeed);
    }
    /**
     * 设置攻击速度
     * @param unitHandle
     * @param newVal
     */
    static setAttackSpeed(unitHandle, newVal) {
        SetUnitState(unitHandle, UnitStateAttackSpeed, newVal);
    }
    /**
     * 设置远程攻击目标数量(多重箭/弹幕攻击)
     * @param unitHandle
     * @param targetCount
     * @param range 多重范围
     * @param missileart
     */
    static setAttackTargetCount(unitHandle, targetCount, range = UnitStateUtil.getDamageRange(unitHandle) + 200, missileart) {
        let templateId = _sl_funs.borrowTemplate("攻击目标数量辅助");
        if (templateId == null) {
            log.errorWithTraceBack("请使用太阳RPG编辑器添加基础物编!");
            return;
        }
        _sl_funs.returnTemplate("攻击目标数量辅助", templateId);
        let tempAbilityId = FourCC(templateId);
        //
        if (GetUnitAbilityLevel(unitHandle, tempAbilityId) == 0) {
            UnitAddAbility(unitHandle, tempAbilityId);
        }
        //
        if (missileart == null) {
            missileart = ObjectDataUtil.getUnitMissileart(id2string(GetUnitTypeId(unitHandle)));
            if (missileart != null && missileart.length > 3) {
                EXSetAbilityDataString(EXGetUnitAbility(unitHandle, tempAbilityId), 1, ABILITY_DATA_MISSILE_ART, missileart);
            }
            else {
                missileart = "Abilities\\Weapons\\Arrow\\ArrowMissile.mdx";
                // print_r(_g_objs.unit[id2string(GetUnitTypeId(unitHandle))])
            }
        }
        EXSetAbilityDataString(EXGetUnitAbility(unitHandle, tempAbilityId), 1, ABILITY_DATA_MISSILE_ART, missileart);
        AbilityUtil.setUnitAbilityArea(unitHandle, tempAbilityId, range, false);
        //
        AbilityUtil.setUnitAbilityDataC(unitHandle, tempAbilityId, targetCount, true);
    }
    /**
     * 添加攻击速度 1= 100%
     * @param unitHandle
     * @param addVal
     */
    static addAttackSpeed(unitHandle, addVal) {
        UnitStateUtil.addUnitState(unitHandle, UnitStateAttackSpeed, addVal);
    }
    /**
     *  获取总护甲
     */
    static getArmor(unitHandle) {
        return GetUnitState(unitHandle, UnitStateArmor);
    }
    /**
     * 设置总护甲 （修改白字护甲为 总护甲-绿字护甲）
     * @param unitHandle
     * @param newVal
     */
    static setArmor(unitHandle, newVal) {
        if (!isBigAttributeMode) {
            newVal = Math.min(newVal, 21_0000_0000);
        }
        SetUnitState(unitHandle, UnitStateArmor, newVal);
    }
    /**
     * 添加白字护甲
     * @param unitHandle
     * @param addVal
     */
    static addArmor(unitHandle, addVal) {
        let newVal = GetUnitState(unitHandle, UnitStateArmor) + addVal;
        if (!isBigAttributeMode) {
            newVal = Math.min(newVal, 21_0000_0000);
        }
        SetUnitState(unitHandle, UnitStateArmor, newVal);
    }
    /**
     * 添加单位状态值
     * @param unitHandle
     * @param whichUnitState
     * @param addVal
     */
    static addUnitState(unitHandle, whichUnitState, addVal) {
        let newVal = GetUnitState(unitHandle, whichUnitState) + addVal;
        SetUnitState(unitHandle, whichUnitState, newVal);
        return newVal;
    }
    /**
     * 获取移动速度
     */
    static getMoveSpeed(unitHandle) {
        return GetUnitMoveSpeed(unitHandle);
    }
    /**
     * 设置移动速度
     * @param unitHandle
     * @param newSpeed
     */
    static setMoveSpeed(unitHandle, newSpeed) {
        SetUnitMoveSpeed(unitHandle, newSpeed);
    }
    /**
     * 添加移动速度
     * @param unitHandle
     * @param addSpeed
     */
    static addMoveSpeed(unitHandle, addSpeed) {
        let newVal = GetUnitMoveSpeed(unitHandle) + addSpeed;
        SetUnitMoveSpeed(unitHandle, newVal);
        return newVal;
    }
    /**
     * 设置移动类型
     * @param unitHandle
     * @param moveType
     */
    static setMoveType(unitHandle, moveType) {
        let moveTypeElement = MoveType[moveType];
        EXSetUnitMoveType(unitHandle, moveTypeElement);
        if (SetUnitMoveType == null) {
            return;
        }
        if (moveTypeElement == 0x00) {
            SetUnitMoveType(unitHandle, "none");
        }
        else if (moveTypeElement == 0x01) {
            SetUnitMoveType(unitHandle, "nomove");
        }
        else if (moveTypeElement == 0x02) {
            SetUnitMoveType(unitHandle, "foot");
        }
        else if (moveTypeElement == 0x04) {
            SetUnitMoveType(unitHandle, "fly");
        }
        else if (moveTypeElement == 0x40) {
            SetUnitMoveType(unitHandle, "float");
        }
        else if (moveTypeElement == 0x08) {
            SetUnitMoveType(unitHandle, "hover");
        }
        else if (moveTypeElement == 0x80) {
            SetUnitMoveType(unitHandle, "amph");
        }
        else if (moveTypeElement == 0x20) {
            SetUnitMoveType(unitHandle, "unbuild");
        }
    }
    /**
     * 能设置建筑的面向角度
     * @param unit
     * @param face
     */
    static setUnitFacing(unit, face) {
        let x = GetUnitX(unit);
        let y = GetUnitY(unit);
        BaseUtil.runLater(0.01, () => {
            SetUnitPosition(unit, x, y);
            EXSetUnitFacing(unit, face);
        }, 3, true);
    }
    /**
     * 获取单位当前生命占最大生命的比例
     * p proportion 比例
     * @param unitHandle
     */
    static getUnitLifeP(unitHandle) {
        return GetUnitState(unitHandle, UNIT_STATE_LIFE) / GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE);
    }
    /**
     * 设置单位当前生命占最大生命的比例
     * p proportion 比例
     * @param unitHandle
     * @param proportion
     */
    static setUnitLifeP(unitHandle, proportion) {
        return SetUnitState(unitHandle, UNIT_STATE_LIFE, GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE) * proportion);
    }
    /**
     * 获取单位当前生命占最大生命的比例
     * p proportion 比例
     * @param unitHandle
     */
    static getUnitManaP(unitHandle) {
        return GetUnitState(unitHandle, UNIT_STATE_MANA) / GetUnitState(unitHandle, UNIT_STATE_MAX_MANA);
    }
    /**
     * 设置单位当前生命占最大魔法的比例
     * p proportion 比例
     * @param unitHandle
     * @param proportion
     */
    static setUnitManaP(unitHandle, proportion) {
        return SetUnitState(unitHandle, UNIT_STATE_MANA, GetUnitState(unitHandle, UNIT_STATE_MAX_MANA) * proportion);
    }
    /**
     * 设置单位颜色
     * @param whichUnit
     * @param red
     * @param green
     * @param blue
     * @param alpha
     */
    static setUnitColor(whichUnit, red, green = red, blue = green, alpha = 255) {
        SetUnitVertexColor(whichUnit, red, green, blue, alpha);
    }
    /**
     * 是否无敌
     * */
    static isInvulnerable(unitHandle) {
        if (GetUnitAbilityLevel(unitHandle, "Avul") > 0) {
            return true;
        }
        return false;
    }
    /**
     * 设置无敌
     * */
    static setInvulnerable(unitHandle, isInvulnerable) {
        //用这个设置 游戏底层也是添加移除 Avul技能
        SetUnitInvulnerable(unitHandle, isInvulnerable);
    }
    /**
     * 给不是无敌的单位 添加指定持续时间的无敌效果
     * (比如防止给本就是无敌的单位 移除了无敌)
     * PS:推荐使用 CommonBuffUtil.addInvulnerableIfNot 会携带无敌buff显示剩余时间与特效效果 以获得更好的玩家体验
     * */
    static addInvulnerableIfNot(unitHandle, dur) {
        let unitSolarData = DataBase.getUnitSolarData(unitHandle, true);
        let invulnerable_endTime = unitSolarData.invulnerable_endTime;
        //单位是无敌的 且之前没有通过invulnerable_endTime的方式添加无敌
        if (GetUnitAbilityLevel(unitHandle, "Avul") > 0 && invulnerable_endTime == null) {
            return false;
        }
        let newInvulnerable_endTime = _g_time + (Math.floor(dur * 100) * 10);
        //优先使用更长时间的无敌
        if (invulnerable_endTime && invulnerable_endTime >= newInvulnerable_endTime) {
            return false;
        }
        unitSolarData.invulnerable_endTime = newInvulnerable_endTime;
        //用这个设置 游戏底层也是添加移除 Avul技能
        SetUnitInvulnerable(unitHandle, true);
        BaseUtil.runLater(dur, () => {
            //判断一下无敌时间再 解除 (通常只有最后设置的无敌能解除无敌)
            let solarDataTemp = DataBase.getUnitSolarData(unitHandle, false);
            if (solarDataTemp?.invulnerable_endTime == null || _g_time >= solarDataTemp.invulnerable_endTime) {
                SetUnitInvulnerable(unitHandle, false);
                if (solarDataTemp) {
                    solarDataTemp.invulnerable_endTime = null;
                }
            }
        });
    }
    /**
     * 设置单位生命周期 (默认水元素)
     * @param unitHandle
     * @param duration
     * @param buffid
     */
    static applyTimedLife(unitHandle, duration, buffid = 'BHwe') {
        UnitApplyTimedLife(unitHandle, buffid, duration);
    }
    /**
     * 命令巡逻到指定点
     */
    static orderPatrol(unitHandle, x, y) {
        IssuePointOrder(unitHandle, "patrol", x, y);
    }
    /**
     * 命令攻击到指定点
     */
    static orderAttack(unitHandle, x, y) {
        IssuePointOrder(unitHandle, "attack", x, y);
    }
    /**
     * 命令攻击到指定单位
     */
    static orderAttackTarget(unitHandle, target) {
        IssueTargetOrder(unitHandle, "attack", target);
    }
    /**
     * 命令移到到指定点
     */
    static orderMove(unitHandle, x, y) {
        IssuePointOrder(unitHandle, "move", x, y);
    }
    /**
     * 击晕指定单位
     */
    static stunUnit(unitHandle, dur, effectPath = "Abilities\\Spells\\Human\\Thunderclap\\ThunderclapTarget.mdx") {
        EXPauseUnit(unitHandle, true);
        let effect = AddSpecialEffectTarget(effectPath, unitHandle, "head");
        BaseUtil.runLater(dur, () => {
            EXPauseUnit(unitHandle, false);
            DestroyEffect(effect);
        });
    }
    /**
     * 启用可以设置飞行高度
     * @param unitHandle
     */
    static enableFlyHeight(unitHandle) {
        UnitAddAbility(unitHandle, FourCC('Amrf'));
        UnitRemoveAbility(unitHandle, FourCC('Amrf'));
    }
    /**
     * 计算单位属性值公式
     */
    static calculateStateFormula(formula, srcUnit, targetUnit) {
        if (formula == null) {
            return 0;
        }
        if (formula.chance != null && GetRandomReal(0, 1) > formula.chance) {
            return 0;
        }
        let value = formula.base || 0;
        if (srcUnit != null) {
            if (formula.attack) {
                value += GetUnitState(srcUnit, UnitStateDamageMax) * formula.attack;
            }
            if (formula.def) {
                value += GetUnitState(srcUnit, UnitStateArmor) * formula.def;
            }
            if (formula.fullPros) {
                value += (GetHeroStr(srcUnit, true) + GetHeroAgi(srcUnit, true) +
                    GetHeroInt(srcUnit, true)) * formula.fullPros;
            }
            if (formula.primaryPros) {
                value += HeroUtil.getHeroPrimaryValue(srcUnit, true) * formula.primaryPros;
            }
            if (formula.str) {
                value += GetHeroStr(srcUnit, true) * formula.str;
            }
            if (formula.agi) {
                value += GetHeroAgi(srcUnit, true) * formula.agi;
            }
            if (formula.int) {
                value += GetHeroInt(srcUnit, true) * formula.int;
            }
            if (formula.hp) {
                value += GetUnitState(srcUnit, UNIT_STATE_LIFE) * formula.hp;
            }
            if (formula.mana) {
                value += GetUnitState(srcUnit, UNIT_STATE_MANA) * formula.mana;
            }
            if (formula.maxHp) {
                value += GetUnitState(srcUnit, UNIT_STATE_MAX_LIFE) * formula.maxHp;
            }
            if (formula.maxMana) {
                value += GetUnitState(srcUnit, UNIT_STATE_MAX_MANA) * formula.maxMana;
            }
            if (formula.loseHp) {
                value += (GetUnitState(srcUnit, UNIT_STATE_MAX_LIFE) - GetUnitState(srcUnit, UNIT_STATE_LIFE)) * formula.loseHp;
            }
            if (formula.loseMana) {
                value += (GetUnitState(srcUnit, UNIT_STATE_MAX_MANA) - GetUnitState(srcUnit, UNIT_STATE_MANA)) * formula.loseMana;
            }
        }
        //目标单位
        if (targetUnit != null) {
            if (formula.target_attack) {
                value += GetUnitState(targetUnit, UnitStateDamageMax) * formula.target_attack;
            }
            if (formula.target_def) {
                value += GetUnitState(targetUnit, UnitStateArmor) * formula.target_def;
            }
            if (formula.target_fullPros) {
                value += (GetHeroStr(targetUnit, true) + GetHeroAgi(targetUnit, true) +
                    GetHeroInt(targetUnit, true)) * formula.target_fullPros;
            }
            if (formula.target_primaryPros) {
                value += HeroUtil.getHeroPrimaryValue(targetUnit, true) * formula.target_primaryPros;
            }
            if (formula.target_str) {
                value += GetHeroStr(targetUnit, true) * formula.target_str;
            }
            if (formula.target_agi) {
                value += GetHeroAgi(targetUnit, true) * formula.target_agi;
            }
            if (formula.target_int) {
                value += GetHeroInt(targetUnit, true) * formula.target_int;
            }
            if (formula.target_hp) {
                value += GetUnitState(targetUnit, UNIT_STATE_LIFE) * formula.target_hp;
            }
            if (formula.target_mana) {
                value += GetUnitState(targetUnit, UNIT_STATE_MANA) * formula.target_mana;
            }
            if (formula.target_maxHp) {
                value += GetUnitState(targetUnit, UNIT_STATE_MAX_LIFE) * formula.target_maxHp;
            }
            if (formula.target_maxMana) {
                value += GetUnitState(targetUnit, UNIT_STATE_MAX_MANA) * formula.target_maxMana;
            }
            if (formula.target_loseHp) {
                value += (GetUnitState(targetUnit, UNIT_STATE_MAX_LIFE) - GetUnitState(targetUnit, UNIT_STATE_LIFE)) * formula.target_loseHp;
            }
            if (formula.target_loseMana) {
                value += (GetUnitState(targetUnit, UNIT_STATE_MAX_MANA) - GetUnitState(targetUnit, UNIT_STATE_MANA)) * formula.target_loseMana;
            }
        }
        //玩家相关
        let player = GetOwningPlayer(srcUnit);
        if (IsHandle(player)) {
            if (formula.gold) {
                value += GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD) * formula.gold;
            }
            if (formula.lumber) {
                value += GetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER) * formula.lumber;
            }
            if (formula.food) {
                value += GetPlayerState(player, PLAYER_STATE_RESOURCE_FOOD_USED) * formula.food;
            }
            if (formula.kills) {
                value += (DataBase.getPlayerSolarData(player, false)?.killCount || 0) * formula.kills;
            }
        }
        //最终数值增幅
        if (formula.increased) {
            value *= (1 + formula.increased);
        }
        return value;
    }
}
