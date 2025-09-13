local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 6,["16"] = 6,["17"] = 7,["18"] = 7,["19"] = 8,["20"] = 8,["21"] = 9,["22"] = 9,["23"] = 10,["24"] = 10,["25"] = 12,["26"] = 12,["27"] = 23,["28"] = 23,["29"] = 23,["31"] = 23,["32"] = 32,["33"] = 33,["36"] = 36,["37"] = 37,["38"] = 38,["39"] = 39,["41"] = 41,["42"] = 43,["43"] = 43,["44"] = 43,["45"] = 43,["46"] = 45,["47"] = 46,["48"] = 47,["49"] = 48,["50"] = 48,["51"] = 48,["52"] = 49,["53"] = 50,["55"] = 48,["56"] = 48,["59"] = 55,["60"] = 56,["61"] = 57,["62"] = 57,["63"] = 57,["64"] = 58,["65"] = 59,["67"] = 57,["68"] = 57,["71"] = 41,["72"] = 32,["73"] = 74,["74"] = 75,["75"] = 76,["77"] = 78,["78"] = 79,["80"] = 81,["81"] = 74,["82"] = 88,["83"] = 89,["84"] = 90,["86"] = 92,["87"] = 93,["89"] = 95,["90"] = 96,["92"] = 98,["93"] = 88,["94"] = 106,["95"] = 107,["96"] = 109,["97"] = 110,["98"] = 112,["100"] = 114,["101"] = 115,["102"] = 117,["104"] = 119,["105"] = 121,["107"] = 123,["108"] = 124,["109"] = 127,["110"] = 128,["111"] = 129,["112"] = 130,["114"] = 132,["115"] = 132,["116"] = 132,["117"] = 132,["118"] = 134,["119"] = 134,["120"] = 134,["121"] = 134,["122"] = 135,["124"] = 137,["125"] = 137,["126"] = 137,["127"] = 137,["128"] = 137,["129"] = 139,["130"] = 139,["131"] = 139,["132"] = 139,["133"] = 140,["135"] = 145,["136"] = 146,["137"] = 147,["138"] = 148,["139"] = 149,["143"] = 155,["144"] = 155,["145"] = 155,["146"] = 155,["147"] = 155,["148"] = 155,["149"] = 155,["150"] = 159,["151"] = 109,["152"] = 106,["153"] = 168,["154"] = 169,["155"] = 170,["156"] = 171,["157"] = 172,["158"] = 173,["160"] = 175,["161"] = 175,["162"] = 175,["163"] = 176,["164"] = 177,["165"] = 178,["166"] = 179,["168"] = 181,["169"] = 181,["170"] = 181,["171"] = 181,["172"] = 181,["173"] = 181,["174"] = 181,["175"] = 181,["176"] = 181,["177"] = 181,["178"] = 181,["179"] = 181,["180"] = 181,["181"] = 181,["182"] = 195,["183"] = 196,["184"] = 198,["185"] = 199,["186"] = 200,["187"] = 202,["189"] = 205,["190"] = 208,["192"] = 211,["196"] = 196,["197"] = 232,["198"] = 233,["199"] = 175,["200"] = 175,["201"] = 168,["202"] = 237,["203"] = 238,["204"] = 239,["205"] = 240,["208"] = 243,["209"] = 243,["210"] = 243,["211"] = 243,["212"] = 243,["213"] = 244,["214"] = 246,["215"] = 247,["216"] = 247,["217"] = 247,["218"] = 247,["219"] = 247,["220"] = 248,["222"] = 250,["224"] = 252,["225"] = 253,["226"] = 254,["227"] = 256,["229"] = 258,["231"] = 258,["234"] = 260,["236"] = 237,["237"] = 268,["238"] = 269,["241"] = 272,["242"] = 276,["243"] = 276,["244"] = 276,["245"] = 277,["246"] = 278,["247"] = 279,["250"] = 283,["251"] = 284,["253"] = 276,["254"] = 276,["255"] = 268,["256"] = 294,["257"] = 295,["258"] = 295,["259"] = 295,["260"] = 296,["261"] = 296,["262"] = 296,["263"] = 296,["264"] = 296,["265"] = 296,["266"] = 296,["267"] = 296,["268"] = 296,["269"] = 296,["270"] = 296,["271"] = 307,["272"] = 309,["273"] = 309,["274"] = 310,["275"] = 311,["276"] = 312,["277"] = 312,["278"] = 312,["279"] = 312,["281"] = 307,["282"] = 316,["283"] = 317,["284"] = 295,["285"] = 295,["286"] = 294,["287"] = 325,["288"] = 326,["289"] = 326,["290"] = 326,["291"] = 327,["292"] = 327,["293"] = 327,["294"] = 327,["295"] = 327,["296"] = 327,["297"] = 327,["298"] = 327,["299"] = 327,["300"] = 327,["301"] = 327,["302"] = 338,["303"] = 339,["304"] = 339,["305"] = 340,["306"] = 341,["307"] = 342,["308"] = 342,["309"] = 342,["310"] = 342,["312"] = 338,["313"] = 345,["314"] = 346,["315"] = 326,["316"] = 326,["317"] = 325,["318"] = 25,["319"] = 26,["320"] = 266});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____SyncUtil = require("solar.solar-common.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local ____ActorFrameUtil = require("solar.solar-common.actor.util.ActorFrameUtil")
local ActorFrameUtil = ____ActorFrameUtil.default
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____SolarConfig = require("solar.solar-common.common.SolarConfig")
local SolarConfig = ____SolarConfig.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local ActorTypeShopUtil = ____exports.default
ActorTypeShopUtil.name = "ActorTypeShopUtil"
function ActorTypeShopUtil.prototype.____constructor(self)
end
function ActorTypeShopUtil.autoDisableSellingAbilityOnNoStoreTarget(self, shopActorUnitTypeId)
    if GetStoreTarget == nil then
        return
    end
    local actorType = ActorTypeUtil:getActorType(shopActorUnitTypeId)
    actorType.interval = 1
    if actorType.onUnitInterval ~= nil then
        print("不要重复设置商店单位的onUnitInterval回调:" .. shopActorUnitTypeId)
    end
    actorType.onUnitInterval = function(____, actor)
        local unit = GetStoreTarget(
            actor.unit,
            GetLocalPlayer()
        )
        if IsHandle(unit) then
            if actor.tempBool ~= true then
                actor.tempBool = true
                ActorAbilityUtil:forUnitActorAbilityList(
                    actor.unit,
                    function(____, actor)
                        if not actor:isDisable() and actor:get("class") == ____exports.default._sl_baseSellingAbilityClass then
                            actor:getRootFrameControl():getDisableFrame().visible = false
                        end
                    end
                )
            end
        else
            if actor.tempBool ~= false then
                actor.tempBool = false
                ActorAbilityUtil:forUnitActorAbilityList(
                    actor.unit,
                    function(____, actor)
                        if actor:get("class") == ____exports.default._sl_baseSellingAbilityClass then
                            actor:getRootFrameControl():getDisableFrame().visible = true
                        end
                    end
                )
            end
        end
    end
end
function ActorTypeShopUtil.isActorItemSellingAbilityType(self, actorAbilityType)
    if actorAbilityType == nil then
        return false
    end
    if actorAbilityType.class ~= ____exports.default._sl_baseSellingAbilityClass then
        return false
    end
    return actorAbilityType.actorItemTypeId ~= nil
end
function ActorTypeShopUtil.getSellActorItemType(self, actorAbilityType)
    if actorAbilityType == nil then
        return nil
    end
    if actorAbilityType.class ~= ____exports.default._sl_baseSellingAbilityClass then
        return nil
    end
    if actorAbilityType.actorItemTypeId == nil then
        return nil
    end
    return ActorTypeUtil:getActorType(actorAbilityType.actorItemTypeId)
end
function ActorTypeShopUtil.addBuyActorLocalClickEvent(self, actorType)
    ____exports.default:_sl_initBuyActor()
    actorType.onLocalClick = function(____, actor, btn)
        if btn ~= 1 then
            return true
        end
        local actorAbility = actor
        if actorAbility:getCooldown() > 0 then
            return false
        end
        if _g_time - (actor.tempNum or 0) < 400 then
            return false
        end
        actor.tempNum = _g_time
        local p = GetLocalPlayer()
        local unit = GetStoreTarget(actor.unit, p)
        if not IsHandle(unit) then
            PlayerUtil:message("没有购买单位!请将需要购买物品的单位靠近此单位!", 10, p)
            return false
        end
        if not PlayerUtil:hasEnoughState(
            p,
            actorAbility:get("goldCost")
        ) then
            ActorFrameUtil:showTipText(
                actor,
                "|cffff0000金币不足,还差:" .. tostring(actorAbility:get("goldCost") - PlayerUtil:getGold(p))
            )
            return false
        end
        if not PlayerUtil:hasEnoughState(
            p,
            nil,
            actorAbility:get("lumberCost")
        ) then
            ActorFrameUtil:showTipText(
                actor,
                "|cffff0000木材不足,还差:" .. tostring(actorAbility:get("lumberCost") - PlayerUtil:getLumber(p))
            )
            return false
        end
        if actorAbility.numberOverlay then
            if actorAbility.numberOverlay < 1 then
                PlayerUtil:message("没有库存了!", 10, p)
                ActorFrameUtil:showTipText(actor, "|cffff0000库存不足")
                return false
            else
            end
        end
        SyncUtil.syncObjData(
            "_sl_:buyActor",
            {
                i = actor.uuid,
                u = h2i(unit)
            }
        )
        return true
    end
end
function ActorTypeShopUtil.warpActorItem2SellingAbility(self, actorItemTypeId)
    if GetStoreTarget == nil then
        local info = "|cffff0000无GetStoreTarget环境此API无效:" .. actorItemTypeId
        BJDebugMsg(info)
        log.errorWithTraceBack(info)
        return nil
    end
    return ____exports.default.cache:get(
        "warpActorItem2SellingAbility:" .. actorItemTypeId,
        function()
            local actorType = ActorTypeUtil:getActorType(actorItemTypeId)
            if actorType == nil then
                log.errorWithTraceBack("不存在此演员物品类型:" .. actorItemTypeId)
                return nil
            end
            local actorAbilityType = {
                id = "_sl_SellingAbility:" .. actorItemTypeId,
                class = ____exports.default._sl_baseSellingAbilityClass,
                name = actorType.name,
                icon = actorType.icon,
                disable = actorType.disable,
                requiredTip = actorType.requiredTip,
                describe = actorType.describe,
                goldCost = actorType.goldCost,
                lumberCost = actorType.lumberCost,
                manaCost = 0,
                maxCd = 0.2,
                actorItemTypeId = actorItemTypeId
            }
            ____exports.default:addBuyActorLocalClickEvent(actorAbilityType)
            actorAbilityType.onAction = function(____, actorAbility)
                local issueOrderUnitSync = actorAbility.issueOrderUnitSync
                actorAbility.issueOrderUnitSync = nil
                if IsHandle(issueOrderUnitSync) then
                    ____exports.default:_sl_buyActorItemByActorAbility(actorAbility, issueOrderUnitSync, actorItemTypeId)
                else
                    if isEmbedJapi then
                        print("网络卡顿,请购买物品的玩家重新点击购买!")
                    else
                        print("网络卡顿,或购买资源不足!")
                    end
                    return
                end
            end
            ActorTypeUtil:registerActorType(actorAbilityType)
            return actorAbilityType
        end
    )
end
function ActorTypeShopUtil._sl_buyActorItemByActorAbility(self, actorAbility, issueOrderUnitSync, actorItemTypeId)
    if actorAbility.actorType._sl_buyActorItemByActorAbility then
        if not actorAbility.actorType:_sl_buyActorItemByActorAbility(actorAbility, issueOrderUnitSync, actorItemTypeId) then
            return false
        end
    end
    if PlayerUtil:costEnoughState(
        GetOwningPlayer(issueOrderUnitSync),
        actorAbility:get("goldCost"),
        actorAbility:get("lumberCost")
    ) then
        if actorAbility.numberOverlay then
            if actorAbility.numberOverlay < 1 then
                PlayerUtil:message(
                    "|cffff0000没有库存了!",
                    10,
                    GetOwningPlayer(issueOrderUnitSync)
                )
                return false
            end
            actorAbility.numberOverlay = actorAbility.numberOverlay - 1
        end
        local buyingUnit = issueOrderUnitSync
        local actorItem = ActorItemUtil:addActorItemForUnit(actorItemTypeId, buyingUnit)
        if actorItem:get("stackMax", 0) > 1 and actorItem:get("destroyOnNoUses") == true then
            actorItem:setUses(actorItem:get("uses", 1))
        end
        local ____opt_0 = actorItem:get("onBuy")
        if ____opt_0 ~= nil then
            ____opt_0(nil, actorItem, buyingUnit)
        end
    else
        log.errorWithTraceBack("购买物品的资源消耗不足！请保证技能校验资源与实际资源需求是一样的！")
    end
end
function ActorTypeShopUtil._sl_initBuyActor(self)
    if ____exports.default._sl_inited then
        return
    end
    ____exports.default._sl_inited = true
    SyncUtil.onSyncObjData(
        "_sl_:buyActor",
        function(____, p, obj)
            local actorAbility = Actor.allActors[obj.i]
            if actorAbility == nil then
                log.errorWithTraceBack("售卖技能演员为null!")
                return
            end
            if not IsHandle(actorAbility.issueOrderUnitSync) then
                actorAbility.issueOrderUnitSync = i2h(obj.u)
            end
        end
    )
end
function ActorTypeShopUtil.getPageNext(self)
    return ____exports.default.cache:get(
        "getPageNext",
        function()
            local actorAbilityType = {
                id = "_sl_SellingAbility:PageNext",
                class = "_sl_Page",
                name = "下一页",
                icon = SolarConfig.defaultDownPath,
                describe = "下一页",
                manaCost = 0,
                maxCd = 0.1,
                x = 2,
                y = 2
            }
            actorAbilityType.onAction = function(____, actor, x, y, targetUnit)
                local ____opt_2 = DataBase:getUnitSolarData(actor.unit, false)
                local actorUnit = ____opt_2 and ____opt_2._SL_solarActorUnit
                if actorUnit then
                    actorUnit._sl_sellActorItemPageIndex = actorUnit._sl_sellActorItemPageIndex + 1
                    actorUnit:set(
                        "sellItems",
                        actorUnit:get("sellItems")
                    )
                end
            end
            ActorTypeUtil:registerActorType(actorAbilityType)
            return actorAbilityType
        end
    )
end
function ActorTypeShopUtil.getPagePrevious(self)
    return ____exports.default.cache:get(
        "getPagePrevious",
        function()
            local actorAbilityType = {
                id = "_sl_SellingAbility:PagePrevious",
                class = "_sl_Page",
                name = "上一页",
                icon = SolarConfig.defaultUpPath,
                describe = "上一页",
                manaCost = 0,
                maxCd = 0.1,
                x = 1,
                y = 2
            }
            actorAbilityType.onAction = function(____, actor, x, y, targetUnit)
                local ____opt_4 = DataBase:getUnitSolarData(actor.unit, false)
                local actorUnit = ____opt_4 and ____opt_4._SL_solarActorUnit
                if actorUnit then
                    actorUnit._sl_sellActorItemPageIndex = actorUnit._sl_sellActorItemPageIndex - 1
                    actorUnit:set(
                        "sellItems",
                        actorUnit:get("sellItems")
                    )
                end
            end
            ActorTypeUtil:registerActorType(actorAbilityType)
            return actorAbilityType
        end
    )
end
ActorTypeShopUtil.cache = __TS__New(Cache)
ActorTypeShopUtil._sl_baseSellingAbilityClass = "太阳演员技能售卖"
ActorTypeShopUtil._sl_inited = false
return ____exports
