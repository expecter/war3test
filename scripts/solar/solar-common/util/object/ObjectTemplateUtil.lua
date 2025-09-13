local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 11,["19"] = 11,["20"] = 11,["22"] = 11,["23"] = 33,["24"] = 34,["25"] = 35,["26"] = 36,["28"] = 38,["29"] = 33,["30"] = 45,["31"] = 46,["32"] = 47,["33"] = 48,["35"] = 50,["36"] = 45,["37"] = 57,["38"] = 58,["39"] = 59,["40"] = 60,["42"] = 62,["43"] = 63,["44"] = 63,["45"] = 63,["46"] = 57,["47"] = 69,["48"] = 70,["49"] = 71,["50"] = 72,["51"] = 73,["52"] = 74,["53"] = 75,["54"] = 76,["55"] = 77,["56"] = 78,["57"] = 79,["58"] = 80,["60"] = 82,["63"] = 85,["64"] = 85,["65"] = 85,["66"] = 86,["67"] = 87,["68"] = 88,["69"] = 85,["70"] = 85,["71"] = 90,["72"] = 91,["73"] = 92,["74"] = 93,["75"] = 94,["76"] = 95,["77"] = 96,["78"] = 97,["79"] = 99,["80"] = 99,["81"] = 99,["82"] = 99,["83"] = 99,["84"] = 99,["85"] = 99,["86"] = 99,["87"] = 99,["88"] = 100,["89"] = 101,["90"] = 102,["91"] = 103,["93"] = 105,["95"] = 69,["96"] = 125,["97"] = 126,["100"] = 129,["101"] = 130,["102"] = 132,["103"] = 133,["104"] = 125,["105"] = 144,["106"] = 145,["107"] = 146,["108"] = 147,["109"] = 148,["111"] = 151,["113"] = 152,["114"] = 152,["115"] = 153,["116"] = 154,["119"] = 152,["123"] = 159,["124"] = 160,["125"] = 161,["126"] = 162,["127"] = 163,["128"] = 164,["130"] = 166,["131"] = 168,["133"] = 144,["134"] = 180,["135"] = 181,["136"] = 181,["137"] = 182,["138"] = 183,["139"] = 184,["140"] = 185,["144"] = 189,["145"] = 190,["146"] = 191,["148"] = 193,["149"] = 195,["150"] = 180,["151"] = 203,["152"] = 203,["153"] = 203,["155"] = 204,["156"] = 205,["157"] = 206,["160"] = 209,["161"] = 209,["162"] = 210,["163"] = 211,["165"] = 209,["168"] = 214,["169"] = 215,["170"] = 203,["171"] = 224,["172"] = 224,["173"] = 224,["175"] = 224,["176"] = 224,["178"] = 225,["179"] = 226,["180"] = 227,["183"] = 230,["184"] = 230,["185"] = 231,["186"] = 232,["188"] = 230,["191"] = 235,["192"] = 224,["193"] = 245,["194"] = 246,["195"] = 248,["196"] = 249,["197"] = 250,["198"] = 251,["199"] = 251,["200"] = 251,["201"] = 252,["202"] = 253,["203"] = 254,["204"] = 255,["205"] = 256,["206"] = 257,["207"] = 258,["208"] = 259,["209"] = 261,["211"] = 264,["212"] = 251,["213"] = 251,["214"] = 266,["215"] = 271,["217"] = 274,["218"] = 275,["219"] = 276,["220"] = 277,["221"] = 277,["222"] = 277,["223"] = 277,["224"] = 281,["226"] = 283,["227"] = 284,["229"] = 286,["231"] = 245,["232"] = 299,["233"] = 300,["234"] = 301,["237"] = 304,["238"] = 305,["239"] = 306,["240"] = 307,["241"] = 308,["243"] = 310,["244"] = 312,["245"] = 313,["246"] = 314,["247"] = 315,["251"] = 319,["252"] = 320,["253"] = 321,["254"] = 322,["255"] = 323,["259"] = 327,["261"] = 299,["262"] = 338,["263"] = 339,["266"] = 342,["267"] = 343,["268"] = 344,["269"] = 345,["270"] = 346,["271"] = 347,["274"] = 350,["275"] = 351,["276"] = 352,["277"] = 353,["280"] = 356,["281"] = 357,["282"] = 358,["283"] = 359,["286"] = 363,["287"] = 364,["288"] = 365,["289"] = 366,["291"] = 368,["292"] = 368,["293"] = 368,["294"] = 369,["295"] = 368,["296"] = 368,["297"] = 338,["298"] = 373,["299"] = 374,["300"] = 375,["301"] = 376,["302"] = 377,["304"] = 379,["305"] = 373,["306"] = 14,["307"] = 26,["308"] = 336});
local ____exports = {}
local ____ObjectPool = require("solar.solar-common.tool.ObjectPool")
local ObjectPool = ____ObjectPool.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____DebugUtil = require("solar.solar-common.util.debug.DebugUtil")
local DebugUtil = ____DebugUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
____exports.default = __TS__Class()
local ObjectTemplateUtil = ____exports.default
ObjectTemplateUtil.name = "ObjectTemplateUtil"
function ObjectTemplateUtil.prototype.____constructor(self)
end
function ObjectTemplateUtil.hasTemplate(self, templateType)
    local strings = ____exports.default.templateInfo[templateType]
    if strings and #strings > 0 then
        return true
    end
    return false
end
function ObjectTemplateUtil.getTemplateMaxCount(self, templateType)
    local templateIds = ____exports.default.templateInfo[templateType]
    if templateIds == nil then
        return 0
    end
    return #templateIds
end
function ObjectTemplateUtil.getTemplateIdleCount(self, templateType)
    local templateIds = ____exports.default.templateInfo[templateType]
    if templateIds == nil then
        return 0
    end
    local state = ____exports.default._sl_templateStateInfo[templateType]
    local ____temp_6 = #templateIds - ((state and state.useIndex or -1) + 1)
    local ____opt_2 = state and state.objectPool
    return ____temp_6 + (____opt_2 and ____opt_2:getNumIdle() or 0)
end
function ObjectTemplateUtil.printTemplateInfo(self)
    ____exports.default:_sl_init()
    print("=======ObjectTemplate Start======")
    BJDebugMsg("=======ObjectTemplate Start======")
    local itemKey = {}
    local abilityKey = {}
    local unitKey = {}
    for templateInfoKey in pairs(____exports.default.templateInfo) do
        if (string.find(templateInfoKey, "物品", nil, true) or 0) - 1 >= 0 then
            itemKey[#itemKey + 1] = templateInfoKey
        elseif (string.find(templateInfoKey, "主动", nil, true) or 0) - 1 >= 0 then
            abilityKey[#abilityKey + 1] = templateInfoKey
        else
            unitKey[#unitKey + 1] = templateInfoKey
        end
    end
    __TS__ArraySort(
        abilityKey,
        function(____, a, b)
            local an = __TS__StringSubstring(a, 6)
            local bn = __TS__StringSubstring(b, 6)
            return tonumber(an) - tonumber(bn)
        end
    )
    local allKey = {}
    __TS__ArrayPushArray(allKey, itemKey)
    __TS__ArrayPushArray(allKey, abilityKey)
    allKey[#allKey + 1] = "哨塔"
    for ____, templateInfoKey in ipairs(allKey) do
        local strings = ____exports.default.templateInfo[templateInfoKey]
        local state = ____exports.default._sl_templateStateInfo[templateInfoKey]
        local nameCol = TextUtil:rightPad(templateInfoKey, 8, " ")
        local ____TextUtil_13 = TextUtil
        local ____TextUtil_rightPad_14 = TextUtil.rightPad
        local ____opt_7 = state and state.objectPool
        local useInfo = ____TextUtil_rightPad_14(
            ____TextUtil_13,
            (((tostring(____opt_7 and ____opt_7:getNumActive() or 0) .. " / ") .. tostring((state and state.useIndex or -1) + 1)) .. " / ") .. tostring(#strings),
            6,
            " "
        )
        local info = ((((nameCol .. "    [ ") .. useInfo) .. " ]:  ") .. strings[1]) .. "  ......"
        print(info)
        if state and state._sl_templateCache then
            print_r(state._sl_templateCache)
        end
        BJDebugMsg(info)
    end
end
function ObjectTemplateUtil.cleanAbility(self, ability)
    if not IsHandle(ability) then
        return
    end
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_COOL, 0.5)
    EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_HOTKET, 0)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0)
end
function ObjectTemplateUtil.addUnitAbilityTemplate(self, unit, abilityNum, cacheKey, cacheRefKey)
    local abilityTemplate = DataBase:getUnitSolarData(unit)._SL_abilityTemplate
    if abilityTemplate == nil then
        abilityTemplate = {}
        DataBase:getUnitSolarData(unit)._SL_abilityTemplate = abilityTemplate
    end
    if abilityNum == nil or abilityNum <= 0 then
        do
            local i = 1
            while i <= 12 do
                if abilityTemplate[i] == nil then
                    abilityNum = i
                    break
                end
                i = i + 1
            end
        end
    end
    if abilityTemplate[abilityNum] == nil then
        local templateType = "主动" .. tostring(abilityNum)
        abilityTemplate[abilityNum] = ____exports.default:borrowTemplate(templateType, cacheKey, cacheRefKey)
        UnitAddAbility(unit, abilityTemplate[abilityNum])
        ____exports.default:cleanAbility(EXGetUnitAbility(unit, abilityTemplate[abilityNum]))
        return abilityTemplate[abilityNum]
    else
        log.errorWithTraceBack((((("这个位置已经有模板实例了。请先销毁这个位置的技能引用实例。" .. GetUnitName(unit)) .. "->") .. tostring(abilityNum)) .. "=") .. abilityTemplate[abilityNum])
        return nil
    end
end
function ObjectTemplateUtil.removeUnitAbilityTemplate(self, unit, abilityId, cacheKey, cacheRefKey)
    local ____opt_17 = DataBase:getUnitSolarData(unit, false)
    local abilityTemplate = ____opt_17 and ____opt_17._SL_abilityTemplate
    if abilityTemplate ~= nil then
        for key in pairs(abilityTemplate) do
            if abilityTemplate[key] == abilityId then
                abilityTemplate[key] = nil
            end
        end
    end
    local abilityObj = _g_objs.ability[abilityId]
    if abilityObj.code == "ANcl" then
        ____exports.default:cleanAbility(EXGetUnitAbility(unit, abilityId))
    end
    UnitRemoveAbility(unit, abilityId)
    ____exports.default:returnTemplate(abilityObj.Tip1 or abilityObj.Tip, abilityId, cacheKey, cacheRefKey)
end
function ObjectTemplateUtil.getUnitAbilityTemplateNextNumber(self, unit, startNum)
    if startNum == nil then
        startNum = 1
    end
    local abilityTemplate = DataBase:getUnitSolarData(unit)._SL_abilityTemplate
    if abilityTemplate == nil then
        return startNum
    end
    do
        local i = startNum
        while i <= 12 do
            if abilityTemplate[i] == nil then
                return i
            end
            i = i + 1
        end
    end
    log.errorWithTraceBack(((("单位" .. GetUnitName(unit)) .. "从起始位置") .. tostring(startNum)) .. "开始已经没有多余的空位置了!")
    return 12
end
function ObjectTemplateUtil.hasUnitAbilityTemplateSpace(self, unit, minNum, maxNum)
    if minNum == nil then
        minNum = 1
    end
    if maxNum == nil then
        maxNum = 1
    end
    local abilityTemplate = DataBase:getUnitSolarData(unit)._SL_abilityTemplate
    if abilityTemplate == nil then
        return true
    end
    do
        local i = minNum
        while i <= maxNum do
            if abilityTemplate[i] == nil then
                return true
            end
            i = i + 1
        end
    end
    return false
end
function ObjectTemplateUtil.borrowTemplate(self, templateType, cacheKey, cacheRefKey)
    ____exports.default:_sl_init()
    local stateInfo = ____exports.default._sl_templateStateInfo[templateType]
    if stateInfo == nil then
        local objTemplates = ____exports.default.templateInfo[templateType]
        local objectPool = __TS__New(
            ObjectPool,
            function()
                stateInfo.useIndex = stateInfo.useIndex + 1
                if objTemplates == nil or stateInfo.useIndex >= #objTemplates then
                    local info = (("模板不足!请增加基础模板物编的数量!当前类型的模板数量:" .. templateType) .. " -> ") .. tostring(objTemplates and #objTemplates)
                    BJDebugMsg(info)
                    print("请检查是否有模板泄漏的情况。即移除物品时未归还模板id。")
                    log.errorWithTraceBack(info)
                    return nil
                elseif #objTemplates > 10 and stateInfo.useIndex + 3 > #objTemplates then
                    BJDebugMsg((((("|cffff0000【太阳TS框架提示】《" .. templateType) .. "》(") .. tostring(#objTemplates)) .. ")模板不足！") .. "请作者增加模板!玩家可减少场上存在的技能或物品等，以免地图逻辑出错！")
                end
                return objTemplates[stateInfo.useIndex + 1]
            end
        )
        stateInfo = {useIndex = -1, objectPool = objectPool, _sl_templateCache = {}}
        ____exports.default._sl_templateStateInfo[templateType] = stateInfo
    end
    if cacheKey then
        local cacheElement = stateInfo._sl_templateCache[cacheKey]
        if cacheElement == nil then
            cacheElement = {
                templateId = stateInfo.objectPool:borrowObject(),
                refs = {}
            }
            stateInfo._sl_templateCache[cacheKey] = cacheElement
        end
        cacheElement.refs[cacheRefKey] = true
        return cacheElement.templateId
    else
        return stateInfo.objectPool:borrowObject()
    end
end
function ObjectTemplateUtil.returnTemplate(self, templateType, objIdStr, cacheKey, cacheRefKey)
    local stateInfo = ____exports.default._sl_templateStateInfo[templateType]
    if stateInfo == nil then
        return
    end
    if cacheKey then
        local cacheElement = stateInfo._sl_templateCache[cacheKey]
        if cacheElement then
            if cacheElement.templateId ~= objIdStr then
                log.errorWithTraceBack("缓存的模版id。借还不一样！")
            end
            deleteKey(cacheElement.refs, cacheRefKey)
            local refCount = 0
            for refsKey in pairs(cacheElement.refs) do
                if cacheElement.refs[refsKey] == true then
                    refCount = refCount + 1
                    break
                end
            end
            if refCount <= 0 then
                cacheElement.templateId = nil
                cacheElement.refs = nil
                stateInfo._sl_templateCache[cacheKey] = nil
                return stateInfo.objectPool:returnObject(objIdStr)
            end
        end
    else
        return stateInfo.objectPool:returnObject(objIdStr)
    end
end
function ObjectTemplateUtil._sl_init(self)
    if ____exports.default._sl_isInitialized then
        return
    end
    DebugUtil.refreshCodeExecStartTime()
    local _sl_templateName = "[$ST]"
    for objId in pairs(_g_objs.ability) do
        local objInfo = _g_objs.ability[objId]
        if objInfo.Name == _sl_templateName then
            self:addTemplate(objInfo.Tip1 or objInfo.Tip, objId)
        end
    end
    for objId in pairs(_g_objs.item) do
        local objInfo = _g_objs.item[objId]
        if objInfo.Name == _sl_templateName then
            self:addTemplate(objInfo.Tip, objId)
        end
    end
    for objId in pairs(_g_objs.unit) do
        local objInfo = _g_objs.unit[objId]
        if objInfo.Name == _sl_templateName then
            self:addTemplate(objInfo.Tip, objId)
        end
    end
    ____exports.default._sl_isInitialized = true
    local number = DebugUtil.countCodeExecuteTime()
    if number > 0.01 then
        print("模板初始化耗时:" .. tostring(number))
    end
    se:playerChat(
        "-sl-tmpl",
        function()
            ____exports.default:printTemplateInfo()
        end
    )
end
function ObjectTemplateUtil.addTemplate(self, template, objIdStr)
    local templates = ____exports.default.templateInfo[template]
    if templates == nil then
        templates = {}
        ____exports.default.templateInfo[template] = templates
    end
    templates[#templates + 1] = objIdStr
end
ObjectTemplateUtil.templateInfo = {}
ObjectTemplateUtil._sl_templateStateInfo = {}
ObjectTemplateUtil._sl_isInitialized = false
return ____exports
