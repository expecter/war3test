import 开局选择英雄角色 from "state/基础/开局选择英雄角色";
import 技能书学习到QWER栏位 from "state/系统/技能书学习到QWER栏位";
import 怪物进攻 from "script/怪物进攻";
import 单位自动创建系统 from "state/系统/单位自动创建系统";
import 选择英雄 from "script/选择英雄";
import 选择技能 from "script/选择技能";
export default function StateInit() {

    new 单位自动创建系统();
    new 怪物进攻();
    new 选择英雄();
    new 选择技能();
    new 技能书学习到QWER栏位();
    new 开局选择英雄角色();
}