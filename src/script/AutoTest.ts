import PlayerUtil from "@/PlayerUtil";
import RandomUtil from "@/RandomUtil";
import 开局选择英雄角色 from "state/基础/开局选择英雄角色";

export default class AutoTest{
    constructor(){
        this.autoSelectHero()
    }
    //自动选择英雄
    autoSelectHero(){
        PlayerUtil.forPlayingPlayers(player => {
            if (GetPlayerController(player) == MAP_CONTROL_USER) {
                let unitIds = RandomUtil.getRandomKeysByWeight(开局选择英雄角色.cfg.optionSize, 开局选择英雄角色.cfg.unitIdWeights);
                let loc = GetPlayerStartLocationLoc(player)
                let unit = CreateUnit(player, unitIds[0], GetLocationX(loc), GetLocationY(loc), 0);
                print("选择的英雄",GetPlayerId(player))
                se.emit("选择英雄", unit)
                sd(player).hero = unit;
            }
        })
        
    }
}