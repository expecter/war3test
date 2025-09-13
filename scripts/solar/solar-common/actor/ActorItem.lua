local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 14,["21"] = 14,["22"] = 14,["23"] = 14,["24"] = 19,["25"] = 19,["26"] = 19,["28"] = 19,["29"] = 19,["31"] = 14,["32"] = 21,["35"] = 24,["36"] = 26,["37"] = 27,["38"] = 28,["40"] = 30,["41"] = 31,["42"] = 32,["43"] = 33,["44"] = 34,["46"] = 36,["47"] = 37,["48"] = 39,["50"] = 43,["51"] = 44,["52"] = 45,["53"] = 19,["54"] = 56,["55"] = 14,["57"] = 58,["58"] = 99,["59"] = 59,["63"] = 61,["65"] = 62,["66"] = 63,["67"] = 65,["71"] = 68,["73"] = 69,["74"] = 70,["75"] = 71,["79"] = 74,["81"] = 75,["84"] = 77,["86"] = 78,["89"] = 80,["91"] = 81,["94"] = 83,["96"] = 84,["99"] = 86,["101"] = 88,["102"] = 89,["103"] = 90,["104"] = 91,["106"] = 93,["107"] = 93,["111"] = 95,["113"] = 96,["114"] = 96,["118"] = 98,["120"] = 99,["121"] = 99,["122"] = 99,["123"] = 99,["124"] = 99,["125"] = 101,["126"] = 101,["130"] = 103,["132"] = 104,["133"] = 104,["134"] = 104,["135"] = 104,["136"] = 104,["137"] = 106,["138"] = 106,["142"] = 108,["144"] = 109,["145"] = 109,["146"] = 109,["147"] = 109,["148"] = 109,["149"] = 111,["150"] = 111,["154"] = 113,["156"] = 114,["157"] = 115,["159"] = 117,["160"] = 117,["161"] = 118,["162"] = 119,["167"] = 123,["169"] = 124,["173"] = 56,["174"] = 130,["175"] = 14,["176"] = 130,["177"] = 138,["178"] = 139,["179"] = 140,["181"] = 14,["183"] = 138,["184"] = 150,["185"] = 151,["186"] = 150,["187"] = 157,["188"] = 158,["189"] = 159,["190"] = 160,["191"] = 161,["192"] = 162,["194"] = 165,["195"] = 166,["198"] = 169,["200"] = 171,["201"] = 157,["202"] = 177,["203"] = 178,["204"] = 179,["205"] = 180,["206"] = 181,["207"] = 182,["209"] = 185,["210"] = 186,["213"] = 189,["215"] = 191,["216"] = 177,["217"] = 199,["218"] = 200,["219"] = 199,["220"] = 208,["221"] = 209,["222"] = 209,["223"] = 209,["224"] = 209,["225"] = 210,["226"] = 211,["227"] = 208,["228"] = 219,["229"] = 220,["230"] = 221,["231"] = 222,["233"] = 219,["234"] = 231,["235"] = 232,["236"] = 232,["237"] = 232,["238"] = 232,["239"] = 231,["240"] = 236,["241"] = 237,["242"] = 238,["243"] = 239,["244"] = 236,["245"] = 243,["246"] = 244,["249"] = 247,["250"] = 248,["251"] = 249,["253"] = 14,["254"] = 253,["255"] = 256,["256"] = 257,["259"] = 260,["260"] = 243,["261"] = 266,["262"] = 267,["263"] = 268,["264"] = 268,["265"] = 268,["266"] = 268,["267"] = 268,["268"] = 270,["269"] = 270,["270"] = 270,["271"] = 272,["272"] = 273,["276"] = 276,["277"] = 276,["278"] = 277,["279"] = 278,["280"] = 279,["281"] = 280,["283"] = 282,["284"] = 283,["285"] = 284,["286"] = 285,["287"] = 286,["288"] = 287,["289"] = 288,["291"] = 290,["292"] = 291,["293"] = 292,["295"] = 294,["298"] = 276,["301"] = 299,["302"] = 300,["303"] = 270,["304"] = 270,["305"] = 266,["306"] = 305,["307"] = 14,["308"] = 307,["309"] = 309,["310"] = 309,["311"] = 309,["312"] = 310,["313"] = 311,["315"] = 309,["316"] = 309,["318"] = 305,["319"] = 318,["320"] = 319,["321"] = 14,["322"] = 321,["323"] = 322,["324"] = 323,["326"] = 325,["327"] = 318,["328"] = 15,["333"] = 53});
local ____exports = {}
local ____ActorAbility = require("solar.solar-common.actor.ActorAbility")
local ActorAbility = ____ActorAbility.default
local ____ObjectDataUtil = require("solar.solar-common.util.object.ObjectDataUtil")
local ObjectDataUtil = ____ObjectDataUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ObjectTemplateUtil = require("solar.solar-common.util.object.ObjectTemplateUtil")
local ObjectTemplateUtil = ____ObjectTemplateUtil.default
local ____ColorUtil = require("solar.solar-common.util.lang.ColorUtil")
local ColorUtil = ____ColorUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local ActorItem = ____exports.default
ActorItem.name = "ActorItem"
__TS__ClassExtends(ActorItem, ActorAbility)
function ActorItem.prototype.____constructor(self, actorTypeId, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    ActorAbility.prototype.____constructor(self, actorTypeId)
    if self._actorType == nil then
        return
    end
    ____exports.default.allActorItems[self.uuid] = self
    local templateType = self:getTemplateType()
    if templateType == nil or _g_objs.item[templateType] == nil or not ObjectTemplateUtil:hasTemplate(templateType) then
        templateType = "主动物品"
    end
    self.itemId = ObjectTemplateUtil:borrowTemplate(templateType, self.templateCacheKey, self.uuid)
    self.templateId = self.itemId
    self.abilityId = ObjectDataUtil:getItemAbilList(self.itemId)
    if self.abilityId ~= nil and #self.abilityId ~= 4 then
        self.abilityId = nil
    end
    self.item = CreateItem(self.itemId, x, y)
    DataBase:getItemSolarData(self.item, true)._SL_solarActorItem = self
    if self.abilityId ~= nil then
    end
    self:set("templateType", templateType)
    self:_sl_init()
    self:update()
end
function ActorItem.prototype._sl_rawset(self, key, value)
    ActorAbility.prototype._sl_rawset(self, key, value)
    repeat
        local ____switch8 = key
        local colorIntByRGB, colorIntByRGB2, colorIntByRGB3
        local ____cond8 = ____switch8 == "id"
        if ____cond8 then
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "name"
        if ____cond8 then
            EXSetItemDataString(self.itemId, 4, value)
            if isEmbedJapi then
                EXSetItemDataString(self.itemId, 2, value)
            end
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "describe"
        if ____cond8 then
            EXSetItemDataString(self.itemId, 3, value)
            if isEmbedJapi then
                EXSetItemDataString(self.itemId, 5, value)
            end
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "hide"
        if ____cond8 then
            SetItemVisible(self.item, not value)
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "pawnable"
        if ____cond8 then
            SetItemPawnable(self.item, value)
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "droppable"
        if ____cond8 then
            SetItemDroppable(self.item, value)
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "uses"
        if ____cond8 then
            SetItemCharges(self.item, value)
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "model"
        if ____cond8 then
            if SetUnitModel then
                SetUnitModel(self.item, value)
            elseif DzItemSetModel then
                DzItemSetModel(self.item, value)
            end
            if DzItemSetPortrait ~= nil then
                DzItemSetPortrait(self.item, value)
            end
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "modelScale"
        if ____cond8 then
            if EXSetItemSize ~= nil then
                EXSetItemSize(self.item, value)
            end
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "colorR"
        if ____cond8 then
            colorIntByRGB = ColorUtil:getColorIntByRGB(
                value or 255,
                self:get("colorG", 255),
                self:get("colorB", 255)
            )
            if EXSetItemColor ~= nil then
                EXSetItemColor(self.item, colorIntByRGB)
            end
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "colorG"
        if ____cond8 then
            colorIntByRGB2 = ColorUtil:getColorIntByRGB(
                self:get("colorR", 255),
                value or 255,
                self:get("colorB", 255)
            )
            if EXSetItemColor ~= nil then
                EXSetItemColor(self.item, colorIntByRGB2)
            end
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "colorB"
        if ____cond8 then
            colorIntByRGB3 = ColorUtil:getColorIntByRGB(
                self:get("colorR", 255),
                self:get("colorG", 255),
                value or 255
            )
            if EXSetItemColor ~= nil then
                EXSetItemColor(self.item, colorIntByRGB3)
            end
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "disable"
        if ____cond8 then
            if self:get("disable") then
                self:getRootFrameControl():getDisableFrame().visible = true
            else
                local ____opt_10 = self:getRootFrameControl(false)
                local disableFrame = ____opt_10 and ____opt_10:getDisableFrame(false)
                if disableFrame then
                    disableFrame.visible = false
                end
            end
            break
        end
        ____cond8 = ____cond8 or ____switch8 == "icon"
        if ____cond8 then
            self:refreshIcon()
            break
        end
    until true
end
function ActorItem.prototype.get(self, key, defaultValue)
    return ActorAbility.prototype.get(self, key, defaultValue)
end
function ActorItem.prototype.getAbility(self)
    if GetItemAbility then
        return GetItemAbility(self.item, 0)
    else
        return ActorAbility.prototype.getAbility(self)
    end
end
function ActorItem.prototype.setPawnable(self, pawnable)
    self:set("pawnable", pawnable)
end
function ActorItem.prototype.getPawnGold(self)
    if self:get("goldCost") ~= nil and self:get("goldCost") > 0 then
        local val = math.floor(self:get("goldCost") * PawnItemRate)
        if val > 0 then
            if self:get("stackMax", 0) > 0 then
                val = val * self:getUses()
            end
            if self.actorType.uses and self.actorType.uses > 1 then
                val = math.floor(val / self.actorType.uses)
            end
        end
        return val
    end
    return 0
end
function ActorItem.prototype.getPawnLumber(self)
    if self:get("lumberCost") ~= nil and self:get("lumberCost") > 0 then
        local val = math.floor(self:get("lumberCost") * PawnItemRate)
        if val > 0 then
            if self:get("stackMax", 0) > 0 then
                val = val * self:getUses()
            end
            if self.actorType.uses and self.actorType.uses > 1 then
                val = math.floor(val / self.actorType.uses)
            end
        end
        return val
    end
    return 0
end
function ActorItem.prototype.setDroppable(self, droppable)
    self:set("droppable", droppable)
end
function ActorItem.prototype.addUses(self, add)
    local newUses = math.max(
        GetItemCharges(self.item),
        1
    ) + add
    self:setUses(newUses)
    return newUses
end
function ActorItem.prototype.setUses(self, newUses)
    self:set("uses", newUses)
    if newUses <= 0 and self:get("destroyOnNoUses") == true then
        self:destroy()
    end
end
function ActorItem.prototype.getUses(self)
    return math.max(
        GetItemCharges(self.item),
        1
    )
end
function ActorItem.prototype.setXY(self, x, y)
    self:set("x", x)
    self:set("y", y)
    SetItemPosition(self.item, x, y)
end
function ActorItem.prototype.update(self)
    if self._sl_isDestroyed then
        return
    end
    self.updating = true
    if self:getAbility() ~= nil then
        ObjectTemplateUtil:cleanAbility(self:getAbility())
    end
    ActorAbility.prototype.update(self)
    if self.unit ~= nil then
        if selection() == self.unit then
            SelectUnit(self.unit, true)
        end
    end
    self.updating = false
end
function ActorItem.prototype.refreshIcon(self)
    self.updating = true
    EXSetItemDataString(
        self.itemId,
        1,
        self:get("icon")
    )
    BaseUtil.runLater(
        0.01,
        function()
            if self.unit == nil then
                self.updating = false
                return
            end
            do
                local i = 0
                while i < 6 do
                    if UnitItemInSlot(self.unit, i) == self.item then
                        local tempSlot = 5
                        if i == 5 then
                            tempSlot = 4
                        end
                        local tempSlotItem = UnitItemInSlot(self.unit, tempSlot)
                        if self:get("droppable") == false then
                            SetItemDroppable(self.item, true)
                            UnitDropItemSlot(self.unit, self.item, tempSlot)
                            UnitDropItemSlot(self.unit, self.item, i)
                            UnitDropItemSlot(self.unit, tempSlotItem, tempSlot)
                            SetItemDroppable(self.item, false)
                        else
                            UnitDropItemSlot(self.unit, self.item, tempSlot)
                            UnitDropItemSlot(self.unit, self.item, i)
                            UnitDropItemSlot(self.unit, tempSlotItem, tempSlot)
                        end
                        self.updating = false
                        return
                    end
                    i = i + 1
                end
            end
            self.unit = nil
            self.updating = false
        end
    )
end
function ActorItem.prototype.action(self, x, y, targetUnit)
    ActorAbility.prototype.action(self, x, y, targetUnit)
    if self:get("destroyOnNoUses") == true or self.actorType.uses or self.actorType.stackMax or GetItemCharges(self.item) > 1 then
        BaseUtil.runLater(
            0.05,
            function()
                if IsHandle(self.item) then
                    self:setUses(GetItemCharges(self.item))
                end
            end
        )
    end
end
function ActorItem.prototype.destroy(self)
    local item = self.item
    ActorAbility.prototype.destroy(self)
    self.item = nil
    if IsHandle(item) then
        RemoveItem(item)
    end
    deleteKey(____exports.default.allActorItems, self.uuid)
end
ActorItem.allActorItems = {}
__TS__SetDescriptor(
    ActorItem.prototype,
    "actorType",
    {get = function(self)
        return self._actorType
    end},
    true
)
return ____exports
