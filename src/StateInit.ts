import 开局选择英雄角色 from "state/基础/开局选择英雄角色";
import 技能书学习到QWER栏位 from "state/系统/技能书学习到QWER栏位";
import SystemMonster from "system/monster/SystemMonster";
import 单位自动创建系统 from "state/系统/单位自动创建系统";
import SystemHero from "system/hero/SystemHero";
import SystemSkill from "system/skill/SystemSkill";
export default function StateInit() {

    new 单位自动创建系统();
    new SystemMonster();
    new SystemHero();
    new SystemSkill();
    new 技能书学习到QWER栏位();
    new 开局选择英雄角色();
}