local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 13,["21"] = 13,["22"] = 13,["24"] = 13,["25"] = 28,["26"] = 28,["27"] = 28,["29"] = 28,["30"] = 28,["32"] = 29,["33"] = 29,["35"] = 29,["36"] = 29,["38"] = 30,["39"] = 31,["40"] = 32,["41"] = 33,["42"] = 34,["43"] = 35,["45"] = 37,["46"] = 38,["47"] = 39,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 42,["53"] = 43,["54"] = 44,["55"] = 45,["56"] = 46,["57"] = 47,["58"] = 48,["61"] = 51,["62"] = 52,["63"] = 53,["64"] = 54,["67"] = 57,["68"] = 58,["69"] = 58,["70"] = 58,["71"] = 58,["72"] = 60,["75"] = 63,["76"] = 64,["77"] = 65,["78"] = 65,["80"] = 58,["81"] = 58,["82"] = 58,["83"] = 58,["85"] = 69,["86"] = 70,["87"] = 71,["88"] = 72,["90"] = 74,["91"] = 75,["93"] = 77,["95"] = 79,["96"] = 41,["97"] = 41,["98"] = 28,["99"] = 88,["100"] = 89,["101"] = 88,["102"] = 100,["103"] = 100,["104"] = 100,["106"] = 100,["107"] = 100,["109"] = 101,["110"] = 102,["111"] = 103,["112"] = 104,["113"] = 106,["114"] = 107,["115"] = 108,["117"] = 110,["118"] = 110,["119"] = 110,["120"] = 111,["121"] = 112,["122"] = 114,["123"] = 115,["124"] = 116,["125"] = 117,["128"] = 120,["129"] = 121,["130"] = 122,["131"] = 122,["133"] = 123,["135"] = 125,["136"] = 110,["137"] = 110,["138"] = 100});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____GroupUtil = require("solar.solar-common.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____DamageUtil = require("solar.solar-common.util.system.DamageUtil")
local DamageUtil = ____DamageUtil.default
local ____RectUtil = require("solar.solar-common.util.game.RectUtil")
local RectUtil = ____RectUtil.default
____exports.default = __TS__Class()
local LeapUtil = ____exports.default
LeapUtil.name = "LeapUtil"
function LeapUtil.prototype.____constructor(self)
end
function LeapUtil.leap(damage_src_handle, angle, range, time, damage, dmgType, effectPath, startX, startY, onHitUnit)
    if damage == nil then
        damage = 0
    end
    if dmgType == nil then
        dmgType = DamageType["s_物理"]
    end
    if startX == nil then
        startX = GetUnitX(damage_src_handle)
    end
    if startY == nil then
        startY = GetUnitY(damage_src_handle)
    end
    local execCount = time * 25
    local dis = range / execCount
    local effectHandle = nil
    if effectPath and #effectPath > 0 then
        effectHandle = AddSpecialEffect(effectPath, startX, startY)
        EffectUtil:setEffectFacing(effectHandle, angle)
    end
    local damagedUnitGroup = nil
    if damage > 0 then
        damagedUnitGroup = GroupUtil.groupObjectPool:borrowObject()
    end
    BaseUtil.onTimer(
        0.04,
        function(____, c)
            local x = 0
            local y = 0
            if effectHandle then
                x = dis * math.cos(angle) + EXGetEffectX(effectHandle)
                y = dis * math.sin(angle) + EXGetEffectY(effectHandle)
                if RectUtil.isInPlayableArea(x, y) then
                    EXSetEffectXY(effectHandle, x, y)
                end
            else
                x = dis * math.cos(angle) + GetUnitX(damage_src_handle)
                y = dis * math.sin(angle) + GetUnitY(damage_src_handle)
                if RectUtil.isInPlayableArea(x, y) and ____exports.default.isPathAble(x, y) then
                    SetUnitPosition(damage_src_handle, x, y)
                end
            end
            if damage > 0 then
                SelectUtil.forEnemyUnitsInRange(
                    damage_src_handle,
                    128,
                    function(____, unit)
                        if IsUnitInGroup(unit, damagedUnitGroup) then
                            return
                        end
                        GroupAddUnit(damagedUnitGroup, unit)
                        DamageUtil:damage(damage_src_handle, unit, damage, dmgType)
                        if onHitUnit ~= nil then
                            onHitUnit(nil, unit)
                        end
                    end,
                    x,
                    y
                )
            end
            execCount = execCount - 1
            if execCount < 1 then
                if damagedUnitGroup then
                    GroupUtil.groupObjectPool:returnObject(damagedUnitGroup)
                end
                if effectHandle then
                    DestroyEffect(effectHandle)
                end
                return false
            end
            return true
        end
    )
end
function LeapUtil.isPathAble(x, y)
    return not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)
end
function LeapUtil.infiniteLeap(unit, angle, speed, panCamera, onDone)
    if speed == nil then
        speed = 1000
    end
    if panCamera == nil then
        panCamera = false
    end
    UnitAddAbility(unit, "Amrf")
    UnitRemoveAbility(unit, "Amrf")
    SetUnitFlyHeight(unit, 256, 1000)
    EXPauseUnit(unit, true)
    local dis = speed * 0.25
    if panCamera and GetOwningPlayer(unit) ~= GetLocalPlayer() then
        panCamera = false
    end
    BaseUtil.onTimer(
        0.04,
        function(____, c)
            local x = dis * math.cos(angle) + GetUnitX(unit)
            local y = dis * math.sin(angle) + GetUnitY(unit)
            if RectUtil.isInPlayableArea(x, y) and c < 300 and not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                SetUnitPosition(unit, x, y)
                if panCamera then
                    PanCameraToTimed(x, y, 0)
                end
            else
                EXPauseUnit(unit, false)
                SetUnitFlyHeight(unit, 0, 1000)
                if onDone ~= nil then
                    onDone(nil)
                end
                return false
            end
            return true
        end
    )
end
return ____exports
