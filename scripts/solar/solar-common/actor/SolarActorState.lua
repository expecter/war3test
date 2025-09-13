local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 11,["28"] = 11,["29"] = 12,["30"] = 12,["31"] = 13,["32"] = 13,["33"] = 14,["34"] = 14,["35"] = 15,["36"] = 15,["37"] = 17,["38"] = 17,["39"] = 17,["41"] = 21,["42"] = 22,["45"] = 26,["46"] = 27,["47"] = 29,["48"] = 30,["49"] = 31,["50"] = 32,["51"] = 33,["52"] = 34,["53"] = 36,["54"] = 37,["55"] = 37,["56"] = 37,["57"] = 39,["58"] = 37,["59"] = 37,["61"] = 43,["62"] = 44,["63"] = 45,["64"] = 46,["67"] = 50,["69"] = 44,["72"] = 20,["73"] = 58,["74"] = 59,["75"] = 61,["76"] = 62,["77"] = 63,["79"] = 64,["80"] = 64,["81"] = 65,["82"] = 66,["83"] = 67,["85"] = 67,["88"] = 64,["92"] = 59,["93"] = 73,["94"] = 75,["95"] = 76,["96"] = 77,["98"] = 78,["99"] = 78,["100"] = 79,["101"] = 80,["102"] = 81,["104"] = 81,["107"] = 78,["111"] = 86,["112"] = 88,["113"] = 89,["114"] = 90,["116"] = 91,["117"] = 91,["118"] = 92,["119"] = 93,["120"] = 94,["122"] = 94,["125"] = 91,["130"] = 73,["131"] = 101,["132"] = 103,["133"] = 104,["135"] = 105,["136"] = 105,["137"] = 106,["138"] = 107,["139"] = 108,["141"] = 108,["144"] = 105,["148"] = 101,["149"] = 114,["150"] = 116,["151"] = 117,["152"] = 118,["154"] = 119,["155"] = 119,["156"] = 120,["157"] = 121,["158"] = 122,["160"] = 122,["163"] = 119,["167"] = 114,["168"] = 128,["169"] = 130,["170"] = 131,["171"] = 132,["173"] = 133,["174"] = 133,["175"] = 134,["176"] = 135,["177"] = 136,["179"] = 136,["182"] = 133,["186"] = 128,["187"] = 142,["188"] = 142,["189"] = 142,["190"] = 144,["191"] = 145,["193"] = 146,["194"] = 146,["195"] = 147,["196"] = 148,["197"] = 149,["199"] = 149,["201"] = 150,["203"] = 150,["206"] = 146,["210"] = 142,["211"] = 142,["212"] = 156,["213"] = 156,["214"] = 156,["215"] = 158,["216"] = 159,["218"] = 160,["219"] = 160,["220"] = 161,["221"] = 162,["222"] = 163,["224"] = 163,["226"] = 164,["228"] = 164,["231"] = 160,["235"] = 156,["236"] = 156,["237"] = 170,["238"] = 170,["239"] = 170,["240"] = 171,["241"] = 172,["242"] = 173,["245"] = 176,["248"] = 179,["250"] = 179,["251"] = 179,["252"] = 179,["253"] = 179,["254"] = 179,["255"] = 179,["256"] = 179,["258"] = 170,["259"] = 170,["260"] = 181,["261"] = 181,["262"] = 181,["263"] = 182,["264"] = 183,["265"] = 184,["268"] = 187,["272"] = 190,["273"] = 190,["275"] = 190,["276"] = 190,["277"] = 190,["278"] = 190,["279"] = 190,["280"] = 190,["281"] = 190,["283"] = 181,["284"] = 181,["285"] = 58,["286"] = 199,["287"] = 200,["288"] = 202,["289"] = 203,["290"] = 204,["291"] = 205,["293"] = 207,["294"] = 207,["295"] = 208,["296"] = 209,["297"] = 210,["299"] = 210,["302"] = 207,["305"] = 214,["307"] = 215,["308"] = 215,["309"] = 216,["310"] = 217,["311"] = 218,["313"] = 218,["316"] = 215,["321"] = 224,["322"] = 225,["323"] = 226,["325"] = 227,["326"] = 227,["327"] = 228,["328"] = 229,["329"] = 230,["331"] = 230,["334"] = 227,["337"] = 233,["339"] = 234,["340"] = 234,["341"] = 235,["342"] = 236,["343"] = 237,["345"] = 237,["348"] = 234,["354"] = 200,["355"] = 199});
local ____exports = {}
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____SolarDamageState = require("solar.solar-common.attribute.SolarDamageState")
local SolarDamageState = ____SolarDamageState.default
local ____SolarActorUnitState = require("solar.solar-common.actor.state.SolarActorUnitState")
local SolarActorUnitState = ____SolarActorUnitState.default
local ____SolarActorItemState = require("solar.solar-common.actor.state.SolarActorItemState")
local SolarActorItemState = ____SolarActorItemState.default
local ____SolarActorAbilityState = require("solar.solar-common.actor.state.SolarActorAbilityState")
local SolarActorAbilityState = ____SolarActorAbilityState.default
local ____SolarActorBuffState = require("solar.solar-common.actor.state.SolarActorBuffState")
local SolarActorBuffState = ____SolarActorBuffState.default
local ____SolarActorAttributeState = require("solar.solar-common.actor.state.SolarActorAttributeState")
local SolarActorAttributeState = ____SolarActorAttributeState.default
local ____SolarActorFrameState = require("solar.solar-common.actor.state.SolarActorFrameState")
local SolarActorFrameState = ____SolarActorFrameState.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MessageUtil = require("solar.solar-common.util.system.MessageUtil")
local MessageUtil = ____MessageUtil.default
local ____SyncUtil = require("solar.solar-common.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
____exports.default = __TS__Class()
local SolarActorState = ____exports.default
SolarActorState.name = "SolarActorState"
function SolarActorState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorState()")
        return
    end
    self:initActor()
    self:initActorSolarDamage()
    __TS__New(SolarActorUnitState)
    __TS__New(SolarActorItemState)
    __TS__New(SolarActorAbilityState)
    __TS__New(SolarActorBuffState)
    __TS__New(SolarActorAttributeState)
    __TS__New(SolarActorFrameState)
    if isEmbedJapi then
        BaseUtil.runLater(
            2.3,
            function()
                MessageUtil:_sl_init_message_hook()
            end
        )
    else
        if isEmbedJapi == false then
            InputUtil:onMouseLeftButtonReleased(function()
                if SolarActorFrameState.mouseFocusActor then
                    if SolarActorFrameState.mouseFocusActor:isDisable() or SolarActorFrameState.mouseFocusActor:isHide() then
                        return
                    end
                    SolarActorFrameState.mouseFocusActor:localClick(1, 0, 0)
                end
            end)
        end
    end
end
function SolarActorState.prototype.initActor(self)
    se:onUnitAttacked(function(e)
        local actorList = ActorUtil:getUnitAllActorList(e.trigUnit)
        if actorList ~= nil and #actorList > 0 then
            local uArg = GetAttacker()
            do
                local i = #actorList - 1
                while i >= 0 do
                    local actor = actorList[i + 1]
                    if not actor:isDisable() then
                        local ____opt_0 = actor:get("onUnitAttacked")
                        if ____opt_0 ~= nil then
                            ____opt_0(nil, actor, uArg)
                        end
                    end
                    i = i - 1
                end
            end
        end
    end)
    se:onUnitDeath(function(e)
        local actorList = ActorUtil:getUnitAllActorList(e.trigUnit)
        local killingUnit = e.killingUnit
        if actorList ~= nil and #actorList > 0 then
            do
                local i = #actorList - 1
                while i >= 0 do
                    local actor = actorList[i + 1]
                    if not actor:isDisable() then
                        local ____opt_2 = actor:get("onUnitDeath")
                        if ____opt_2 ~= nil then
                            ____opt_2(nil, actor, killingUnit)
                        end
                    end
                    i = i - 1
                end
            end
        end
        if IsHandle(killingUnit) then
            local actorList = ActorUtil:getUnitAllActorList(killingUnit)
            if actorList ~= nil and #actorList > 0 then
                local uArg = e.trigUnit
                do
                    local i = #actorList - 1
                    while i >= 0 do
                        local actor = actorList[i + 1]
                        if not actor:isDisable() then
                            local ____opt_4 = actor:get("onUnitKillEnemy")
                            if ____opt_4 ~= nil then
                                ____opt_4(nil, actor, uArg)
                            end
                        end
                        i = i - 1
                    end
                end
            end
        end
    end)
    se:onHeroLevelUp(function(e)
        local actorList = ActorUtil:getUnitAllActorList(e.trigUnit)
        if actorList ~= nil and #actorList > 0 then
            do
                local i = #actorList - 1
                while i >= 0 do
                    local actor = actorList[i + 1]
                    if not actor:isDisable() then
                        local ____opt_6 = actor:get("onUnitLevelChange")
                        if ____opt_6 ~= nil then
                            ____opt_6(nil, actor, 1)
                        end
                    end
                    i = i - 1
                end
            end
        end
    end)
    se:onUnitSpellEffect(function(e)
        local actorList = ActorUtil:getUnitAllActorList(e.trigUnit)
        if actorList ~= nil and #actorList > 0 then
            local idStr = e.spellAbilityIdStr
            do
                local i = #actorList - 1
                while i >= 0 do
                    local actor = actorList[i + 1]
                    if not actor:isDisable() then
                        local ____opt_8 = actor:get("onUnitSpell")
                        if ____opt_8 ~= nil then
                            ____opt_8(nil, actor, idStr)
                        end
                    end
                    i = i - 1
                end
            end
        end
    end)
    se:onUnitPickupItem(function(e)
        local actorList = ActorUtil:getUnitAllActorList(e.trigUnit)
        if actorList ~= nil and #actorList > 0 then
            local item = e.manipulatedItem
            do
                local i = #actorList - 1
                while i >= 0 do
                    local actor = actorList[i + 1]
                    if not actor:isDisable() then
                        local ____opt_10 = actor:get("onUnitPickupItem")
                        if ____opt_10 ~= nil then
                            ____opt_10(nil, actor, item)
                        end
                    end
                    i = i - 1
                end
            end
        end
    end)
    se:on(
        "_sl_:单位获得演员",
        function(data)
            local actorList = ActorUtil:getUnitAllActorList(data.u)
            if actorList ~= nil and #actorList > 0 then
                do
                    local i = #actorList - 1
                    while i >= 0 do
                        local actor = actorList[i + 1]
                        if actor ~= data.a and not actor:isDisable() then
                            local ____opt_12 = actor:get("onUnitAddActor")
                            if ____opt_12 ~= nil then
                                ____opt_12(nil, actor, data.a)
                            end
                            local ____opt_14 = actor:get("onUnitActorsChange")
                            if ____opt_14 ~= nil then
                                ____opt_14(nil, actor, false, data.a)
                            end
                        end
                        i = i - 1
                    end
                end
            end
        end
    )
    se:on(
        "_sl_:单位失去演员",
        function(data)
            local actorList = ActorUtil:getUnitAllActorList(data.u)
            if actorList ~= nil and #actorList > 0 then
                do
                    local i = #actorList - 1
                    while i >= 0 do
                        local actor = actorList[i + 1]
                        if actor ~= data.a and not actor:isDisable() then
                            local ____opt_16 = actor:get("onUnitRemoveActor")
                            if ____opt_16 ~= nil then
                                ____opt_16(nil, actor, data.a)
                            end
                            local ____opt_18 = actor:get("onUnitActorsChange")
                            if ____opt_18 ~= nil then
                                ____opt_18(nil, actor, true, data.a)
                            end
                        end
                        i = i - 1
                    end
                end
            end
        end
    )
    SyncUtil.onSyncObjData(
        "_sl_:a:onClick",
        function(____, triggerPlayer, data)
            local actor = Actor.allActors[data.i]
            if actor == nil then
                log.errorWithTraceBack("本地点击的id未找到对应的演员!")
                return
            end
            if actor:isDisable() then
                return
            end
            local ____opt_20 = actor:get("onClick")
            if ____opt_20 ~= nil then
                ____opt_20(
                    nil,
                    actor,
                    data.b,
                    triggerPlayer,
                    actor.actorType
                )
            end
        end
    )
    SyncUtil.onSyncObjData(
        "_sl_:at:onClick",
        function(____, triggerPlayer, data)
            local actorType = ActorTypeUtil:getActorType(data.i)
            if actorType == nil then
                log.errorWithTraceBack("本地点击的id未找到对应的演员类型!")
                return
            end
            if actorType.disable == true then
                return
            end
            local ____this_23
            ____this_23 = actorType
            local ____opt_22 = ____this_23.onClick
            if ____opt_22 ~= nil then
                ____opt_22(
                    ____this_23,
                    nil,
                    data.b,
                    triggerPlayer,
                    actorType
                )
            end
        end
    )
end
function SolarActorState.prototype.initActorSolarDamage(self)
    SolarDamageState:addEventHandler(function(____, event)
        local unit0 = event.unit0
        local unit1 = event.unit1
        local actorList = ActorUtil:getUnitAllActorList(unit0)
        if actorList ~= nil and #actorList > 0 then
            do
                local i = #actorList - 1
                while i >= 0 do
                    local actor = actorList[i + 1]
                    if not actor:isDisable() then
                        local ____opt_24 = actor:get("onUnitDamaged")
                        if ____opt_24 ~= nil then
                            ____opt_24(nil, actor, unit1, event)
                        end
                    end
                    i = i - 1
                end
            end
            if event.isAttack then
                do
                    local i = #actorList - 1
                    while i >= 0 do
                        local actor = actorList[i + 1]
                        if not actor:isDisable() then
                            local ____opt_26 = actor:get("onUnitAttackedDamage")
                            if ____opt_26 ~= nil then
                                ____opt_26(nil, actor, unit1, event)
                            end
                        end
                        i = i - 1
                    end
                end
            end
        end
        if IsHandle(unit1) then
            actorList = ActorUtil:getUnitAllActorList(unit1)
            if actorList ~= nil and #actorList > 0 then
                do
                    local i = #actorList - 1
                    while i >= 0 do
                        local actor = actorList[i + 1]
                        if not actor:isDisable() then
                            local ____opt_28 = actor:get("onUnitDamageEnemy")
                            if ____opt_28 ~= nil then
                                ____opt_28(nil, actor, unit0, event)
                            end
                        end
                        i = i - 1
                    end
                end
                if event.isAttack then
                    do
                        local i = #actorList - 1
                        while i >= 0 do
                            local actor = actorList[i + 1]
                            if not actor:isDisable() then
                                local ____opt_30 = actor:get("onUnitAttackDamageEnemy")
                                if ____opt_30 ~= nil then
                                    ____opt_30(nil, actor, unit0, event)
                                end
                            end
                            i = i - 1
                        end
                    end
                end
            end
        end
    end)
end
return ____exports
