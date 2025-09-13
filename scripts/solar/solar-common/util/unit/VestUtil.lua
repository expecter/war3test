local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 8,["16"] = 8,["17"] = 9,["18"] = 9,["19"] = 12,["20"] = 12,["21"] = 12,["23"] = 12,["24"] = 25,["25"] = 25,["26"] = 25,["28"] = 25,["29"] = 25,["31"] = 25,["32"] = 25,["34"] = 25,["35"] = 25,["37"] = 25,["38"] = 25,["40"] = 26,["41"] = 26,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 26,["46"] = 26,["47"] = 26,["48"] = 26,["49"] = 25,["50"] = 36,["51"] = 36,["52"] = 36,["54"] = 36,["55"] = 36,["57"] = 36,["58"] = 36,["60"] = 36,["61"] = 36,["63"] = 36,["64"] = 36,["66"] = 37,["67"] = 38,["68"] = 38,["69"] = 38,["70"] = 38,["71"] = 38,["72"] = 38,["73"] = 38,["74"] = 38,["76"] = 40,["77"] = 40,["78"] = 40,["79"] = 40,["80"] = 40,["81"] = 40,["82"] = 40,["83"] = 40,["85"] = 36,["86"] = 44,["87"] = 44,["88"] = 44,["90"] = 44,["91"] = 44,["93"] = 44,["94"] = 44,["96"] = 45,["97"] = 45,["98"] = 45,["99"] = 45,["100"] = 45,["101"] = 45,["102"] = 45,["103"] = 46,["104"] = 47,["105"] = 49,["107"] = 52,["108"] = 53,["110"] = 55,["111"] = 56,["112"] = 57,["113"] = 58,["114"] = 59,["115"] = 59,["116"] = 59,["117"] = 59,["118"] = 60,["119"] = 61,["120"] = 61,["121"] = 61,["122"] = 62,["123"] = 61,["124"] = 61,["126"] = 65,["127"] = 44,["128"] = 80,["129"] = 80,["130"] = 80,["132"] = 80,["133"] = 80,["135"] = 80,["136"] = 80,["138"] = 82,["141"] = 86,["142"] = 87,["143"] = 88,["144"] = 89,["145"] = 90,["146"] = 91,["147"] = 91,["148"] = 92,["151"] = 96,["152"] = 97,["156"] = 100,["157"] = 100,["158"] = 101,["159"] = 102,["160"] = 103,["162"] = 100,["165"] = 106,["166"] = 108,["167"] = 108,["168"] = 108,["169"] = 108,["170"] = 109,["171"] = 109,["172"] = 109,["173"] = 109,["174"] = 110,["175"] = 110,["176"] = 110,["177"] = 110,["179"] = 112,["180"] = 112,["181"] = 112,["182"] = 112,["183"] = 113,["184"] = 113,["185"] = 113,["186"] = 113,["187"] = 114,["188"] = 114,["189"] = 114,["190"] = 114,["191"] = 116,["192"] = 116,["193"] = 116,["194"] = 116,["195"] = 117,["196"] = 117,["197"] = 117,["198"] = 117,["199"] = 118,["200"] = 118,["201"] = 118,["202"] = 118,["203"] = 119,["204"] = 119,["205"] = 119,["206"] = 119,["207"] = 89,["208"] = 121,["210"] = 124,["211"] = 125,["212"] = 126,["214"] = 128,["215"] = 129,["216"] = 130,["217"] = 131,["218"] = 132,["219"] = 133,["220"] = 134,["221"] = 135,["222"] = 136,["223"] = 137,["224"] = 80,["225"] = 69});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
____exports.default = __TS__Class()
local VestUtil = ____exports.default
VestUtil.name = "VestUtil"
function VestUtil.prototype.____constructor(self)
end
function VestUtil.SunCreateVestByUnit(u, x, y, model, moveType, timer, player)
    if x == nil then
        x = GetUnitX(u)
    end
    if y == nil then
        y = GetUnitY(u)
    end
    if model == nil then
        model = ""
    end
    if moveType == nil then
        moveType = 0
    end
    if timer == nil then
        timer = 2
    end
    return ____exports.default.createVestByUnit(
        u,
        x,
        y,
        model,
        moveType,
        timer,
        player
    )
end
function VestUtil.createVestByUnit(u, x, y, model, moveType, timer, player)
    if x == nil then
        x = GetUnitX(u)
    end
    if y == nil then
        y = GetUnitY(u)
    end
    if model == nil then
        model = ""
    end
    if moveType == nil then
        moveType = 0
    end
    if timer == nil then
        timer = 2
    end
    if player then
        return ____exports.default.createVest(
            player,
            x,
            y,
            model,
            moveType,
            timer
        )
    else
        return ____exports.default.createVest(
            GetOwningPlayer(u),
            x,
            y,
            model,
            moveType,
            timer
        )
    end
end
function VestUtil.createVest(player, x, y, model, moveType, timer)
    if model == nil then
        model = ""
    end
    if moveType == nil then
        moveType = 0
    end
    if timer == nil then
        timer = 2
    end
    local mj = CreateUnit(
        player,
        FourCC("hrdh"),
        x,
        y,
        0
    )
    DzSetUnitModel(mj, model)
    if moveType == 1 then
        EXSetUnitMoveType(mj, 4)
    else
        EXSetUnitMoveType(mj, 0)
        ShowUnit(mj, false)
    end
    SetUnitPosition(mj, x, y)
    SetUnitMoveSpeed(mj, 0)
    SetUnitState(mj, UNIT_STATE_MAX_MANA, 99999)
    SetUnitState(mj, UNIT_STATE_MANA, 99999)
    UnitAddAbility(
        mj,
        FourCC("Aloc")
    )
    if timer > 0 then
        BaseUtil.runLater(
            timer,
            function()
                RemoveUnit(mj)
            end
        )
    end
    return mj
end
function VestUtil.createPhantomUnit(unit, lifeTime, damageP, underDamageP, owner)
    if lifeTime == nil then
        lifeTime = 15
    end
    if damageP == nil then
        damageP = 1
    end
    if underDamageP == nil then
        underDamageP = 2
    end
    if not IsHandle(unit) then
        return
    end
    if ____exports.default._sl_createPhantomUnitTrigger == nil then
        local trigger = __TS__New(Trigger)
        trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_SUMMON)
        trigger:addAction(function()
            local vest = GetSummoningUnit()
            local ____opt_0 = DataBase:getUnitSolarData(vest, false)
            local srcUnit = ____opt_0 and ____opt_0.createPhantomUnit_srcUnit
            if not IsHandle(srcUnit) then
                return
            end
            local phantomUnit = GetSummonedUnit()
            if not IsHandle(phantomUnit) then
                return
            end
            do
                local i = 0
                while i < 6 do
                    local item = UnitItemInSlot(phantomUnit, i)
                    if IsHandle(item) and ActorItemUtil:getActorItem(item) == nil then
                        RemoveItem(item)
                    end
                    i = i + 1
                end
            end
            if UnitUtil.isHero(phantomUnit) then
                UnitUtil.setExtraStr(
                    phantomUnit,
                    UnitUtil.getExtraStr(srcUnit)
                )
                UnitUtil.setExtraAgi(
                    phantomUnit,
                    UnitUtil.getExtraAgi(srcUnit)
                )
                UnitUtil.setExtraInt(
                    phantomUnit,
                    UnitUtil.getExtraInt(srcUnit)
                )
            end
            UnitUtil.setExtraAttack(
                phantomUnit,
                UnitUtil.getExtraAttack(srcUnit)
            )
            UnitUtil.setExtraAttackSpd(
                phantomUnit,
                UnitUtil.getExtraAttackSpd(srcUnit)
            )
            UnitUtil.setExtraDef(
                phantomUnit,
                UnitUtil.getExtraDef(srcUnit)
            )
            UnitStateUtil:setMaxLife(
                phantomUnit,
                UnitStateUtil:getMaxLife(srcUnit)
            )
            UnitStateUtil:setLife(
                phantomUnit,
                UnitStateUtil:getLife(srcUnit)
            )
            UnitStateUtil:setMaxMana(
                phantomUnit,
                UnitStateUtil:getMaxMana(srcUnit)
            )
            UnitStateUtil:setMana(
                phantomUnit,
                UnitStateUtil:getMana(srcUnit)
            )
        end)
        ____exports.default._sl_createPhantomUnitTrigger = trigger
    end
    local vest = ____exports.default.createVestByUnit(unit)
    if owner then
        SetUnitOwner(vest, owner, true)
    end
    DataBase:getUnitSolarData(vest, true).createPhantomUnit_srcUnit = unit
    UnitAddAbility(vest, "AIil")
    local abilityTemp = EXGetUnitAbility(vest, "AIil")
    EXSetAbilityDataReal(abilityTemp, 1, ABILITY_DATA_DATA_A, damageP)
    EXSetAbilityDataReal(abilityTemp, 1, ABILITY_DATA_DATA_B, underDamageP)
    EXSetAbilityDataReal(abilityTemp, 1, ABILITY_DATA_DUR, lifeTime)
    EXSetAbilityDataReal(abilityTemp, 1, ABILITY_DATA_HERODUR, lifeTime)
    IncUnitAbilityLevel(vest, "AIil")
    DecUnitAbilityLevel(vest, "AIil")
    IssueTargetOrderById(vest, 852274, unit)
end
VestUtil._sl_createPhantomUnitTrigger = nil
return ____exports
