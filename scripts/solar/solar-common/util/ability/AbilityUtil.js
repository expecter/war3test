import TargetType, { OptionType, TargetCnType } from "../../constant/TargetType";
// import {AbilityOrder} from "../../lib/core/base_object/AbilityObjectIdOrder";
/**
 * 设置技能
 */
export default class AbilityUtil {
    static config = {
        ignoreAbilityIds: {
            Ahrp: true,
            Amil: true,
            Ahar: true,
            Aatk: true, //攻击
            Amov: true, //移动
        }
    };
    /**
     * 获取单位身上拥有的技能
     * (包括物品携带的 和隐藏的技能 和魔法书里的技能 和buff)
     */
    static getUnitAbilityIds(unit) {
        let abilityIdStrs = [];
        for (let i = 0; i < 100; i++) {
            let ar = EXGetUnitAbilityByIndex(unit, i);
            // let ar: ability = null;
            // if (GetUnitSpellAbility) {
            //     ar = GetUnitSpellAbility(unit, i);//获取技能
            // } else {
            //     ar = EXGetUnitAbilityByIndex(unit, i);//获取单位技能 与物品技能
            // }
            if (!IsHandle(ar)) {
                break;
            }
            let aId = EXGetAbilityId(ar);
            let aIdStr = id2string(aId);
            if (AbilityUtil.config.ignoreAbilityIds[aIdStr]) {
                continue;
            }
            abilityIdStrs.push(aIdStr);
        }
        return abilityIdStrs;
    }
    /**
     * 转换目标允许为数字
     */
    static targets2Num(str) {
        if (!str) {
            return;
        }
        let result = 0;
        let data = str.split(",");
        for (let name of data) {
            let flag = TargetType[name];
            if (!flag) {
                print('错误的目标允许类型: ' + name);
            }
            result = result + flag;
        }
        return result;
    }
    /**
     * 中文或英文key 目标允许转底层数字标识
     * 示例: 地面,空中,建筑
     * 转换目标允许为数字
     */
    static targetAllow2Num(str) {
        if (!str) {
            return;
        }
        let result = 0;
        let data = str.split(",");
        for (let name of data) {
            let flag = TargetCnType[name];
            if (flag == null) {
                flag = TargetType[name];
            }
            if (flag == null) {
                print('错误的目标允许类型: ' + name);
                continue;
            }
            result = result + flag;
        }
        return result;
    }
    /**
     * 转换图标选项为数字
     */
    static option2Num(str) {
        if (!str) {
            return;
        }
        let result = 0;
        let data = str.split(",");
        for (let name of data) {
            let flag = OptionType[name];
            if (!flag) {
                print('错误的图标选项类型: ' + name);
            }
            result = result + flag;
        }
        return result;
    }
    /**
     * 设置单位技能名字
     * @param udw 修改技能单位
     * @param abilityId 修改的技能id
     * @param name 修改技能的名字
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityName(udw, abilityId, name, isref = false) {
        if (!name) {
            print("不存在技能名字");
        }
        EXSetAbilityDataString(EXGetUnitAbility(udw, abilityId), 1, ABILITY_DATA_NAME, name);
        EXSetAbilityDataString(EXGetUnitAbility(udw, abilityId), 1, ABILITY_DATA_TIP, name);
        if (isref) {
            IncUnitAbilityLevel(udw, abilityId);
            DecUnitAbilityLevel(udw, abilityId);
        }
    }
    /**
     * 设置单位技能图标
     * @param udw 修改技能单位
     * @param abilityId 修改的技能id
     * @param hotKey
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityHotkey(udw, abilityId, hotKey, isref = false) {
        if (!hotKey) {
            print("不存在hotKey");
        }
        EXSetAbilityDataInteger(EXGetUnitAbility(udw, abilityId), 1, ABILITY_DATA_HOTKET, hotKey);
        if (isref) {
            IncUnitAbilityLevel(udw, abilityId);
            DecUnitAbilityLevel(udw, abilityId);
        }
    }
    /**
     * 获取单位技能图标
     * @param udw  技能单位
     * @param abilityId 技能id
     * @returns
     */
    static getUnitAbilityArt(udw, abilityId) {
        return EXGetAbilityDataString(EXGetUnitAbility(udw, abilityId), 1, ABILITY_DATA_ART);
    }
    /**
     * 设置单位技能图标
     * @param udw 修改技能单位
     * @param abilityId 修改的技能id
     * @param art 修改技能的图标路径
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityArt(udw, abilityId, art, isref = false) {
        if (!art) {
            print("不存在技能图标路径");
        }
        EXSetAbilityDataString(EXGetUnitAbility(udw, abilityId), 1, ABILITY_DATA_ART, art);
        if (isref) {
            IncUnitAbilityLevel(udw, abilityId);
            DecUnitAbilityLevel(udw, abilityId);
        }
    }
    /**
     * 设置单位技能提示拓展
     * @param udw 修改技能单位
     * @param skid 修改的技能id
     * @param Ubertip 修改技能的提示拓展
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityUbertip(udw, skid, Ubertip, isref = false) {
        if (!Ubertip) {
            print("不存在技能提示拓展");
        }
        EXSetAbilityDataString(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_UBERTIP, Ubertip);
        if (isref) {
            IncUnitAbilityLevel(udw, skid);
            DecUnitAbilityLevel(udw, skid);
        }
    }
    /**
     * 设置技能data A
     * @param udw
     * @param skid
     * @param data
     * @param isref
     */
    static setUnitAbilityDataA(udw, skid, data, isref = false) {
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_DATA_A, data);
        if (isref) {
            IncUnitAbilityLevel(udw, skid);
            DecUnitAbilityLevel(udw, skid);
        }
    }
    /**
     * 设置通魔技能目标类型
     * @param udw 修改技能单位
     * @param skid 修改的技能id （以通魔为模板的技能id）
     * 无目标 TARGET_TYPE_NONE = 0;
     * 单位目标 TARGET_TYPE_UNIT = 1;
     * 点目标 TARGET_TYPE_POINT = 2;
     * 单位或点 TARGET_TYPE_UNIT_OR_POINT = 3;
     * @param target_type
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitANclAbilityTarget(udw, skid, target_type, isref = false) {
        AbilityUtil.setUnitAbilityDataB(udw, skid, target_type, isref);
    }
    /**
     * 设置技能data B
     * @param udw
     * @param skid
     * @param data
     * @param isref
     */
    static setUnitAbilityDataB(udw, skid, DataB, isref = false) {
        if (!DataB) {
            print("不存在技能图标路径");
        }
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_DATA_B, DataB);
        if (isref) {
            IncUnitAbilityLevel(udw, skid);
            DecUnitAbilityLevel(udw, skid);
        }
    }
    /**
     * 设置通魔技能选项
     * ANcl = 通魔
     * @param udw 修改技能单位
     * @param skid 修改的技能id （以通魔为模板的技能id）
     * @param options
     * 图标可见    visible
     * 目标选取图像 targimage
     * 物理魔法    physical
     * 通用魔法    universal
     * 单独释放    unique
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitANclAbilityOption(udw, skid, options, isref = false) {
        if (!options) {
            print("不存在技能选项");
        }
        let data = AbilityUtil.option2Num(options);
        AbilityUtil.setUnitAbilityDataC(udw, skid, data, isref);
    }
    /**
     * 设置技能data C
     * @param udw
     * @param skid
     * @param data
     * @param isref
     */
    static setUnitAbilityDataC(udw, skid, data, isref = false) {
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_DATA_C, data);
        if (isref) {
            IncUnitAbilityLevel(udw, skid);
            DecUnitAbilityLevel(udw, skid);
        }
    }
    /**
     * 设置技能data D
     * @param udw
     * @param skid
     * @param data
     * @param isref
     */
    static setUnitAbilityDataD(udw, skid, data, isref = false) {
        if (!data) {
            print("不存在技能选项");
        }
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_DATA_D, data);
        if (isref) {
            IncUnitAbilityLevel(udw, skid);
            DecUnitAbilityLevel(udw, skid);
        }
    }
    /**
     * 设置技能data UnitID 如动态设置哨塔的建造单位类型
     * @param udw
     * @param skid
     * @param data
     * @param isref
     */
    static setUnitAbilityUnitId(udw, skid, data, isref = false) {
        if (!data) {
            print("不存在技能选项");
        }
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_UNITID, data);
        if (isref) {
            IncUnitAbilityLevel(udw, skid);
            DecUnitAbilityLevel(udw, skid);
        }
    }
    /**
     * 设置技能目标允许
     * @param udw 修改技能单位
     * @param skid 修改的技能id
     * @param Targs 修改技能的目标允许
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityTargs(udw, skid, Targs, isref = false) {
        if (!Targs) {
            print("不存在技能目标允许");
        }
        let data = AbilityUtil.targets2Num(Targs);
        EXSetAbilityDataInteger(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_TARGS, R2I(data));
        if (isref) {
            IncUnitAbilityLevel(udw, skid);
            DecUnitAbilityLevel(udw, skid);
        }
    }
    /**
     * 刷新单位技能
     * @param udw
     * @param skid
     */
    static refreshAbility(udw, skid) {
        IncUnitAbilityLevel(udw, skid);
        DecUnitAbilityLevel(udw, skid);
    }
    /**
     * 设置技能释放间隔
     * @param udw 修改技能单位
     * @param skid 修改的技能id
     * @param Cool 修改技能的释放间隔
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityCool(udw, skid, cool) {
        if (typeof skid === 'string') {
            skid = FourCC(skid);
        }
        if (!cool) {
            print("不存在技能释放间隔");
        }
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_COOL, cool);
    }
    /**
     * 设置当前单位 指定技能 的当前冷却时间
     *
     */
    static setUnitAbilityStateCooldown(udw, skid, state_cooldown) {
        if (typeof skid === 'string') {
            skid = FourCC(skid);
        }
        if (!state_cooldown) {
            print("不存在技能释放间隔");
        }
        EXSetAbilityState(EXGetUnitAbility(udw, skid), ABILITY_STATE_COOLDOWN, state_cooldown);
    }
    /**
     * 刷新当前单位 指定技能的 实时冷却时间
     * 每次施法 都刷新一下 才能进入冷却
     * @param udw
     * @param skid
     * @param state_cooldown
     */
    static refreshUnitAbilityStateCooldown(udw, skid, state_cooldown) {
        if (typeof skid === 'string') {
            skid = FourCC(skid);
        }
        if (!state_cooldown) {
            print("不存在技能释放间隔");
        }
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_COOL, state_cooldown);
        EXSetAbilityState(EXGetUnitAbility(udw, skid), ABILITY_STATE_COOLDOWN, state_cooldown);
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_COOL, 0); //防止影响其他玩家单位的 技能冷却间隔
    }
    /**
     * 设置技能魔法消耗
     * @param udw 修改技能单位
     * @param skid 修改的技能id
     * @param Cost 修改技能的魔法消耗
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityCost(udw, skid, Cost, isref = false) {
        if (!Cost) {
            print("不存在技能魔法消耗");
        }
        EXSetAbilityDataInteger(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_COST, Cost);
        if (isref) {
            IncUnitAbilityLevel(udw, skid);
            DecUnitAbilityLevel(udw, skid);
        }
    }
    /**
     * 设置技能施法距离
     * @param udw 修改技能单位
     * @param skid 修改的技能id
     * @param Rng 修改技能的施法距离
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityRng(udw, skid, Rng, isref = false) {
        if (!Rng) {
            print("不存在技能施法距离");
        }
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_RNG, Rng);
        if (isref) {
            IncUnitAbilityLevel(udw, skid);
            DecUnitAbilityLevel(udw, skid);
        }
    }
    /**
     * 设置技能影响区域
     * @param udw 修改技能单位
     * @param skid 修改的技能id
     * @param Area 修改技能的影响区域
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityArea(udw, skid, Area, isref = false) {
        if (!Area) {
            print("不存在技能影响区域");
        }
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_AREA, Area);
        if (isref) {
            IncUnitAbilityLevel(udw, skid);
            DecUnitAbilityLevel(udw, skid);
        }
    }
    /**
     * 设置通魔的技能数据
     * @param ability
     * @param targetType
     */
    static setTargetType(ability, targetType) {
        if (targetType == '单位') {
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1);
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 1);
            EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_TARGS, 0x00);
        }
        else if (targetType == '点') {
            //图标可见 + 目标选取
            if (EXGetAbilityDataReal(ability, 1, ABILITY_DATA_AREA) < 100) {
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1);
            }
            else {
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 3);
            }
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 2);
        }
        else if (targetType == '单位或点') {
            //图标可见 + 目标选取
            if (EXGetAbilityDataReal(ability, 1, ABILITY_DATA_AREA) < 100) {
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1);
            }
            else {
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 3);
            }
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 3);
            EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_TARGS, 0x00);
        }
        else if (targetType == '物品') {
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1);
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 1);
            EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_TARGS, 0x20);
        }
        else if (targetType == '无目标') {
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1);
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0);
        }
        else {
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1);
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0);
        }
    }
    ;
    /**
     *
     * @param ability
     * @param targetAllow 示例: 地面,空中,建筑
     */
    static setTargetAllow(ability, targetAllow) {
        let allow2Num = AbilityUtil.targetAllow2Num(targetAllow);
        EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_TARGS, allow2Num);
    }
    /**
     * 获取施法位置xy
     * @param attype == 0 无目标
     * @param attype == 1 单位目标
     * @param attype == 2 点目标
     * @param attype == 3 单位或点目标
     * @param store
     */
    static getSpellXY(attype, store) {
        if (!store) {
            store = {};
        }
        //无目标
        if (attype == 0) {
            store.x = GetUnitX(GetTriggerUnit());
            store.y = GetUnitY(GetTriggerUnit());
        }
        //单位目标
        if (attype == 1) {
            store.x = GetUnitX(GetSpellTargetUnit());
            store.y = GetUnitY(GetSpellTargetUnit());
        }
        //点目标
        if (attype == 2) {
            store.x = GetSpellTargetX();
            store.y = GetSpellTargetY();
        }
        //单位或点目标
        if (attype == 2) {
            //是点
            if (GetSpellTargetX() != 0 && GetSpellTargetY() != 0) {
                store.x = GetSpellTargetX();
                store.y = GetSpellTargetY();
            }
            //是单位
            if (GetUnitX(GetSpellTargetUnit()) != 0 && GetUnitY(GetSpellTargetUnit()) != 0) {
                store.x = GetUnitX(GetSpellTargetUnit());
                store.y = GetUnitY(GetSpellTargetUnit());
            }
        }
        return store;
    }
    /**
     * 获取单位技能的冷却时间
     * @param udw
     * @param skid
     */
    static getUnitAbilityCool(udw, skid) {
        return EXGetAbilityDataReal(EXGetUnitAbility(udw, skid), GetUnitAbilityLevel(udw, skid), ABILITY_DATA_COOL);
    }
    /**
     * 获取单位技能的当前冷却时间
     * @param udw
     * @param skid
     */
    static getUnitAbilityStateCooldown(udw, skid) {
        return EXGetAbilityState(EXGetUnitAbility(udw, skid), ABILITY_STATE_COOLDOWN);
    }
    /**
     *
     * @param hero 英雄单位
     * @param maxLevel 技能最大等级
     */
    static studyHeroAbilLists(hero, maxLevel = 50) {
        let uobj = _g_objs.unit[id2string(GetUnitTypeId(hero))];
        let heroAbilList = uobj.heroAbilList || "";
        let heroAbilLists = heroAbilList.split(",");
        for (let abilityId of heroAbilLists) {
            if (abilityId && abilityId.length == 4) {
                for (let i = 0; i < maxLevel; i++) {
                    SelectHeroSkill(hero, FourCC(abilityId));
                }
            }
        }
        return heroAbilLists;
    }
    /**
     * 是否是目标选择界面
     */
    static isSelectUi() {
        let [ability, order] = button(3, 2);
        return order == 0xD000B;
    }
    /**
     * 是否是魔法书界面 或建造界面
     */
    static isBookUi() {
        let [ability, order] = button(3, 2);
        return order == 0xD0007;
    }
}
