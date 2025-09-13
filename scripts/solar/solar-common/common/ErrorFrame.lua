local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 10,["24"] = 10,["25"] = 10,["27"] = 42,["28"] = 26,["29"] = 27,["32"] = 30,["33"] = 31,["34"] = 32,["35"] = 33,["36"] = 34,["37"] = 35,["38"] = 37,["39"] = 38,["40"] = 37,["41"] = 26,["42"] = 47,["43"] = 48,["46"] = 51,["49"] = 54,["50"] = 55,["51"] = 56,["52"] = 57,["53"] = 58,["54"] = 59,["55"] = 60,["56"] = 61,["58"] = 63,["59"] = 64,["60"] = 65,["61"] = 66,["63"] = 47,["64"] = 72,["65"] = 74,["66"] = 75,["67"] = 76,["68"] = 78,["69"] = 79,["70"] = 80,["71"] = 81,["72"] = 82,["73"] = 83,["74"] = 83,["75"] = 83,["76"] = 83,["77"] = 83,["78"] = 84,["79"] = 84,["80"] = 84,["81"] = 84,["82"] = 84,["83"] = 86,["84"] = 87,["85"] = 90,["86"] = 91,["87"] = 92,["88"] = 93,["89"] = 94,["90"] = 95,["91"] = 95,["92"] = 95,["93"] = 95,["94"] = 95,["95"] = 95,["96"] = 95,["97"] = 96,["98"] = 97,["99"] = 98,["100"] = 99,["101"] = 100,["102"] = 101,["103"] = 96,["104"] = 105,["105"] = 106,["106"] = 107,["107"] = 109,["108"] = 110,["109"] = 111,["110"] = 112,["111"] = 113,["112"] = 114,["113"] = 115,["114"] = 111,["115"] = 72,["116"] = 11,["117"] = 17,["118"] = 19});
local ____exports = {}
local ____ErrorMsgHelper = require("solar.solar-common.common.ErrorMsgHelper")
local ErrorMsgHelper = ____ErrorMsgHelper.default
local ____SolarConfig = require("solar.solar-common.common.SolarConfig")
local SolarConfig = ____SolarConfig.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____Label = require("solar.solar-common.framex.control.Label")
local Label = ____Label.default
local ____TextAlign = require("solar.solar-common.constant.TextAlign")
local TextAlign = ____TextAlign.default
local ____Button = require("solar.solar-common.framex.control.Button")
local Button = ____Button.default
local ____ImageColor = require("solar.solar-common.framex.ImageColor")
local ImageColor = ____ImageColor.default
local ____DebugGameUtil = require("solar.solar-common.util.debug.DebugGameUtil")
local DebugGameUtil = ____DebugGameUtil.default
____exports.default = __TS__Class()
local ErrorFrame = ____exports.default
ErrorFrame.name = "ErrorFrame"
function ErrorFrame.prototype.____constructor(self)
end
function ErrorFrame.init(self)
    if ____exports.default.is_init then
        return
    end
    ____exports.default.is_init = true
    ____exports.default:_sl_initFrame()
    ____exports.default.imageColor.visible = false
    ____exports.default.text.visible = false
    ____exports.default.closeBtn.visible = false
    ____exports.default.showBtn.visible = false
    ErrorMsgHelper.onError = function(____, errorMsgHelper)
        ____exports.default:showErrorMsgHelper(errorMsgHelper)
    end
end
function ErrorFrame.showErrorMsgHelper(self, errorMsgHelper)
    if SolarConfig.useErrorFrame == false then
        return
    end
    if ____exports.default._sl_isShowing == true then
        return
    end
    ____exports.default._sl_isShowing = true
    local text = (____exports.default.config.tip .. "|r|n\r\n") .. DebugGameUtil:getCommonInfo()
    ____exports.default.text:setText((((text .. "|r|n\r\n") .. errorMsgHelper.cnMsg) .. "|r|n\r\n") .. errorMsgHelper.cnTraceback)
    if isDebug then
        ____exports.default.imageColor.visible = true
        ____exports.default.text.visible = true
        ____exports.default.closeBtn.visible = true
        ____exports.default.showBtn.visible = false
    else
        ____exports.default.imageColor.visible = false
        ____exports.default.text.visible = false
        ____exports.default.closeBtn.visible = false
        ____exports.default.showBtn.visible = true
    end
end
function ErrorFrame._sl_initFrame(self)
    local imageColor = __TS__New(ImageColor)
    imageColor:setColor(80, 80, 80, 255)
    ____exports.default.imageColor = imageColor
    local text = __TS__New(Label)
    text:setBackgroundImage(____exports.default.config.backgroundImage)
    text:getTextFrame():setTextAlignment(TextAlign.topLeft)
    text:getTextFrame():clearPoints()
    text:getTextFrame():setSize(____exports.default.config.width, -1)
    imageColor.rootFrame:setPoints(
        text:getTextFrame().handle,
        0.01,
        0.01
    )
    text:getRootFrame():setPoints(
        text:getTextFrame().handle,
        0.01,
        0.01
    )
    ____exports.default.text = text
    ____exports.default.text:getTextFrame():setAbsPoint(FramePoint.topRight, 0.55, 0.5)
    local closeBtn = __TS__New(Button)
    ____exports.default.closeBtn = closeBtn
    closeBtn:setSize(0.04, 0.04)
    closeBtn:setBackgroundImage("UI\\Widgets\\BattleNet\\chaticons\\bnet-squelch.blp")
    closeBtn:getLampEffectFrame()
    closeBtn.rootFrame:setPoint(
        FramePoint.center,
        text.rootFrame.handle,
        FramePoint.topRight,
        0,
        0
    )
    closeBtn:setOnClick(function()
        text.visible = false
        ____exports.default.showBtn.visible = false
        ____exports.default.closeBtn.visible = false
        ____exports.default.imageColor.visible = false
        ____exports.default._sl_isShowing = false
    end)
    local showBtn = __TS__New(Button)
    ____exports.default.showBtn = showBtn
    showBtn:setSize(0.025, 0.025)
    showBtn:setBackgroundImage("UI\\Widgets\\BattleNet\\chaticons\\bnet-squelch.blp")
    showBtn.rootFrame:setAbsPoint(FramePoint.topLeft, 0.004, 0.24)
    showBtn:setOnClick(function()
        text.visible = true
        ____exports.default.closeBtn.visible = true
        ____exports.default.imageColor.visible = true
        ____exports.default._sl_isShowing = true
    end)
end
ErrorFrame.config = {width = 0.4, height = 0.35, backgroundImage = "UI\\Widgets\\EscMenu\\Undead\\undead-options-menu-background.blp", tip = "|cffff0000【地图程序出现错误，您可截图此信息提交于作者，帮助作者修复该问题】"}
ErrorFrame.is_init = false
ErrorFrame._sl_isShowing = false
return ____exports
