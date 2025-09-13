local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 19,["10"] = 19,["11"] = 19,["13"] = 19,["14"] = 25,["15"] = 26,["16"] = 36,["17"] = 37,["18"] = 38,["19"] = 39,["20"] = 40,["21"] = 41,["22"] = 42,["23"] = 44,["24"] = 44,["25"] = 44,["26"] = 44,["27"] = 49,["28"] = 25,["29"] = 58,["30"] = 59,["31"] = 60,["32"] = 61,["33"] = 58,["34"] = 64,["35"] = 65,["36"] = 64,["37"] = 86,["38"] = 87,["39"] = 86});
local ____exports = {}
---
-- @noSelfInFile *
local ffi = _require("ffi")
____exports.default = __TS__Class()
local UnsafeUtil = ____exports.default
UnsafeUtil.name = "UnsafeUtil"
function UnsafeUtil.prototype.____constructor(self)
end
function UnsafeUtil._sl_init(self)
    local code = "\n        typedef void (*ffi_anyfunc)();\n        ffi_anyfunc GetProcAddress(int lib, const char* name);\n        int GetModuleHandleA(const char* lpModuleName);\n        typedef uint32_t (*__stdcall object_to_handle)(uintptr_t obj);\n        \n        \n        \n        \n        "
    ____exports.default:cdef(code)
    local gameModule = ffi.C.GetModuleHandleA("game.dll")
    local jassModule = ffi.C.GetModuleHandleA("jass.dll")
    ____exports.default.gameModule = gameModule
    ____exports.default.jassModule = jassModule
    print("gameModule=" .. tostring(gameModule))
    print("jassModule=" .. tostring(jassModule))
    local ad = ffi.C.GetProcAddress(
        jassModule,
        ffi.cast("const char*", 456)
    )
    ____exports.default.objectToHandle = ffi.cast("object_to_handle", ad)
end
function UnsafeUtil.readMemory(self, address)
    local ptr = ffi.cast("int *", address)
    local value = ptr[0]
    return value
end
function UnsafeUtil.writeMemory(self, address, data, size)
    ffi.C.memset(address, data, size)
end
function UnsafeUtil.cdef(self, code)
    ffi.cdef(code)
end
return ____exports
