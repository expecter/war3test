import BaseUtil from "@/BaseUtil";
import DialogUtil from "@/DialogUtil";
import ObjectDataUtil from "@/ObjectDataUtil";
import PlayerUtil from "@/PlayerUtil";
import RandomUtil from "@/RandomUtil";

export default class 选择英雄{
    
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

    constructor(){
        BaseUtil.runLater(选择英雄.cfg.timeOut, () => {
            PlayerUtil.forPlayingPlayers(player => {
                if(GetPlayerController(player) == MAP_CONTROL_USER){
                    选择英雄.showDialog(player)
                }
            });
        })
    }

    static showDialog(player: player) {
        let buttonTexts = []

        let unitIds = RandomUtil.getRandomKeysByWeight(选择英雄.cfg.optionSize, 选择英雄.cfg.unitIdWeights);
        for (let i = 0; i < unitIds.length; i++) {
            buttonTexts.push(ObjectDataUtil.getUnitName(unitIds[i]))
        }
        let d = sd(player);
        d.开局选择英雄角色随机次数 = (d.开局选择英雄角色随机次数 || 0) + 1;
        if (d.开局选择英雄角色随机次数 <= 选择英雄.cfg.freeRefreshCount) {
            buttonTexts.push("【|cff00ff00重随|r】")
        }
        if(isAuto){
            选择英雄.SelectHero(player,unitIds[0])
        }else{
            DialogUtil.show(GetPlayerId(player), "选择角色", (i, text) => {
                if (i == unitIds.length) {
                    选择英雄.showDialog(player);
                } else {
                    选择英雄.SelectHero(player,unitIds[i])
                }
            }, ...buttonTexts)
        }
    }

    static SelectHero(player:player,key:string){
        let loc = GetPlayerStartLocationLoc(player)
        let unit = CreateUnit(player, key, GetLocationX(loc), GetLocationY(loc), 0);
        se.emit("选择英雄", unit)
        sd(player).hero = unit;
    }
}