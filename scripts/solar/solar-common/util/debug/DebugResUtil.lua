local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 23,["13"] = 24,["14"] = 25,["15"] = 23,["16"] = 29,["18"] = 30,["19"] = 31,["20"] = 29,["21"] = 3,["22"] = 3,["23"] = 3,["24"] = 3,["25"] = 3,["26"] = 3,["27"] = 3,["28"] = 11,["29"] = 11,["30"] = 11,["31"] = 11,["32"] = 11,["33"] = 11,["34"] = 11,["35"] = 19,["36"] = 20});
local ____exports = {}
____exports.default = __TS__Class()
local DebugResUtil = ____exports.default
DebugResUtil.name = "DebugResUtil"
function DebugResUtil.prototype.____constructor(self)
end
function DebugResUtil.getNextIconResPath(self)
    local ____exports_default_0, ____iconIndex_1 = ____exports.default, "iconIndex"
    ____exports_default_0[____iconIndex_1] = ____exports_default_0[____iconIndex_1] + 1
    return ____exports.default.icons[____exports.default.iconIndex % #____exports.default.icons + 1]
end
function DebugResUtil.getNextModelResPath(self)
    local ____exports_default_2, ____modelIndex_3 = ____exports.default, "modelIndex"
    ____exports_default_2[____modelIndex_3] = ____exports_default_2[____modelIndex_3] + 1
    return ____exports.default.models[____exports.default.modelIndex % #____exports.default.models + 1]
end
DebugResUtil.icons = {
    "ReplaceableTextures\\CommandButtons\\BTNOgre.blp",
    "ReplaceableTextures\\CommandButtons\\BTNPig.blp",
    "ReplaceableTextures\\CommandButtons\\BTNGoblinZeppelin.blp",
    "ReplaceableTextures\\CommandButtons\\BTNSpawningGrounds.blp",
    "ReplaceableTextures\\CommandButtons\\BTNAlleriaFlute.blp"
}
DebugResUtil.models = {
    "units\\creeps\\Ogre\\Ogre.mdx",
    "units\\critters\\Pig\\Pig.mdx",
    "units\\creeps\\GoblinZeppelin\\GoblinZeppelin.mdx",
    "buildings\\naga\\SpawningGrounds\\SpawningGrounds.mdx",
    "Objects\\InventoryItems\\TreasureChest\\treasurechest.mdx"
}
DebugResUtil.iconIndex = 0
DebugResUtil.modelIndex = 0
return ____exports
