/** @noSelfInFile **/
/**
 * 设置加速倍率
 */
declare function DzSetSpeed(value: number): void;

/**
 * 刷新小地图
 */
declare function DzUpdateMinimap(): void;

/**
 * 修改单位alpha
 */
declare function DzUnitChangeAlpha(whichUnit: unit, alpha: number, forceUpdate: boolean): void;

/**
 * 沉默单位-禁用技能
 */
declare function DzUnitSilence(whichUnit: unit, disable: boolean): void;

/**
 * 禁用攻击
 */
declare function DzUnitDisableAttack(whichUnit: unit, disable: boolean): void;

/**
 * 禁用道具
 */
declare function DzUnitDisableInventory(whichUnit: unit, disable: boolean): void;

/**
 * 设置单位是否可以选中
 */
declare function DzUnitSetCanSelect(whichUnit: unit, state: boolean): void;

/**
 * 修改单位是否可以被设置为目标
 */
declare function DzUnitSetTargetable(whichUnit: unit, state: boolean): void;

/**
 * 保存内存数据
 */
declare function DzSaveMemoryCache(cache: string): void;

/**
 * 读取内存数据
 */
declare function DzGetMemoryCache(): string;


/**
 * 转换世界坐标为屏幕坐标-异步
 */
declare function DzConvertWorldPosition(x: number, y: number, z: number, callback: () => void): boolean;

/**
 * 转换世界坐标为屏幕坐标-获取转换后的X坐标
 */
declare function DzGetConvertWorldPositionX(): number;

/**
 * 转换世界坐标为屏幕坐标-获取转换后的Y坐标
 */
declare function DzGetConvertWorldPositionY(): number;

/**
 * 创建command button
 */
declare function DzCreateCommandButton(parent: number, icon: string, name: string, desc: string): number;

/**
 * 打开QQ群链接
 */
declare function DzOpenQQGroupUrl(url: string): boolean;

/**
 * 获取当前选择的单位
 */
declare function DzGetSelectedLeaderUnit(): unit;

/**
 * 聊天框是否打开
 */
declare function DzIsChatBoxOpen(): boolean;

/**
 * 获取子控件数量
 */
declare function DzFrameGetChildrenCount(frame: number): number;

/**
 * 获取子控件
 */
declare function DzFrameGetChild(frame: number, index: number): number;

/**
 * 获取框选控件
 */
declare function DzFrameGetInfoPanelSelectButton(index: number): number;

/**
 * 获取BUFF控件
 */
declare function DzFrameGetInfoPanelBuffButton(index: number): number;

/**
 * 获取农民控件
 */
declare function DzFrameGetPeonBar(): number;

/**
 * 获取技能右下角数字文本控件
 */
declare function DzFrameGetCommandBarButtonNumberText(frame: number): number;

/**
 * 获取技能右下角数字文本框体
 */
declare function DzFrameGetCommandBarButtonNumberOverlay(frame: number): number;

/**
 * 获取技能冷却指示器
 */
declare function DzFrameGetCommandBarButtonCooldownIndicator(frame: number): number;

/**
 * 获取技能自动施法指示器
 */
declare function DzFrameGetCommandBarButtonAutoCastIndicator(frame: number): number;

/**
 * 转换地图坐标为小地图x坐标
 */
declare function DzFrameWorldToMinimapPosX(x: number, y: number): number;

/**
 * 转换地图坐标为小地图y坐标
 */
declare function DzFrameWorldToMinimapPosY(x: number, y: number): number;

/**
 * 游戏提示信息界面
 */
declare function DzFrameGetWorldFrameMessage(): number;

/**
 * 转换世界坐标为屏幕x坐标
 */
declare function DzConvertWorldPositionX(x: number, y: number, z: number): number;

/**
 * 转换世界坐标为屏幕y坐标
 */
declare function DzConvertWorldPositionY(x: number, y: number, z: number): number;

/**
 * 转换世界坐标为屏幕深度
 */
declare function DzConvertWorldPositionDepth(x: number, y: number, z: number): number;

/**
 * 转换屏幕坐标到世界x坐标
 */
declare function DzConvertScreenPositionX(x: number, y: number): number;

/**
 * 转换屏幕坐标到世界y坐标
 */
declare function DzConvertScreenPositionY(x: number, y: number): number;

/**
 * 获取特效颜色
 */
declare function DzGetEffectVertexColor(whichEffect: effect): number;

/**
 * 获取特效透明度
 */
declare function DzGetEffectVertexAlpha(whichEffect: effect): number;

/**
 * 获取物品技能
 * (PS:与内置的GetItemAbility返回不一样 内置的返回为300以下  这个返回的是100000以上的数字)
 */
declare function DzGetItemAbility(whichItem: item, index: number): ability;

/**
 * 获取商店目标
 */
declare function DzGetActivePatron(store: unit, p: player): unit;

/**
 * 获取玩家选中的单位数量
 */
declare function DzGetLocalSelectUnitCount(): number;

/**
 * 获取玩家选中的单位
 */
declare function DzGetLocalSelectUnit(index: number): unit;

/**
 * 获取字符串数量
 */
declare function DzGetJassStringTableCount(): number;

/**
 * 获取 FPS 帧数
 */
declare function DzGetFPS(): number;

/**
 * 获取建造的命令id
 */
declare function DzGetOnBuildOrderId(): number;

/**
 * 获取建造的命令类型
 */
declare function DzGetOnBuildOrderType(): number;

/**
 * 获取预建造对象
 */
declare function DzGetOnBuildAgent(): widget;

/**
 * 获取监听到的技能
 */
declare function DzGetOnTargetAbilId(): number;

/**
 * 获取监听到技能预选命令
 */
declare function DzGetOnTargetOrderId(): number;

/**
 * 获取监听到技能预选命令类型
 */
declare function DzGetOnTargetOrderType(): number;

/**
 * 获取监听到技能预选目标
 */
declare function DzGetOnTargetAgent(): widget;

/**
 * 获取监听到技能预选目标
 */
declare function DzGetOnTargetInstantTarget(): widget;

/**
 * 设置单位的鼠标指向UI和血条显示/隐藏
 */
declare function DzSetUnitPreselectUIVisible(whichUnit: handle, visible: boolean): void;

/**
 * 设置特效播放动画
 */
declare function DzSetEffectAnimation(whichEffect: effect, index: number, flag: number): void;

/**
 * 设置特效播放动画
 */
declare function DzPlayEffectAnimation(whichEffect: effect, anim: string, link: string): void;

/**
 * 绑定特效
 */
declare function DzBindEffect(parent: widget, attachPoint: string, whichEffect: effect): void;

/**
 * 解除绑定特效
 */
declare function DzUnbindEffect(whichEffect: effect): void;

/**
 * 单位缩放
 */
declare function DzSetWidgetSpriteScale(whichUnit: widget, scale: number): void;

/**
 * 特效缩放
 */
declare function DzSetEffectScale(whichHandle: effect, scale: number): void;

/**
 * 设置特效坐标
 */
declare function DzSetEffectPos(whichEffect: effect, x: number, y: number, z: number): void;

/**
 * 设置特效颜色
 */
declare function DzSetEffectVertexColor(whichEffect: effect, color: number): void;

/**
 * 设置特效透明度
 */
declare function DzSetEffectVertexAlpha(whichEffect: effect, alpha: number): void;

/**
 * 设置控件视口
 */
declare function DzFrameSetClip(frame: number, enable: boolean): void;

/**
 * 设置魔兽窗口大小
 */
declare function DzChangeWindowSize(width: number, height: number): boolean;

/**
 * 解锁BLP像素限制
 */
declare function DzUnlockBlpSizeLimit(enable: boolean): void;

/**
 * 设置FPS显示/隐藏
 */
declare function DzToggleFPS(show: boolean): void;

/**
 * 清除模型内存缓存
 */
declare function DzModelRemoveFromCache(path: string): void;

/**
 * 清除所有模型内存缓存
 */
declare function DzModelRemoveAllFromCache(): void;

/**
 * 自定义指定单位的小地图图标
 */
declare function DzWidgetSetMinimapIcon(whichunit: unit, path: string): void;

/**
 * 开启/关闭自定义指定单位的小地图图标
 */
declare function DzWidgetSetMinimapIconEnable(whichunit: unit, enable: boolean): void;

/**
 * 显示游戏提示信息
 */
declare function DzSimpleMessageFrameAddMessage(frame: number, text: string, color: number, duration: number, permanent: boolean): void;

/**
 * 清理游戏提示信息
 */
declare function DzSimpleMessageFrameClear(frame: number): void;

/**
 * 监听建筑选位置
 */
declare function DzRegisterOnBuildLocal(func: () => void): void;

/**
 * 监听技能选目标
 */
declare function DzRegisterOnTargetLocal(func: () => void): void;

/**
 * 解除界面位置限制
 */
declare function DzFrameEnableClipRect(enable: boolean): void;

/**
 * 设置移动类型 物编完全效果 ExSetUnitMoveType设置不完全 部分判断使用时还是旧物编填的类型
 */
declare function DzSetUnitMoveType(unit: unit, moveType: string): void;


declare function DzSetUnitName(whichUnit: unit, name: string): void;

declare function DzSetUnitPortrait(whichUnit: unit, modelFile: string): void;

declare function DzSetUnitDescription(whichUnit: unit, value: string): void;

declare function DzSetUnitMissileArc(whichUnit: unit, arc: number): void;

declare function DzSetUnitMissileModel(whichUnit: unit, modelFile: string): void;

declare function DzSetUnitProperName(whichUnit: unit, name: string): void;

declare function DzSetUnitMissileHoming(whichUnit: unit, enable: boolean): void;

declare function DzSetUnitMissileSpeed(whichUnit: unit, speed: number): void;

declare function DzSetEffectVisible(whichHandle: effect, enable: boolean): void;

declare function DzReviveUnit(whichUnit: unit, whichPlayer: player, hp: number, mp: number, x: number, y: number): void;

declare function DzGetAttackAbility(whichUnit: unit): ability;

declare function DzAttackAbilityEndCooldown(whichHandle: ability): void;

/** 获取玩家平台ID 返回32位的字符串 */
declare function KKApiPlayerGUID(p: player): string;

/** 获取玩家 在自定义排行榜 上榜的排名 */
declare function DzAPI_Map_CommentTotalCount1(whichPlayer: player, id: number): number;

/** 获取自定义排行榜 上榜的玩家数 */
declare function DzAPI_Map_CustomRankCount(rankKey: number): number;

/** 获取自定义排行榜 指定排名的 玩家名 rankKey = 1-9   index= 0-100 */
declare function DzAPI_Map_CustomRankPlayerName(rankKey: number, index: number): string;

/** 获取自定义排行榜 指定排名的 数值 rankKey = 1-9   index= 0-100 */
declare function DzAPI_Map_CustomRankValue(rankKey: number, index: number): number;

// BeginBatchSaveArchive,  // 开始批量保存存档
declare function KKApiBeginBatchSaveArchive(whichPlayer: player): boolean;

// AddBatchSaveArchive,    // 添加批量保存存档条目
/**
 *
 * @param whichPlayer
 * @param key
 * @param value
 * @param caseInsensitive 是否区分大小写
 * @constructor
 */
declare function KKApiAddBatchSaveArchive(whichPlayer: player, key: string, value: string, caseInsensitive: boolean): boolean;

// EndBatchSaveArchive,    // 结束批量保存存档
/**
 *
 * @param whichPlayer
 * @param abandon true=放弃本次上传，并清空条目，false=上报批量结果，并清空条目。
 * @constructor
 */
declare function KKApiEndBatchSaveArchive(whichPlayer: player, abandon: boolean): boolean;

/**
 * 设置单位技能的 启用/禁用(暗图标)  隐藏图标
 * @param ability see DzUnitFindAbility
 * @param enable
 * @param hideIcon
 * @constructor
 */
declare function DzAbilitySetEnable(ability: ability, enable: boolean, hideIcon: boolean): boolean;

declare function DzUnitFindAbility(u: unit, abilityID: number): ability;


declare function DzDoodadCreate(id: number, val: number, x: number, y: number, z: number, rotate: number, scale: number): number;

declare function DzDoodadGetTypeId(doodad: number): number;

declare function DzDoodadSetModel(doodad: number, modelFile: string): void;

declare function DzDoodadSetTeamColor(doodad: number, color: number): void;

declare function DzDoodadSetColor(doodad: number, color: number): void;

declare function DzDoodadGetX(doodad: number): number;

declare function DzDoodadGetY(doodad: number): number;

declare function DzDoodadGetZ(doodad: number): number;

declare function DzDoodadSetPosition(doodad: number, x: number, y: number, z: number): void;

declare function DzDoodadSetOrientMatrixRotate(doodad: number, angle: number, axisX: number, axisY: number, axisZ: number): void;

declare function DzDoodadSetOrientMatrixScale(doodad: number, x: number, y: number, z: number): void;

declare function DzDoodadSetOrientMatrixResize(doodad: number): void;

declare function DzDoodadSetVisible(doodad: number, enable: boolean): void;

declare function DzDoodadSetAnimation(doodad: number, animName: string, animRandom: boolean): void;

declare function DzDoodadSetTimeScale(doodad: number, scale: number): void;

declare function DzDoodadGetTimeScale(doodad: number): number;

declare function DzDoodadGetCurrentAnimationIndex(doodad: number): number;

declare function DzDoodadGetAnimationCount(doodad: number): number;

declare function DzDoodadGetAnimationName(doodad: number, index: number): string;

declare function DzDoodadGetAnimationTime(doodad: number, index: number): number;

// 查找单位技能
declare function DzUnitFindAbility(whichUnit: unit, abilcode: number): ability;

// 修改技能数据-字符串
declare function DzAbilitySetStringData(whichAbility: ability, key: string, value: string): void;

// 启用/禁用技能
declare function DzAbilitySetEnable(whichAbility: ability, enable: boolean, hideUI: boolean): void;

// 设置单位移动类型
declare function DzUnitSetMoveType(whichUnit: unit, moveType: string): void;

// 获取控件宽度
declare function DzFrameGetWidth(frame: number): number;

declare function DzFrameSetAnimateByIndex(frame: number, index: number, flag: number): void;

declare function DzSetUnitDataCacheInteger(uid: number, id: number, index: number, v: number): void;

declare function DzUnitUIAddLevelArrayInteger(uid: number, id: number, lv: number, v: number): void;


// GetLotteryUsedCount, // 获取宝箱抽取次数
/**
 *
 * @param whichPlayer
 * @param index 0=第一个宝箱（默认宝箱），1=第二个宝箱，2=第三个宝箱
 * @constructor
 */
declare function DzAPI_Map_GetLotteryUsedCountEx(whichPlayer: player, index: number): number;

/**
 * 获取所有宝箱抽取次数
 * @param whichPlayer
 * @constructor
 */
declare function DzAPI_Map_GetLotteryUsedCount(whichPlayer: player): number;


declare function KKApiRequestBackendLogic(whichPlayer: player, key: string, groupkey: string): boolean;

declare function KKApiCheckBackendLogicExists(whichPlayer: player, key: string): boolean;

declare function KKApiGetBackendLogicIntResult(whichPlayer: player, key: string): number;

declare function KKApiGetBackendLogicUpdateTime(whichPlayer: player, key: string): number;

declare function KKApiGetBackendLogicGroup(whichPlayer: player, key: string): string;

declare function DzSetUnitTypeName(uid: number, name: string): void;

declare function DzItemSetModel(item: item, model: string): void;

declare function DzItemSetPortrait(item: item, model: string): void;

declare function DzItemSetVertexColor(item: item, color: number): void;