local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 5,["11"] = 5,["12"] = 5,["14"] = 5,["15"] = 8,["16"] = 9,["17"] = 10,["18"] = 11,["19"] = 12,["20"] = 13,["21"] = 14,["23"] = 17,["24"] = 19,["25"] = 20,["26"] = 21,["27"] = 22,["28"] = 23,["29"] = 24,["30"] = 25,["32"] = 27,["33"] = 27,["34"] = 27,["35"] = 28,["36"] = 27,["37"] = 27,["39"] = 30,["40"] = 30,["41"] = 31,["42"] = 32,["43"] = 30,["46"] = 34,["47"] = 8,["48"] = 38,["49"] = 39,["50"] = 41,["51"] = 42,["52"] = 43,["53"] = 38,["54"] = 46,["55"] = 47,["56"] = 48,["57"] = 49,["58"] = 51,["59"] = 52,["60"] = 53,["61"] = 54,["62"] = 55,["64"] = 57,["65"] = 58,["66"] = 59,["67"] = 60,["68"] = 61,["69"] = 62,["70"] = 63,["71"] = 64,["72"] = 65,["73"] = 66,["74"] = 67,["76"] = 69,["77"] = 69,["78"] = 69,["79"] = 70,["80"] = 69,["81"] = 69,["82"] = 72,["83"] = 73,["85"] = 75,["86"] = 76,["87"] = 77,["88"] = 78,["89"] = 46,["90"] = 127,["91"] = 128,["92"] = 129,["93"] = 129,["94"] = 129,["96"] = 129,["98"] = 129,["99"] = 130,["100"] = 131,["102"] = 133,["103"] = 127,["104"] = 137,["105"] = 138,["106"] = 139,["108"] = 140,["109"] = 140,["111"] = 141,["112"] = 142,["113"] = 143,["115"] = 145,["116"] = 146,["117"] = 147,["118"] = 147,["119"] = 147,["120"] = 147,["121"] = 147,["123"] = 149,["124"] = 150,["125"] = 151,["127"] = 153,["130"] = 140,["133"] = 156,["134"] = 137,["135"] = 82,["136"] = 82,["137"] = 82,["138"] = 82,["139"] = 82,["140"] = 82,["141"] = 82,["142"] = 82,["143"] = 82,["144"] = 82,["145"] = 82,["146"] = 82,["147"] = 82,["148"] = 82,["149"] = 82,["150"] = 82,["151"] = 82,["152"] = 82,["153"] = 82,["154"] = 82,["155"] = 82,["156"] = 82,["157"] = 82,["158"] = 82,["159"] = 82,["160"] = 82,["161"] = 82,["162"] = 82,["163"] = 82,["164"] = 82,["165"] = 82,["166"] = 82,["167"] = 82,["168"] = 82,["169"] = 82,["170"] = 82,["171"] = 82,["172"] = 82,["173"] = 82,["174"] = 82,["175"] = 82,["176"] = 82,["177"] = 82,["178"] = 82});
local ____exports = {}
local ____GroupUtil = require("solar.solar-common.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
local jDebug = require("jass.debug")
____exports.default = __TS__Class()
local DebugGameUtil = ____exports.default
DebugGameUtil.name = "DebugGameUtil"
function DebugGameUtil.prototype.____constructor(self)
end
function DebugGameUtil.getCommonInfo(self)
    local info = (((("T=" .. tostring(math.floor(_g_time / 1000))) .. ",Hc/m=") .. tostring(handlecount())) .. "/") .. tostring(handlemax())
    info = ((info .. ",Sm=") .. tostring(____exports.default:getScriptMemory())) .. "mb"
    if isEmbedJapi then
        info = ((info .. ",Wm=") .. tostring(GetUsedMemory())) .. "mb"
        info = (info .. ",Cs=") .. tostring(GetCacheStringCount())
        info = (info .. ",Cm=") .. tostring(GetCacheModelCount())
    end
    info = (((info .. ",GP_ai=") .. tostring(GroupUtil.groupObjectPool:getNumActive())) .. ":") .. tostring(GroupUtil.groupObjectPool:getNumIdle())
    local handleInfoObj = ____exports.default:calculateHandleInfoObj()
    local handleInfoObjs = {}
    for handleInfoObjKey in pairs(handleInfoObj) do
        local obj = handleInfoObj[handleInfoObjKey]
        obj.type = handleInfoObjKey
        obj.typeName = ____exports.default:getTypeCnName(handleInfoObjKey)
        handleInfoObjs[#handleInfoObjs + 1] = obj
    end
    __TS__ArraySort(
        handleInfoObjs,
        function(self, a, b)
            return b.count - a.count
        end
    )
    do
        local i = 0
        while i < #handleInfoObjs and i < 10 do
            local obj = handleInfoObjs[i + 1]
            info = (((((info .. ",") .. ____exports.default:getTypeCnName(obj.type)) .. "=") .. tostring(obj.count)) .. "/") .. tostring(obj.reference)
            i = i + 1
        end
    end
    return info
end
function DebugGameUtil.getScriptMemory(self)
    local lua_memory = collectgarbage("count")
    local stringTs = string
    local lm = stringTs.format("%.3f", lua_memory / 1024)
    return lm
end
function DebugGameUtil.getDebugInfo(self)
    local str = "========showDebugInfo():Start========\r\n"
    str = ((str .. "垃圾收集器在运行为：") .. tostring(collectgarbage("isrunning"))) .. "\r\n"
    local lua_memory = collectgarbage("count")
    local stringTs = string
    local lm = stringTs.format("%.3f", lua_memory / 1024)
    str = ((str .. "脚本引擎占用内存[") .. tostring(lm)) .. "m]"
    if GetUsedMemory then
        str = ((str .. " GetUsedMemory=[") .. tostring(GetUsedMemory())) .. "]"
    end
    collectgarbage("collect")
    str = ((str .. "\r\nhandle最大值 =") .. tostring(jDebug.handlemax())) .. "\r\n"
    str = ((str .. "handle总数 =") .. tostring(jDebug.handlecount())) .. "\r\n"
    str = (str .. "========Handle信息:========") .. "\r\n"
    local handleInfoObj = ____exports.default:calculateHandleInfoObj()
    local handleInfoObjs = {}
    for handleInfoObjKey in pairs(handleInfoObj) do
        local obj = handleInfoObj[handleInfoObjKey]
        obj.type = handleInfoObjKey
        obj.typeName = ____exports.default:getTypeCnName(handleInfoObjKey)
        handleInfoObjs[#handleInfoObjs + 1] = obj
    end
    __TS__ArraySort(
        handleInfoObjs,
        function(self, a, b)
            return b.count - a.count
        end
    )
    for ____, obj in ipairs(handleInfoObjs) do
        str = (((((str .. ____exports.default:getTypeCnName(obj.type)) .. "    数量: ") .. tostring(obj.count)) .. "    引用计数: ") .. tostring(obj.reference)) .. "\r\n"
    end
    str = (str .. "========showDebugInfo():End========") .. "\r\n"
    str = ((str .. "GroupUtil.groupObjectPool.getNumActive()=") .. tostring(GroupUtil.groupObjectPool:getNumActive())) .. "\r\n"
    str = ((str .. "GroupUtil.groupObjectPool.getNumIdle()=") .. tostring(GroupUtil.groupObjectPool:getNumIdle())) .. "\r\n"
    return str
end
function DebugGameUtil.getTypeCnName(self, ____type)
    local name = ____exports.default.typeName[____type]
    local ____name_0
    if name then
        ____name_0 = name
    else
        ____name_0 = ____type
    end
    name = ____name_0
    if "事件" == name then
        name = ((tostring(name) .. "(") .. ____type) .. ")"
    end
    return name
end
function DebugGameUtil.calculateHandleInfoObj(self)
    local startIndex = 1048575
    local handleInfoObj = {}
    do
        local i = startIndex
        while i < startIndex + jDebug.handlemax() do
            do
                local handledefInfo = handledef(i2h(i))
                if not handledefInfo or not handledefInfo.type then
                    goto __continue22
                end
                local infoObj = handleInfoObj[handledefInfo.type]
                if not infoObj then
                    infoObj = {
                        count = 0,
                        reference = 0,
                        typeName = ____exports.default:getTypeCnName(handledefInfo.type)
                    }
                end
                infoObj.count = infoObj.count + 1
                if handledefInfo.reference then
                    infoObj.reference = infoObj.reference + handledefInfo.reference
                end
                handleInfoObj[handledefInfo.type] = infoObj
            end
            ::__continue22::
            i = i + 1
        end
    end
    return handleInfoObj
end
DebugGameUtil.typeName = {
    ["+loc"] = "点",
    ["+EIP"] = "点特效",
    ["+EIm"] = "附着特效",
    ["+EIf"] = "特效III",
    ["+tmr"] = "计时器",
    item = "物品",
    ["+w3u"] = "单位",
    ["+grp"] = "单位组",
    ["+dlb"] = "按钮",
    ["+dlg"] = "对话框",
    ["+w3d"] = "可破坏物",
    pcvt = "玩家聊天事件",
    pevt = "玩家事件",
    uevt = "单位事件",
    wdvt = "可破坏物事件",
    ["+flt"] = "过滤器",
    ["+fgm"] = "可见度修正器",
    ["+frc"] = "玩家组",
    ghth = "哈希表",
    ["+mdb"] = "多面板",
    ["+ply"] = "玩家",
    ["+rct"] = "矩形区域",
    ["+agr"] = "范围",
    ["+snd"] = "声音",
    ["+tid"] = "计时器窗口",
    ["+trg"] = "触发器",
    ["+tac"] = "触发器动作",
    tcnd = "触发器条件",
    ipol = "物品池",
    ["+mbi"] = "多面板项目",
    gcch = "缓存",
    plsd = "玩家属性变化事件",
    ["+que"] = "任务",
    ["+rev"] = "事件",
    alvt = "技能等级事件",
    bevt = "buff事件",
    devt = "对话框事件",
    gevt = "游戏全局事件",
    gfvt = "游戏帧事件",
    psvt = "玩家状态事件",
    tmet = "计时器事件",
    tmvt = "计时器变量事件"
}
return ____exports
