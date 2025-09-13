local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 17,["11"] = 17,["12"] = 17,["14"] = 17,["15"] = 28,["16"] = 29,["17"] = 30,["18"] = 31,["20"] = 33,["21"] = 34,["22"] = 35,["23"] = 36,["24"] = 40,["25"] = 42,["26"] = 43,["27"] = 44,["28"] = 44,["29"] = 44,["30"] = 45,["31"] = 46,["34"] = 49,["35"] = 50,["36"] = 51,["40"] = 54,["41"] = 54,["43"] = 54,["45"] = 44,["46"] = 44,["48"] = 58,["49"] = 59,["50"] = 60,["51"] = 28,["52"] = 72,["53"] = 72,["54"] = 73,["55"] = 74,["56"] = 74,["57"] = 74,["58"] = 74,["59"] = 74,["60"] = 74,["61"] = 74,["62"] = 74,["64"] = 77,["65"] = 78,["66"] = 79,["68"] = 80,["69"] = 80,["70"] = 81,["71"] = 83,["72"] = 84,["73"] = 85,["74"] = 80,["77"] = 91,["78"] = 91,["79"] = 91,["80"] = 91,["81"] = 91,["82"] = 92,["83"] = 72,["84"] = 107,["85"] = 107,["86"] = 108,["87"] = 109,["88"] = 110,["89"] = 111,["90"] = 111,["91"] = 111,["92"] = 111,["93"] = 111,["94"] = 111,["95"] = 111,["96"] = 111,["97"] = 112,["98"] = 113,["99"] = 113,["100"] = 113,["101"] = 113,["102"] = 113,["103"] = 113,["104"] = 113,["105"] = 113,["107"] = 115,["109"] = 109,["110"] = 118,["111"] = 119,["112"] = 120,["113"] = 122,["114"] = 123,["115"] = 124,["118"] = 130,["119"] = 130,["120"] = 131,["121"] = 133,["122"] = 134,["123"] = 135,["124"] = 130,["127"] = 140,["128"] = 141,["129"] = 141,["130"] = 141,["131"] = 141,["132"] = 141,["133"] = 142,["135"] = 148,["136"] = 148,["137"] = 148,["138"] = 148,["139"] = 148,["140"] = 149,["141"] = 107,["142"] = 162,["143"] = 162,["144"] = 163,["145"] = 164,["146"] = 165,["147"] = 166,["148"] = 166,["149"] = 166,["150"] = 167,["151"] = 168,["152"] = 169,["153"] = 170,["154"] = 170,["155"] = 170,["156"] = 170,["157"] = 170,["158"] = 171,["160"] = 173,["161"] = 173,["162"] = 173,["163"] = 173,["164"] = 174,["165"] = 166,["166"] = 166,["167"] = 176,["168"] = 177,["169"] = 178,["170"] = 176,["172"] = 180,["173"] = 180,["174"] = 181,["175"] = 182,["176"] = 182,["177"] = 182,["179"] = 182,["181"] = 182,["182"] = 183,["183"] = 184,["184"] = 180,["187"] = 191,["188"] = 191,["189"] = 191,["190"] = 191,["191"] = 191,["192"] = 193,["193"] = 162,["194"] = 21});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____KeyCode = require("solar.solar-common.constant.KeyCode")
local KeyCode = ____KeyCode.default
____exports.default = __TS__Class()
local DialogUtil = ____exports.default
DialogUtil.name = "DialogUtil"
function DialogUtil.prototype.____constructor(self)
end
function DialogUtil.getBaseDialog(self, playerId)
    if isAsync then
        log.errorWithTraceBack("不能在异步环境使用此对话框！")
        return nil
    end
    local baseDialogData = ____exports.default._sl_base_dialog_datas[playerId]
    if baseDialogData == nil then
        local dialog = DialogCreate()
        baseDialogData = {dialog = dialog, buttons = {}}
        ____exports.default._sl_base_dialog_datas[playerId] = baseDialogData
        local trigger = CreateTrigger()
        TriggerRegisterDialogEvent(trigger, dialog)
        TriggerAddAction(
            trigger,
            function()
                local dialogData = ____exports.default._sl_base_dialog_datas[GetPlayerId(GetTriggerPlayer())]
                if dialogData == nil then
                    return
                end
                local button = GetClickedButton()
                local buttonData = dialogData.buttons[GetHandleId(button)]
                if buttonData == nil then
                    return
                end
                local ____this_1
                ____this_1 = dialogData
                local ____opt_0 = ____this_1.onClickButtonCallBack
                if ____opt_0 ~= nil then
                    ____opt_0(____this_1, buttonData._sl_index, buttonData._sl_text)
                end
            end
        )
    end
    local baseDialog = baseDialogData.dialog
    DialogClear(baseDialog)
    return baseDialogData
end
function DialogUtil.show(self, playerId, title, onClickButtonCallBack, ...)
    local buttonTexts = {...}
    if (buttonTexts and #buttonTexts) > 10 then
        return ____exports.default:showPage(
            playerId,
            title,
            onClickButtonCallBack,
            1,
            9,
            table.unpack(buttonTexts)
        )
    end
    local baseDialogData = ____exports.default:getBaseDialog(playerId)
    baseDialogData.onClickButtonCallBack = onClickButtonCallBack
    DialogSetMessage(baseDialogData.dialog, title)
    do
        local i = 0
        while i < #buttonTexts do
            local buttonText = buttonTexts[i + 1]
            local hotKey = 0
            local button = DialogAddButton(baseDialogData.dialog, buttonText, hotKey)
            baseDialogData.buttons[GetHandleId(button)] = {_sl_index = i, _sl_text = buttonText}
            i = i + 1
        end
    end
    DialogDisplay(
        Player(playerId),
        baseDialogData.dialog,
        true
    )
    return baseDialogData.dialog
end
function DialogUtil.showPage(self, playerId, title, onClickButtonCallBack, pageIndex, pageSize, ...)
    local buttonTexts = {...}
    local baseDialogData = ____exports.default:getBaseDialog(playerId)
    baseDialogData.onClickButtonCallBack = function(____, index, text)
        if text == "_sl_:上一页" then
            ____exports.default:showPage(
                playerId,
                title,
                onClickButtonCallBack,
                pageIndex - 1,
                pageSize,
                table.unpack(buttonTexts)
            )
        elseif text == "_sl_:下一页" then
            ____exports.default:showPage(
                playerId,
                title,
                onClickButtonCallBack,
                pageIndex + 1,
                pageSize,
                table.unpack(buttonTexts)
            )
        else
            onClickButtonCallBack(nil, index, text)
        end
    end
    local maxPageIndex = math.ceil(#buttonTexts / pageSize)
    DialogSetMessage(baseDialogData.dialog, title)
    local start = (pageIndex - 1) * pageSize
    if pageIndex > 1 then
        local button = DialogAddButton(baseDialogData.dialog, "上一页", 0)
        baseDialogData.buttons[GetHandleId(button)] = {_sl_index = pageIndex - 1, _sl_text = "_sl_:上一页"}
    end
    do
        local i = start
        while i < #buttonTexts and i < start + pageSize do
            local buttonText = buttonTexts[i + 1]
            local hotKey = 0
            local button = DialogAddButton(baseDialogData.dialog, buttonText, hotKey)
            baseDialogData.buttons[GetHandleId(button)] = {_sl_index = i, _sl_text = buttonText}
            i = i + 1
        end
    end
    if pageIndex < maxPageIndex then
        local button = DialogAddButton(
            baseDialogData.dialog,
            (((("下一页" .. " (") .. tostring(pageIndex)) .. "/") .. tostring(maxPageIndex)) .. ")",
            0
        )
        baseDialogData.buttons[GetHandleId(button)] = {_sl_index = pageIndex - 1, _sl_text = "_sl_:下一页"}
    end
    DialogDisplay(
        Player(playerId),
        baseDialogData.dialog,
        true
    )
    return baseDialogData.dialog
end
function DialogUtil.showWithTimeLimit(self, playerId, title, lifeTime, onClickButtonCallBack, ...)
    local buttonTexts = {...}
    local baseDialogData = ____exports.default:getBaseDialog(playerId)
    local dialog = baseDialogData.dialog
    DialogSetMessage(dialog, title)
    local tl = BaseUtil.onTimer(
        1,
        function(____, c)
            if c > lifeTime then
                onClickButtonCallBack(nil, 0, buttonTexts[1])
                baseDialogData.onClickButtonCallBack = nil
                DialogDisplay(
                    Player(playerId),
                    dialog,
                    false
                )
                return false
            end
            DialogSetMessage(
                dialog,
                ((title .. " （|cffff0000剩余") .. tostring(lifeTime - c)) .. "|r）"
            )
            return true
        end
    )
    baseDialogData.onClickButtonCallBack = function(____, index, text)
        tl:destroy()
        onClickButtonCallBack(nil, index, text)
    end
    do
        local i = 0
        while i < #buttonTexts do
            local buttonText = buttonTexts[i + 1]
            local ____temp_4
            if i < 10 then
                ____temp_4 = KeyCode["VK_" .. tostring(i + 1)]
            else
                ____temp_4 = 0
            end
            local hotKey = ____temp_4
            local button = DialogAddButton(dialog, buttonText, hotKey)
            baseDialogData.buttons[GetHandleId(button)] = {_sl_index = i, _sl_text = buttonText}
            i = i + 1
        end
    end
    DialogDisplay(
        Player(playerId),
        dialog,
        true
    )
    return dialog
end
DialogUtil._sl_base_dialog_datas = {}
return ____exports
