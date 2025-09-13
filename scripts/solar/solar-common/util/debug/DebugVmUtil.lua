local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__StringReplaceAll = ____lualib.__TS__StringReplaceAll
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 4,["12"] = 4,["13"] = 4,["15"] = 4,["16"] = 12,["17"] = 13,["18"] = 12,["19"] = 20,["20"] = 21,["22"] = 22,["23"] = 22,["25"] = 23,["26"] = 24,["27"] = 25,["29"] = 28,["30"] = 29,["32"] = 31,["33"] = 32,["35"] = 34,["36"] = 35,["38"] = 37,["39"] = 38,["41"] = 41,["42"] = 42,["46"] = 22,["49"] = 46,["50"] = 20,["51"] = 54,["52"] = 55,["53"] = 56,["54"] = 57,["56"] = 59,["57"] = 60,["58"] = 61,["59"] = 62,["60"] = 54,["61"] = 69,["62"] = 70,["63"] = 71,["65"] = 73,["66"] = 74,["67"] = 75,["68"] = 76,["71"] = 79,["72"] = 69,["73"] = 86,["74"] = 87,["75"] = 88,["77"] = 90,["78"] = 91,["79"] = 92,["80"] = 93,["81"] = 94,["83"] = 96,["84"] = 97,["85"] = 98,["86"] = 99,["87"] = 100,["89"] = 102,["90"] = 103,["91"] = 86,["92"] = 114,["93"] = 114,["94"] = 114,["96"] = 114,["97"] = 114,["99"] = 114,["100"] = 114,["102"] = 115,["103"] = 116,["104"] = 117,["105"] = 118,["106"] = 118,["107"] = 119,["108"] = 120,["109"] = 121,["110"] = 122,["111"] = 123,["112"] = 124,["114"] = 126,["115"] = 127,["117"] = 129,["120"] = 132,["121"] = 133,["123"] = 135,["124"] = 136,["125"] = 137,["127"] = 138,["128"] = 138,["129"] = 139,["130"] = 138,["133"] = 141,["134"] = 142,["135"] = 118,["136"] = 118,["137"] = 118,["138"] = 114});
local ____exports = {}
____exports.default = __TS__Class()
local DebugVmUtil = ____exports.default
DebugVmUtil.name = "DebugVmUtil"
function DebugVmUtil.prototype.____constructor(self)
end
function DebugVmUtil.sethook(self, hook, mask)
    debug.sethook(hook, mask, 0)
end
function DebugVmUtil.getUserScriptRequireModNameByStack(self)
    local userScriptPaths = {}
    do
        local i = 1
        while i < 200 do
            do
                local requireModName = ____exports.default:getRequireModName(i)
                if requireModName == nil then
                    return userScriptPaths
                end
                if requireModName == "" then
                    goto __continue6
                end
                if __TS__StringIncludes(requireModName, "solar.") then
                    goto __continue6
                end
                if __TS__StringIncludes(requireModName, "lualib_bundle") then
                    goto __continue6
                end
                if __TS__StringIncludes(requireModName, "App") then
                    goto __continue6
                end
                if not __TS__ArrayIncludes(userScriptPaths, requireModName) then
                    userScriptPaths[#userScriptPaths + 1] = requireModName
                end
            end
            ::__continue6::
            i = i + 1
        end
    end
    return userScriptPaths
end
function DebugVmUtil.getRequireModName(self, f)
    local information = debug.getinfo(f, "nS")
    if information == nil then
        return nil
    end
    local luaPath = __TS__StringSubstring(information.source, 1, #information.source - 4)
    luaPath = __TS__StringReplaceAll(luaPath, local_map_dir_path, "")
    luaPath = __TS__StringReplaceAll(luaPath, "scripts\\", "")
    return __TS__StringReplaceAll(luaPath, "\\", ".")
end
function DebugVmUtil.getTsLine(self, functionInfo)
    if functionInfo.short_src == nil then
        return functionInfo.linedefined
    end
    local tsLine = tostring(functionInfo.linedefined or 0)
    if _G.__TS__sourcemap then
        if _G.__TS__sourcemap[functionInfo.short_src] then
            tsLine = tostring(_G.__TS__sourcemap[functionInfo.short_src][tsLine] or tsLine)
        end
    end
    return tsLine
end
function DebugVmUtil.getTsSrcLineName(self, functionInfo)
    if not functionInfo then
        return ""
    end
    local src = functionInfo.source
    if not src then
        src = "<C>"
    elseif __TS__StringSubstring(src, #src - 4, #src) == ".lua" then
        src = __TS__StringSubstring(src, 0, #src - 4)
    end
    local name = functionInfo.name
    if not name then
        name = "匿名"
    elseif __TS__StringSubstring(name, #name - 2, #name) == "_l" then
        name = __TS__StringSubstring(name, 0, #name - 2)
    end
    local title = (((src .. ":") .. tostring(____exports.default:getTsLine(functionInfo))) .. ":") .. name
    return title
end
function DebugVmUtil.hookCRAndPrintInfo(self, writeFile, printMaxCount, mask)
    if writeFile == nil then
        writeFile = true
    end
    if printMaxCount == nil then
        printMaxCount = 2
    end
    if mask == nil then
        mask = "c"
    end
    local pt = {}
    local file = io.open("_sre/temp/hookCRAndPrintInfo.txt", "wb")
    local cLines = {}
    ____exports.default:sethook(
        function(e)
            local information = debug.getinfo(2, "nS")
            local tsSrcNameLine = ____exports.default:getTsSrcLineName(information)
            local count = (pt[tsSrcNameLine] or 0) + 1
            pt[tsSrcNameLine] = count
            if printMaxCount < 0 or count < printMaxCount then
                print(tsSrcNameLine)
            end
            if time % 1000 == 0 then
                pt = {}
            end
            if not writeFile then
                return
            end
            if #cLines > 1000 then
                cLines = __TS__ArraySlice(cLines, #cLines - 20, #cLines)
            end
            cLines[#cLines + 1] = tsSrcNameLine
            file:seek("set")
            file:write("﻿")
            do
                local i = math.max(#cLines - 20, 0)
                while i < #cLines do
                    file:write(tostring(cLines[i + 1]) .. "\r\n")
                    i = i + 1
                end
            end
            file:write("\r\n####结束####\r\n")
            file:flush()
        end,
        mask
    )
end
return ____exports
