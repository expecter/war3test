import PlayerUtil from "@/PlayerUtil";
import DialogUtil from "@/DialogUtil";
import BaseUtil from "@/BaseUtil";
import RandomUtil from "@/RandomUtil";
import ObjectDataUtil from "@/ObjectDataUtil";

export default class 开局选择英雄角色 {

    static cfg: {
        unitIdWeights: { [单位id: string]: number }
        optionSize: number;//可选项
        freeRefreshCount: number;//默认初始免费刷新次数
        timeOut: number;//选择弹出时间
    } = {
        unitIdWeights: {},
        optionSize: 3,
        freeRefreshCount: 1,
        timeOut: 0.2
    }

    constructor() {
        BaseUtil.runLater(开局选择英雄角色.cfg.timeOut, () => {
            PlayerUtil.forPlayingPlayers(player => {

                开局选择英雄角色.showDialog(player)

            });
        })

    }

    static showDialog(player: player) {


        let buttonTexts = []

        let unitIds = RandomUtil.getRandomKeysByWeight(开局选择英雄角色.cfg.optionSize, 开局选择英雄角色.cfg.unitIdWeights);
        for (let i = 0; i < unitIds.length; i++) {
            buttonTexts.push(ObjectDataUtil.getUnitName(unitIds[i]))
        }
        let d = sd(player);
        d.开局选择英雄角色随机次数 = (d.开局选择英雄角色随机次数 || 0) + 1;
        if (d.开局选择英雄角色随机次数 <= 开局选择英雄角色.cfg.freeRefreshCount) {
            buttonTexts.push("【|cff00ff00重随|r】")
        }

        DialogUtil.show(GetPlayerId(player), "选择角色", (i, text) => {
            if (i == unitIds.length) {
                开局选择英雄角色.showDialog(player);
            } else {
                let loc = GetPlayerStartLocationLoc(player)
                let unit = CreateUnit(player, unitIds[i], GetLocationX(loc), GetLocationY(loc), 0);
                se.emit("选择英雄", unit)
                sd(player).hero = unit;
            }
        }, ...buttonTexts)
    }


}