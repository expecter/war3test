local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 3,["16"] = 3,["17"] = 4,["18"] = 4,["19"] = 5,["20"] = 5,["21"] = 7,["22"] = 7,["23"] = 8,["24"] = 8,["25"] = 9,["26"] = 9,["27"] = 10,["28"] = 10,["29"] = 17,["30"] = 17,["31"] = 17,["32"] = 17,["33"] = 27,["34"] = 17,["35"] = 24,["36"] = 25,["37"] = 29,["38"] = 31,["39"] = 32,["40"] = 33,["41"] = 35,["43"] = 37,["44"] = 38,["45"] = 40,["46"] = 41,["47"] = 42,["49"] = 44,["52"] = 47,["53"] = 48,["54"] = 49,["55"] = 50,["56"] = 52,["57"] = 52,["58"] = 52,["59"] = 52,["60"] = 53,["61"] = 53,["62"] = 53,["63"] = 53,["64"] = 54,["65"] = 54,["66"] = 54,["67"] = 54,["68"] = 56,["69"] = 56,["70"] = 56,["71"] = 56,["74"] = 72,["75"] = 73,["78"] = 77,["79"] = 78,["81"] = 81,["82"] = 83,["83"] = 83,["84"] = 83,["85"] = 83,["86"] = 83,["87"] = 83,["89"] = 85,["90"] = 85,["91"] = 85,["92"] = 85,["93"] = 85,["94"] = 85,["95"] = 85,["96"] = 86,["97"] = 87,["99"] = 90,["100"] = 91,["101"] = 92,["102"] = 94,["104"] = 95,["105"] = 95,["106"] = 96,["107"] = 98,["108"] = 99,["109"] = 99,["110"] = 99,["111"] = 99,["114"] = 95,["118"] = 27,["119"] = 113,["120"] = 17,["121"] = 115,["125"] = 118,["126"] = 205,["127"] = 119,["129"] = 120,["130"] = 120,["132"] = 121,["133"] = 121,["137"] = 123,["139"] = 124,["140"] = 125,["142"] = 127,["143"] = 129,["144"] = 129,["149"] = 132,["151"] = 133,["154"] = 135,["156"] = 136,["157"] = 136,["158"] = 136,["159"] = 136,["160"] = 136,["161"] = 136,["162"] = 136,["165"] = 139,["167"] = 140,["168"] = 140,["169"] = 140,["170"] = 140,["171"] = 140,["172"] = 140,["173"] = 140,["176"] = 143,["178"] = 144,["179"] = 144,["180"] = 144,["181"] = 144,["182"] = 144,["183"] = 144,["184"] = 144,["187"] = 147,["189"] = 148,["190"] = 148,["191"] = 148,["192"] = 148,["193"] = 148,["194"] = 148,["195"] = 148,["198"] = 151,["200"] = 152,["201"] = 152,["205"] = 154,["207"] = 155,["210"] = 157,["212"] = 158,["213"] = 158,["214"] = 158,["215"] = 158,["216"] = 159,["217"] = 159,["218"] = 159,["219"] = 159,["220"] = 160,["223"] = 162,["225"] = 163,["226"] = 164,["229"] = 166,["231"] = 167,["232"] = 168,["235"] = 171,["237"] = 172,["240"] = 174,["242"] = 175,["245"] = 177,["247"] = 178,["250"] = 180,["252"] = 181,["255"] = 183,["257"] = 184,["260"] = 186,["262"] = 187,["265"] = 189,["267"] = 190,["270"] = 192,["272"] = 193,["275"] = 195,["277"] = 196,["280"] = 198,["282"] = 199,["285"] = 201,["287"] = 202,["290"] = 204,["292"] = 205,["293"] = 206,["296"] = 208,["298"] = 209,["299"] = 210,["302"] = 212,["304"] = 213,["305"] = 214,["308"] = 216,["310"] = 217,["311"] = 218,["314"] = 220,["316"] = 221,["317"] = 222,["318"] = 223,["323"] = 113,["324"] = 230,["325"] = 17,["326"] = 230,["327"] = 234,["328"] = 17,["329"] = 236,["330"] = 234,["331"] = 239,["332"] = 239,["333"] = 239,["335"] = 240,["336"] = 241,["338"] = 17,["339"] = 239,["340"] = 250,["341"] = 252,["342"] = 250,["343"] = 258,["344"] = 259,["345"] = 258,["346"] = 265,["347"] = 266,["348"] = 265,["349"] = 273,["350"] = 274,["353"] = 277,["354"] = 278,["355"] = 279,["356"] = 280,["357"] = 281,["358"] = 282,["359"] = 283,["361"] = 285,["363"] = 287,["364"] = 288,["365"] = 289,["366"] = 290,["368"] = 292,["369"] = 293,["370"] = 294,["371"] = 294,["374"] = 297,["375"] = 298,["376"] = 299,["377"] = 300,["378"] = 301,["379"] = 302,["380"] = 303,["382"] = 305,["384"] = 307,["385"] = 308,["386"] = 309,["387"] = 310,["388"] = 311,["390"] = 313,["393"] = 273,["394"] = 321,["395"] = 321,["396"] = 322,["397"] = 323,["398"] = 324,["399"] = 325,["400"] = 326,["401"] = 326,["404"] = 321,["405"] = 335,["406"] = 336,["407"] = 337,["408"] = 338,["409"] = 339,["412"] = 342,["413"] = 335,["414"] = 349,["415"] = 350,["417"] = 351,["418"] = 351,["419"] = 352,["420"] = 353,["421"] = 354,["422"] = 355,["424"] = 351,["427"] = 358,["428"] = 349,["429"] = 364,["431"] = 365,["432"] = 365,["433"] = 366,["434"] = 367,["435"] = 368,["436"] = 365,["439"] = 370,["440"] = 371,["441"] = 372,["442"] = 373,["443"] = 374,["447"] = 364,["448"] = 385,["449"] = 385,["450"] = 385,["452"] = 386,["453"] = 385,["454"] = 393,["455"] = 393,["456"] = 394,["457"] = 395,["458"] = 396,["459"] = 397,["460"] = 398,["463"] = 401,["467"] = 393,["468"] = 412,["469"] = 413,["470"] = 414,["471"] = 415,["473"] = 417,["474"] = 412,["475"] = 425,["476"] = 426,["477"] = 427,["478"] = 428,["480"] = 430,["481"] = 431,["482"] = 425,["483"] = 439,["484"] = 440,["485"] = 439,["486"] = 448,["487"] = 449,["488"] = 448,["489"] = 452,["490"] = 453,["491"] = 17,["492"] = 455,["493"] = 456,["495"] = 459,["496"] = 460,["498"] = 462,["499"] = 452,["500"] = 19,["501"] = 20,["502"] = 21,["507"] = 110});
local ____exports = {}
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____ObjectTemplateUtil = require("solar.solar-common.util.object.ObjectTemplateUtil")
local ObjectTemplateUtil = ____ObjectTemplateUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ActorAbility = require("solar.solar-common.actor.ActorAbility")
local ActorAbility = ____ActorAbility.default
local ____ActorTypeShopUtil = require("solar.solar-common.actor.util.ActorTypeShopUtil")
local ActorTypeShopUtil = ____ActorTypeShopUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local ____UnitTypeUtil = require("solar.solar-common.util.unit.UnitTypeUtil")
local UnitTypeUtil = ____UnitTypeUtil.default
____exports.default = __TS__Class()
local ActorUnit = ____exports.default
ActorUnit.name = "ActorUnit"
__TS__ClassExtends(ActorUnit, Actor)
function ActorUnit.prototype.____constructor(self, actorTypeId, player, x, y)
    Actor.prototype.____constructor(self, actorTypeId)
    self._sl_sellActorItemPageIndex = 0
    self.sellItemAbilityList = {}
    ____exports.default.allActorUnits[self.uuid] = self
    local templateType = self:getTemplateType()
    ObjectTemplateUtil:_sl_init()
    if not ObjectTemplateUtil:hasTemplate(templateType) then
        self.unitTypeID = templateType
    else
        local autoTemplateAllocPolicy = self.actorType.templateAllocPolicy
        if self.templateCacheKey == nil then
            if self.actorType.templateAllocPolicy == nil and ObjectTemplateUtil:getTemplateMaxCount(self._actorType.templateType) > 10 then
                self.templateCacheKey = "_sltap_ats:" .. self._actorType.id
                autoTemplateAllocPolicy = "actorTypeShare"
            else
                self.templateCacheKey = "_sltap_tts:" .. self._actorType.templateType
            end
        end
        local unitTypeID = ObjectTemplateUtil:borrowTemplate(templateType, self.templateCacheKey, self.uuid)
        self.unitTypeID = unitTypeID
        self.templateId = unitTypeID
        if autoTemplateAllocPolicy == "actorTypeShare" then
            DzSetUnitTypeName(
                FourCC(self.unitTypeID),
                self:getName()
            )
            UnitTypeUtil:setUnitIcon(
                self.unitTypeID,
                self:getIcon()
            )
            UnitTypeUtil:setUnitTypeTip(
                self.unitTypeID,
                self:getName()
            )
            UnitTypeUtil:setUnitTypeUbertip(
                self.unitTypeID,
                self:getDescribe()
            )
        end
    end
    if self.unitTypeID == nil or #self.unitTypeID ~= 4 then
        log.errorWithTraceBack((("物编模板id获取失败:" .. tostring(templateType)) .. " -> ") .. tostring(self.unitTypeID))
        return
    end
    if self.actorType.sellItems and #self.actorType.sellItems > 0 and self.actorType.onUnitInterval == nil then
        ActorTypeShopUtil:autoDisableSellingAbilityOnNoStoreTarget(actorTypeId)
    end
    if self.actorType.foodCost and self.actorType.foodCost ~= 0 then
        DzSetUnitDataCacheInteger(
            FourCC(self.unitTypeID),
            92,
            0,
            self.actorType.foodCost
        )
    end
    self.unit = CreateUnit(
        player,
        self.unitTypeID,
        x,
        y,
        270
    )
    if self.actorType.foodCost == nil or self.actorType.foodCost == 0 then
        SetUnitUseFood(self.unit, false)
    end
    DataBase:getUnitSolarData(self.unit)._SL_solarActorUnit = self
    self:_sl_init()
    self:update()
    if IsHeroUnitId(GetUnitTypeId(self.unit)) and FrameSetOriginButtonTexture and GetLocalPlayer() == player then
        do
            local i = 5
            while i >= 0 do
                local heroBarButton = DzFrameGetHeroBarButton(i)
                if FrameIsShow(heroBarButton) then
                    FrameSetOriginButtonTexture(
                        heroBarButton,
                        self:getIcon()
                    )
                    break
                end
                i = i - 1
            end
        end
    end
end
function ActorUnit.prototype._sl_rawset(self, key, value)
    Actor.prototype._sl_rawset(self, key, value)
    if not IsHandle(self.unit) then
        return
    end
    repeat
        local ____switch19 = key
        local builds, upgradeUnits, trainUnits, sellItems, abilities
        local ____cond19 = ____switch19 == "name"
        if ____cond19 then
            if SetUnitName ~= nil then
                SetUnitName(self.unit, value)
            end
            if SetUnitProperName ~= nil then
                SetUnitProperName(self.unit, value)
            end
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "model"
        if ____cond19 then
            if SetUnitModel then
                SetUnitModel(self.unit, value)
            else
                DzSetUnitModel(self.unit, value)
                if SetUnitPortrait ~= nil then
                    SetUnitPortrait(self.unit, value)
                end
            end
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "modelScale"
        if ____cond19 then
            SetUnitScale(self.unit, value, value, value)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "colorR"
        if ____cond19 then
            SetUnitVertexColor(
                self.unit,
                value or 255,
                self:get("colorG", 255),
                self:get("colorB", 255),
                self:get("alpha", 255)
            )
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "colorG"
        if ____cond19 then
            SetUnitVertexColor(
                self.unit,
                self:get("colorR", 255),
                value or 255,
                self:get("colorB", 255),
                self:get("alpha", 255)
            )
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "colorB"
        if ____cond19 then
            SetUnitVertexColor(
                self.unit,
                self:get("colorR", 255),
                self:get("colorG", 255),
                value or 255,
                self:get("alpha", 255)
            )
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "alpha"
        if ____cond19 then
            SetUnitVertexColor(
                self.unit,
                self:get("colorR", 255),
                self:get("colorG", 255),
                self:get("colorB", 255),
                value or 255
            )
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "missileModel"
        if ____cond19 then
            if SetUnitMissileModel ~= nil then
                SetUnitMissileModel(self.unit, value)
            end
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "moveType"
        if ____cond19 then
            UnitStateUtil:setMoveType(self.unit, value)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "flyHeight"
        if ____cond19 then
            UnitAddAbility(
                self.unit,
                FourCC("Amrf")
            )
            UnitRemoveAbility(
                self.unit,
                FourCC("Amrf")
            )
            SetUnitFlyHeight(self.unit, value, 0)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "maxLife"
        if ____cond19 then
            SetUnitState(self.unit, UNIT_STATE_MAX_LIFE, value)
            SetUnitState(self.unit, UNIT_STATE_LIFE, value)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "maxMana"
        if ____cond19 then
            SetUnitState(self.unit, UNIT_STATE_MAX_MANA, value)
            SetUnitState(self.unit, UNIT_STATE_MANA, value)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "acquireRange"
        if ____cond19 then
            SetUnitAcquireRange(self.unit, value)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "range"
        if ____cond19 then
            SetUnitState(self.unit, UnitStateDamageRange, value)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "damage"
        if ____cond19 then
            SetUnitState(self.unit, UnitStateDamageBase, value)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "damageCd"
        if ____cond19 then
            SetUnitState(self.unit, UnitStateDamageCool, value)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "strength"
        if ____cond19 then
            SetHeroStr(self.unit, value, true)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "agility"
        if ____cond19 then
            SetHeroAgi(self.unit, value, true)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "intelligence"
        if ____cond19 then
            SetHeroInt(self.unit, value, true)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "hide"
        if ____cond19 then
            ShowUnit(self.unit, value == false)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "def"
        if ____cond19 then
            SetUnitState(self.unit, UnitStateArmor, value)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "turnRate"
        if ____cond19 then
            SetUnitTurnSpeed(self.unit, value)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "moveSpeed"
        if ____cond19 then
            SetUnitMoveSpeed(self.unit, value)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "builds"
        if ____cond19 then
            builds = value
            self:setBuilds(builds)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "upgradeUnits"
        if ____cond19 then
            upgradeUnits = value
            self:setUpgradeUnits2unit(upgradeUnits)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "trainUnits"
        if ____cond19 then
            trainUnits = value
            self:setTrainUnits2unit(trainUnits)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "sellItems"
        if ____cond19 then
            sellItems = value
            self:setSellItems(sellItems)
            break
        end
        ____cond19 = ____cond19 or ____switch19 == "abilities"
        if ____cond19 then
            abilities = value
            if abilities and #abilities > 0 then
                self:addAbility(table.unpack(abilities))
            end
            break
        end
    until true
end
function ActorUnit.prototype.get(self, key, defaultValue)
    return Actor.prototype.get(self, key, defaultValue)
end
function ActorUnit.prototype.setXY(self, x, y)
    Actor.prototype.setXY(self, x, y)
    SetUnitPosition(self.unit, x, y)
end
function ActorUnit.prototype.getRootFrameControl(self, createDefault)
    if createDefault == nil then
        createDefault = true
    end
    if createDefault and self._sl_rootFrameControl == nil then
        ____exports.default._sl_hasFrameActorUnits[self.uuid] = self
    end
    return Actor.prototype.getRootFrameControl(self, createDefault)
end
function ActorUnit.prototype.setBuilds(self, builds)
    _sl_funs:setBuilds2unit(self.unit, builds)
end
function ActorUnit.prototype.setUpgradeUnits2unit(self, upgradeUnits)
    _sl_funs:setUpgradeUnits2unit(self.unit, upgradeUnits)
end
function ActorUnit.prototype.setTrainUnits2unit(self, trainUnits)
    _sl_funs:setTrainUnits2unit(self.unit, trainUnits)
end
function ActorUnit.prototype.setSellItems(self, sellItems)
    if sellItems == nil or #sellItems == 0 then
        return
    end
    local nowSellItems = sellItems
    self:removeAllSellItems()
    if #sellItems > ____exports.default._sl_sellActorItemPageSize + 2 then
        local start = self._sl_sellActorItemPageIndex * ____exports.default._sl_sellActorItemPageSize
        local ____end = start + ____exports.default._sl_sellActorItemPageSize
        if ____end > #sellItems then
            ____end = #sellItems
        end
        nowSellItems = __TS__ArraySlice(sellItems, start, ____end)
    end
    for ____, sellItemId in ipairs(nowSellItems) do
        if self:hasSellItem(sellItemId) then
            print_r(sellItems)
            log.errorWithTraceBack("removeAllSellItems移除有问题！没有移除干净！" .. self:getName())
        else
            local sellingAbilityTypeId = ActorTypeShopUtil:warpActorItem2SellingAbility(sellItemId).id
            local actorAbility = self:addActorAbility(sellingAbilityTypeId)
            local ____self_sellItemAbilityList_8 = self.sellItemAbilityList
            ____self_sellItemAbilityList_8[#____self_sellItemAbilityList_8 + 1] = actorAbility
        end
    end
    if #sellItems > ____exports.default._sl_sellActorItemPageSize + 2 then
        local maxPageSize = math.ceil(#sellItems / ____exports.default._sl_sellActorItemPageSize)
        if self._sl_sellActorItemPageIndex > 0 then
            local previousAbility = self:addActorAbility(ActorTypeShopUtil:getPagePrevious().id)
            previousAbility:setName(((("上一页 (" .. tostring(self._sl_sellActorItemPageIndex + 1)) .. "/") .. tostring(maxPageSize)) .. ")")
            previousAbility:getRootFrameControl(true):setNumberOverlayText((tostring(self._sl_sellActorItemPageIndex + 1) .. "/") .. tostring(maxPageSize))
            previousAbility:setDescribe((tostring(self._sl_sellActorItemPageIndex + 1) .. "/") .. tostring(maxPageSize))
        else
            self:removeActorAbility(ActorTypeShopUtil:getPagePrevious().id)
        end
        if self._sl_sellActorItemPageIndex < maxPageSize - 1 then
            local nextAbility = self:addActorAbility(ActorTypeShopUtil:getPageNext().id)
            nextAbility:getRootFrameControl(true):setNumberOverlayText((tostring(self._sl_sellActorItemPageIndex + 1) .. "/") .. tostring(maxPageSize))
            nextAbility:setName(((("下一页 (" .. tostring(self._sl_sellActorItemPageIndex + 1)) .. "/") .. tostring(maxPageSize)) .. ")")
            nextAbility:setDescribe((tostring(self._sl_sellActorItemPageIndex + 1) .. "/") .. tostring(maxPageSize))
        else
            self:removeActorAbility(ActorTypeShopUtil:getPageNext().id)
        end
    end
end
function ActorUnit.prototype.addSellItem(self, ...)
    local sellItems = {...}
    for ____, sellItemId in ipairs(sellItems) do
        if not self:hasSellItem(sellItemId) then
            local sellingAbilityTypeId = ActorTypeShopUtil:warpActorItem2SellingAbility(sellItemId).id
            local actorAbility = self:addActorAbility(sellingAbilityTypeId)
            local ____self_sellItemAbilityList_9 = self.sellItemAbilityList
            ____self_sellItemAbilityList_9[#____self_sellItemAbilityList_9 + 1] = actorAbility
        end
    end
end
function ActorUnit.prototype.hasSellItem(self, sellItemId)
    local sellingAbilityTypeId = ActorTypeShopUtil:warpActorItem2SellingAbility(sellItemId).id
    for ____, sellItemAbility in ipairs(self.sellItemAbilityList) do
        if sellItemAbility.actorType.id == sellingAbilityTypeId then
            return true
        end
    end
    return false
end
function ActorUnit.prototype.removeSellItem(self, sellItemId)
    local sellingAbilityTypeId = ActorTypeShopUtil:warpActorItem2SellingAbility(sellItemId).id
    do
        local i = #self.sellItemAbilityList - 1
        while i >= 0 do
            local sellItemAbility = self.sellItemAbilityList[i + 1]
            if sellItemAbility.actorType.id == sellingAbilityTypeId then
                sellItemAbility:destroy()
                __TS__ArraySplice(self.sellItemAbilityList, i, 1)
            end
            i = i - 1
        end
    end
    return false
end
function ActorUnit.prototype.removeAllSellItems(self)
    do
        local i = #self.sellItemAbilityList - 1
        while i >= 0 do
            local sellItemAbility = self.sellItemAbilityList[i + 1]
            sellItemAbility:destroy()
            ArrayUtil:removeElement(self.sellItemAbilityList, sellItemAbility)
            i = i - 1
        end
    end
    local actorAbilityList = ActorAbilityUtil:getUnitActorAbilityList(self.unit)
    if actorAbilityList then
        for ____, actor in ipairs(actorAbilityList) do
            if actor ~= nil and ActorTypeShopUtil:isActorItemSellingAbilityType(actor.actorType) then
                actor:destroy()
            end
        end
    end
end
function ActorUnit.prototype.applyTimedLife(self, duration, buffid)
    if buffid == nil then
        buffid = "BHwe"
    end
    UnitApplyTimedLife(self.unit, buffid, duration)
end
function ActorUnit.prototype.addAbility(self, ...)
    local abilities = {...}
    if abilities and #abilities > 0 then
        for ____, ability in ipairs(abilities) do
            if DataBase:getSolarActorType(ability) ~= nil then
                if self:getActorAbility(ability) == nil then
                    self:addActorAbility(ability)
                end
            else
                UnitAddAbility(self.unit, ability)
            end
        end
    end
end
function ActorUnit.prototype.addActorAbility(self, actorAbilityTypeId, startPosNum)
    local actorAbility = self:getActorAbility(actorAbilityTypeId)
    if actorAbility == nil then
        actorAbility = __TS__New(ActorAbility, actorAbilityTypeId, self.unit, startPosNum)
    end
    return actorAbility
end
function ActorUnit.prototype.removeActorAbility(self, actorAbilityTypeId)
    local actorAbility = self:getActorAbility(actorAbilityTypeId)
    if actorAbility == nil then
        return false
    end
    actorAbility:destroy()
    return true
end
function ActorUnit.prototype.getActorAbility(self, actorTypeId)
    return ActorAbilityUtil:getUnitActorAbility(self.unit, actorTypeId)
end
function ActorUnit.prototype.destroyAllActorAbility(self)
    ActorAbilityUtil:destroyUnitAllActorAbility(self.unit)
end
function ActorUnit.prototype.destroy(self)
    local unit = self.unit
    Actor.prototype.destroy(self)
    if self._sl_RootFrame ~= nil then
        deleteKey(____exports.default._sl_hasFrameActorUnits, self.uuid)
    end
    if IsHandle(unit) then
        RemoveUnit(unit)
    end
    deleteKey(____exports.default.allActorUnits, self.uuid)
end
ActorUnit._sl_hasFrameActorUnits = {}
ActorUnit._sl_sellActorItemPageSize = 9
ActorUnit.allActorUnits = {}
__TS__SetDescriptor(
    ActorUnit.prototype,
    "actorType",
    {get = function(self)
        return self._actorType
    end},
    true
)
return ____exports
