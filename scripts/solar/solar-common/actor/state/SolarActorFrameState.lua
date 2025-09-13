local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 11,["28"] = 11,["29"] = 13,["30"] = 13,["31"] = 15,["32"] = 15,["33"] = 17,["34"] = 17,["35"] = 18,["36"] = 18,["37"] = 19,["38"] = 19,["39"] = 20,["40"] = 20,["41"] = 21,["42"] = 21,["43"] = 23,["44"] = 23,["45"] = 23,["47"] = 36,["48"] = 37,["51"] = 40,["54"] = 43,["55"] = 44,["56"] = 45,["57"] = 46,["58"] = 43,["59"] = 49,["60"] = 50,["61"] = 51,["64"] = 55,["66"] = 49,["67"] = 58,["68"] = 60,["69"] = 61,["70"] = 62,["71"] = 63,["73"] = 68,["74"] = 69,["75"] = 71,["76"] = 72,["77"] = 73,["78"] = 74,["79"] = 75,["84"] = 81,["85"] = 60,["88"] = 91,["89"] = 91,["91"] = 92,["92"] = 92,["93"] = 93,["94"] = 94,["95"] = 95,["96"] = 96,["97"] = 97,["98"] = 98,["99"] = 97,["100"] = 100,["101"] = 92,["104"] = 91,["108"] = 106,["109"] = 106,["110"] = 107,["111"] = 108,["112"] = 109,["113"] = 110,["114"] = 111,["115"] = 110,["116"] = 113,["117"] = 106,["120"] = 116,["121"] = 117,["122"] = 118,["124"] = 116,["125"] = 121,["126"] = 121,["127"] = 121,["128"] = 122,["129"] = 123,["130"] = 124,["131"] = 125,["133"] = 121,["134"] = 121,["135"] = 35,["136"] = 131,["137"] = 132,["138"] = 133,["140"] = 135,["141"] = 136,["142"] = 137,["144"] = 139,["145"] = 140,["146"] = 131,["147"] = 144,["148"] = 145,["149"] = 146,["152"] = 149,["153"] = 150,["154"] = 151,["155"] = 152,["156"] = 153,["158"] = 144,["159"] = 157,["160"] = 158,["161"] = 159,["164"] = 163,["165"] = 165,["166"] = 166,["167"] = 167,["170"] = 170,["171"] = 176,["172"] = 177,["173"] = 178,["175"] = 180,["176"] = 181,["178"] = 183,["179"] = 184,["182"] = 187,["184"] = 157,["185"] = 191,["186"] = 192,["187"] = 193,["188"] = 193,["189"] = 193,["190"] = 193,["191"] = 194,["194"] = 197,["195"] = 198,["196"] = 199,["197"] = 191,["198"] = 202,["199"] = 203,["200"] = 204,["201"] = 205,["202"] = 202,["203"] = 209,["204"] = 211,["206"] = 212,["207"] = 212,["208"] = 213,["209"] = 214,["210"] = 215,["211"] = 216,["212"] = 217,["213"] = 218,["216"] = 221,["217"] = 223,["218"] = 224,["219"] = 225,["220"] = 226,["221"] = 227,["223"] = 229,["224"] = 230,["225"] = 231,["226"] = 232,["228"] = 234,["231"] = 212,["234"] = 209,["235"] = 241,["237"] = 243,["238"] = 243,["240"] = 244,["241"] = 245,["242"] = 246,["243"] = 247,["244"] = 248,["245"] = 249,["247"] = 251,["249"] = 253,["250"] = 253,["251"] = 253,["252"] = 253,["253"] = 254,["254"] = 255,["255"] = 256,["256"] = 257,["259"] = 260,["260"] = 262,["261"] = 263,["262"] = 264,["263"] = 265,["264"] = 266,["266"] = 268,["267"] = 269,["268"] = 270,["269"] = 271,["271"] = 273,["276"] = 243,["279"] = 241,["280"] = 280,["281"] = 282,["282"] = 283,["283"] = 284,["284"] = 285,["285"] = 285,["286"] = 285,["287"] = 286,["288"] = 287,["289"] = 287,["290"] = 287,["291"] = 287,["292"] = 285,["293"] = 285,["296"] = 293,["298"] = 294,["299"] = 295,["300"] = 296,["302"] = 298,["303"] = 299,["306"] = 302,["307"] = 303,["308"] = 304,["310"] = 306,["311"] = 307,["312"] = 308,["313"] = 309,["314"] = 310,["316"] = 312,["318"] = 315,["319"] = 316,["320"] = 317,["321"] = 318,["323"] = 320,["324"] = 321,["325"] = 322,["327"] = 324,["328"] = 325,["332"] = 280,["333"] = 28,["334"] = 30,["335"] = 31,["336"] = 32});
local ____exports = {}
local ____FrameCallbackUtil = require("solar.solar-common.util.frame.FrameCallbackUtil")
local FrameCallbackUtil = ____FrameCallbackUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____AbilityButtonUtil = require("solar.solar-common.util.ability.AbilityButtonUtil")
local AbilityButtonUtil = ____AbilityButtonUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____ActorUnit = require("solar.solar-common.actor.ActorUnit")
local ActorUnit = ____ActorUnit.default
local ____CameraUtil = require("solar.solar-common.util.game.CameraUtil")
local CameraUtil = ____CameraUtil.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____GameUtil = require("solar.solar-common.util.game.GameUtil")
local GameUtil = ____GameUtil.default
local ____ActorFrameUtil = require("solar.solar-common.actor.util.ActorFrameUtil")
local ActorFrameUtil = ____ActorFrameUtil.default
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
local ____ActorAbility = require("solar.solar-common.actor.ActorAbility")
local ActorAbility = ____ActorAbility.default
local ____MessageUtil = require("solar.solar-common.util.system.MessageUtil")
local MessageUtil = ____MessageUtil.default
local ____NativeFrameUtil = require("solar.solar-common.util.frame.NativeFrameUtil")
local NativeFrameUtil = ____NativeFrameUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____ActorTypeBuildUtil = require("solar.solar-common.actor.util.ActorTypeBuildUtil")
local ActorTypeBuildUtil = ____ActorTypeBuildUtil.default
local ____ObjectDataUtil = require("solar.solar-common.util.object.ObjectDataUtil")
local ObjectDataUtil = ____ObjectDataUtil.default
____exports.default = __TS__Class()
local SolarActorFrameState = ____exports.default
SolarActorFrameState.name = "SolarActorFrameState"
function SolarActorFrameState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorFrameState()")
        return
    end
    if DzFrameGetCommandBarButton == nil then
        return
    end
    FrameCallbackUtil:addFrameSetUpdateCallback(function()
        ____exports.default:updateItemFrame()
        ____exports.default:updateAbilityFrame()
        ____exports.default:updateUnitFrame()
    end)
    InputUtil:onMouseRightButtonReleased(function()
        if ____exports.default.mouseFocusActor then
            if ____exports.default.mouseFocusActor:isDisable() or ____exports.default.mouseFocusActor:isHide() then
                return
            end
            ____exports.default.mouseFocusActor:localClick(2, 0, 0)
        end
    end)
    if isEmbedJapi then
        MessageUtil:addWindowEventCallBack(function(eventId)
            if eventId == 1 then
                local actor = ____exports.default.mouseFocusActor
                if actor == nil then
                end
                if actor ~= nil and __TS__InstanceOf(actor, ActorAbility) then
                    if actor:isPassive() or actor:isDisable() or actor:isHide() then
                        local sceneX = InputUtil:getMouseSceneX()
                        local sceneY = InputUtil:getMouseSceneY()
                        local xyObj = AbilityButtonUtil:getPosBySceneXY(sceneX, sceneY)
                        if xyObj ~= nil then
                            return true
                        end
                    end
                end
            end
            return false
        end)
    end
    do
        local x = 0
        while x <= 3 do
            do
                local y = 0
                while y <= 2 do
                    local cmdButton = DzFrameGetCommandBarButton(y, x)
                    local cmdButtonFrame = Frame:fromHandle(cmdButton)
                    local fx = x
                    local fy = y
                    cmdButtonFrame:addOnMouseEnter(function()
                        ____exports.default.showCommandBarButtonActorTooltip(fx, fy)
                    end)
                    cmdButtonFrame:addOnMouseLeave(____exports.default.hideTooltip)
                    y = y + 1
                end
            end
            x = x + 1
        end
    end
    do
        local i = 0
        while i < 6 do
            local cmdButton = DzFrameGetItemBarButton(i)
            local cmdButtonFrame = Frame:fromHandle(cmdButton)
            local fi = i
            cmdButtonFrame:addOnMouseEnter(function()
                ____exports.default.showItemTooltip(fi)
            end)
            cmdButtonFrame:addOnMouseLeave(____exports.default.hideTooltip)
            i = i + 1
        end
    end
    se:onUnitSelected(function(e)
        if ____exports.default._sl_mouseFocusItemIndex >= 0 then
            ____exports.default.showItemTooltip(____exports.default._sl_mouseFocusItemIndex)
        end
    end)
    se:on(
        "刷新UI",
        function()
            if ____exports.default._sl_mouseFocusItemIndex >= 0 then
                ____exports.default.showItemTooltip(____exports.default._sl_mouseFocusItemIndex)
            elseif ____exports.default.mouseFocusActor ~= nil then
                ActorFrameUtil:showTooltip(____exports.default.mouseFocusActor)
            end
        end
    )
end
function SolarActorFrameState.getMouseFocusItem(self)
    if ____exports.default._sl_mouseFocusItemIndex < 0 then
        return nil
    end
    local u = selection()
    if not IsHandle(u) then
        return nil
    end
    local item = UnitItemInSlot(u, ____exports.default._sl_mouseFocusItemIndex)
    return ActorItemUtil:getActorItem(item)
end
function SolarActorFrameState.showItemTooltip(i)
    local u = selection()
    if not IsHandle(u) then
        return
    end
    ____exports.default._sl_mouseFocusItemIndex = i
    local item = UnitItemInSlot(u, i)
    local actorItem = ActorItemUtil:getActorItem(item)
    if actorItem ~= nil then
        ActorFrameUtil:showTooltip(actorItem)
    end
end
function SolarActorFrameState.showCommandBarButtonActorTooltip(x, y)
    local ability, order, arg = button(x, y)
    if ability == nil or ability == 0 then
        return
    end
    if (1096114805 == ability or 1095262837 == ability) and arg == 8 then
        local unitIdStr = id2string(order)
        local zwActorType = ActorTypeBuildUtil.zwId2UnitIdMap[unitIdStr]
        if zwActorType == nil then
            return
        end
        local info = {name = zwActorType.name or zwActorType.id, icon = zwActorType.icon, describe = zwActorType.describe}
        local hotKey = ObjectDataUtil:getUnitDataString(unitIdStr, "Hotkey")
        if hotKey ~= nil and #hotKey > 0 then
            info.hotKey = hotKey
        end
        if zwActorType.requiredTip ~= nil and ActorTypeBuildUtil:isLocalPlayerActorUnitTypeDisableState(zwActorType.id) then
            info.requiredTip = zwActorType.requiredTip
        end
        info.labelInfos = ActorFrameUtil:getActorTypeLabelInfo(zwActorType)
        ActorFrameUtil:showTooltipByInfo(info)
        return
    else
        ____exports.default.showAbilityTooltip(ability)
    end
end
function SolarActorFrameState.showAbilityTooltip(ability)
    local abilityIdStr = id2string(ability)
    local actorAbility = ActorAbilityUtil:getActorAbilityByBaseId(
        abilityIdStr,
        selection()
    )
    if actorAbility == nil then
        return
    end
    ____exports.default._sl_mouseFocusItemIndex = -1
    ____exports.default.mouseFocusActor = actorAbility
    ActorFrameUtil:showTooltip(actorAbility)
end
function SolarActorFrameState.hideTooltip()
    ActorFrameUtil:hideTooltip()
    ____exports.default.mouseFocusActor = nil
    ____exports.default._sl_mouseFocusItemIndex = -1
end
function SolarActorFrameState.updateItemFrame(self)
    local unit = selection()
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            local actorItem = ActorItemUtil:getActorItem(item)
            if actorItem == nil then
                if ____exports.default.itemBarButtonActorFrames[i] then
                    ____exports.default.itemBarButtonActorFrames[i].rootFrame.visible = false
                    ____exports.default.itemBarButtonActorFrames[i] = nil
                end
            else
                local buttonFrame = DzFrameGetItemBarButton(i)
                local frame = actorItem:getRootFrameControl(false)
                if frame ~= ____exports.default.itemBarButtonActorFrames[i] then
                    if ____exports.default.itemBarButtonActorFrames[i] then
                        ____exports.default.itemBarButtonActorFrames[i].rootFrame.visible = false
                        ____exports.default.itemBarButtonActorFrames[i] = nil
                    end
                    if frame then
                        frame.rootFrame:clearPoints()
                        frame.rootFrame:setAllPoints(buttonFrame)
                        frame.rootFrame.visible = true
                    end
                    ____exports.default.itemBarButtonActorFrames[i] = frame
                end
            end
            i = i + 1
        end
    end
end
function SolarActorFrameState.updateAbilityFrame(self)
    do
        local i = 1
        while i <= 12 do
            do
                local pos = AbilityButtonUtil:getPosByNumber(i)
                local button_abilityId, orderID, orderType = button(pos.x, pos.y)
                if button_abilityId == nil or button_abilityId == 0 then
                    if ____exports.default.commandBarButtonActorFrames[i] then
                        ____exports.default.commandBarButtonActorFrames[i].rootFrame.visible = false
                        ____exports.default.commandBarButtonActorFrames[i] = nil
                    end
                    goto __continue56
                end
                local actorAbility = ActorAbilityUtil:getActorAbilityByBaseId(
                    id2string(button_abilityId),
                    selection()
                )
                if actorAbility == nil then
                    if ____exports.default.commandBarButtonActorFrames[i] then
                        ____exports.default.commandBarButtonActorFrames[i].rootFrame.visible = false
                        ____exports.default.commandBarButtonActorFrames[i] = nil
                    end
                else
                    local buttonFrame = DzFrameGetCommandBarButton(pos.y, pos.x)
                    local frame = actorAbility:getRootFrameControl(false)
                    if frame ~= ____exports.default.commandBarButtonActorFrames[i] then
                        if ____exports.default.commandBarButtonActorFrames[i] then
                            ____exports.default.commandBarButtonActorFrames[i].rootFrame.visible = false
                            ____exports.default.commandBarButtonActorFrames[i] = nil
                        end
                        if frame then
                            frame.rootFrame:clearPoints()
                            frame.rootFrame:setAllPoints(buttonFrame)
                            frame.rootFrame.visible = true
                        end
                        ____exports.default.commandBarButtonActorFrames[i] = frame
                    end
                end
            end
            ::__continue56::
            i = i + 1
        end
    end
end
function SolarActorFrameState.updateUnitFrame(self)
    if isEmbedJapi == false then
        local unit = selection()
        if IsHandle(unit) then
            ActorUnitUtil:ifHasActorUnit(
                unit,
                function(____, actor)
                    local simpleNameFrame = NativeFrameUtil:getUnitName()
                    DzFrameSetText(
                        simpleNameFrame,
                        actor:getName()
                    )
                end
            )
        end
    end
    for actorUuid in pairs(ActorUnit._sl_hasFrameActorUnits) do
        do
            local actorUnit = ActorUnit._sl_hasFrameActorUnits[actorUuid]
            if actorUnit == nil or actorUnit:isDestroyed() then
                goto __continue69
            end
            local rootFrame = actorUnit:getRootFrameControl(false)
            if rootFrame == nil then
                return
            end
            if not UnitAlive(actorUnit.unit) then
                rootFrame.rootFrame.visible = false
                goto __continue69
            end
            local x = actorUnit.unitX
            local y = actorUnit.unitY
            local z = GameUtil:getTerrainHeight(x, y)
            if unit_overhead then
                z = z + unit_overhead(actorUnit.unit) - 50
            else
                z = z + 150
            end
            local scoordinates = CameraUtil:getScreenCoordinates(x, y, z)
            if scoordinates.x <= 0 or scoordinates.x >= 0.8 then
                rootFrame.rootFrame.visible = false
                goto __continue69
            end
            if scoordinates.y <= 0.13 or scoordinates.y >= 0.56 then
                rootFrame.rootFrame.visible = false
                goto __continue69
            end
            rootFrame.rootFrame:setAbsPoint(FramePoint.bottom, scoordinates.x, scoordinates.y)
            rootFrame.rootFrame.visible = true
        end
        ::__continue69::
    end
end
SolarActorFrameState.mouseFocusActor = nil
SolarActorFrameState._sl_mouseFocusItemIndex = -1
SolarActorFrameState.commandBarButtonActorFrames = {}
SolarActorFrameState.itemBarButtonActorFrames = {}
return ____exports
