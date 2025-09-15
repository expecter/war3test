import 开局选择英雄角色 from "xlsx/系统/开局选择英雄角色";
import 选择单位类型池 from "xlsx/系统/选择单位类型池";
import 单位自动创建系统 from "xlsx/系统/单位自动创建系统";
export default function StateConfigInit() {
    单位自动创建系统();
    选择单位类型池();
    开局选择英雄角色();
}
