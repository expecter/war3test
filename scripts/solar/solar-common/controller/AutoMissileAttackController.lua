local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 7,["21"] = 7,["22"] = 8,["23"] = 8,["24"] = 25,["25"] = 25,["26"] = 25,["27"] = 70,["28"] = 70,["29"] = 70,["31"] = 30,["32"] = 32,["33"] = 33,["34"] = 35,["35"] = 38,["36"] = 44,["37"] = 46,["38"] = 47,["39"] = 48,["40"] = 50,["41"] = 51,["42"] = 52,["43"] = 53,["44"] = 62,["45"] = 63,["46"] = 65,["47"] = 71,["48"] = 72,["49"] = 73,["50"] = 74,["51"] = 70,["52"] = 78,["53"] = 78,["54"] = 78,["56"] = 79,["57"] = 79,["58"] = 79,["59"] = 80,["60"] = 81,["63"] = 85,["66"] = 89,["68"] = 89,["70"] = 91,["71"] = 91,["72"] = 92,["73"] = 94,["76"] = 98,["77"] = 99,["78"] = 79,["79"] = 79,["80"] = 79,["81"] = 78,["82"] = 104,["83"] = 105,["84"] = 106,["85"] = 107,["86"] = 108,["87"] = 109,["89"] = 111,["90"] = 112,["93"] = 115,["94"] = 116,["95"] = 104,["96"] = 119,["97"] = 120,["98"] = 121,["99"] = 122,["100"] = 123,["101"] = 124,["104"] = 127,["105"] = 128,["107"] = 130,["108"] = 119,["109"] = 133,["110"] = 134,["111"] = 135,["112"] = 136,["115"] = 139,["116"] = 140,["117"] = 142,["118"] = 142,["119"] = 142,["120"] = 143,["121"] = 143,["122"] = 143,["123"] = 143,["124"] = 143,["125"] = 143,["126"] = 144,["127"] = 144,["128"] = 144,["129"] = 144,["130"] = 144,["131"] = 144,["132"] = 145,["133"] = 142,["134"] = 142,["135"] = 148,["137"] = 149,["138"] = 149,["140"] = 150,["141"] = 152,["142"] = 153,["143"] = 155,["146"] = 158,["147"] = 159,["150"] = 163,["151"] = 164,["152"] = 165,["154"] = 167,["155"] = 167,["156"] = 167,["157"] = 167,["158"] = 167,["159"] = 167,["160"] = 167,["161"] = 167,["162"] = 168,["163"] = 169,["164"] = 170,["165"] = 171,["166"] = 172,["167"] = 173,["168"] = 174,["169"] = 176,["170"] = 177,["171"] = 179,["175"] = 183,["178"] = 149,["181"] = 133,["182"] = 188,["183"] = 189,["184"] = 190,["185"] = 188,["186"] = 26,["187"] = 27});
local ____exports = {}
local ____Projectile = require("solar.solar-common.tool.Projectile")
local Projectile = ____Projectile.default
local ____STimer = require("solar.solar-common.tool.STimer")
local STimer = ____STimer.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____WeaponType = require("solar.solar-common.constant.WeaponType")
local WeaponType = ____WeaponType.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
____exports.default = __TS__Class()
local AutoMissileAttackController = ____exports.default
AutoMissileAttackController.name = "AutoMissileAttackController"
function AutoMissileAttackController.prototype.____constructor(self, unit, projectileModelPath, damageStateFormula, onHitTarget)
    if projectileModelPath == nil then
        projectileModelPath = "Abilities\\Weapons\\RocketMissile\\RocketMissile.mdx"
    end
    self.range = 1000
    self.extRange = 0
    self.coolDown = 1
    self.speed = 1000
    self.targetCount = 1
    self.projectileModelScale = 1
    self.colorR = 255
    self.colorG = 255
    self.colorB = 255
    self.alpha = 255
    self.damageTypeId = DamageType["s_法术"]
    self.weaponTypeID = WeaponType.T0_WHOKNOWS
    self.attackType = ATTACK_TYPE_CHAOS
    self.sTimer = __TS__New(STimer)
    self._isDestroy = false
    self._lastLaunchTime = 0
    self.unit = unit
    self.projectileModelPath = projectileModelPath
    self.damageStateFormula = damageStateFormula
    self.onHitTarget = onHitTarget
end
function AutoMissileAttackController.prototype.start(self, minCd)
    if minCd == nil then
        minCd = ____exports.default.minCd
    end
    self.sTimer:start(
        ____exports.default.minCd,
        function()
            if self._isDestroy then
                self.sTimer:destroy()
                return
            end
            if not UnitStateUtil:isAlive(self.unit) then
                return
            end
            local ____opt_0 = self.onUpdate
            if ____opt_0 ~= nil then
                ____opt_0(self, self)
            end
            local ____opt_2 = AttributeUtil:getUnitAttribute(self.unit, false)
            local autoMissileAttackSpeed = ____opt_2 and ____opt_2.autoMissileAttackSpeed or 0
            local cd = self.coolDown / (autoMissileAttackSpeed + 1)
            if _g_time - self._lastLaunchTime < cd * 1000 then
                return
            end
            self:doLaunchMissile()
            self._lastLaunchTime = _g_time
        end,
        true
    )
end
function AutoMissileAttackController.prototype.getRealRange(self)
    local range = self.range + self.extRange
    local unitAttribute = AttributeUtil:getUnitAttribute(self.unit, false)
    if unitAttribute then
        if unitAttribute.autoMissileAttackRange then
            range = range + unitAttribute.autoMissileAttackRange
        end
        if unitAttribute.autoMissileAttackRange_p then
            range = range * (1 + unitAttribute.autoMissileAttackRange_p)
        end
    end
    range = math.min(range, self.rangeMaxLimit or ____exports.default.defaultRangeMaxLimit)
    return range
end
function AutoMissileAttackController.prototype.getRealTargetCount(self)
    local targetCount = self.targetCount
    local unitAttribute = AttributeUtil:getUnitAttribute(self.unit, false)
    if unitAttribute then
        if unitAttribute.autoMissileAttackTargetCount then
            targetCount = targetCount + unitAttribute.autoMissileAttackTargetCount
        end
    end
    if self.realTargetCountMaxLimit and targetCount > self.realTargetCountMaxLimit then
        return self.realTargetCountMaxLimit
    end
    return targetCount
end
function AutoMissileAttackController.prototype.doLaunchMissile(self)
    local range = self:getRealRange()
    local enemyUnits = SelectUtil.getEnemyUnitsInRange(self.unit, range)
    if enemyUnits == nil or #enemyUnits == 0 then
        return
    end
    local x = GetUnitX(self.unit)
    local y = GetUnitY(self.unit)
    __TS__ArraySort(
        enemyUnits,
        function(____, a, b)
            local aD = MathUtil.distanceBetweenPoints(
                x,
                y,
                GetUnitX(a),
                GetUnitY(a)
            )
            local bD = MathUtil.distanceBetweenPoints(
                x,
                y,
                GetUnitX(b),
                GetUnitY(b)
            )
            return aD - bD
        end
    )
    local realTargetCount = self:getRealTargetCount()
    do
        local i = 0
        while i < realTargetCount and i < #enemyUnits do
            do
                local targetUnit = enemyUnits[i + 1]
                if self.onBeforeLaunchMissile then
                    local b = self:onBeforeLaunchMissile(self, targetUnit)
                    if self._isDestroy then
                        return
                    end
                    if b == false then
                        goto __continue20
                    end
                end
                local damage = 0
                if self.damageStateFormula then
                    damage = UnitStateUtil:calculateStateFormula(self.damageStateFormula, self.unit, targetUnit)
                end
                local projectile = __TS__New(
                    Projectile,
                    self.unit,
                    targetUnit,
                    damage,
                    self.projectileModelPath,
                    self.onHitTarget
                )
                projectile.speed = self.speed
                projectile.damageName = self.damageName
                projectile.projectileModelScale = self.projectileModelScale
                projectile.colorR = self.colorR
                projectile.colorG = self.colorG
                projectile.colorB = self.colorB
                projectile.alpha = self.alpha
                if self.onLaunchMissile then
                    self:onLaunchMissile(self, projectile)
                    if self._isDestroy then
                        return
                    end
                end
                projectile:start()
            end
            ::__continue20::
            i = i + 1
        end
    end
end
function AutoMissileAttackController.prototype.destroy(self)
    self._isDestroy = true
    self.sTimer:destroy()
end
AutoMissileAttackController.defaultRangeMaxLimit = 3000
AutoMissileAttackController.minCd = 0.05
return ____exports
