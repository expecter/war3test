import BaseUtil from "@/BaseUtil";
import VectorUtil from "@/VectorUtil";
import RandomUtil from "@/RandomUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import ActorItemUtil from "@/ActorItemUtil";
import RectUtil from "@/RectUtil";
import PlayerUtil from "@/PlayerUtil";
import TextUtil from "@/TextUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import ObjectDataUtil from "@/ObjectDataUtil";
export default class 单位自动创建系统 {
    static config = [];
    //给敌人创建名字漂浮
    static isCreateEnemyNameTextTagOnLoc = true;
    //靠近创建范围
    static nearCreateRange = 1000;
    constructor() {
        //
        BaseUtil.runLater(1.1, () => {
            for (let cfg of 单位自动创建系统.config) {
                单位自动创建系统.doWork(cfg);
            }
        });
    }
    static doWork(cfg) {
        //立即创建
        if (cfg.creationTime != null) {
            if (cfg.creationTime == 0) {
                单位自动创建系统.立即创建单位(cfg);
            }
            else {
                BaseUtil.runLater(cfg.creationTime, () => {
                    单位自动创建系统.立即创建单位(cfg);
                });
            }
        }
        else {
            //靠近创建
            let loc = VectorUtil.getVector(cfg.loc);
            let size = (cfg.area || 300) + 单位自动创建系统.nearCreateRange;
            let rect = RectUtil.createRect(loc.x, loc.y, size * 2, size * 2);
            se.onEnterRect(rect, (e, solarTrigger) => {
                if (PlayerUtil.isUser(e.trigUnitOwner)) {
                    单位自动创建系统.立即创建单位(cfg);
                    solarTrigger.destroy();
                }
            });
        }
    }
    static 立即创建单位(cfg) {
        //获取位置
        let loc = VectorUtil.getVector(cfg.loc);
        if (loc == null) {
            print("单位自动创建系统:位置不存在" + tostring(cfg.id) + "[" + tostring(cfg.loc) + "]");
            print_r(cfg);
            return;
        }
        //开始创建
        let player = null;
        if (cfg.owner) {
            player = Player(cfg.owner);
        }
        if (单位自动创建系统.isCreateEnemyNameTextTagOnLoc && IsPlayerEnemy(PlayerUtil.firstOfUsers(), player)) {
            let actorType = ActorTypeUtil.getActorType(cfg.unitId);
            let text = actorType?.name || actorType?.id;
            if (!text) {
                text = ObjectDataUtil.getUnitName(cfg.unitId);
            }
            单位自动创建系统.createTextTag(loc, text);
        }
        let count = cfg.count || 1;
        for (let i = 0; i < count; i++) {
            let x = loc.x;
            let y = loc.y;
            if (cfg.area != null) {
                x += RandomUtil.nextInt(-cfg.area, cfg.area);
                y += RandomUtil.nextInt(-cfg.area, cfg.area);
            }
            if (cfg.unitId) {
                let face = 270;
                if (i > 0) {
                    face = RandomUtil.nextInt(0, 360);
                }
                let unit = ActorUnitUtil.createUnit(player, cfg.unitId, x, y, face);
                //有复活
                if (cfg.reviveTime) {
                    let actorUnit = ActorUnitUtil.getActorUnit(unit);
                    if (actorUnit == null) {
                        print("非演员单位不支持使用此系统复活参数！");
                    }
                    单位自动创建系统.setOnUnitDeath(actorUnit, cfg.reviveTime, player, cfg.unitId, x, y);
                }
            }
            if (cfg.itemId) {
                let item = ActorItemUtil.createItem(cfg.itemId, x, y, player);
                //有复活
                if (cfg.reviveTime) {
                    let actorItem = ActorItemUtil.getActorItem(item);
                    if (actorItem == null) {
                        print("非演员物品不支持使用此系统复活参数！");
                    }
                    单位自动创建系统.setOnDestroy(actorItem, cfg.reviveTime, player, cfg.itemId, x, y);
                }
            }
        }
    }
    static setOnUnitDeath(actorUnit, reviveTime, player, unitId, x, y) {
        actorUnit.set("onUnitDeath", (actor, killingUnit) => {
            BaseUtil.runLater(reviveTime, () => {
                let temp = ActorUnitUtil.createActorUnit(player, unitId, x, y);
                单位自动创建系统.setOnUnitDeath(temp, reviveTime, player, unitId, x, y);
            });
        });
    }
    static setOnDestroy(actorUnit, reviveTime, player, itemId, x, y) {
        actorUnit.set("onDestroy", (actor) => {
            BaseUtil.runLater(reviveTime, () => {
                let temp = ActorItemUtil.createActorItem(itemId, x, y, player);
                单位自动创建系统.setOnDestroy(temp, reviveTime, player, itemId, x, y);
            });
        });
    }
    static createTextTag(loc, text) {
        let textTagHandle = CreateTextTag();
        SetTextTagColor(textTagHandle, 255, 20, 20, 255);
        let fontSize = 10 * 0.0023;
        text = TextUtil.removeColors(text);
        SetTextTagText(textTagHandle, text, fontSize);
        SetTextTagPos(textTagHandle, loc.x - (text.length / 2 * 15), loc.y, 220);
        SetTextTagPermanent(textTagHandle, true);
        //
        return textTagHandle;
    }
}
