import 技能书学习到QWER栏位 from "state/系统/技能书学习到QWER栏位";
import AutoTest from "script/AutoTest";
import 怪物进攻 from "script/怪物进攻";
import 单位自动创建系统 from "state/系统/单位自动创建系统";
import 选择英雄 from "script/选择英雄";
export default function StateInit() {

    new 单位自动创建系统();
    new 怪物进攻()
    new 选择英雄();
    new 技能书学习到QWER栏位();
}