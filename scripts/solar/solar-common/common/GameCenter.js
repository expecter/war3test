/**
 * 游戏中心
 *
 * 用于管理游戏中的全局对象
 */
export default class GameCenter {
    static _sl_isInit = false;
    static _sl_allUnits = [];
    static _sl_tempGroup = null;
    static _sl_last_updateTime = 0;
    /**
     * 获取地图所有单位
     * (根据获取时间缓存)
     * (对数据实时性要求高的 realTime 请传true 以获得实时的全图单位)
     */
    static getAllUnits(realTime = false) {
        if (GameCenter._sl_isInit) {
            if (GameCenter._sl_last_updateTime != _g_time) {
                GameCenter.updateAllUnits();
            }
            else if (realTime) {
                GameCenter.updateAllUnits();
            }
            return GameCenter._sl_allUnits;
        }
        GameCenter.checkInit();
        return GameCenter._sl_allUnits;
    }
    static checkInit() {
        if (GameCenter._sl_isInit) {
            return;
        }
        GameCenter._sl_tempGroup = CreateGroup();
        let t = CreateTrigger();
        let r = CreateRegion();
        let world = GetWorldBounds();
        RegionAddRect(r, world);
        TriggerRegisterEnterRegion(t, r, null); //实时增量更新(创建单位与进入矩形区域还有一点延迟 延迟大概不会超过1毫秒)
        TriggerAddAction(t, () => {
            GameCenter._sl_allUnits.push(GetTriggerUnit());
        });
        let t2 = CreateTrigger();
        TriggerRegisterTimerEvent(t2, 1.97, true); //每2秒全量更新
        TriggerAddAction(t2, GameCenter.updateAllUnits);
        //
        GameCenter.updateAllUnits();
        GameCenter._sl_isInit = true;
    }
    /**
     * 250单位在i5-10400 2.9GHz cpu下 耗时大约 0.5毫秒
     */
    static updateAllUnits() {
        //
        let allUnits = [];
        for (let id = 0; id < 16; id++) {
            GroupEnumUnitsOfPlayer(GameCenter._sl_tempGroup, Player(id), null);
            for (let i = 0; i <= 1000000; i++) {
                let h = FirstOfGroup(GameCenter._sl_tempGroup);
                if (h == 0 || h == null) {
                    break;
                }
                allUnits.push(h);
                GroupRemoveUnit(GameCenter._sl_tempGroup, h);
            }
        }
        GameCenter._sl_allUnits = allUnits;
        GameCenter._sl_last_updateTime = _g_time;
    }
}
