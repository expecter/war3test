/** @noSelfInFile **/
import { Destructable } from "./destructable";
import { Handle } from "./handle";
import { Item } from "./item";
import { MapPlayer } from "./player";
import { Point } from "./point";
import { Widget } from "./widget";
import UnitUtil from "../../util/unit/UnitUtil";
import DataBase from "../../common/DataBase";
import BaseUtil from "../../util/BaseUtil";
export class Unit extends Widget {
    // @ts-ignore
    handle;
    uuid;
    constructor(owner, unitId, x, y, face) {
        if (Handle.initFromHandle()) {
            super();
            return;
        }
        const p = Player(owner);
        const unitH = CreateUnit(p, unitId, x, y, face);
        super(unitH);
    }
    /**
     * 也可直接使用 DataBase.getUnitSolarData(handle)
     * 注意死亡单位的solarData 查询请使用 DataBase.getUnitSolarData(handle,false)
     */
    get solarData() {
        return DataBase.getUnitSolarData(this.handle);
    }
    set solarData(obj) {
        DataBase.setDataByHandle("+w3u", this.handle, obj);
    }
    //
    /**
     *  addons
     */
    costLife(val) {
        if (this.life < val) {
            return false;
        }
        this.life = this.life - val;
        return true;
    }
    costMana(val) {
        if (this.mana < val) {
            return false;
        }
        this.mana = this.mana - val;
        return true;
    }
    /**
     * 设置主动攻击范围
     * @param value
     */
    set acquireRange(value) {
        SetUnitAcquireRange(this.handle, value);
    }
    /**
     * 设置主动攻击范围
     * @param value
     */
    get acquireRange() {
        return GetUnitAcquireRange(this.handle);
    }
    /**
     * 敏捷
     */
    get agility() {
        return GetHeroAgi(this.handle, false);
    }
    /**
     * 敏捷
     */
    set agility(value) {
        SetHeroAgi(this.handle, value, true);
    }
    // public get armor() {
    //     return BlzGetUnitArmor(this.handle);
    // }
    //
    // public set armor(armorAmount: number) {
    //     BlzSetUnitArmor(this.handle, armorAmount);
    // }
    /**
     * 单位睡眠
     */
    set sleep(flag) {
        UnitAddSleep(this.handle, flag);
    }
    /**
     * 单位睡眠
     */
    get sleep() {
        return UnitCanSleep(this.handle);
    }
    // public get collisionSize() {
    //     return BlzGetUnitCollisionSize(this.handle);
    // }
    /**
     * 单位颜色
     */
    set color(whichColor) {
        SetUnitColor(this.handle, whichColor);
    }
    /**
     * 当前单位命令
     */
    get currentOrder() {
        return GetUnitCurrentOrder(this.handle);
    }
    /**
     * 默认主动攻击范围
     */
    get defaultAcquireRange() {
        return GetUnitDefaultAcquireRange(this.handle);
    }
    /**
     * 默认飞行高度
     */
    get defaultFlyHeight() {
        return GetUnitDefaultFlyHeight(this.handle);
    }
    /**
     * 默认移动速度
     */
    get defaultMoveSpeed() {
        return GetUnitDefaultMoveSpeed(this.handle);
    }
    /**
     * 默认转向速度
     */
    get defaultPropWindow() {
        return GetUnitDefaultPropWindow(this.handle);
    }
    /**
     * 默认转向速度
     */
    get defaultTurnSpeed() {
        return GetUnitDefaultTurnSpeed(this.handle);
    }
    /**
     * 经验值
     */
    get experience() {
        return GetHeroXP(this.handle);
    }
    /**
     * 经验值
     */
    set experience(newXpVal) {
        SetHeroXP(this.handle, newXpVal, true);
    }
    /**
     * 面向角度
     */
    set facing(value) {
        SetUnitFacing(this.handle, value);
    }
    /**
     * 面向角度
     */
    get facing() {
        return GetUnitFacing(this.handle);
    }
    /**
     * 单位提供人口数量
     */
    get foodMade() {
        return GetUnitFoodMade(this.handle);
    }
    /**
     * 单位提供人口数量
     */
    get foodUsed() {
        return GetUnitFoodUsed(this.handle);
    }
    /**
     * 单位忽略报警开关
     */
    get ignoreAlarmToggled() {
        return UnitIgnoreAlarmToggled(this.handle);
    }
    /**
     * 智力
     */
    get intelligence() {
        return GetHeroInt(this.handle, false);
    }
    /**
     * 智力
     */
    set intelligence(value) {
        SetHeroInt(this.handle, value, true);
    }
    /**
     * 单位物品栏大小
     */
    get inventorySize() {
        return UnitInventorySize(this.handle);
    }
    /**
     * 设置单位 无敌
     */
    set invulnerable(flag) {
        SetUnitInvulnerable(this.handle, flag);
    }
    // public get invulnerable() {
    //     return BlzIsUnitInvulnerable(this.handle);
    // }
    /**
     * 单位等级
     */
    get level() {
        return GetUnitLevel(this.handle);
    }
    //
    // public get localZ() {
    //     return BlzGetLocalUnitZ(this.handle);
    // }
    /**
     * 魔法
     */
    get mana() {
        return this.getState(UNIT_STATE_MANA);
    }
    /**
     * 魔法
     */
    set mana(value) {
        this.setState(UNIT_STATE_MANA, value);
    }
    /**
     * 最大生命值
     */
    get maxLife() {
        return GetUnitState(this.handle, UNIT_STATE_MAX_LIFE);
    }
    /**
     * 最大生命值
     */
    set maxLife(value) {
        SetUnitState(this.handle, UNIT_STATE_MAX_LIFE, value);
    }
    /**
     * 最大魔法值
     */
    get maxMana() {
        return GetUnitState(this.handle, UNIT_STATE_MAX_MANA);
    }
    /**
     * 最大魔法值
     */
    set maxMana(value) {
        SetUnitState(this.handle, UNIT_STATE_MAX_MANA, value);
    }
    /**
     * 移动速度
     */
    set moveSpeed(value) {
        SetUnitMoveSpeed(this.handle, value);
    }
    /**
     * 移动速度
     */
    get moveSpeed() {
        return GetUnitMoveSpeed(this.handle);
    }
    /**
     * 名字
     */
    get name() {
        return GetUnitName(this.handle);
    }
    // set name(value: string) {
    //     BlzSetUnitName(this.handle, value);
    // }
    //
    // public set nameProper(value: string) {
    //     BlzSetHeroProperName(this.handle, value);
    // }
    /**
     * 英雄的姓名
     */
    get nameProper() {
        return GetHeroProperName(this.handle);
    }
    /**
     * 所属玩家
     */
    set owner(whichPlayer) {
        SetUnitOwner(this.handle, whichPlayer.handle, true);
    }
    /**
     * 所属玩家
     */
    get owner() {
        return MapPlayer.fromHandle(GetOwningPlayer(this.handle));
    }
    /**
     * 暂停单位
     */
    set paused(flag) {
        PauseUnit(this.handle, flag);
    }
    /**
     * 暂停单位
     */
    get paused() {
        return IsUnitPaused(this.handle);
    }
    /**
     * 点
     * @deprecated
     */
    get point() {
        return Point.fromHandle(GetUnitLoc(this.handle));
    }
    /**
     * 点
     */
    set point(whichPoint) {
        SetUnitPositionLoc(this.handle, whichPoint.handle);
    }
    /**
     * 单位的 附加值
     */
    get pointValue() {
        return GetUnitPointValue(this.handle);
    }
    /**
     * 改变单位转向角度
     */
    set propWindow(value) {
        SetUnitPropWindow(this.handle, value);
    }
    /**
     * 单位转向角度
     */
    get propWindow() {
        return GetUnitPropWindow(this.handle);
    }
    /**
     * 单位的种族
     */
    get race() {
        return GetUnitRace(this.handle);
    }
    /**
     * 单位 聚集点
     */
    get rallyDestructable() {
        return Destructable.fromHandle(GetUnitRallyDestructable(this.handle));
    }
    /**
     * 聚集点
     */
    get rallyPoint() {
        return Point.fromHandle(GetUnitRallyPoint(this.handle));
    }
    /**
     * 拥有源聚集点单位
     */
    get rallyUnit() {
        return Unit.fromHandle(GetUnitRallyUnit(this.handle));
    }
    /**
     * 设置金矿资源
     */
    set resourceAmount(amount) {
        SetResourceAmount(this.handle, amount);
    }
    /**
     * 黄金资源数量
     */
    get resourceAmount() {
        return GetResourceAmount(this.handle);
    }
    // public get selectable() {
    //     return BlzIsUnitSelectable(this.handle);
    // }
    //
    // public set selectionScale(scale: number) {
    //     this.setField(UNIT_RF_SELECTION_SCALE, scale);
    // }
    //
    // public get selectionScale() {
    //     const result = this.getField(UNIT_RF_SELECTION_SCALE);
    //     return typeof result === "number" ? result : 0;
    // }
    /**
     * 显示/隐藏 [R]
     */
    set show(flag) {
        ShowUnit(this.handle, flag);
    }
    /**
     * 显示/隐藏 [R]
     */
    get show() {
        return !IsUnitHidden(this.handle);
    }
    // public get skin() {
    //     return BlzGetUnitSkin(this.handle);
    // }
    //
    // public set skin(skinId: number | string) {
    //     BlzSetUnitSkin(this.handle, skinId);
    // }
    /**
     * 未用完的技能点数
     */
    get skillPoints() {
        return GetHeroSkillPoints(this.handle);
    }
    /**
     * 添加剩余技能点 [R]
     */
    set skillPoints(skillPointDelta) {
        UnitModifySkillPoints(this.handle, skillPointDelta);
    }
    /**
     * 单位在睡眠
     */
    get sleeping() {
        return UnitIsSleeping(this.handle);
    }
    /**
     * 力量
     */
    get strength() {
        return GetHeroStr(this.handle, false);
    }
    /**
     * 力量
     */
    set strength(value) {
        SetHeroStr(this.handle, value, true);
    }
    /**
     * 设定单位转向速度
     */
    set turnSpeed(value) {
        SetUnitTurnSpeed(this.handle, value);
    }
    /**
     * 设定单位转向速度
     */
    get turnSpeed() {
        return GetUnitTurnSpeed(this.handle);
    }
    /**
     * 单位的类型
     */
    get typeId() {
        return GetUnitTypeId(this.handle);
    }
    /**
     * 单位的类型4字符串
     */
    get typeIdString() {
        return id2string(GetUnitTypeId(this.handle));
    }
    /**
     * 单位自定义值
     */
    get userData() {
        return GetUnitUserData(this.handle);
    }
    /**
     * 单位自定义值
     */
    set userData(value) {
        SetUnitUserData(this.handle, value);
    }
    /**
     * 传送门激活
     */
    set waygateActive(flag) {
        WaygateActivate(this.handle, flag);
    }
    /**
     * 传送门激活
     */
    get waygateActive() {
        return WaygateIsActive(this.handle);
    }
    /**
     * x
     */
    get x() {
        return GetUnitX(this.handle);
    }
    /**
     * x
     * @deprecated SetUnitPosition (单独分开设置坐标一个轴 可能会触发进入新x 旧y所在的区域事件 还是同时设置xy稳定)
     */
    set x(value) {
        SetUnitX(this.handle, value);
    }
    /**
     * y
     */
    get y() {
        return GetUnitY(this.handle);
    }
    /**
     * y
     * @deprecated SetUnitPosition (单独分开设置坐标一个轴 可能会触发进入新y 旧x所在的区域事件 还是同时设置xy稳定)
     */
    set y(value) {
        SetUnitY(this.handle, value);
    }
    // public get z() {
    //     return BlzGetUnitZ(this.handle);
    // }
    /**
     * 添加技能
     */
    addAbility(abilityId) {
        return UnitAddAbility(this.handle, abilityId);
    }
    /**
     * 单位动画附加名
     */
    addAnimationProps(animProperties, add) {
        AddUnitAnimationProperties(this.handle, animProperties, add);
    }
    /**
     * 增加经验值
     */
    addExperience(xpToAdd, showEyeCandy) {
        AddHeroXP(this.handle, xpToAdd, showEyeCandy);
    }
    /**
     * 闪动指示器(对单位) [R]
     */
    addIndicator(red, blue, green, alpha) {
        UnitAddIndicator(this.handle, red, blue, green, alpha);
    }
    /**
     * 给予物品 [R]
     */
    addItem(whichItem) {
        return UnitAddItem(this.handle, whichItem.handle);
    }
    /**
     * 给予物品 [R]
     */
    addItemById(itemId) {
        let item = UnitAddItemById(this.handle, itemId);
        if (IsHandle(item)) {
            //可能添加的装备 被其他触发时间Remove了 就没有这个装备了。比如合成装备时 创建的装备直接被当做材料给删除合成到其他类型了
            return Item.fromHandle(item);
        }
        return null;
    }
    /**
     * 新建物品到指定物品栏 [R]
     */
    addItemToSlotById(itemId, itemSlot) {
        return UnitAddItemToSlotById(this.handle, itemId, itemSlot);
    }
    /**
     * 增加 物品-类型 (到商店)
     */
    addItemToStock(itemId, currentStock, stockMax) {
        AddItemToStock(this.handle, itemId, currentStock, stockMax);
    }
    /**
     * 添加金矿资源
     */
    addResourceAmount(amount) {
        AddResourceAmount(this.handle, amount);
    }
    /**
     * 设置单位睡眠(无论何时)
     */
    addSleepPerm(add) {
        UnitAddSleepPerm(this.handle, add);
    }
    /**
     * 添加类别 [R]
     */
    addType(whichUnitType) {
        return UnitAddType(this.handle, whichUnitType);
    }
    /**
     * 增加 单位-类型 (到商店)
     */
    addUnitToStock(unitId, currentStock, stockMax) {
        AddUnitToStock(this.handle, unitId, currentStock, stockMax);
    }
    /**
     * 设置生命周期 [R]
     */
    applyTimedLife(buffId, duration) {
        UnitApplyTimedLife(this.handle, buffId, duration);
    }
    /**
     * 添加声音
     */
    attachSound(sound) {
        AttachSoundToUnit(sound.handle, this.handle);
    }
    // public cancelTimedLife() {
    //     BlzUnitCancelTimedLife(this.handle);
    // }
    /**
     * 单位在睡觉
     */
    canSleepPerm() {
        return UnitCanSleepPerm(this.handle);
    }
    /**
     * 拥有Buff数量 [R]
     */
    countBuffs(removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel) {
        return UnitCountBuffsEx(this.handle, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel);
    }
    /**
     * 伤害区域 [R]
     */
    damageAt(delay, radius, x, y, amount, attack, ranged, attackType, damageType, weaponType) {
        return UnitDamagePoint(this.handle, delay, radius, x, y, amount, attack, ranged, attackType, damageType, weaponType);
    }
    /**
     * 伤害区目标 [R]
     */
    damageTarget(target, amount, attack, ranged, attackType, damageType, weaponType) {
        return UnitDamageTarget(this.handle, target, amount, attack, ranged, attackType, damageType, weaponType);
    }
    /**
     * 降低等级 [R]
     */
    decAbilityLevel(abilCode) {
        return DecUnitAbilityLevel(this.handle, abilCode);
    }
    /**
     * Instantly removes the unit from the game.
     */
    destroy(delay = 0) {
        if (delay && delay > 0) {
            handle_ref(this.handle); //防止单位死亡或其他方式导致handle被重用
            BaseUtil.runLater(delay, () => {
                this.solarData = null;
                handle_unref(this.handle);
                RemoveUnit(this.handle);
            });
        }
        else {
            this.solarData = null;
            RemoveUnit(this.handle);
        }
    }
    // public disableAbility(abilId: number | string, flag: boolean, hideUI: boolean) {
    //     BlzUnitDisableAbility(this.handle, abilId, flag, hideUI);
    // }
    /**
     * 发布丢弃物品命令(指定坐标) [R]
     */
    dropItem(whichItem, x, y) {
        return UnitDropItemPoint(this.handle, whichItem.handle, x, y);
    }
    /**
     * 移动物品到物品栏 [R]
     */
    dropItemFromSlot(whichItem, slot) {
        return UnitDropItemSlot(this.handle, whichItem.handle, slot);
    }
    /**
     * 移动物品到物品栏 [R]
     */
    dropItemTarget(whichItem, target /* | Unit | Item | Destructable*/) {
        return UnitDropItemTarget(this.handle, whichItem.handle, target.handle);
    }
    // public endAbilityCooldown(abilCode: number) {
    //     BlzEndUnitAbilityCooldown(this.handle, abilCode);
    // }
    //
    // public getAbility(abilId: number | string) {
    //     return BlzGetUnitAbility(this.handle, abilId);
    // }
    //
    // public getAbilityByIndex(index: number) {
    //     return BlzGetUnitAbilityByIndex(this.handle, index);
    // }
    //
    // public getAbilityCooldown(abilId: number | string, level: number) {
    //     return BlzGetUnitAbilityCooldown(this.handle, abilId, level);
    // }
    //
    // public getAbilityCooldownRemaining(abilId: number | string) {
    //     return BlzGetUnitAbilityCooldownRemaining(this.handle, abilId);
    // }
    /**
     * 单位技能等级 [R]
     */
    hasAbility(abilId) {
        return GetUnitAbilityLevel(this.handle, FourCC(abilId)) > 0;
    }
    /**
     * 单位技能等级 [R]
     */
    getAbilityLevel(abilCode) {
        return GetUnitAbilityLevel(this.handle, abilCode);
    }
    // public getAbilityManaCost(abilId: number | string, level: number) {
    //     return BlzGetUnitAbilityManaCost(this.handle, abilId, level);
    // }
    /**
     * 英雄敏捷 [R]
     */
    getAgility(includeBonuses) {
        return GetHeroAgi(this.handle, includeBonuses);
    }
    // public getAttackCooldown(weaponIndex: number) {
    //     return BlzGetUnitAttackCooldown(this.handle, weaponIndex);
    // }
    //
    // public getBaseDamage(weaponIndex: number) {
    //     return BlzGetUnitBaseDamage(this.handle, weaponIndex);
    // }
    //
    // public getDiceNumber(weaponIndex: number) {
    //     return BlzGetUnitDiceNumber(this.handle, weaponIndex);
    // }
    //
    // public getDiceSides(weaponIndex: number) {
    //     return BlzGetUnitDiceSides(this.handle, weaponIndex);
    // }
    // public getField(field: unitbooleanfield | unitintegerfield | unitrealfield | unitstringfield) {
    //     const fieldType = field.toString().substr(0, field.toString().indexOf(":"));
    //
    //     switch (fieldType) {
    //         case "unitbooleanfield":
    //             const fieldBool: unitbooleanfield = field as unitbooleanfield;
    //
    //             return BlzGetUnitBooleanField(this.handle, fieldBool);
    //         case "unitintegerfield":
    //             const fieldInt: unitintegerfield = field as unitintegerfield;
    //
    //             return BlzGetUnitIntegerField(this.handle, fieldInt);
    //         case "unitrealfield":
    //             const fieldReal: unitrealfield = field as unitrealfield;
    //
    //             return BlzGetUnitRealField(this.handle, fieldReal);
    //         case "unitstringfield":
    //             const fieldString: unitstringfield = field as unitstringfield;
    //
    //             return BlzGetUnitStringField(this.handle, fieldString);
    //         default:
    //             return 0;
    //     }
    // }
    /**
     * 飞行高度 (当前)
     */
    getflyHeight() {
        return GetUnitFlyHeight(this.handle);
    }
    /**
     * 英雄等级
     */
    getHeroLevel() {
        return GetHeroLevel(this.handle);
    }
    /**
     * 单位忽略报警
     */
    getIgnoreAlarm(flag) {
        return UnitIgnoreAlarm(this.handle, flag);
    }
    /**
     * 英雄智力 [R]
     */
    getIntelligence(includeBonuses) {
        return GetHeroInt(this.handle, includeBonuses);
    }
    /**
     * 单位持有物品
     */
    getItemInSlot(slot) {
        let itemHandle = UnitItemInSlot(this.handle, slot);
        if (IsHandle(itemHandle)) {
            return Item.fromHandle(itemHandle);
        }
        return null;
    }
    /**
     * 获取单位物品栏里的指定物品类型的物品
     * @constructor
     */
    getItemByItemType(itemtype) {
        let itemHandle = UnitUtil.GetInventoryOfItemType(this.handle, itemtype);
        if (IsHandle(itemHandle)) {
            return Item.fromHandle(itemHandle);
        }
        return null;
    }
    /**
     * 属性 [R]
     */
    getState(whichUnitState) {
        return GetUnitState(this.handle, whichUnitState);
    }
    /**
     * 力量 [R]
     */
    getStrength(includeBonuses) {
        return GetHeroStr(this.handle, includeBonuses);
    }
    /**
     * 是否拥有buff [R]
     */
    hasBuffs(removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel) {
        return UnitHasBuffsEx(this.handle, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel);
    }
    /**
     * 是否拥有物品 [R]
     */
    hasItem(whichItem) {
        return UnitHasItem(this.handle, whichItem.handle);
    }
    /**
     * 是否拥有物品类型 [R]
     */
    hasItemType(itemType) {
        for (let i = 0; i < 6; i++) {
            let indexItem = UnitItemInSlot(this.handle, i);
            if (IsHandle(indexItem) && GetItemTypeId(indexItem) == itemType) {
                return true;
            }
        }
        return false;
    }
    // public hideAbility(abilId: number | string, flag: boolean) {
    //     BlzUnitHideAbility(this.handle, abilId, flag);
    // }
    /**
     * 提升技能等级 [R]
     */
    incAbilityLevel(abilCode) {
        return IncUnitAbilityLevel(this.handle, abilCode);
    }
    /**
     * 是玩家组里玩家的单位
     */
    inForce(whichForce) {
        return IsUnitInForce(this.handle, whichForce.handle);
    }
    /**
     * 在单位组
     */
    inGroup(whichGroup) {
        return IsUnitInGroup(this.handle, whichGroup.handle);
    }
    /**
     * 在点的范围内
     */
    inRange(x, y, distance) {
        return IsUnitInRangeXY(this.handle, x, y, distance);
    }
    /**
     * 在指定点范围内 [R]
     */
    inRangeOfPoint(whichPoint, distance) {
        return IsUnitInRangeLoc(this.handle, whichPoint.handle, distance);
    }
    /**
     * 在指定单位范围内 [R]
     */
    inRangeOfUnit(otherUnit, distance) {
        return IsUnitInRange(this.handle, otherUnit.handle, distance);
    }
    // public interruptAttack() {
    //     BlzUnitInterruptAttack(this.handle);
    // }
    /**
     * 是运输单元
     */
    inTransport(whichTransport) {
        return IsUnitInTransport(this.handle, whichTransport.handle);
    }
    /**
     * 是否存活
     */
    isAlive() {
        return UnitAlive(this.handle);
    }
    /**
     * 单位所属玩家的同盟玩家
     */
    isAlly(whichPlayer) {
        return IsUnitAlly(this.handle, whichPlayer.handle);
    }
    /**
     * 单位所属玩家的敌对玩家
     */
    isEnemy(whichPlayer) {
        return IsUnitEnemy(this.handle, whichPlayer.handle);
    }
    /**
     * 英雄获得经验值
     */
    isExperienceSuspended() {
        return IsSuspendedXP(this.handle);
    }
    /**
     * 单位被战争迷雾遮挡
     */
    isFogged(whichPlayer) {
        return IsUnitFogged(this.handle, whichPlayer.handle);
    }
    /**
     * 单位类型是英雄单位
     */
    isHero() {
        return IsHeroUnitId(this.typeId);
    }
    /**
     * 是镜像单位
     */
    isIllusion() {
        return IsUnitIllusion(this.handle);
    }
    /**
     * 单位加载
     */
    isLoaded() {
        return IsUnitLoaded(this.handle);
    }
    /**
     * 单位被黑色阴影遮挡
     */
    isMasked(whichPlayer) {
        return IsUnitMasked(this.handle, whichPlayer.handle);
    }
    /**
     * 玩家已选定单位
     */
    isSelected(whichPlayer) {
        return IsUnitSelected(this.handle, whichPlayer.handle);
    }
    /**
     * 发布建造命令(指定坐标) [R]
     */
    issueBuildOrder(unit, x, y) {
        return typeof unit === "string" ? IssueBuildOrder(this.handle, unit, x, y) : IssueBuildOrderById(this.handle, unit, x, y);
    }
    /**
     * 给单位发送命令到 没有目标
     */
    issueImmediateOrder(order) {
        return typeof order === "string" ? IssueImmediateOrder(this.handle, order) : IssueImmediateOrderById(this.handle, order);
    }
    /**
     * 发布命令(指定坐标)
     */
    issueInstantOrderAt(order, x, y, instantTargetWidget) {
        return typeof order === "string" ? IssueInstantPointOrder(this.handle, order, x, y, instantTargetWidget.handle) : IssueInstantPointOrderById(this.handle, order, x, y, instantTargetWidget.handle);
    }
    /**
     * 发布命令(指定单位)
     */
    issueInstantTargetOrder(order, targetWidget, instantTargetWidget) {
        return typeof order === "string" ? IssueInstantTargetOrder(this.handle, order, targetWidget.handle, instantTargetWidget.handle) : IssueInstantTargetOrderById(this.handle, order, targetWidget.handle, instantTargetWidget.handle);
    }
    /**
     * 发布命令(指定坐标)
     */
    issueOrderAt(order, x, y) {
        return typeof order === "string" ? IssuePointOrder(this.handle, order, x, y) : IssuePointOrderById(this.handle, order, x, y);
    }
    /**
     * 给单位发送命令到 点
     */
    issuePointOrder(order, whichPoint) {
        return typeof order === "string" ? IssuePointOrderLoc(this.handle, order, whichPoint.handle) : IssuePointOrderByIdLoc(this.handle, order, whichPoint.handle);
    }
    /**
     * 给单位发送命令到 单位
     */
    issueTargetOrder(order, targetWidget) {
        return typeof order === "string" ? IssueTargetOrder(this.handle, order, targetWidget.handle) : IssueTargetOrderById(this.handle, order, targetWidget.handle);
    }
    /**
     * 是单位
     */
    isUnit(whichSpecifiedUnit) {
        return IsUnit(this.handle, whichSpecifiedUnit.handle);
    }
    /**
     * 检查单位 分类
     */
    isUnitType(whichUnitType) {
        return IsUnitType(this.handle, whichUnitType);
    }
    /**
     * 单位对于玩家可见
     */
    isVisible(whichPlayer) {
        return IsUnitVisible(this.handle, whichPlayer.handle);
    }
    /**
     * 杀死单位
     */
    kill() {
        KillUnit(this.handle);
    }
    /**
     * 锁定单位脸面对方向
     */
    lookAt(whichBone, lookAtTarget, offsetX, offsetY, offsetZ) {
        SetUnitLookAt(this.handle, whichBone, lookAtTarget.handle, offsetX, offsetY, offsetZ);
    }
    /**
     * 设置技能永久性 [R]
     */
    makeAbilityPermanent(permanent, abilityId) {
        UnitMakeAbilityPermanent(this.handle, permanent, abilityId);
    }
    /**
     * 添加剩余技能点 [R]
     */
    modifySkillPoints(skillPointDelta) {
        return UnitModifySkillPoints(this.handle, skillPointDelta);
    }
    // public pauseEx(flag: boolean) {
    //     BlzPauseUnitEx(this.handle, flag);
    // }
    /**
     * 暂停/恢复生命周期 [R]
     */
    pauseTimedLife(flag) {
        UnitPauseTimedLife(this.handle, flag);
    }
    /**
     * 队列单位动作
     * @param whichAnimation
     */
    queueAnimation(whichAnimation) {
        QueueUnitAnimation(this.handle, whichAnimation);
    }
    /**
     * 恢复单位的防守职责
     */
    recycleGuardPosition() {
        RecycleGuardPosition(this.handle);
    }
    /**
     * 删除技能 [R]
     */
    removeAbility(abilityId) {
        return UnitRemoveAbility(this.handle, abilityId);
    }
    /**
     * 删除魔法效果(指定极性) [R]
     */
    removeBuffs(removePositive, removeNegative) {
        UnitRemoveBuffs(this.handle, removePositive, removeNegative);
    }
    /**
     * 删除魔法效果(详细类别) [R]
     */
    removeBuffsEx(removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel) {
        UnitRemoveBuffsEx(this.handle, removePositive, removeNegative, magic, physical, timedLife, aura, autoDispel);
    }
    /**
     * 忽略单位的防守职责
     */
    removeGuardPosition() {
        RemoveGuardPosition(this.handle);
    }
    /**
     * 新建物品到指定物品栏 [R]
     */
    removeItem(whichItem) {
        UnitRemoveItem(this.handle, whichItem.handle);
    }
    /**
     * 从物品栏移除物品
     * @param itemSlot
     */
    removeItemFromSlot(itemSlot) {
        return Item.fromHandle(UnitRemoveItemFromSlot(this.handle, itemSlot));
    }
    /**
     * 从物品栏移除物品根据物品类型
     * @param
     */
    removeItemFromStock(itemId) {
        RemoveItemFromStock(this.handle, itemId);
    }
    /**
     * 移除类型
     * @param
     */
    removeType(whichUnitType) {
        return UnitAddType(this.handle, whichUnitType);
    }
    /**
     * 删除 单位-类型 (从商店)
     */
    removeUnitFromStock(itemId) {
        RemoveUnitFromStock(this.handle, itemId);
    }
    /**
     * 重设单位技能Cool down
     */
    resetCooldown() {
        UnitResetCooldown(this.handle);
    }
    /**
     * 重置单位面对方向
     */
    resetLookAt() {
        ResetUnitLookAt(this.handle);
    }
    /**
     * 立即复活(指定坐标) [R]
     */
    revive(x, y, doEyecandy) {
        return ReviveHero(this.handle, x, y, doEyecandy);
    }
    /**
     * 复活英雄（立即）
     */
    reviveAtPoint(whichPoint, doEyecandy) {
        return ReviveHeroLoc(this.handle, whichPoint.handle, doEyecandy);
    }
    /**
     * 选择单位
     */
    select(flag) {
        SelectUnit(this.handle, flag);
    }
    /**
     * 英雄学习技能
     */
    selectSkill(abilCode) {
        SelectHeroSkill(this.handle, abilCode);
    }
    // public setAbilityCooldown(abilId: number | string, level: number, cooldown: number) {
    //     BlzSetUnitAbilityCooldown(this.handle, abilId, level, cooldown);
    // }
    /**
     * 设置技能等级 [R]
     */
    setAbilityLevel(abilCode, level) {
        return SetUnitAbilityLevel(this.handle, abilCode, level);
    }
    // public setAbilityManaCost(abilId: number | string, level: number, manaCost: number) {
    //     BlzSetUnitAbilityManaCost(this.handle, abilId, level, manaCost);
    // }
    /**
     * 设置英雄敏捷 [R]
     */
    setAgility(value, permanent) {
        SetHeroAgi(this.handle, value, permanent);
    }
    /**
     * 播放单位动作
     */
    setAnimation(whichAnimation) {
        if (typeof whichAnimation === "string") {
            SetUnitAnimation(this.handle, whichAnimation);
        }
        else {
            SetUnitAnimationByIndex(this.handle, whichAnimation);
        }
    }
    /**
     * 播放单位动作 (指定概率)
     */
    setAnimationWithRarity(whichAnimation, rarity) {
        SetUnitAnimationWithRarity(this.handle, whichAnimation, rarity);
    }
    // public setAttackCooldown(cooldown: number, weaponIndex: number) {
    //     BlzSetUnitAttackCooldown(this.handle, cooldown, weaponIndex);
    // }
    //
    // public setBaseDamage(baseDamage: number, weaponIndex: number) {
    //     BlzSetUnitBaseDamage(this.handle, baseDamage, weaponIndex);
    // }
    /**
     * 改变单位动画播放速度(按倍数) [R]
     */
    setBlendTime(timeScale) {
        SetUnitBlendTime(this.handle, timeScale);
    }
    /**
     * 设置建筑物 建筑升级比
     */
    setConstructionProgress(constructionPercentage) {
        UnitSetConstructionProgress(this.handle, constructionPercentage);
    }
    /**
     * 锁定指定单位的警戒点 [R]
     */
    setCreepGuard(creepGuard) {
        SetUnitCreepGuard(this.handle, creepGuard);
    }
    // public setDiceNumber(diceNumber: number, weaponIndex: number) {
    //     BlzSetUnitDiceNumber(this.handle, diceNumber, weaponIndex);
    // }
    //
    // public setDiceSides(diceSides: number, weaponIndex: number) {
    //     BlzSetUnitDiceSides(this.handle, diceSides, weaponIndex);
    // }
    /**
     * 设置英雄经验值
     */
    setExperience(newXpVal, showEyeCandy) {
        SetHeroXP(this.handle, newXpVal, showEyeCandy);
    }
    /**
     * 复活英雄（立即）
     */
    setExploded(exploded) {
        SetUnitExploded(this.handle, exploded);
    }
    // public setFacingEx(facingAngle: number) {
    //     BlzSetUnitFacingEx(this.handle, facingAngle);
    // }
    //
    // public setField(field: unitbooleanfield | unitintegerfield | unitrealfield | unitstringfield, value: boolean | number | string) {
    //     const fieldType = field.toString().substr(0, field.toString().indexOf(":"));
    //
    //     if (fieldType === "unitbooleanfield" && typeof value === "boolean") {
    //         return BlzSetUnitBooleanField(this.handle, field as unitbooleanfield, value);
    //     } else if (fieldType === "unitintegerfield" && typeof value === "number") {
    //         return BlzSetUnitIntegerField(this.handle, field as unitintegerfield, value);
    //     } else if (fieldType === "unitrealfield" && typeof value === "number") {
    //         return BlzSetUnitRealField(this.handle, field as unitrealfield, value);
    //     } else if (fieldType === "unitstringfield" && typeof value === "string") {
    //         return BlzSetUnitStringField(this.handle, field as unitstringfield, value);
    //     }
    //
    //     return false;
    // }
    /***
     * 设定单位飞行高度
     * @param value
     * @param rate
     */
    setflyHeight(value, rate) {
        SetUnitFlyHeight(this.handle, value, rate);
    }
    /**
     * 设置英雄等级
     */
    setHeroLevel(level, showEyeCandy) {
        SetHeroLevel(this.handle, level, showEyeCandy);
    }
    /**
     * 设置英雄智力 [R]
     */
    setIntelligence(value, permanent) {
        SetHeroInt(this.handle, value, permanent);
    }
    /**
     * 限制物品的位置 (从商店)
     */
    setItemTypeSlots(slots) {
        SetItemTypeSlots(this.handle, slots);
    }
    /**
     * 改变单位所有者
     */
    setOwner(whichPlayer, changeColor) {
        SetUnitOwner(this.handle, whichPlayer.handle, changeColor);
    }
    /**
     * 设置碰撞 打开/关闭
     */
    setPathing(flag) {
        SetUnitPathing(this.handle, flag);
    }
    /**
     * 移动单位(立即)(指定坐标) [R]
     */
    setPosition(x, y) {
        SetUnitPosition(this.handle, x, y);
    }
    /**
     * 设置可否营救(对玩家) [R]
     */
    setRescuable(byWhichPlayer, flag) {
        SetUnitRescuable(this.handle, byWhichPlayer.handle, flag);
    }
    /**
     * 设置营救单位的营救距离
     */
    setRescueRange(range) {
        SetUnitRescueRange(this.handle, range);
    }
    /**
     * 改变单位尺寸(按倍数) [R]
     */
    setScale(scaleX, scaleY, scaleZ) {
        SetUnitScale(this.handle, scaleX, scaleY, scaleZ);
    }
    /**
     * 设置单位属性 [R]
     */
    setState(whichUnitState, newVal) {
        SetUnitState(this.handle, whichUnitState, newVal);
    }
    /**
     * 设置英雄力量 [R]
     */
    setStrength(value, permanent) {
        SetHeroStr(this.handle, value, permanent);
    }
    /**
     * 改变单位动画播放速度(按倍数) [R]
     */
    setTimeScale(timeScale) {
        SetUnitTimeScale(this.handle, timeScale);
    }
    // public setUnitAttackCooldown(cooldown: number, weaponIndex: number) {
    //     BlzSetUnitAttackCooldown(this.handle, cooldown, weaponIndex);
    // }
    /**
     * 限制单位的位置 (从商店)
     */
    setUnitTypeSlots(slots) {
        SetUnitTypeSlots(this.handle, slots);
    }
    /**
     * 设置建筑物 科技升级比
     */
    setUpgradeProgress(upgradePercentage) {
        UnitSetUpgradeProgress(this.handle, upgradePercentage);
    }
    /**
     * 设置单位小地图图标
     */
    setUseAltIcon(flag) {
        UnitSetUsesAltIcon(this.handle, flag);
    }
    /**
     * 允许/禁止 人口占用 [R]
     */
    setUseFood(useFood) {
        SetUnitUseFood(this.handle, useFood);
    }
    /**
     * 改变单位的颜色(RGB:0-255) [R]
     */
    setVertexColor(red, green, blue, alpha) {
        SetUnitVertexColor(this.handle, red, green, blue, alpha);
    }
    /**
     * 共享视野 [R]
     */
    shareVision(whichPlayer, share) {
        UnitShareVision(this.handle, whichPlayer.handle, share);
    }
    // public showTeamGlow(show: boolean) {
    //     BlzShowUnitTeamGlow(this.handle, show);
    // }
    // public startAbilityCooldown(abilCode: number, cooldown: number) {
    //     BlzStartUnitAbilityCooldown(this.handle, abilCode, cooldown);
    // }
    /**
     * 降低等级 [R]
     */
    stripLevels(howManyLevels) {
        return UnitStripHeroLevel(this.handle, howManyLevels);
    }
    /**
     * 暂停尸体腐烂 [R]
     */
    suspendDecay(suspend) {
        UnitSuspendDecay(this.handle, suspend);
    }
    /**
     * 允许/禁止经验获取 [R]
     */
    suspendExperience(flag) {
        SuspendHeroXP(this.handle, flag);
    }
    /**
     * 使用物品
     */
    useItem(whichItem) {
        return UnitUseItem(this.handle, whichItem.handle);
    }
    /**
     * 使用物品(指定坐标)
     */
    useItemAt(whichItem, x, y) {
        return UnitUseItemPoint(this.handle, whichItem.handle, x, y);
    }
    /**
     * 对单位使用物品
     */
    useItemTarget(whichItem, target) {
        return UnitUseItemTarget(this.handle, whichItem.handle, target.handle);
    }
    /**
     * 单位在睡眠
     */
    wakeUp() {
        UnitWakeUp(this.handle);
    }
    /**
     * 传送门目的地X坐标
     */
    waygateGetDestinationX() {
        return WaygateGetDestinationX(this.handle);
    }
    /**
     * 传送门目的地Y坐标
     */
    waygateGetDestinationY() {
        return WaygateGetDestinationY(this.handle);
    }
    /**
     * 设置传送门目的坐标 [R]
     */
    waygateSetDestination(x, y) {
        WaygateSetDestination(this.handle, x, y);
    }
    /**
     * 单位-类型 提供的人口
     */
    static foodMadeByType(unitId) {
        return GetFoodMade(unitId);
    }
    /**
     * 单位-类型 使用的人口
     */
    static foodUsedByType(unitId) {
        return GetFoodUsed(unitId);
    }
    /**
     * 选取的单位
     */
    static fromEnum() {
        return this.fromHandle(GetEnumUnit());
    }
    /**
     * 触发单位
     */
    static fromEvent() {
        return this.fromHandle(GetTriggerUnit());
    }
    /**指定单位*/
    static fromHandle(handle) {
        return this.getObject(handle, "+w3u");
    }
    /**
     * 单位-类型的 附加值
     */
    static getPointValueByType(unitType) {
        return GetUnitPointValueByType(unitType);
    }
    /**
     * 单位类型是英雄单位
     */
    static isUnitIdHero(unitId) {
        return IsHeroUnitId(unitId);
    }
    /**
     * 检查单位-类型 分类
     */
    static isUnitIdType(unitId, whichUnitType) {
        return IsUnitIdType(unitId, whichUnitType);
    }
}
