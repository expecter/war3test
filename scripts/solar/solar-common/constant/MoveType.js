var MoveType;
(function (MoveType) {
    /**没有， 无视碰撞 */ MoveType[MoveType["none"] = 0] = "none";
    /**无法移动 */ MoveType[MoveType["nomove"] = 1] = "nomove";
    /**步行， 地面碰撞跟寻路  */ MoveType[MoveType["foot"] = 2] = "foot";
    /**飞行  具有飞行视野，寻路能穿越树木跟悬崖，可以直接设置飞行高度 不用乌鸦形态了 */ MoveType[MoveType["fly"] = 4] = "fly";
    /**地雷  */ MoveType[MoveType["dilei"] = 8] = "dilei";
    /**疾风步  */ MoveType[MoveType["jifengbu"] = 16] = "jifengbu";
    /**未知  */ MoveType[MoveType["weizhi"] = 32] = "weizhi";
    /**漂浮 只能在深水里活动 不能在地面活动 */ MoveType[MoveType["float"] = 64] = "float";
    /**骑马  */ MoveType[MoveType["horse"] = 2] = "horse";
    /**浮空  不会踩中地雷 */ MoveType[MoveType["hover"] = 8] = "hover";
    /**两栖 */ MoveType[MoveType["amph"] = 128] = "amph";
    /**未知 自己测试 */ MoveType[MoveType["unbuild"] = 32] = "unbuild";
    //
    MoveType[MoveType["\u6CA1\u6709"] = 0] = "\u6CA1\u6709";
    MoveType[MoveType["\u65E0\u6CD5\u79FB\u52A8"] = 1] = "\u65E0\u6CD5\u79FB\u52A8";
    MoveType[MoveType["\u6B65\u884C"] = 2] = "\u6B65\u884C";
    MoveType[MoveType["\u98DE\u884C"] = 4] = "\u98DE\u884C";
    MoveType[MoveType["\u5730\u96F7"] = 8] = "\u5730\u96F7";
    MoveType[MoveType["\u75BE\u98CE\u6B65"] = 16] = "\u75BE\u98CE\u6B65";
    MoveType[MoveType["\u672A\u77E5"] = 32] = "\u672A\u77E5";
    MoveType[MoveType["\u6F02\u6D6E"] = 64] = "\u6F02\u6D6E";
    MoveType[MoveType["\u9A91\u9A6C"] = 2] = "\u9A91\u9A6C";
    MoveType[MoveType["\u6D6E\u7A7A"] = 8] = "\u6D6E\u7A7A";
    MoveType[MoveType["\u4E24\u6816"] = 128] = "\u4E24\u6816";
})(MoveType || (MoveType = {}));
export default MoveType;
