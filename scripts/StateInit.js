import 开局选择英雄角色 from "state/基础/开局选择英雄角色";
import 单位自动创建系统 from "state/系统/单位自动创建系统";
export default function StateInit() {
    new 单位自动创建系统();
    new 开局选择英雄角色();
}
