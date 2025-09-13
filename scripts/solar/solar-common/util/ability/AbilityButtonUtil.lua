local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 7,["15"] = 7,["16"] = 7,["18"] = 7,["19"] = 48,["20"] = 49,["21"] = 50,["22"] = 51,["23"] = 52,["24"] = 53,["25"] = 48,["26"] = 65,["27"] = 66,["28"] = 67,["29"] = 68,["30"] = 69,["31"] = 70,["33"] = 72,["34"] = 73,["37"] = 76,["38"] = 77,["39"] = 65,["40"] = 82,["41"] = 83,["44"] = 86,["45"] = 86,["46"] = 86,["47"] = 86,["48"] = 86,["49"] = 86,["51"] = 92,["52"] = 92,["53"] = 93,["54"] = 94,["55"] = 92,["58"] = 96,["59"] = 97,["60"] = 98,["61"] = 82,["62"] = 104,["63"] = 106,["64"] = 107,["65"] = 111,["66"] = 113,["67"] = 114,["68"] = 115,["71"] = 118,["72"] = 119,["73"] = 120,["75"] = 121,["76"] = 121,["78"] = 122,["79"] = 123,["80"] = 124,["82"] = 126,["83"] = 127,["85"] = 131,["86"] = 132,["87"] = 133,["88"] = 134,["89"] = 135,["90"] = 135,["91"] = 135,["92"] = 135,["93"] = 135,["94"] = 135,["95"] = 135,["96"] = 135,["98"] = 137,["102"] = 121,["105"] = 141,["106"] = 142,["107"] = 143,["110"] = 146,["111"] = 148,["112"] = 149,["114"] = 150,["115"] = 150,["116"] = 151,["117"] = 152,["118"] = 153,["119"] = 154,["120"] = 154,["121"] = 154,["122"] = 154,["123"] = 154,["124"] = 154,["125"] = 154,["126"] = 154,["129"] = 150,["132"] = 158,["136"] = 162,["137"] = 163,["139"] = 104,["140"] = 168,["142"] = 169,["143"] = 169,["144"] = 170,["145"] = 171,["146"] = 171,["147"] = 171,["148"] = 171,["149"] = 171,["150"] = 171,["151"] = 171,["152"] = 171,["153"] = 169,["156"] = 168,["157"] = 177,["159"] = 178,["160"] = 178,["161"] = 179,["162"] = 180,["163"] = 180,["164"] = 180,["165"] = 180,["166"] = 180,["167"] = 180,["168"] = 180,["169"] = 180,["170"] = 178,["173"] = 177,["174"] = 193,["175"] = 194,["176"] = 195,["177"] = 196,["178"] = 197,["180"] = 199,["181"] = 193,["182"] = 208,["183"] = 209,["184"] = 210,["186"] = 212,["187"] = 213,["188"] = 214,["189"] = 208,["190"] = 223,["191"] = 224,["192"] = 225,["194"] = 227,["195"] = 228,["196"] = 229,["197"] = 230,["199"] = 232,["201"] = 234,["202"] = 223,["203"] = 243,["204"] = 244,["205"] = 245,["206"] = 246,["207"] = 247,["208"] = 248,["210"] = 250,["211"] = 251,["212"] = 252,["214"] = 254,["217"] = 257,["219"] = 259,["220"] = 243,["221"] = 269,["222"] = 270,["223"] = 271,["224"] = 272,["226"] = 274,["227"] = 275,["228"] = 276,["230"] = 278,["231"] = 269,["232"] = 297,["233"] = 298,["234"] = 299,["235"] = 300,["236"] = 297,["237"] = 9,["238"] = 10,["239"] = 18,["240"] = 19,["241"] = 30,["242"] = 37,["243"] = 80,["244"] = 101,["245"] = 102,["246"] = 187,["247"] = 187,["248"] = 187,["249"] = 187,["250"] = 187,["251"] = 187,["252"] = 187,["253"] = 187,["254"] = 187,["255"] = 187,["256"] = 187,["257"] = 187,["258"] = 187,["259"] = 187,["260"] = 282,["261"] = 283,["262"] = 284,["263"] = 285,["264"] = 286,["265"] = 287});
local ____exports = {}
local ____FrameCallbackUtil = require("solar.solar-common.util.frame.FrameCallbackUtil")
local FrameCallbackUtil = ____FrameCallbackUtil.default
local ____AbilityUtil = require("solar.solar-common.util.ability.AbilityUtil")
local AbilityUtil = ____AbilityUtil.default
local ____KeyCode = require("solar.solar-common.constant.KeyCode")
local KeyCode = ____KeyCode.default
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
____exports.default = __TS__Class()
local AbilityButtonUtil = ____exports.default
AbilityButtonUtil.name = "AbilityButtonUtil"
function AbilityButtonUtil.prototype.____constructor(self)
end
function AbilityButtonUtil.setAbilityBottomButtonXAndHotKey(self, unit, abilityIdStr, x)
    local player = GetOwningPlayer(unit)
    local keyCode = ____exports.default.qwerKeyCodes[x + 1]
    AbilityUtil:setUnitAbilityHotkey(unit, abilityIdStr, keyCode, false)
    AbilityUtil:setUnitAbilityName(unit, abilityIdStr, ((_g_objs.ability[abilityIdStr].Name .. "(") .. ____exports.default.qwerKeyNames[x + 1]) .. ")", true)
    return ____exports.default:setAbilityBottomButtonX(abilityIdStr, x, player)
end
function AbilityButtonUtil.setAbilityBottomButtonX(self, abilityIdStr, x, player)
    abilityIdStr = LangUtil:getIntId(abilityIdStr)
    local sABXMPD = ____exports.default.syncAbilityIdButtonXMap[GetPlayerId(player)]
    if not sABXMPD then
        sABXMPD = {}
        ____exports.default.syncAbilityIdButtonXMap[GetPlayerId(player)] = sABXMPD
    end
    sABXMPD[abilityIdStr] = x
    if player ~= GetLocalPlayer() then
        return
    end
    ____exports.default:_sl_init_bottomButton_system()
    ____exports.default.abilityIdButtonXMap[abilityIdStr] = x
end
function AbilityButtonUtil._sl_init_bottomButton_system(self)
    if ____exports.default._sl_isInitialized then
        return
    end
    ____exports.default._sl_bottomButtonArray = {
        DzFrameGetCommandBarButton(2, 0),
        DzFrameGetCommandBarButton(2, 1),
        DzFrameGetCommandBarButton(2, 2),
        DzFrameGetCommandBarButton(2, 3)
    }
    do
        local index = 0
        while index < 4 do
            local uiid = ____exports.default._sl_bottomButtonArray[index + 1]
            DzFrameClearAllPoints(uiid)
            index = index + 1
        end
    end
    ____exports.default:_sl_resetBottomButton()
    FrameCallbackUtil:addFrameSetUpdateCallback(____exports.default._sl_refreshButton)
    ____exports.default._sl_isInitialized = true
end
function AbilityButtonUtil._sl_refreshButton()
    local noQwer = true
    local xwz = {____exports.default.onlySetButtons[1], ____exports.default.onlySetButtons[2], ____exports.default.onlySetButtons[3], ____exports.default.onlySetButtons[4]}
    local frameSelection = selection()
    if frameSelection ~= ____exports.default.lastFrameSelection then
        ____exports.default:_sl_hideBottomButton()
        ____exports.default.lastFrameSelection = frameSelection
        return
    end
    ____exports.default.lastFrameSelection = frameSelection
    local add = {}
    local noAbility = true
    do
        local index = 0
        while index < 4 do
            do
                local skid = button(index, 2)
                if skid == 0 or not skid then
                    goto __continue14
                end
                noAbility = false
                local uiid = ____exports.default._sl_bottomButtonArray[index + 1]
                --- 注意单位 不能拥有相同位置的技能 否则会重叠按钮
                local realButtonX = ____exports.default.abilityIdButtonXMap[skid]
                if realButtonX then
                    xwz[realButtonX + 1] = true
                    noQwer = false
                    DzFrameSetPoint(
                        uiid,
                        8,
                        DzGetGameUI(),
                        8,
                        realButtonX * 0.0435 - 0.144,
                        0.007
                    )
                else
                    add[#add + 1] = uiid
                end
            end
            ::__continue14::
            index = index + 1
        end
    end
    if noAbility and not ____exports.default.lastNoAbility then
        ____exports.default:_sl_hideBottomButton()
        ____exports.default.lastNoAbility = noAbility
        return
    end
    ____exports.default.lastNoAbility = noAbility
    for ____, uiid in ipairs(add) do
        local bol = true
        do
            local index = 0
            while index < #xwz do
                if not xwz[index + 1] then
                    bol = false
                    xwz[index + 1] = true
                    DzFrameSetPoint(
                        uiid,
                        8,
                        DzGetGameUI(),
                        8,
                        index * 0.0435 - 0.144,
                        0.007
                    )
                    break
                end
                index = index + 1
            end
        end
        if bol then
            break
        end
    end
    if noQwer then
        ____exports.default:_sl_resetBottomButton()
    end
end
function AbilityButtonUtil._sl_hideBottomButton(self)
    do
        local index = 0
        while index < 4 do
            local uiid = ____exports.default._sl_bottomButtonArray[index + 1]
            DzFrameSetPoint(
                uiid,
                8,
                DzGetGameUI(),
                8,
                -1,
                -1
            )
            index = index + 1
        end
    end
end
function AbilityButtonUtil._sl_resetBottomButton(self)
    do
        local index = 0
        while index < 4 do
            local uiid = ____exports.default._sl_bottomButtonArray[index + 1]
            DzFrameSetPoint(
                uiid,
                8,
                DzGetGameUI(),
                8,
                index * 0.0435 - 0.144,
                0.007
            )
            index = index + 1
        end
    end
end
function AbilityButtonUtil.getHotKeyByNumber(self, num)
    if num < 1 then
        return ____exports.default.hotKeys[1]
    elseif num > 12 then
        return ____exports.default.hotKeys[12]
    end
    return ____exports.default.hotKeys[num]
end
function AbilityButtonUtil.getPosByNumber(self, number)
    if number < 1 or number > 12 then
        return {x = 0, y = -11}
    end
    local x = (number - 1) % 4
    local y = math.floor((number - 1) / 4)
    return {x = x, y = y}
end
function AbilityButtonUtil.getNumberByPos(self, xOrPos, y)
    if xOrPos == nil then
        return 0
    end
    local x = 0
    if y == nil then
        x = xOrPos.x
        y = xOrPos.y
    else
        x = xOrPos
    end
    return y * 4 + x + 1
end
function AbilityButtonUtil.getPos(self, xOrPosOrNum, y)
    local x = 0
    if y == nil then
        if LangUtil:isNumber(xOrPosOrNum) then
            if xOrPosOrNum == -1 then
                return {x = 0, y = -11}
            end
            local x = (xOrPosOrNum - 1) % 4
            local y = math.floor((xOrPosOrNum - 1) / 4)
            return {x = x, y = y}
        else
            return xOrPosOrNum
        end
    else
        x = xOrPosOrNum
    end
    return {x = x, y = y}
end
function AbilityButtonUtil.getPosBySceneXY(self, sceneX, sceneY)
    local rY = 2 - math.floor((sceneY - 0.01) / 0.041)
    if rY < 0 or rY > 2 then
        return nil
    end
    local rX = math.floor((sceneX - 0.618) / 0.0425)
    if rX < 0 or rX > 3 then
        return nil
    end
    return {x = rX, y = rY}
end
function AbilityButtonUtil.getUIXYByPos(self, x, y)
    local uiX = 0.8 - (3 - x) * (____exports.default.btnUIWidth + ____exports.default.btnUIXGap) - ____exports.default.btnUIXMargin
    local uiY = (2 - y) * (____exports.default.btnUIHeight + ____exports.default.btnUIYGap) + ____exports.default.btnUIYMargin
    return {x = uiX, y = uiY}
end
AbilityButtonUtil.qwerKeyCodes = {KeyCode.VK_Q, KeyCode.VK_W, KeyCode.VK_E, KeyCode.VK_R}
AbilityButtonUtil.qwerKeyNames = {"Q", "W", "E", "R"}
AbilityButtonUtil.onlySetButtons = {false, false, false, false}
AbilityButtonUtil._sl_bottomButtonArray = nil
AbilityButtonUtil.abilityIdButtonXMap = {}
AbilityButtonUtil.syncAbilityIdButtonXMap = {}
AbilityButtonUtil._sl_isInitialized = false
AbilityButtonUtil.lastFrameSelection = nil
AbilityButtonUtil.lastNoAbility = false
AbilityButtonUtil.hotKeys = {
    "Z",
    "X",
    "C",
    "V",
    "A",
    "S",
    "D",
    "F",
    "Q",
    "W",
    "E",
    "R"
}
AbilityButtonUtil.btnUIWidth = 0.04
AbilityButtonUtil.btnUIHeight = 0.04
AbilityButtonUtil.btnUIXGap = 0.0035
AbilityButtonUtil.btnUIYGap = 0.0035
AbilityButtonUtil.btnUIXMargin = 0.012
AbilityButtonUtil.btnUIYMargin = 0.007
return ____exports
