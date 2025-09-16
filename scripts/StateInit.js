import AutoTest from "script/AutoTest";
import 怪物自动进攻 from "script/怪物自动进攻";
import 开局选择英雄角色 from "state/基础/开局选择英雄角色";
import 单位自动创建系统 from "state/系统/单位自动创建系统";
export default function StateInit() {
    new 单位自动创建系统();
    new 怪物自动进攻();
    if (isDebug) {
        new AutoTest();
    }
    else {
        new 开局选择英雄角色();
    }
}
