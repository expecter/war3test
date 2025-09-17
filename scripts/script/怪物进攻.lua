local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 8,["19"] = 8,["20"] = 8,["22"] = 10,["23"] = 10,["24"] = 10,["25"] = 11,["26"] = 12,["27"] = 12,["28"] = 12,["29"] = 12,["30"] = 12,["31"] = 12,["32"] = 12,["33"] = 12,["34"] = 13,["35"] = 10,["36"] = 10,["37"] = 15,["38"] = 9,["39"] = 19,["41"] = 20,["42"] = 20,["43"] = 21,["44"] = 22,["45"] = 23,["46"] = 24,["47"] = 25,["48"] = 25,["49"] = 25,["50"] = 26,["51"] = 27,["53"] = 25,["54"] = 25,["56"] = 20,["59"] = 19});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____RectUtil = require("solar.solar-common.util.game.RectUtil")
local RectUtil = ____RectUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____l__8FDB_653B_602A_8DEF_7EBF = require("_sl_editor.l_进攻怪路线")
local ____l__8FDB_653B_602A_8DEF_7EBF = ____l__8FDB_653B_602A_8DEF_7EBF["l_进攻怪路线"]
local _____8FDB_653B_602A_6F14_5458 = require("xlsx.敌人怪物.进攻怪演员")
local ____d__8FDB_653B_602A_6F14_5458 = _____8FDB_653B_602A_6F14_5458["d_进攻怪演员"]
____exports.default = __TS__Class()
local _____602A_7269_8FDB_653B = ____exports.default
_____602A_7269_8FDB_653B.name = "怪物进攻"
function _____602A_7269_8FDB_653B.prototype.____constructor(self)
    BaseUtil.onTimer(
        10,
        function(____, count)
            local element = ____d__8FDB_653B_602A_6F14_5458[count + 1]
            ActorUnitUtil:createActorUnit(
                Player(11),
                element.id,
                ____l__8FDB_653B_602A_8DEF_7EBF[1].x,
                ____l__8FDB_653B_602A_8DEF_7EBF[1].y,
                0,
                10
            )
            return true
        end
    )
    ____exports.default:Attack(____l__8FDB_653B_602A_8DEF_7EBF)
end
function _____602A_7269_8FDB_653B.Attack(self, line)
    do
        local i = 0
        while i < #line do
            local vector = line[i + 1]
            local vector2 = line[i + 1 + 1]
            local rect = RectUtil.createRect(vector.x, vector.y, 1000, 1000)
            if vector2 then
                se:onEnterRect(
                    rect,
                    function(e)
                        if e.trigUnitOwnerId > 9 then
                            UnitStateUtil:orderAttack(e.trigUnit, vector2.x, vector2.y)
                        end
                    end
                )
            end
            i = i + 1
        end
    end
end
return ____exports
