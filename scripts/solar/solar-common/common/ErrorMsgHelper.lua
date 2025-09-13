local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 34,["14"] = 31,["15"] = 35,["16"] = 36,["17"] = 37,["18"] = 38,["19"] = 39,["20"] = 40,["22"] = 42,["23"] = 43,["25"] = 45,["26"] = 34,["27"] = 9,["28"] = 10,["29"] = 11,["31"] = 13,["33"] = 14,["34"] = 14,["35"] = 15,["36"] = 15,["37"] = 15,["38"] = 15,["39"] = 15,["40"] = 15,["41"] = 14,["44"] = 17,["45"] = 17,["46"] = 17,["47"] = 18,["48"] = 19,["50"] = 21,["51"] = 21,["52"] = 21,["53"] = 21,["54"] = 21,["55"] = 21,["56"] = 21,["58"] = 17,["59"] = 17,["60"] = 24,["61"] = 9,["62"] = 48,["63"] = 49,["64"] = 50,["65"] = 51,["67"] = 53,["68"] = 54,["69"] = 55,["70"] = 56,["71"] = 57,["72"] = 58,["74"] = 60,["75"] = 61,["76"] = 62,["77"] = 63,["78"] = 64,["79"] = 65,["80"] = 66,["81"] = 67,["82"] = 68,["83"] = 69,["84"] = 70,["85"] = 71,["86"] = 72,["87"] = 73,["88"] = 74,["89"] = 75,["90"] = 76,["91"] = 77,["92"] = 78,["93"] = 79,["94"] = 80,["95"] = 81,["96"] = 82,["97"] = 83,["98"] = 84,["99"] = 85,["100"] = 86,["101"] = 87,["102"] = 88,["103"] = 89,["104"] = 90,["105"] = 91,["106"] = 92,["107"] = 93,["108"] = 94,["109"] = 95,["110"] = 96,["111"] = 97,["112"] = 98,["113"] = 99,["114"] = 100,["115"] = 101,["116"] = 102,["117"] = 103,["118"] = 104,["119"] = 105,["120"] = 106,["121"] = 107,["122"] = 108,["123"] = 109,["124"] = 110,["125"] = 111,["126"] = 112,["127"] = 113,["129"] = 115,["130"] = 116,["131"] = 117,["132"] = 118,["133"] = 119,["134"] = 120,["135"] = 121,["136"] = 122,["137"] = 123,["139"] = 125,["140"] = 126,["142"] = 128,["143"] = 48,["144"] = 132,["145"] = 133,["146"] = 134,["147"] = 135,["149"] = 137,["150"] = 138,["151"] = 139,["153"] = 140,["154"] = 147,["156"] = 149,["157"] = 150,["158"] = 151,["159"] = 152,["160"] = 153,["161"] = 154,["162"] = 155,["163"] = 156,["164"] = 161,["168"] = 163,["169"] = 164,["170"] = 132,["171"] = 180,["172"] = 181,["173"] = 181,["174"] = 181,["175"] = 181,["176"] = 181,["177"] = 182,["178"] = 180,["179"] = 185,["180"] = 185,["181"] = 185,["183"] = 186,["184"] = 187,["185"] = 189,["186"] = 190,["187"] = 191,["188"] = 192,["189"] = 193,["191"] = 195,["192"] = 196,["194"] = 200,["195"] = 201,["196"] = 202,["197"] = 203,["198"] = 204,["199"] = 205,["201"] = 207,["202"] = 208,["203"] = 209,["205"] = 213,["206"] = 214,["207"] = 214,["208"] = 214,["209"] = 214,["210"] = 214,["211"] = 214,["212"] = 214,["214"] = 216,["215"] = 217,["216"] = 217,["217"] = 217,["218"] = 217,["219"] = 217,["220"] = 217,["221"] = 217,["222"] = 218,["223"] = 218,["224"] = 218,["225"] = 218,["226"] = 218,["227"] = 218,["228"] = 218,["229"] = 219,["230"] = 220,["231"] = 221,["232"] = 222,["233"] = 222,["234"] = 222,["235"] = 222,["236"] = 222,["237"] = 222,["238"] = 222,["241"] = 225,["242"] = 226,["243"] = 226,["244"] = 226,["245"] = 226,["246"] = 226,["247"] = 226,["248"] = 226,["249"] = 227,["250"] = 227,["251"] = 227,["252"] = 227,["253"] = 227,["254"] = 227,["255"] = 227,["259"] = 231,["260"] = 231,["262"] = 231,["264"] = 185,["265"] = 2,["266"] = 5,["271"] = 169,["279"] = 173,["287"] = 177});
local ____exports = {}
____exports.default = __TS__Class()
local ErrorMsgHelper = ____exports.default
ErrorMsgHelper.name = "ErrorMsgHelper"
function ErrorMsgHelper.prototype.____constructor(self, msg, traceback)
    self._repairSuggestions = ""
    ____exports.default:init0()
    self._msg = tostring(msg)
    self._traceback = tostring(traceback)
    if isDebug then
        self.cnMsg = self:translateMsg()
        self.cnTraceback = self:translateTraceback()
    else
        self.cnMsg = self._msg
        self.cnTraceback = self._traceback
    end
    ____exports.default.lastError = self
end
function ErrorMsgHelper.init0(self)
    if not isDebug or ____exports.default.justInvoke then
        return true
    end
    local trigger = CreateTrigger()
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            TriggerRegisterPlayerChatEvent(
                trigger,
                Player(i),
                "se",
                true
            )
            i = i + 1
        end
    end
    TriggerAddAction(
        trigger,
        function()
            if ____exports.default.lastError then
                ____exports.default.printErrorMsgHelper(____exports.default.lastError, false)
            else
                DisplayTimedTextToPlayer(
                    GetLocalPlayer(),
                    0,
                    0,
                    60,
                    "没有最近的错误消息！"
                )
            end
        end
    )
    return true
end
function ErrorMsgHelper.prototype.translateMsg(self)
    local newMsg = tostring(self._msg)
    if not newMsg or not #newMsg or #newMsg == 0 then
        return newMsg
    end
    local cn = nil
    local onlyCn = false
    if (string.find(newMsg, "invalid key to 'next'", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "invalid key to 'next'", "'next'键无效")
        self._repairSuggestions = "请检查是否存在对象遍历中先进行置空操作，再进行了增加新元素的操作！"
        onlyCn = true
    end
    if (string.find(newMsg, "attempt to index a number value", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to index a number value", "不能从数字类型获取属性")
        self._repairSuggestions = "请检查变量读取正确或存入了正确的值！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to index a nil value", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to index a nil value", "不能从空值中获取属性")
        self._repairSuggestions = "请在获取属性前加上对空值判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to call a nil value", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to call a nil value", "不能调用空值函数")
        self._repairSuggestions = "请在要调用的函数前加上对空值判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to compare number with nil", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to compare number with nil", "不能用空值与数字比较大小")
        self._repairSuggestions = "请在判断中加上对空值判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to compare table with nil", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to compare table with nil", "不能用空值与对象比较大小")
        self._repairSuggestions = "请检查判断中的值是否为数字！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to compare nil with number", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to compare nil with number", "不能用空值与数字比较大小")
        self._repairSuggestions = "请在判断中加上对空值判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to concatenate a nil", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to concatenate a nil", "不能连接一个空值")
        self._repairSuggestions = "请在使用的变量前加上对空值的判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to perform arithmetic on a nil value", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to perform arithmetic on a nil value", "不能对空值进行算术运算")
        self._repairSuggestions = "请在算术运算前面加上对空值或赋予初始值进行运算！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to perform 'n%0'", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to perform 'n%0'", "不能对0取余数")
        self._repairSuggestions = "请修改余数不能为0"
        onlyCn = true
    elseif (string.find(newMsg, "Call jass function crash.", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "Call jass function crash.", "调用底层Jass函数异常")
        self._repairSuggestions = "请检查函数的所有参数是否正确！(如参数是否为空值、是否存在此物编、数值是否超过最大边界、参数类型是否正确)"
        onlyCn = true
    elseif (string.find(newMsg, "table index is nil", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "table index is nil", "访问表的索引是空")
        self._repairSuggestions = "请检查访问表的索引"
        onlyCn = true
    elseif (string.find(newMsg, "stack overflow", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "stack overflow", "栈溢出")
        self._repairSuggestions = "请检查访问表的索引"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to perform", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to perform", "不能执行")
        self._repairSuggestions = "请检查算法是否存在0或null！请赋值初始值！"
    elseif (string.find(newMsg, "(data string too short)", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "(data string too short)", "字符串数据长度太短")
        self._repairSuggestions = "请检查字符串数据是否为空值或长度过短"
    end
    if cn and #cn and #cn > 0 then
        cn = __TS__StringReplace(cn, " (local ", " (局部变量 ")
        cn = __TS__StringReplace(cn, " (field ", " (属性 ")
        cn = __TS__StringReplace(cn, " (global ", " (全局变量 ")
        cn = __TS__StringReplace(cn, "bad argument", "参数错误")
        cn = __TS__StringReplace(cn, " (value expected)", " (允许值)")
        cn = __TS__StringReplace(cn, "bad argument #", "错误的参数 #")
        cn = __TS__StringReplace(cn, "<unknown>", "<未知>")
        newMsg = (newMsg .. "\r\n") .. cn
    end
    if onlyCn then
        return cn
    end
    return newMsg
end
function ErrorMsgHelper.prototype.translateTraceback(self)
    local newMsg = self.traceback
    if not newMsg or not #newMsg or #newMsg == 0 then
        return newMsg
    end
    local strings = __TS__StringSplit(newMsg, "\n")
    local cnMsg = ""
    for ____, line in ipairs(strings) do
        do
            if (string.find(line, "solar\\common\\", nil, true) or 0) - 1 >= 0 or (string.find(line, "lualib_bundle.lua:", nil, true) or 0) - 1 >= 0 or (string.find(line, "solar\\", nil, true) or 0) - 1 >= 0 or (string.find(line, "\\_sl_egp\\", nil, true) or 0) - 1 >= 0 or (string.find(line, "[C]:", nil, true) or 0) - 1 >= 0 or (string.find(line, "[string \"fix_closure\"]:", nil, true) or 0) - 1 >= 0 then
                goto __continue33
            end
            line = __TS__StringReplace(line, "[C]: in upvalue ", "在上值底层C代码: ")
            line = __TS__StringReplace(line, " in ", " 在 ")
            line = __TS__StringReplace(line, " local ", " 局部变量 ")
            line = __TS__StringReplace(line, " global ", " 全局变量 ")
            line = __TS__StringReplace(line, " method ", " 方法 ")
            line = __TS__StringReplace(line, " function ", " 函数 ")
            line = __TS__StringReplace(line, " upvalue ", " 上值 ")
            line = __TS__StringReplace(line, "(...tail calls...)", "(...尾调用...)")
            cnMsg = (cnMsg .. line) .. "\r\n"
        end
        ::__continue33::
    end
    cnMsg = __TS__StringReplace(cnMsg, "stack traceback:", "函数堆栈:")
    return cnMsg
end
function ErrorMsgHelper.error_handle(msg)
    local errorMsgHelper = __TS__New(
        ____exports.default,
        msg,
        debug.traceback()
    )
    ____exports.default.printErrorMsgHelper(errorMsgHelper)
end
function ErrorMsgHelper.printErrorMsgHelper(errorMsgHelper, translate)
    if translate == nil then
        translate = true
    end
    local title = "------------------太阳RPG异常报告S---------------------"
    local ____end = "------------------太阳RPG异常报告E---------------------"
    local newMsg
    local tb
    if translate then
        newMsg = errorMsgHelper.cnMsg
        tb = errorMsgHelper.cnTraceback
    else
        newMsg = errorMsgHelper.msg
        tb = errorMsgHelper.traceback
    end
    print(title)
    print(newMsg .. "\n")
    print(tb)
    if translate then
        local baseTb = "\n\n-------------------原始堆栈--------------------\n\n" .. errorMsgHelper.traceback
        print(baseTb)
    end
    print(____end)
    if #errorMsgHelper.repairSuggestions > 0 then
        print(errorMsgHelper.repairSuggestions)
    end
    if ____exports.default.showFriendlyErrorInfo then
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            60,
            newMsg
        )
    end
    if DisplayTimedTextToPlayer and not ____exports.default.showFriendlyErrorInfo then
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            60,
            title
        )
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            60,
            newMsg
        )
        local tbLines = __TS__StringSplit(tb, "\n")
        for ____, dz in ipairs(tbLines) do
            if dz and #dz > 0 then
                DisplayTimedTextToPlayer(
                    GetLocalPlayer(),
                    0,
                    0,
                    60,
                    dz
                )
            end
        end
        if #errorMsgHelper.repairSuggestions > 0 then
            DisplayTimedTextToPlayer(
                GetLocalPlayer(),
                0,
                0,
                60,
                ____end
            )
            DisplayTimedTextToPlayer(
                GetLocalPlayer(),
                0,
                0,
                60,
                errorMsgHelper.repairSuggestions
            )
        end
    end
    local ____this_1
    ____this_1 = ____exports.default
    local ____opt_0 = ____this_1.onError
    if ____opt_0 ~= nil then
        ____opt_0(____this_1, errorMsgHelper)
    end
end
ErrorMsgHelper.justInvoke = false
ErrorMsgHelper.showFriendlyErrorInfo = true
__TS__SetDescriptor(
    ErrorMsgHelper.prototype,
    "msg",
    {get = function(self)
        return self._msg
    end},
    true
)
__TS__SetDescriptor(
    ErrorMsgHelper.prototype,
    "traceback",
    {get = function(self)
        return self._traceback
    end},
    true
)
__TS__SetDescriptor(
    ErrorMsgHelper.prototype,
    "repairSuggestions",
    {get = function(self)
        return self._repairSuggestions
    end},
    true
)
return ____exports
