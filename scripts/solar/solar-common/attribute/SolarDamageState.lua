local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["21"] = 13,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 69,["26"] = 69,["27"] = 69,["29"] = 70,["30"] = 71,["33"] = 74,["34"] = 75,["35"] = 77,["37"] = 79,["38"] = 80,["39"] = 81,["40"] = 82,["41"] = 83,["42"] = 84,["43"] = 86,["46"] = 89,["47"] = 90,["49"] = 92,["50"] = 94,["51"] = 95,["52"] = 96,["54"] = 98,["55"] = 99,["56"] = 99,["57"] = 100,["58"] = 101,["59"] = 102,["62"] = 82,["63"] = 69,["64"] = 49,["65"] = 50,["66"] = 50,["67"] = 49,["68"] = 57,["69"] = 58,["70"] = 58,["71"] = 57,["72"] = 65,["73"] = 66,["74"] = 66,["75"] = 65,["76"] = 110,["77"] = 113,["78"] = 115,["81"] = 118,["82"] = 118,["83"] = 118,["84"] = 118,["87"] = 121,["88"] = 122,["89"] = 123,["90"] = 124,["91"] = 125,["92"] = 125,["93"] = 125,["94"] = 125,["95"] = 126,["96"] = 127,["97"] = 128,["101"] = 132,["104"] = 138,["105"] = 139,["106"] = 142,["107"] = 144,["108"] = 145,["109"] = 147,["110"] = 149,["111"] = 151,["112"] = 152,["113"] = 152,["114"] = 152,["115"] = 152,["118"] = 158,["119"] = 158,["120"] = 158,["121"] = 158,["122"] = 158,["123"] = 158,["124"] = 158,["125"] = 158,["126"] = 158,["127"] = 158,["128"] = 158,["129"] = 158,["130"] = 158,["131"] = 158,["132"] = 175,["133"] = 176,["134"] = 177,["135"] = 178,["136"] = 179,["137"] = 181,["140"] = 184,["141"] = 185,["142"] = 186,["143"] = 187,["144"] = 189,["147"] = 192,["148"] = 193,["149"] = 194,["150"] = 195,["151"] = 197,["154"] = 200,["155"] = 203,["156"] = 204,["157"] = 110,["158"] = 212,["159"] = 214,["160"] = 215,["161"] = 216,["164"] = 219,["165"] = 220,["166"] = 221,["169"] = 224,["170"] = 225,["171"] = 227,["173"] = 230,["174"] = 232,["175"] = 233,["177"] = 237,["178"] = 239,["179"] = 240,["181"] = 244,["182"] = 245,["184"] = 249,["185"] = 251,["186"] = 253,["187"] = 255,["188"] = 256,["190"] = 260,["191"] = 261,["194"] = 267,["195"] = 268,["196"] = 269,["199"] = 275,["200"] = 276,["201"] = 277,["203"] = 283,["204"] = 284,["206"] = 292,["207"] = 293,["210"] = 299,["211"] = 300,["212"] = 301,["215"] = 306,["216"] = 307,["217"] = 308,["219"] = 315,["220"] = 316,["221"] = 317,["222"] = 317,["223"] = 317,["224"] = 317,["225"] = 317,["226"] = 317,["227"] = 317,["228"] = 317,["230"] = 321,["231"] = 212,["232"] = 33,["233"] = 33,["234"] = 33,["235"] = 33,["236"] = 33,["237"] = 33,["238"] = 33,["239"] = 33});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____DamageUtil = require("solar.solar-common.util.system.DamageUtil")
local DamageUtil = ____DamageUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
--- 太阳伤害系统
-- 可配置config.damageEventHandlers 以自行处理伤害事件
local BaseRealMax = 8e+37
____exports.default = __TS__Class()
local SolarDamageState = ____exports.default
SolarDamageState.name = "SolarDamageState"
function SolarDamageState.prototype.____constructor(self, useBaseAttribute)
    if useBaseAttribute == nil then
        useBaseAttribute = ____exports.default.config.useBaseAttribute
    end
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarDamageState()")
        return
    end
    ____exports.default.config.useBaseAttribute = useBaseAttribute
    if useBaseAttribute then
        ____exports.default:addEventHandler(____exports.default.calculateAttributeDamage)
    end
    isSolarDamageEnable = true
    local trigger = __TS__New(Trigger)
    trigger:registerAnyUnitDamagedEvent()
    trigger:addAction(function()
        local eventDamage = GetEventDamage()
        local triggerUnit = GetTriggerUnit()
        if eventDamage <= 0 then
            return
        end
        if eventDamage > BaseRealMax and gv._sl_lastDamage and gv._sl_lastDamage > BaseRealMax then
            eventDamage = gv._sl_lastDamage
        end
        local event = self:damageDistributor(eventDamage, triggerUnit)
        local realDamage = eventDamage
        if event and event.resultDamage then
            realDamage = event.resultDamage
        end
        if isBigAttributeMode and realDamage > 2100000000 then
            local ____opt_2 = AttributeUtil:getUnitAttribute(triggerUnit, false)
            local _SL_BA_max_life = ____opt_2 and ____opt_2._SL_BA_max_life
            if _SL_BA_max_life and _SL_BA_max_life > BaseRealMax then
                UnitStateUtil:addLife(triggerUnit, -(realDamage - 2100000000))
                EXSetEventDamage(2100000000)
            end
        end
    end)
end
function SolarDamageState.addEventHandlerFirst(self, eventHandler)
    local ____exports_default_config_firstDamageEventHandlers_4 = ____exports.default.config.firstDamageEventHandlers
    ____exports_default_config_firstDamageEventHandlers_4[#____exports_default_config_firstDamageEventHandlers_4 + 1] = eventHandler
end
function SolarDamageState.addEventHandler(self, eventHandler)
    local ____exports_default_config_damageEventHandlers_5 = ____exports.default.config.damageEventHandlers
    ____exports_default_config_damageEventHandlers_5[#____exports_default_config_damageEventHandlers_5 + 1] = eventHandler
end
function SolarDamageState.addEventHandlerLast(self, eventHandler)
    local ____exports_default_config_lastDamageEventHandlers_6 = ____exports.default.config.lastDamageEventHandlers
    ____exports_default_config_lastDamageEventHandlers_6[#____exports_default_config_lastDamageEventHandlers_6 + 1] = eventHandler
end
function SolarDamageState.prototype.damageDistributor(self, eventDamage, unit0)
    local unit1 = GetEventDamageSource()
    if not IsHandle(unit1) then
        return
    end
    if IsUnitAlly(
        unit0,
        GetOwningPlayer(unit1)
    ) then
        return
    end
    local isAttack = 0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK)
    if isBigAttributeMode and isAttack then
        local u1Attack = GetUnitState(unit1, UnitStateDamageMax)
        local u0Armor = GetUnitState(unit0, UnitStateArmor)
        local rr = math.max(
            1 - MathUtil.armorReduction(u0Armor),
            0.00001
        )
        eventDamage = u1Attack * rr
        EXSetEventDamage(eventDamage)
        if eventDamage <= 0 then
            return
        end
    end
    if not isSolarDamageEnable then
        return
    end
    local u0sa = AttributeUtil:getUnitAttribute(unit0)
    local u1sa = AttributeUtil:getUnitAttribute(unit1)
    local resultDamage = eventDamage
    if ____exports.default.config.useBaseAttribute and isAttack and u1sa ~= nil then
        if u1sa.def_pierce_p or u1sa.def_pierce then
            local armor = UnitStateUtil:getArmor(unit0) * (1 - (u1sa.def_pierce_p or 0))
            armor = armor - (u1sa.def_pierce or 0)
            local rd = MathUtil.armorReduction(armor)
            resultDamage = math.max(
                resultDamage,
                UnitStateUtil:getDamageMax(unit1)
            ) * (1 - rd)
        end
    end
    local event = {
        baseDamage = eventDamage,
        damageType = EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE),
        weaponType = EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE),
        unit0 = unit0,
        unit1 = unit1,
        u0sa = u0sa,
        u1sa = u1sa,
        isAttack = isAttack,
        isRanged = 0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED),
        isPhysical = DamageUtil:isEventPhysicalDamageType(),
        isCritical = false,
        resultDamage = resultDamage
    }
    isSolarDamageEnable = false
    for ____, damageEventHandler in ipairs(____exports.default.config.firstDamageEventHandlers) do
        damageEventHandler(nil, event)
        if event.consumed then
            isSolarDamageEnable = true
            return event
        end
    end
    for ____, damageEventHandler in ipairs(____exports.default.config.damageEventHandlers) do
        damageEventHandler(nil, event)
        if event.consumed then
            isSolarDamageEnable = true
            return event
        end
    end
    for ____, damageEventHandler in ipairs(____exports.default.config.lastDamageEventHandlers) do
        damageEventHandler(nil, event)
        if event.consumed then
            isSolarDamageEnable = true
            return event
        end
    end
    isSolarDamageEnable = true
    EXSetEventDamage(event.resultDamage)
    return event
end
function SolarDamageState.calculateAttributeDamage(self, event)
    local u0sa = event.u0sa
    local u1sa = event.u1sa
    if u0sa == nil and u1sa == nil then
        return
    end
    if u0sa and u0sa.miss_p and GetRandomReal(0, 1) < u0sa.miss_p then
        event.isMiss = true
        event.resultDamage = 0
        return
    end
    local newResultDamage = event.resultDamage
    if event.isAttack and (u1sa and u1sa.attack_damage_increased) then
        newResultDamage = newResultDamage * (u1sa.attack_damage_increased + 1)
    end
    if event.isPhysical then
        if ____exports.default.config.physical_damage_increased_attack or event.isAttack == false then
            newResultDamage = newResultDamage * ((u1sa and u1sa.physical_damage_increased or 0) + 1)
        end
        if GetRandomReal(0, 1) < (u1sa and u1sa.physical_critical_chance or 0) then
            newResultDamage = newResultDamage * ((u1sa and u1sa.physical_critical_damage or 0) + 1)
            event.isCritical = true
        end
        local physical_damage_pierce = (u1sa and u1sa.physical_damage_pierce or 0) - (u0sa and u0sa.physical_damage_reduction or 0)
        newResultDamage = newResultDamage * (1 + physical_damage_pierce)
    else
        newResultDamage = newResultDamage + (u1sa and u1sa.magic_power or 0)
        newResultDamage = newResultDamage * ((u1sa and u1sa.magic_damage_increased or 0) + 1)
        if GetRandomReal(0, 1) < (u1sa and u1sa.magic_critical_chance or 0) then
            newResultDamage = newResultDamage * ((u1sa and u1sa.magic_critical_damage or 0) + 1)
            event.isCritical = true
        end
        local magic_damage_pierce = (u1sa and u1sa.magic_damage_pierce or 0) - (u0sa and u0sa.magic_damage_reduction or 0)
        newResultDamage = newResultDamage * (1 + magic_damage_pierce)
    end
    --- 根据伤害类型 增伤
    local damage_increased_dt_x = "damage_increased_dt_" .. tostring(event.damageType)
    if u1sa and u1sa[damage_increased_dt_x] then
        newResultDamage = newResultDamage * (1 + u1sa[damage_increased_dt_x])
    end
    --- 根据武器类型 增伤
    local damage_increased_wt_x = "damage_increased_wt_" .. tostring(event.weaponType)
    if u1sa and u1sa[damage_increased_wt_x] then
        newResultDamage = newResultDamage * (1 + u1sa[damage_increased_wt_x])
    end
    if u1sa and u1sa.damage_increased then
        newResultDamage = newResultDamage * (1 + u1sa.damage_increased)
    end
    if u0sa and u0sa.damage_reduction then
        newResultDamage = newResultDamage * (1 - math.min(u0sa.damage_reduction, ____exports.default.config.damage_reduction_max))
    end
    --- 根据伤害类型 抗性 减伤
    local damage_reduction_dt_x = "damage_reduction_dt_" .. tostring(event.damageType)
    if u0sa and u0sa[damage_reduction_dt_x] then
        newResultDamage = newResultDamage * (1 - u0sa[damage_reduction_dt_x])
    end
    --- 根据武器类型 抗性 减伤
    local damage_reduction_wt_x = "damage_reduction_wt_" .. tostring(event.weaponType)
    if u0sa and u0sa[damage_reduction_wt_x] then
        newResultDamage = newResultDamage * (1 - u0sa[damage_reduction_wt_x])
    end
    if u1sa and u1sa.blood_sucking then
        local add_hp = newResultDamage * u1sa.blood_sucking
        SetUnitState(
            event.unit1,
            UNIT_STATE_LIFE,
            math.max(
                0,
                GetUnitState(event.unit1, UNIT_STATE_LIFE) + add_hp
            )
        )
    end
    event.resultDamage = newResultDamage
end
SolarDamageState.config = {
    useBaseAttribute = true,
    physical_damage_increased_attack = true,
    damage_reduction_max = 0.99,
    firstDamageEventHandlers = {},
    damageEventHandlers = {},
    lastDamageEventHandlers = {}
}
return ____exports
