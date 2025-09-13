local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 13,["20"] = 13,["21"] = 14,["22"] = 14,["23"] = 15,["24"] = 15,["25"] = 16,["26"] = 16,["27"] = 17,["28"] = 17,["29"] = 20,["30"] = 20,["31"] = 20,["33"] = 52,["34"] = 53,["37"] = 58,["38"] = 59,["41"] = 62,["42"] = 63,["43"] = 64,["44"] = 62,["45"] = 66,["46"] = 67,["47"] = 68,["48"] = 66,["49"] = 70,["50"] = 71,["51"] = 72,["52"] = 70,["53"] = 74,["54"] = 75,["55"] = 76,["56"] = 74,["57"] = 80,["58"] = 81,["61"] = 84,["62"] = 80,["63"] = 95,["64"] = 97,["65"] = 98,["66"] = 99,["68"] = 51,["69"] = 104,["70"] = 105,["71"] = 106,["72"] = 107,["73"] = 104,["74"] = 110,["75"] = 111,["76"] = 110,["77"] = 117,["78"] = 118,["79"] = 119,["80"] = 120,["83"] = 125,["84"] = 126,["85"] = 127,["88"] = 130,["89"] = 131,["90"] = 132,["91"] = 133,["93"] = 134,["94"] = 135,["95"] = 136,["96"] = 137,["97"] = 141,["99"] = 143,["100"] = 144,["101"] = 145,["102"] = 146,["103"] = 148,["104"] = 150,["105"] = 151,["107"] = 153,["108"] = 154,["109"] = 155,["111"] = 157,["112"] = 158,["113"] = 159,["115"] = 161,["117"] = 163,["121"] = 166,["122"] = 167,["123"] = 166,["124"] = 117,["125"] = 176,["126"] = 177,["127"] = 178,["128"] = 177,["129"] = 176,["130"] = 23,["131"] = 30,["132"] = 30,["133"] = 30,["134"] = 31,["135"] = 33,["136"] = 35,["137"] = 36,["138"] = 37,["139"] = 38,["140"] = 39,["141"] = 39,["142"] = 39,["143"] = 39,["144"] = 39,["145"] = 39,["146"] = 39,["147"] = 40,["148"] = 41,["149"] = 42,["150"] = 45,["151"] = 46,["152"] = 46,["153"] = 46,["154"] = 46,["155"] = 46,["156"] = 47,["157"] = 30,["158"] = 30,["159"] = 49});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____ObjectPool = require("solar.solar-common.tool.ObjectPool")
local ObjectPool = ____ObjectPool.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____SolarBuffState = require("solar.solar-common.attribute.SolarBuffState")
local SolarBuffState = ____SolarBuffState.default
local ____BuffUtil = require("solar.solar-common.util.system.BuffUtil")
local BuffUtil = ____BuffUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____FrameControl = require("solar.solar-common.framex.control.FrameControl")
local FrameControl = ____FrameControl.default
local ____ActorFrameUtil = require("solar.solar-common.actor.util.ActorFrameUtil")
local ActorFrameUtil = ____ActorFrameUtil.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
____exports.default = __TS__Class()
local SolarActorBuffState = ____exports.default
SolarActorBuffState.name = "SolarActorBuffState"
function SolarActorBuffState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorBuffState()")
        return
    end
    if SingletonUtil:notFirstTime(SolarBuffState) then
        print("演员buff系统不能与旧buff系统同时使用!")
        return
    end
    BuffUtil.registerBuffType = function(____, buffType)
        log.errorWithTraceBack("演员buff系统不能与旧buff系统同时使用！")
        return nil
    end
    BuffUtil.getBuffType = function(____, buffTypeId)
        log.errorWithTraceBack("演员buff系统不能与旧buff系统同时使用！")
        return nil
    end
    BuffUtil.forAllBuffTypes = function(____, callback, buffTypeClass)
        log.errorWithTraceBack("演员buff系统不能与旧buff系统同时使用！")
        return nil
    end
    BuffUtil.addBuff = function(____, unit, buffTypeId, caster, initBuff)
        log.errorWithTraceBack("演员buff系统不能与旧buff系统同时使用！")
        return nil
    end
    ActorBuffUtil:addAnyActorBuffLevelChangeListener(function(____, buff, delta)
        if buff.attribute == nil or buff.actorType.attribute == nil then
            return
        end
        buff.attribute = AttributeUtil:multiply(buff.actorType.attribute, buff.level)
    end)
    if ____exports.default.config.showSolarActorBuffUI then
        local trigger = __TS__New(Trigger)
        trigger:registerTimerEvent(0.1, true)
        trigger:addAction(self.refreshSolarBuffUI)
    end
end
function SolarActorBuffState.showUbertip()
    local frameH = DzGetTriggerUIEventFrame()
    local actorBuff = ____exports.default.frameBuffMap["f" .. tostring(frameH)]
    ActorFrameUtil:showTooltip(actorBuff)
end
function SolarActorBuffState.hideUbertip()
    ActorFrameUtil:hideTooltip()
end
function SolarActorBuffState.prototype.refreshSolarBuffUI()
    local realSelectUnit = SelectUtil.getRealSelectUnit()
    if not IsHandle(realSelectUnit) then
        ____exports.default:showBuffsUI(false)
        return
    end
    local actorBuffs = ActorBuffUtil:getUnitActorBuffs(realSelectUnit)
    if not actorBuffs then
        ____exports.default:showBuffsUI(false)
        return
    end
    local objectPool = ____exports.default.objectPool
    objectPool:setAllIdleStatus(true)
    local index = 0
    for ____, actorBuff in ipairs(actorBuffs) do
        do
            local uiShowType = actorBuff:get("uiShowType")
            if uiShowType ~= nil and uiShowType ~= "单位状态栏" then
                goto __continue17
            elseif actorBuff:get("class") and actorBuff:get("class") ~= "基础" and actorBuff:get("class") ~= "演员buff" and actorBuff:get("class") ~= "羁绊" and uiShowType ~= "单位状态栏" then
                goto __continue17
            end
            local frameControl = objectPool:borrowObject()
            frameControl.visible = true
            frameControl:getImageFrame():setTexture(actorBuff:get("icon", "ReplaceableTextures\\CommandButtons\\BTNTemp.blp"))
            frameControl:setAbsPoint(FRAMEPOINT_BOTTOMLEFT, 0.37 + index * 0.016, 0.007)
            ____exports.default.frameBuffMap["f" .. tostring(frameControl:getButtonFrame().current)] = actorBuff
            if actorBuff:get("tag") == "光环" or actorBuff:get("dur", 0) <= 3 then
                frameControl:getCooldownFrame().visible = false
            else
                frameControl:getCooldownFrame().visible = true
                local cd = actorBuff:getRemainingTime() / actorBuff:get("dur")
                frameControl:getCooldownFrame():setAnimateOffset(cd)
            end
            if actorBuff.level and actorBuff.level ~= 1 then
                frameControl:getTextFrame():setText(tostring(actorBuff.level) .. "")
                frameControl:getTextFrame().visible = true
            else
                frameControl:getTextFrame().visible = false
            end
            index = index + 1
        end
        ::__continue17::
    end
    objectPool:forDirtyObjects(function(____, frameControl)
        frameControl.visible = false
    end)
end
function SolarActorBuffState.showBuffsUI(self, show)
    ____exports.default.objectPool:forActiveObjects(function(____, frameControl)
        frameControl.visible = show
    end)
end
SolarActorBuffState.config = {showSolarActorBuffUI = true}
SolarActorBuffState.objectPool = __TS__New(
    ObjectPool,
    function()
        local frameControl = __TS__New(FrameControl)
        frameControl:setSize(0.015, 0.015)
        frameControl:getImageFrame()
        frameControl:getCooldownFrame()
        frameControl:getTextFrame():setFont(0.006)
        frameControl:getTextFrame():clearPoints()
        frameControl:getTextFrame():setPoint(
            FramePoint.bottomRight,
            frameControl:getRootFrame().handle,
            FramePoint.bottomRight,
            -0.0005,
            0.0005
        )
        frameControl:getButtonFrame(true, false)
        frameControl:getButtonFrame():setOnMouseEnter(____exports.default.showUbertip)
        frameControl:getButtonFrame():setOnMouseLeave(____exports.default.hideUbertip)
        frameControl:getCooldownFrame():setModel("solar_asset\\model\\ui_cooldown_0_015.mdx", 0)
        DzFrameSetAnimate(
            frameControl:getCooldownFrame().current,
            0,
            false
        )
        return frameControl
    end
)
SolarActorBuffState.frameBuffMap = {}
return ____exports
