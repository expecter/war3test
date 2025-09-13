local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 16,["26"] = 16,["27"] = 16,["29"] = 26,["30"] = 27,["33"] = 30,["34"] = 30,["35"] = 30,["36"] = 31,["37"] = 32,["38"] = 32,["39"] = 32,["40"] = 33,["41"] = 32,["42"] = 32,["43"] = 36,["45"] = 30,["46"] = 30,["47"] = 40,["48"] = 41,["49"] = 42,["50"] = 43,["51"] = 44,["52"] = 45,["53"] = 46,["54"] = 47,["55"] = 48,["56"] = 49,["57"] = 50,["59"] = 43,["60"] = 55,["61"] = 57,["62"] = 58,["63"] = 59,["64"] = 60,["65"] = 59,["66"] = 58,["67"] = 64,["68"] = 64,["69"] = 64,["70"] = 65,["71"] = 65,["72"] = 65,["73"] = 66,["74"] = 67,["75"] = 66,["76"] = 65,["77"] = 65,["78"] = 64,["79"] = 64,["80"] = 25,["81"] = 80,["82"] = 82,["83"] = 83,["84"] = 84,["87"] = 87,["88"] = 88,["90"] = 90,["93"] = 94,["96"] = 98,["97"] = 102,["98"] = 103,["100"] = 105,["101"] = 108,["102"] = 109,["103"] = 110,["104"] = 111,["106"] = 113,["107"] = 114,["109"] = 119,["110"] = 120,["111"] = 121,["113"] = 124,["114"] = 125,["115"] = 126,["116"] = 127,["117"] = 128,["119"] = 130,["121"] = 133,["122"] = 134,["123"] = 135,["125"] = 137,["126"] = 138,["127"] = 139,["128"] = 140,["129"] = 141,["131"] = 143,["133"] = 146,["134"] = 147,["135"] = 148,["137"] = 150,["138"] = 151,["139"] = 152,["140"] = 153,["141"] = 154,["143"] = 157,["145"] = 160,["146"] = 161,["147"] = 162,["149"] = 166,["150"] = 167,["152"] = 170,["153"] = 171,["155"] = 174,["156"] = 175,["158"] = 178,["159"] = 179,["160"] = 180,["162"] = 183,["163"] = 184,["164"] = 185,["165"] = 186,["166"] = 187,["167"] = 188,["168"] = 190,["169"] = 191,["170"] = 192,["171"] = 193,["172"] = 194,["173"] = 195,["174"] = 196,["175"] = 197,["176"] = 198,["177"] = 199,["178"] = 200,["181"] = 206,["182"] = 207,["184"] = 209,["185"] = 210,["186"] = 211,["187"] = 212,["189"] = 214,["191"] = 217,["192"] = 218,["193"] = 219,["195"] = 221,["196"] = 222,["198"] = 224,["199"] = 225,["201"] = 227,["202"] = 228,["203"] = 229,["204"] = 230,["206"] = 232,["208"] = 234,["209"] = 235,["210"] = 236,["212"] = 238,["213"] = 239,["215"] = 241,["216"] = 242,["218"] = 244,["219"] = 245,["220"] = 246,["221"] = 247,["223"] = 249,["225"] = 251,["226"] = 252,["227"] = 253,["229"] = 255,["230"] = 256,["232"] = 259,["233"] = 259,["234"] = 259,["235"] = 259,["236"] = 259,["237"] = 259,["238"] = 259,["239"] = 80,["240"] = 17,["241"] = 20});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____HandleUtil = require("solar.solar-common.util.lang.HandleUtil")
local HandleUtil = ____HandleUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
____exports.default = __TS__Class()
local UnitAttributeState = ____exports.default
UnitAttributeState.name = "UnitAttributeState"
function UnitAttributeState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new UnitAttributeState()")
        return
    end
    BaseUtil.runLater(
        0.1,
        function()
            for configKey in pairs(____exports.default.config) do
                SingletonUtil:executeOnce(
                    "UnitAttributeState.config:警告",
                    function()
                        print("不推荐在UnitAttributeState.config设置属性," .. "请直接使用AttributeUtil.setUnitTypeAttribute设置属性。这个方式将在未来移除!")
                    end
                )
                AttributeUtil:setUnitTypeAttribute(configKey, ____exports.default.config[configKey])
            end
        end
    )
    local enterRectTrigger = __TS__New(Trigger)
    enterRectTrigger:registerEnterRect(GetPlayableMapRect())
    enterRectTrigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    enterRectTrigger:addAction(function()
        local triggerUnit = GetTriggerUnit()
        local typeStr = id2string(GetUnitTypeId(triggerUnit))
        local utsa = AttributeUtil:getUnitTypeAttribute(typeStr)
        if utsa then
            local unitAttribute = AttributeUtil:getUnitAttribute(triggerUnit, true)
            AttributeUtil:add(unitAttribute, utsa)
            ____exports.default:refreshUnitSolarAttribute(triggerUnit, utsa)
        end
    end)
    local triggerTimer = __TS__New(Trigger)
    triggerTimer:registerTimerEvent(1.97, true)
    triggerTimer:addAction(function()
        AttributeUtil:forAllUnitsAttribute(function(____, unitHandle, attribute)
            ____exports.default:refreshUnitSolarAttribute(unitHandle, attribute)
        end)
    end)
    BaseUtil.runLater(
        0.01,
        function()
            se:on(
                "属性刷新",
                function()
                    AttributeUtil:forAllUnitsAttribute(function(____, unitHandle, attribute)
                        ____exports.default:refreshUnitSolarAttribute(unitHandle, attribute)
                    end)
                end
            )
        end
    )
end
function UnitAttributeState.refreshUnitSolarAttribute(self, unitHandle, attribute)
    if isDebug and not HandleUtil:isUnitHandle(unitHandle) then
        print_r(handledef(unitHandle))
        log.errorWithTraceBack("你传的单位handle 有误。可能已被其它类型的handle对象重用")
        return
    end
    if not attribute then
        attribute = AttributeUtil:getUnitAttribute(unitHandle)
    end
    if not attribute then
        return
    end
    if not UnitStateUtil:isAlive(unitHandle) then
        return
    end
    local solarData = DataBase:getUnitSolarData(unitHandle)
    if attribute.attack then
        UnitUtil.setExtraAttack(unitHandle, attribute.attack or 0, "_SLA_attack")
    end
    if attribute.attack_p then
        local base = GetUnitState(unitHandle, UnitStateDamageMax) - (solarData._sla_temp_attack_p or 0)
        local val = (attribute.attack_p or 0) * base
        if val > -2100000000 and val < 2100000000 then
            val = math.floor(val)
        end
        solarData._sla_temp_attack_p = val
        UnitUtil.setExtraAttack(unitHandle, val, "_SLA_attack_p")
    end
    if attribute.life then
        local val = attribute.life or 0
        UnitUtil.setExtraHp(unitHandle, val, "_SLA_life")
    end
    if attribute.life_p then
        local base = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE) - UnitUtil.getExtraHp(unitHandle, "_SLA_life_p")
        local val = (attribute.life_p or 0) * base
        if val > -2100000000 and val < 2100000000 then
            val = math.floor(val)
        end
        UnitUtil.setExtraHp(unitHandle, val, "_SLA_life_p")
    end
    if attribute.mana then
        local val = attribute.mana and attribute.mana or 0
        UnitUtil.setExtraMana(unitHandle, val, "_SLA_mana")
    end
    if attribute.mana_p then
        local base = GetUnitState(unitHandle, UNIT_STATE_MAX_MANA) - UnitUtil.getExtraMana(unitHandle, "_SLA_mana_p")
        local val = (attribute.mana_p or 0) * base
        if val > -2100000000 and val < 2100000000 then
            val = math.floor(val)
        end
        UnitUtil.setExtraMana(unitHandle, val, "_SLA_mana_p")
    end
    if attribute.def ~= nil then
        local val = attribute.def or 0
        UnitUtil.setExtraDef(unitHandle, val, "_SLA_def")
    end
    if attribute.def_p ~= nil then
        local base = GetUnitState(unitHandle, UnitStateArmor) - UnitUtil.getExtraDef(unitHandle, "_SLA_def_p")
        local val = (attribute.def_p or 0) * base
        if val > -2100000000 and val < 2100000000 then
            val = math.floor(val)
        end
        UnitUtil.setExtraDef(unitHandle, val, "_SLA_def_p")
    end
    if attribute.attackSpd_p ~= nil then
        local val = attribute.attackSpd_p
        UnitUtil.setExtraAttackSpd(unitHandle, val, "_SLA_attackSpd_p")
    end
    if attribute.damage_cool ~= nil then
        UnitUtil.setExtraDamageCool(unitHandle, attribute.damage_cool, "_SLA_damage_cool")
    end
    if attribute.damage_range ~= nil then
        UnitUtil.setExtraDamageRange(unitHandle, attribute.damage_range, "_SLA_damage_range")
    end
    if attribute.move_speed ~= nil then
        UnitUtil.setExtraMoveSpeed(unitHandle, attribute.move_speed, "_SLA_move_speed")
    end
    if attribute.move_speed_p ~= nil then
        local ms = GetUnitMoveSpeed(unitHandle) * attribute.move_speed_p
        UnitUtil.setExtraMoveSpeed(unitHandle, ms, "_SLA_move_speed_p")
    end
    local strength = attribute.full_property or 0
    local agility = strength
    local intelligence = strength
    local strength_p = (attribute.full_property_p or 0) + (attribute.strength_p or 0)
    local agility_p = (attribute.full_property_p or 0) + (attribute.agility_p or 0)
    local intelligence_p = (attribute.full_property_p or 0) + (attribute.intelligence_p or 0)
    if attribute.primary_property or attribute.primary_property_p then
        local primaryTypeKey = HeroUtil:getHeroPrimary(unitHandle)
        if primaryTypeKey == "STR" then
            strength = strength + (attribute.primary_property or 0)
            strength_p = strength_p + (attribute.primary_property_p or 0)
        elseif primaryTypeKey == "AGI" then
            agility = agility + (attribute.primary_property or 0)
            agility_p = agility_p + (attribute.primary_property_p or 0)
        elseif primaryTypeKey == "INT" then
            intelligence = intelligence + (attribute.primary_property or 0)
            intelligence_p = intelligence_p + (attribute.primary_property_p or 0)
        end
    end
    if attribute.strength then
        strength = strength + attribute.strength
    end
    if strength_p then
        local base = 0
        if ____exports.default.greenIncrease then
            base = GetHeroStr(unitHandle, true) - (solarData._sla_temp_strength_p or 0)
        else
            base = GetHeroStr(unitHandle, false)
        end
        local val = (strength_p or 0) * base
        if val > -2100000000 and val < 2100000000 then
            val = math.floor(val)
        end
        strength = strength + val
        solarData._sla_temp_strength_p = val
    end
    if attribute.agility then
        agility = agility + attribute.agility
    end
    if agility_p then
        local base = 0
        if ____exports.default.greenIncrease then
            base = GetHeroAgi(unitHandle, true) - (solarData._sla_temp_agility_p or 0)
        else
            base = GetHeroAgi(unitHandle, false)
        end
        local val = (agility_p or 0) * base
        if val > -2100000000 and val < 2100000000 then
            val = math.floor(val)
        end
        agility = agility + val
        solarData._sla_temp_agility_p = val
    end
    if attribute.intelligence then
        intelligence = intelligence + attribute.intelligence
    end
    if intelligence_p then
        local base = 0
        if ____exports.default.greenIncrease then
            base = GetHeroInt(unitHandle, true) - (solarData._sla_temp_intelligence_p or 0)
        else
            base = GetHeroInt(unitHandle, false)
        end
        local val = (intelligence_p or 0) * base
        if val > -2100000000 and val < 2100000000 then
            val = math.floor(val)
        end
        intelligence = intelligence + val
        solarData._sla_temp_intelligence_p = val
    end
    UnitUtil.setExtraStrAgiInt(
        unitHandle,
        "_SLA_StrAgiInt",
        strength,
        agility,
        intelligence
    )
end
UnitAttributeState.greenIncrease = true
UnitAttributeState.config = {}
return ____exports
