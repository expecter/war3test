local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 27,["29"] = 27,["30"] = 27,["32"] = 27,["33"] = 45,["34"] = 45,["35"] = 45,["37"] = 46,["38"] = 45,["39"] = 49,["40"] = 49,["41"] = 49,["43"] = 50,["44"] = 49,["45"] = 53,["46"] = 53,["47"] = 53,["49"] = 54,["50"] = 53,["51"] = 64,["52"] = 64,["53"] = 64,["55"] = 65,["58"] = 68,["59"] = 69,["60"] = 70,["61"] = 71,["62"] = 72,["63"] = 72,["64"] = 72,["65"] = 73,["66"] = 74,["67"] = 74,["68"] = 74,["69"] = 74,["70"] = 74,["71"] = 74,["72"] = 74,["73"] = 72,["74"] = 72,["75"] = 72,["76"] = 72,["77"] = 76,["78"] = 76,["79"] = 76,["80"] = 77,["81"] = 78,["82"] = 79,["83"] = 76,["84"] = 76,["85"] = 64,["86"] = 89,["87"] = 90,["90"] = 93,["91"] = 93,["92"] = 93,["93"] = 93,["94"] = 93,["95"] = 98,["96"] = 99,["97"] = 100,["99"] = 102,["100"] = 103,["102"] = 105,["103"] = 106,["104"] = 89,["105"] = 113,["106"] = 114,["109"] = 117,["110"] = 118,["111"] = 119,["112"] = 120,["113"] = 123,["114"] = 125,["115"] = 126,["116"] = 127,["117"] = 128,["118"] = 129,["120"] = 131,["122"] = 133,["123"] = 134,["124"] = 135,["125"] = 136,["127"] = 138,["128"] = 139,["130"] = 142,["131"] = 143,["132"] = 144,["133"] = 145,["134"] = 146,["135"] = 147,["137"] = 149,["138"] = 150,["140"] = 152,["141"] = 153,["142"] = 154,["143"] = 155,["144"] = 156,["146"] = 158,["147"] = 159,["149"] = 161,["150"] = 162,["151"] = 163,["152"] = 164,["153"] = 165,["155"] = 167,["156"] = 168,["158"] = 170,["159"] = 171,["160"] = 113,["161"] = 174,["162"] = 175,["163"] = 177,["164"] = 178,["165"] = 179,["166"] = 179,["167"] = 179,["168"] = 179,["169"] = 183,["170"] = 184,["171"] = 185,["172"] = 186,["174"] = 188,["176"] = 190,["177"] = 194,["178"] = 195,["179"] = 196,["180"] = 196,["181"] = 196,["182"] = 196,["184"] = 202,["185"] = 203,["186"] = 204,["187"] = 204,["188"] = 204,["189"] = 204,["192"] = 211,["193"] = 212,["194"] = 213,["195"] = 213,["196"] = 213,["197"] = 213,["198"] = 217,["199"] = 218,["200"] = 219,["201"] = 220,["203"] = 222,["205"] = 224,["206"] = 228,["207"] = 229,["208"] = 229,["209"] = 229,["210"] = 229,["211"] = 234,["212"] = 235,["213"] = 236,["214"] = 236,["215"] = 236,["216"] = 236,["219"] = 243,["220"] = 244,["221"] = 245,["222"] = 245,["223"] = 245,["224"] = 245,["225"] = 249,["226"] = 250,["227"] = 250,["228"] = 250,["229"] = 250,["230"] = 255,["231"] = 256,["232"] = 256,["233"] = 256,["234"] = 256,["236"] = 261,["237"] = 174,["238"] = 268,["239"] = 269,["240"] = 270,["241"] = 271,["242"] = 271,["243"] = 271,["244"] = 271,["246"] = 276,["247"] = 277,["248"] = 277,["249"] = 277,["250"] = 277,["252"] = 282,["253"] = 283,["254"] = 283,["255"] = 283,["256"] = 283,["258"] = 288,["259"] = 268,["260"] = 292,["261"] = 293,["264"] = 296,["265"] = 297,["266"] = 298,["267"] = 299,["268"] = 292,["269"] = 302,["270"] = 304,["273"] = 308,["274"] = 308,["275"] = 308,["276"] = 308,["277"] = 308,["278"] = 308,["279"] = 308,["280"] = 308,["281"] = 309,["282"] = 310,["283"] = 311,["284"] = 312,["285"] = 313,["286"] = 313,["287"] = 313,["288"] = 313,["289"] = 313,["290"] = 313,["291"] = 313,["292"] = 315,["293"] = 316,["294"] = 317,["295"] = 317,["296"] = 317,["297"] = 317,["298"] = 317,["299"] = 317,["300"] = 317,["301"] = 319,["302"] = 320,["303"] = 321,["304"] = 321,["305"] = 321,["306"] = 321,["307"] = 321,["308"] = 321,["309"] = 321,["310"] = 325,["311"] = 326,["312"] = 327,["313"] = 328,["314"] = 329,["315"] = 329,["316"] = 329,["317"] = 329,["318"] = 329,["319"] = 329,["320"] = 329,["321"] = 330,["322"] = 330,["323"] = 330,["324"] = 330,["325"] = 330,["326"] = 330,["327"] = 330,["328"] = 332,["329"] = 333,["330"] = 334,["331"] = 335,["332"] = 336,["333"] = 336,["334"] = 336,["335"] = 336,["336"] = 336,["337"] = 336,["338"] = 336,["339"] = 337,["340"] = 337,["341"] = 337,["342"] = 337,["343"] = 337,["344"] = 337,["345"] = 337,["346"] = 339,["347"] = 340,["348"] = 341,["349"] = 342,["350"] = 343,["351"] = 343,["352"] = 343,["353"] = 343,["354"] = 343,["355"] = 343,["356"] = 343,["357"] = 344,["358"] = 344,["359"] = 344,["360"] = 344,["361"] = 344,["362"] = 344,["363"] = 344,["364"] = 347,["365"] = 348,["366"] = 349,["367"] = 351,["368"] = 352,["369"] = 352,["370"] = 352,["371"] = 352,["372"] = 352,["373"] = 352,["374"] = 352,["375"] = 353,["376"] = 355,["377"] = 355,["378"] = 355,["379"] = 355,["380"] = 355,["381"] = 355,["382"] = 355,["383"] = 355,["384"] = 356,["385"] = 356,["386"] = 356,["387"] = 356,["388"] = 356,["389"] = 356,["390"] = 356,["391"] = 356,["392"] = 359,["393"] = 361,["394"] = 361,["395"] = 361,["396"] = 361,["397"] = 361,["398"] = 361,["399"] = 361,["400"] = 361,["401"] = 361,["402"] = 361,["403"] = 361,["404"] = 361,["405"] = 361,["406"] = 361,["407"] = 302,["408"] = 378,["409"] = 379,["411"] = 380,["412"] = 380,["413"] = 380,["414"] = 380,["415"] = 380,["416"] = 380,["417"] = 380,["418"] = 380,["419"] = 380,["420"] = 380,["421"] = 381,["422"] = 382,["423"] = 383,["425"] = 386,["426"] = 387,["428"] = 392,["429"] = 378});
local ____exports = {}
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____SolarConfig = require("solar.solar-common.common.SolarConfig")
local SolarConfig = ____SolarConfig.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____ActorItem = require("solar.solar-common.actor.ActorItem")
local ActorItem = ____ActorItem.default
local ____ActorAbility = require("solar.solar-common.actor.ActorAbility")
local ActorAbility = ____ActorAbility.default
local ____TipFrameUtil = require("solar.solar-common.util.frame.TipFrameUtil")
local TipFrameUtil = ____TipFrameUtil.default
local ____SyncUtil = require("solar.solar-common.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
local ____ActorBuff = require("solar.solar-common.actor.ActorBuff")
local ActorBuff = ____ActorBuff.default
____exports.default = __TS__Class()
local ActorFrameUtil = ____exports.default
ActorFrameUtil.name = "ActorFrameUtil"
function ActorFrameUtil.prototype.____constructor(self)
end
function ActorFrameUtil.showWarnText(self, actor, tipText, dur, showPlayer)
    if dur == nil then
        dur = 1
    end
    ____exports.default:showTipText(actor, SolarConfig.defaultWarnTextColor .. tipText, dur, showPlayer)
end
function ActorFrameUtil.showFailText(self, actor, tipText, dur, showPlayer)
    if dur == nil then
        dur = 1
    end
    ____exports.default:showTipText(actor, SolarConfig.defaultFailTextColor .. tipText, dur, showPlayer)
end
function ActorFrameUtil.showSuccessText(self, actor, tipText, dur, showPlayer)
    if dur == nil then
        dur = 1
    end
    ____exports.default:showTipText(actor, SolarConfig.defaultSuccessTextColor .. tipText, dur, showPlayer)
end
function ActorFrameUtil.showTipText(self, actor, tipText, dur, showPlayer)
    if dur == nil then
        dur = 1
    end
    if showPlayer ~= nil and GetLocalPlayer() ~= showPlayer then
        return
    end
    local frame = TipFrameUtil._sl_tipTextFrameObjectPool:borrowObject()
    frame:setText(tipText)
    frame.visible = true
    DzFrameShow(frame.backdropFrame.handle, true)
    BaseUtil.runLater(
        0.03,
        function(count, maxCount)
            local y = 0.01 + 0.002 * count
            frame:setPoint(
                FramePoint.bottom,
                actor:getRootFrameControl().rootFrame.handle,
                FramePoint.top,
                0,
                y
            )
        end,
        30,
        true
    )
    BaseUtil.runLater(
        dur,
        function()
            frame.visible = false
            DzFrameShow(frame.backdropFrame.handle, false)
            TipFrameUtil._sl_tipTextFrameObjectPool:returnObject(frame)
        end
    )
end
function ActorFrameUtil.showTooltip(self, actor)
    if actor == nil then
        return
    end
    local info = {
        name = actor:getName(),
        icon = actor:getIcon(),
        describe = actor:getDescribe(true)
    }
    local hotKey = actor:get("hotKey")
    if hotKey ~= nil and #hotKey > 0 and __TS__InstanceOf(actor, ActorAbility) and not actor:isPassive() then
        info.hotKey = hotKey
    end
    if actor:isDisable() and actor:get("requiredTip") ~= nil then
        info.requiredTip = actor:get("requiredTip")
    end
    info.labelInfos = ____exports.default:getActorLabelInfo(actor)
    ____exports.default:showTooltipByInfo(info)
end
function ActorFrameUtil.showTooltipByInfo(self, info)
    if info == nil then
        return
    end
    ____exports.default:_sl_initTooltip()
    local tooltip = DzFrameGetTooltip()
    DzFrameClearAllPoints(tooltip)
    DzFrameSetAbsolutePoint(tooltip, FramePoint.bottomLeft, 0.81, 0)
    local tooltipFrames = ____exports.default._sl_tooltipFrames
    tooltipFrames.name:setText(info.name)
    local hotKey = info.hotKey
    if hotKey ~= nil then
        tooltipFrames.hotKey:setText(("(|cffeeee00" .. hotKey) .. "|r)")
        tooltipFrames.hotKey.visible = true
    else
        tooltipFrames.hotKey.visible = false
    end
    tooltipFrames.icon:setTexture(info.icon)
    if info.requiredTip ~= nil then
        tooltipFrames.requiredTip:setText("|cffffff00需要:|n - " .. info.requiredTip)
        tooltipFrames.requiredTip.visible = true
    else
        tooltipFrames.requiredTip:setText("")
        tooltipFrames.requiredTip.visible = false
    end
    local labelInfos = info.labelInfos
    if #labelInfos > 0 then
        tooltipFrames.labelIcon1:setTexture(labelInfos[1].icon)
        tooltipFrames.label1:setText(labelInfos[1].text)
        tooltipFrames.labelIcon1.visible = labelInfos[1].icon ~= nil and labelInfos[1].icon ~= ""
        tooltipFrames.label1.visible = true
    else
        tooltipFrames.labelIcon1.visible = false
        tooltipFrames.label1.visible = false
    end
    if #labelInfos > 1 then
        tooltipFrames.labelIcon2:setTexture(labelInfos[2].icon)
        tooltipFrames.label2:setText(labelInfos[2].text)
        tooltipFrames.labelIcon2.visible = labelInfos[2].icon ~= nil and labelInfos[2].icon ~= ""
        tooltipFrames.label2.visible = true
    else
        tooltipFrames.labelIcon2.visible = false
        tooltipFrames.label2.visible = false
    end
    if #labelInfos > 2 then
        tooltipFrames.labelIcon3:setTexture(labelInfos[3].icon)
        tooltipFrames.label3:setText(labelInfos[3].text)
        tooltipFrames.labelIcon3.visible = labelInfos[3].icon ~= nil and labelInfos[3].icon ~= ""
        tooltipFrames.label3.visible = true
    else
        tooltipFrames.labelIcon3.visible = false
        tooltipFrames.label3.visible = false
    end
    tooltipFrames.describe:setText(info.describe)
    tooltipFrames.root.visible = true
end
function ActorFrameUtil.getActorLabelInfo(self, actor)
    local labelInfo = {}
    local goldCost = actor:get("goldCost")
    if actor:get("tooltipLabel1") then
        labelInfo[#labelInfo + 1] = {
            icon = actor:get("tooltipLabelIcon1") or SolarConfig.defaultResourceGoldPath,
            text = actor:get("tooltipLabel1")
        }
    elseif goldCost and goldCost > 0 then
        local text = nil
        if __TS__InstanceOf(actor, ActorItem) then
            text = TextUtil:toCnUnit(actor:getPawnGold())
        else
            text = TextUtil:toCnUnit(goldCost)
        end
        labelInfo[#labelInfo + 1] = {icon = SolarConfig.defaultResourceGoldPath, text = text}
    elseif __TS__InstanceOf(actor, ActorAbility) then
        if not actor:isPassive() and actor:get("maxCd") ~= nil and actor:get("maxCd") > 2 then
            labelInfo[#labelInfo + 1] = {
                icon = "UI\\Widgets\\ToolTips\\Human\\ToolTipStonesIcon.blp",
                text = tostring(actor:get("maxCd")) .. "秒"
            }
        end
    elseif __TS__InstanceOf(actor, ActorBuff) then
        if actor.level and actor.level ~= 1 then
            labelInfo[#labelInfo + 1] = {
                icon = "UI\\Widgets\\EscMenu\\Orc\\orc-slider-knob.blp",
                text = "Lv." .. tostring(actor.level)
            }
        end
    end
    local lumberCost = actor:get("lumberCost")
    if actor:get("tooltipLabel2") then
        labelInfo[#labelInfo + 1] = {
            icon = actor:get("tooltipLabelIcon2") or SolarConfig.defaultResourceLumberPath,
            text = actor:get("tooltipLabel2")
        }
    elseif lumberCost and lumberCost > 0 then
        local text = nil
        if __TS__InstanceOf(actor, ActorItem) then
            text = TextUtil:toCnUnit(actor:getPawnLumber())
        else
            text = TextUtil:toCnUnit(lumberCost)
        end
        labelInfo[#labelInfo + 1] = {icon = SolarConfig.defaultResourceLumberPath, text = text}
    elseif actor:get("manaCost") ~= nil and actor:get("manaCost") > 0 then
        labelInfo[#labelInfo + 1] = {
            icon = "UI\\Widgets\\ToolTips\\Human\\ToolTipManaIcon.blp",
            text = tostring(actor:get("manaCost")) .. "魔法"
        }
    elseif __TS__InstanceOf(actor, ActorBuff) then
        if actor:get("tag") ~= "光环" and actor:get("dur", 0) > 3 then
            labelInfo[#labelInfo + 1] = {
                icon = "UI\\Widgets\\BattleNet\\bnet-tournament-clock.blp",
                text = tostring(math.ceil(actor:getRemainingTime())) .. "秒"
            }
        end
    end
    local foodCost = actor:get("foodCost")
    if actor:get("tooltipLabel3") then
        labelInfo[#labelInfo + 1] = {
            icon = actor:get("tooltipLabelIcon3") or "UI\\Feedback\\Resources\\ResourceUndead.blp",
            text = actor:get("tooltipLabel3")
        }
    elseif foodCost and foodCost > 0 then
        labelInfo[#labelInfo + 1] = {
            icon = "UI\\Widgets\\ToolTips\\Human\\ToolTipSupplyIcon.blp",
            text = tostring(foodCost) .. ""
        }
    elseif actor:get("killsCost") ~= nil and actor:get("killsCost") > 0 then
        labelInfo[#labelInfo + 1] = {
            icon = "UI\\Feedback\\Resources\\ResourceUndead.blp",
            text = tostring(actor:get("killsCost")) .. "杀敌数"
        }
    end
    return labelInfo
end
function ActorFrameUtil.getActorTypeLabelInfo(self, actorType)
    local labelInfos = {}
    if actorType.goldCost and actorType.goldCost ~= 0 then
        labelInfos[#labelInfos + 1] = {
            icon = SolarConfig.defaultResourceGoldPath,
            text = tostring(actorType.goldCost) .. ""
        }
    end
    if actorType.lumberCost and actorType.lumberCost ~= 0 then
        labelInfos[#labelInfos + 1] = {
            icon = SolarConfig.defaultResourceLumberPath,
            text = tostring(actorType.lumberCost) .. ""
        }
    end
    if actorType.foodCost and actorType.foodCost ~= 0 then
        labelInfos[#labelInfos + 1] = {
            icon = SolarConfig.defaultResourceSupplyPath,
            text = tostring(actorType.foodCost) .. ""
        }
    end
    return labelInfos
end
function ActorFrameUtil.hideTooltip(self)
    if ____exports.default._sl_tooltipFrames == nil then
        return
    end
    ____exports.default._sl_tooltipFrames.root.visible = false
    local tooltip = DzFrameGetTooltip()
    DzFrameClearAllPoints(tooltip)
    DzFrameSetAbsolutePoint(tooltip, FramePoint.bottomRight, 0.8, 0.16)
end
function ActorFrameUtil._sl_initTooltip(self)
    if ____exports.default._sl_tooltipFrames ~= nil then
        return
    end
    local root = __TS__New(
        Frame,
        "BACKDROP",
        nil,
        DzGetGameUI(),
        "_sl_border_backdrop",
        0
    )
    local gap = 0.008
    local fontSize = 0.0113
    local icon = Frame:createBackDrop(root.handle)
    icon:setSize(0.03, 0.04)
    icon:setPoint(
        FramePoint.topLeft,
        root.handle,
        FramePoint.topLeft,
        gap,
        -gap
    )
    local name = Frame:createTEXT(root.handle)
    name:setFont(fontSize)
    name:setPoint(
        FramePoint.topLeft,
        icon.handle,
        FramePoint.topRight,
        gap,
        0
    )
    local hotKey = Frame:createTEXT(root.handle)
    hotKey:setFont(fontSize)
    hotKey:setPoint(
        FramePoint.left,
        name.handle,
        FramePoint.right,
        0.001,
        0
    )
    local labelIcon1 = Frame:createBackDrop(root.handle)
    local label1 = Frame:createTEXT(root.handle)
    label1:setFont(fontSize)
    labelIcon1:setSize(0.009, 0.012)
    labelIcon1:setPoint(
        FramePoint.topLeft,
        name.handle,
        FramePoint.bottomLeft,
        0,
        -gap
    )
    label1:setPoint(
        FramePoint.left,
        labelIcon1.handle,
        FramePoint.right,
        0.002,
        0
    )
    local labelIcon2 = Frame:createBackDrop(root.handle)
    local label2 = Frame:createTEXT(root.handle)
    label2:setFont(fontSize)
    labelIcon2:setSize(0.009, 0.012)
    labelIcon2:setPoint(
        FramePoint.left,
        label1.handle,
        FramePoint.right,
        gap,
        0
    )
    label2:setPoint(
        FramePoint.left,
        labelIcon2.handle,
        FramePoint.right,
        0.002,
        0
    )
    local labelIcon3 = Frame:createBackDrop(root.handle)
    local label3 = Frame:createTEXT(root.handle)
    label3:setFont(fontSize)
    labelIcon3:setSize(0.009, 0.012)
    labelIcon3:setPoint(
        FramePoint.left,
        label2.handle,
        FramePoint.right,
        gap,
        0
    )
    label3:setPoint(
        FramePoint.left,
        labelIcon3.handle,
        FramePoint.right,
        0.002,
        0
    )
    local describe = Frame:createTEXT(root.handle)
    describe:setFont(fontSize)
    DzFrameSetSize(describe.handle, 0.2, -1)
    local requiredTip = Frame:createTEXT(root.handle)
    requiredTip:setPoint(
        FramePoint.bottomLeft,
        describe.handle,
        FramePoint.topLeft,
        0,
        gap
    )
    DzFrameSetSize(requiredTip.handle, 0.2, -1)
    DzFrameSetPoint(
        root.handle,
        FRAMEPOINT_TOPLEFT,
        requiredTip.handle,
        FRAMEPOINT_TOPLEFT,
        -gap,
        0.055
    )
    DzFrameSetPoint(
        root.handle,
        FRAMEPOINT_BOTTOMRIGHT,
        describe.handle,
        FRAMEPOINT_BOTTOMRIGHT,
        gap,
        -gap
    )
    describe:setAbsPoint(FramePoint.bottomRight, SolarConfig.defaultTooltipFrameAbsX, SolarConfig.defaultTooltipFrameAbsY)
    ____exports.default._sl_tooltipFrames = {
        root = root,
        name = name,
        hotKey = hotKey,
        icon = icon,
        requiredTip = requiredTip,
        describe = describe,
        labelIcon1 = labelIcon1,
        label1 = label1,
        labelIcon2 = labelIcon2,
        label2 = label2,
        labelIcon3 = labelIcon3,
        label3 = label3
    }
end
function ActorFrameUtil.localClickActorType(self, actorType, btn, x, y)
    isAsync = true
    local ____this_1
    ____this_1 = actorType
    local ____opt_0 = ____this_1.onLocalClick
    local b = ____opt_0 and ____opt_0(
        ____this_1,
        nil,
        btn,
        x,
        y,
        actorType
    )
    isAsync = false
    if b == false then
        return false
    end
    if actorType.onClick ~= nil then
        SyncUtil.syncObjData("_sl_:at:onClick", {i = actorType.id, b = btn})
    end
    return true
end
return ____exports
