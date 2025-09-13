local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 4,["12"] = 4,["13"] = 4,["15"] = 4,["16"] = 4,["18"] = 4,["19"] = 4,["21"] = 5,["22"] = 6,["23"] = 7,["24"] = 8,["25"] = 9,["26"] = 10,["27"] = 11,["28"] = 12,["29"] = 4});
local ____exports = {}
____exports.default = __TS__Class()
local QuestUtil = ____exports.default
QuestUtil.name = "QuestUtil"
function QuestUtil.prototype.____constructor(self)
end
function QuestUtil.create(self, title, description, iconPath, required, discovered)
    if iconPath == nil then
        iconPath = "ReplaceableTextures\\CommandButtons\\BTNSpy.blp"
    end
    if required == nil then
        required = true
    end
    if discovered == nil then
        discovered = true
    end
    local quest = CreateQuest()
    QuestSetTitle(quest, title)
    QuestSetDescription(quest, description)
    QuestSetIconPath(quest, iconPath)
    QuestSetRequired(quest, required)
    QuestSetDiscovered(quest, discovered)
    QuestSetCompleted(quest, false)
    return quest
end
return ____exports
