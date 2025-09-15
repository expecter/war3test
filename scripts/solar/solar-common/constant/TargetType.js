/**
 转换目标允许
 */
var TargetType;
(function (TargetType) {
    /**地面*/ TargetType[TargetType["ground"] = 2] = "ground";
    /**空中*/ TargetType[TargetType["air"] = 4] = "air";
    /**建筑*/ TargetType[TargetType["structure"] = 8] = "structure";
    /**守卫*/ TargetType[TargetType["ward"] = 16] = "ward";
    /**物品*/ TargetType[TargetType["item"] = 32] = "item";
    /**树木*/ TargetType[TargetType["tree"] = 64] = "tree";
    /**墙*/ TargetType[TargetType["wall"] = 128] = "wall";
    /**残骸*/ TargetType[TargetType["debris"] = 256] = "debris";
    /**装饰物*/ TargetType[TargetType["decoration"] = 512] = "decoration";
    /**桥*/ TargetType[TargetType["bridge"] = 1024] = "bridge";
    //
    /**自己*/ TargetType[TargetType["self"] = 4096] = "self";
    /**玩家单位*/ TargetType[TargetType["player"] = 8192] = "player";
    /**联盟*/ TargetType[TargetType["allies"] = 16384] = "allies";
    /**中立*/ TargetType[TargetType["neutral"] = 32768] = "neutral";
    /**敌人*/ TargetType[TargetType["enemy"] = 65536] = "enemy";
    /**敌人*/ TargetType[TargetType["enemies"] = 65536] = "enemies";
    //
    /**可攻击的*/ TargetType[TargetType["vulnerable"] = 1048576] = "vulnerable";
    /**无敌*/ TargetType[TargetType["invulnerable"] = 2097152] = "invulnerable";
    /**英雄*/ TargetType[TargetType["hero"] = 4194304] = "hero";
    /**非-英雄*/ TargetType[TargetType["nonhero"] = 8388608] = "nonhero";
    /**存活*/ TargetType[TargetType["alive"] = 16777216] = "alive";
    /**死亡*/ TargetType[TargetType["dead"] = 33554432] = "dead";
    /**有机生物*/ TargetType[TargetType["organic"] = 67108864] = "organic";
    /**机械类*/ TargetType[TargetType["mechanical"] = 134217728] = "mechanical";
    /**非-自爆工兵*/ TargetType[TargetType["nonsapper"] = 268435456] = "nonsapper";
    /**自爆工兵*/ TargetType[TargetType["sapper"] = 536870912] = "sapper";
    /**非-古树*/ TargetType[TargetType["nonancient"] = 1073741824] = "nonancient";
    /**古树*/ TargetType[TargetType["ancient"] = 2147483648] = "ancient";
    //不确定的
    /**别人*/ TargetType[TargetType["notself"] = 2048] = "notself";
    /**地形*/ TargetType[TargetType["terrain"] = 131072] = "terrain";
    /**没有*/ TargetType[TargetType["none"] = 262144] = "none";
    /**友军单位*/ TargetType[TargetType["friend"] = 524288] = "friend";
})(TargetType || (TargetType = {}));
export default TargetType;
/**
 转换目标允许
 */
export var TargetCnType;
(function (TargetCnType) {
    TargetCnType[TargetCnType["\u5730\u9762"] = 2] = "\u5730\u9762";
    TargetCnType[TargetCnType["\u7A7A\u4E2D"] = 4] = "\u7A7A\u4E2D";
    TargetCnType[TargetCnType["\u5EFA\u7B51"] = 8] = "\u5EFA\u7B51";
    TargetCnType[TargetCnType["\u5B88\u536B"] = 16] = "\u5B88\u536B";
    TargetCnType[TargetCnType["\u7269\u54C1"] = 32] = "\u7269\u54C1";
    TargetCnType[TargetCnType["\u6811\u6728"] = 64] = "\u6811\u6728";
    TargetCnType[TargetCnType["\u5899"] = 128] = "\u5899";
    TargetCnType[TargetCnType["\u6B8B\u9AB8"] = 256] = "\u6B8B\u9AB8";
    TargetCnType[TargetCnType["\u88C5\u9970\u7269"] = 512] = "\u88C5\u9970\u7269";
    TargetCnType[TargetCnType["\u6865"] = 1024] = "\u6865";
    //
    TargetCnType[TargetCnType["\u81EA\u5DF1"] = 4096] = "\u81EA\u5DF1";
    TargetCnType[TargetCnType["\u73A9\u5BB6\u5355\u4F4D"] = 8192] = "\u73A9\u5BB6\u5355\u4F4D";
    TargetCnType[TargetCnType["\u8054\u76DF"] = 16384] = "\u8054\u76DF";
    TargetCnType[TargetCnType["\u4E2D\u7ACB"] = 32768] = "\u4E2D\u7ACB";
    TargetCnType[TargetCnType["\u654C\u4EBA"] = 65536] = "\u654C\u4EBA";
    //
    TargetCnType[TargetCnType["\u53EF\u653B\u51FB\u7684"] = 1048576] = "\u53EF\u653B\u51FB\u7684";
    TargetCnType[TargetCnType["\u65E0\u654C"] = 2097152] = "\u65E0\u654C";
    TargetCnType[TargetCnType["\u82F1\u96C4"] = 4194304] = "\u82F1\u96C4";
    TargetCnType[TargetCnType["\u975E\u82F1\u96C4"] = 8388608] = "\u975E\u82F1\u96C4";
    TargetCnType[TargetCnType["\u5B58\u6D3B"] = 16777216] = "\u5B58\u6D3B";
    TargetCnType[TargetCnType["\u6B7B\u4EA1"] = 33554432] = "\u6B7B\u4EA1";
    TargetCnType[TargetCnType["\u6709\u673A\u751F\u7269"] = 67108864] = "\u6709\u673A\u751F\u7269";
    TargetCnType[TargetCnType["\u673A\u68B0\u7C7B"] = 134217728] = "\u673A\u68B0\u7C7B";
    TargetCnType[TargetCnType["\u975E\u81EA\u7206\u5DE5\u5175"] = 268435456] = "\u975E\u81EA\u7206\u5DE5\u5175";
    TargetCnType[TargetCnType["\u81EA\u7206\u5DE5\u5175"] = 536870912] = "\u81EA\u7206\u5DE5\u5175";
    TargetCnType[TargetCnType["\u975E\u53E4\u6811"] = 1073741824] = "\u975E\u53E4\u6811";
    TargetCnType[TargetCnType["\u53E4\u6811"] = 2147483648] = "\u53E4\u6811";
    //不确定的
    TargetCnType[TargetCnType["\u522B\u4EBA"] = 2048] = "\u522B\u4EBA";
    TargetCnType[TargetCnType["\u5730\u5F62"] = 131072] = "\u5730\u5F62";
    TargetCnType[TargetCnType["\u6CA1\u6709"] = 262144] = "\u6CA1\u6709";
    TargetCnType[TargetCnType["\u53CB\u519B\u5355\u4F4D"] = 524288] = "\u53CB\u519B\u5355\u4F4D";
})(TargetCnType || (TargetCnType = {}));
/**无目标*/
export const TARGET_TYPE_NONE = 0;
/**单位目标*/
export const TARGET_TYPE_UNIT = 1;
/**点目标*/
export const TARGET_TYPE_POINT = 2;
/**单位或点*/
export const TARGET_TYPE_UNIT_OR_POINT = 3;
/**
 图标选项
 */
export var OptionType;
(function (OptionType) {
    /**图标可见*/ OptionType[OptionType["visible"] = 1] = "visible";
    /**目标选取图像*/ OptionType[OptionType["targimage"] = 2] = "targimage";
    /**物理魔法*/ OptionType[OptionType["physical"] = 4] = "physical";
    /**通用魔法*/ OptionType[OptionType["universal"] = 8] = "universal";
    /**单独释放*/ OptionType[OptionType["unique"] = 16] = "unique";
})(OptionType || (OptionType = {}));
