/**
 共计32种伤害类型 可以自行对应这些类型到自己的设计的属性上
 */
var DamageType;
(function (DamageType) {
    //solar
    /**物理 会受到护甲减免*/
    DamageType[DamageType["s_\u7269\u7406"] = 4] = "s_\u7269\u7406";
    /**物理 不计护甲*/
    DamageType[DamageType["s_\u7269\u7406\u6280\u80FD"] = 5] = "s_\u7269\u7406\u6280\u80FD";
    /**不计护甲*/
    DamageType[DamageType["s_\u6CD5\u672F"] = 14] = "s_\u6CD5\u672F";
    DamageType[DamageType["s_\u771F\u5B9E\u4F24\u5BB3"] = 7] = "s_\u771F\u5B9E\u4F24\u5BB3";
    //base
    /**未知   */ DamageType[DamageType["T0_UNKNOWN"] = 0] = "T0_UNKNOWN";
    /**普通   会受到护甲减免*/ DamageType[DamageType["T4_NORMAL"] = 4] = "T4_NORMAL";
    /**强化   */ DamageType[DamageType["T5_ENHANCED"] = 5] = "T5_ENHANCED";
    /**火焰   */ DamageType[DamageType["T8_FIRE"] = 8] = "T8_FIRE";
    /**冰冻   */ DamageType[DamageType["T9_COLD"] = 9] = "T9_COLD";
    /**闪电   */ DamageType[DamageType["T10_LIGHTNING"] = 10] = "T10_LIGHTNING";
    /**毒药   */ DamageType[DamageType["T11_POISON"] = 11] = "T11_POISON";
    /**疾病   */ DamageType[DamageType["T12_DISEASE"] = 12] = "T12_DISEASE";
    /**神圣   */ DamageType[DamageType["T13_DIVINE"] = 13] = "T13_DIVINE";
    /**魔法   */ DamageType[DamageType["T14_MAGIC"] = 14] = "T14_MAGIC";
    /**音速   */ DamageType[DamageType["T15_SONIC"] = 15] = "T15_SONIC";
    /**酸性   */ DamageType[DamageType["T16_ACID"] = 16] = "T16_ACID";
    /**力量   */ DamageType[DamageType["T17_FORCE"] = 17] = "T17_FORCE";
    /**死亡   */ DamageType[DamageType["T18_DEATH"] = 18] = "T18_DEATH";
    /**精神   */ DamageType[DamageType["T19_MIND"] = 19] = "T19_MIND";
    /**植物   */ DamageType[DamageType["T20_PLANT"] = 20] = "T20_PLANT";
    /**防御   */ DamageType[DamageType["T21_DEFENSIVE"] = 21] = "T21_DEFENSIVE";
    /**破坏   */ DamageType[DamageType["T22_DEMOLITION"] = 22] = "T22_DEMOLITION";
    /**慢性毒药*/ DamageType[DamageType["T23_SLOW_POISON"] = 23] = "T23_SLOW_POISON";
    /**灵魂锁链*/ DamageType[DamageType["T24_SPIRIT_LINK"] = 24] = "T24_SPIRIT_LINK";
    /**暗影突袭*/ DamageType[DamageType["T25_SHADOW_STRIKE"] = 25] = "T25_SHADOW_STRIKE";
    /**通用   */ DamageType[DamageType["T26_UNIVERSAL"] = 26] = "T26_UNIVERSAL";
    //solar addon
    /**自定义伤害类型 */ DamageType[DamageType["T1_C"] = 1] = "T1_C";
    /**自定义伤害类型 */ DamageType[DamageType["T2_C"] = 2] = "T2_C";
    /**自定义伤害类型 */ DamageType[DamageType["T3_C"] = 3] = "T3_C";
    /**自定义伤害类型 */ DamageType[DamageType["T6_C"] = 6] = "T6_C";
    /**自定义伤害类型 */ DamageType[DamageType["T7_C"] = 7] = "T7_C";
    /**自定义伤害类型 */ DamageType[DamageType["T27_C"] = 27] = "T27_C";
    /**自定义伤害类型 */ DamageType[DamageType["T28_C"] = 28] = "T28_C";
    /**自定义伤害类型 */ DamageType[DamageType["T29_C"] = 29] = "T29_C";
    /**自定义伤害类型 */ DamageType[DamageType["T30_C"] = 30] = "T30_C";
    /**自定义伤害类型 */ DamageType[DamageType["T31_C"] = 31] = "T31_C";
})(DamageType || (DamageType = {}));
export default DamageType;
