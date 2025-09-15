/**
 共计23种武器类型 可以自行对应这些类型到自己的设计的属性上
 */
var WeaponType;
(function (WeaponType) {
    //base
    /** */
    WeaponType[WeaponType["T0_WHOKNOWS"] = 0] = "T0_WHOKNOWS";
    /** */
    WeaponType[WeaponType["T1_METAL_LIGHT_CHOP"] = 1] = "T1_METAL_LIGHT_CHOP";
    /** */
    WeaponType[WeaponType["T2_METAL_MEDIUM_CHOP"] = 2] = "T2_METAL_MEDIUM_CHOP";
    /** */
    WeaponType[WeaponType["T3_METAL_HEAVY_CHOP"] = 3] = "T3_METAL_HEAVY_CHOP";
    /** */
    WeaponType[WeaponType["T4_METAL_LIGHT_SLICE"] = 4] = "T4_METAL_LIGHT_SLICE";
    /** */
    WeaponType[WeaponType["T5_METAL_MEDIUM_SLICE"] = 5] = "T5_METAL_MEDIUM_SLICE";
    /** */
    WeaponType[WeaponType["T6_METAL_HEAVY_SLICE"] = 6] = "T6_METAL_HEAVY_SLICE";
    /** */
    WeaponType[WeaponType["T7_METAL_MEDIUM_BASH"] = 7] = "T7_METAL_MEDIUM_BASH";
    /** */
    WeaponType[WeaponType["T8_METAL_HEAVY_BASH"] = 8] = "T8_METAL_HEAVY_BASH";
    /** */
    WeaponType[WeaponType["T9_METAL_MEDIUM_STAB"] = 9] = "T9_METAL_MEDIUM_STAB";
    /** */
    WeaponType[WeaponType["T10_METAL_HEAVY_STAB"] = 10] = "T10_METAL_HEAVY_STAB";
    /** */
    WeaponType[WeaponType["T11_WOOD_LIGHT_SLICE"] = 11] = "T11_WOOD_LIGHT_SLICE";
    /** */
    WeaponType[WeaponType["T12_WOOD_MEDIUM_SLICE"] = 12] = "T12_WOOD_MEDIUM_SLICE";
    /** */
    WeaponType[WeaponType["T13_WOOD_HEAVY_SLICE"] = 13] = "T13_WOOD_HEAVY_SLICE";
    /** */
    WeaponType[WeaponType["T14_WOOD_LIGHT_BASH"] = 14] = "T14_WOOD_LIGHT_BASH";
    /** */
    WeaponType[WeaponType["T15_WOOD_MEDIUM_BASH"] = 15] = "T15_WOOD_MEDIUM_BASH";
    /** */
    WeaponType[WeaponType["T16_WOOD_HEAVY_BASH"] = 16] = "T16_WOOD_HEAVY_BASH";
    /** */
    WeaponType[WeaponType["T17_WOOD_LIGHT_STAB"] = 17] = "T17_WOOD_LIGHT_STAB";
    /** */
    WeaponType[WeaponType["T18_WOOD_MEDIUM_STAB"] = 18] = "T18_WOOD_MEDIUM_STAB";
    /**原生不常见的*/
    WeaponType[WeaponType["T19_CLAW_LIGHT_SLICE"] = 19] = "T19_CLAW_LIGHT_SLICE";
    /**原生不常见的 */
    WeaponType[WeaponType["T20_CLAW_MEDIUM_SLICE"] = 20] = "T20_CLAW_MEDIUM_SLICE";
    /**原生不常见的*/
    WeaponType[WeaponType["T21_CLAW_HEAVY_SLICE"] = 21] = "T21_CLAW_HEAVY_SLICE";
    /** */
    WeaponType[WeaponType["T22_AXE_MEDIUM_CHOP"] = 22] = "T22_AXE_MEDIUM_CHOP";
    /** */
    WeaponType[WeaponType["T23_ROCK_HEAVY_BASH"] = 23] = "T23_ROCK_HEAVY_BASH";
})(WeaponType || (WeaponType = {}));
export default WeaponType;
