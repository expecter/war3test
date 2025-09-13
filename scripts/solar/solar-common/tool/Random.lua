local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["9"] = 10,["10"] = 2,["11"] = 3,["12"] = 7,["13"] = 11,["14"] = 12,["16"] = 14,["17"] = 15,["18"] = 10,["19"] = 22,["20"] = 23,["21"] = 24,["22"] = 22,["23"] = 31,["25"] = 32,["26"] = 32,["27"] = 33,["28"] = 32,["31"] = 35,["32"] = 31,["33"] = 43,["34"] = 44,["35"] = 45,["36"] = 46,["37"] = 43,["38"] = 54,["39"] = 55,["40"] = 54,["41"] = 63,["42"] = 64,["43"] = 63,["44"] = 71,["45"] = 72,["46"] = 71});
local ____exports = {}
____exports.default = __TS__Class()
local Random = ____exports.default
Random.name = "Random"
function Random.prototype.____constructor(self, seed)
    self._base_seed = 0
    self.nowVal = 0
    self.index = 0
    if seed == nil then
        seed = 314159269 * os.time() * math.floor(os.clock() * 1000) + 453806245
    end
    self._base_seed = seed
    self.nowVal = self._base_seed
end
function Random.prototype.reset(self)
    self.nowVal = self._base_seed
    self.index = 0
end
function Random.prototype.seek(self, count)
    do
        local i = 1
        while i < count do
            self:next()
            i = i + 1
        end
    end
    return self:next()
end
function Random.prototype.next(self)
    self.index = self.index + 1
    self.nowVal = 314159269 * self.nowVal + 453806245
    return self.nowVal / 2147483648
end
function Random.prototype.nextInt(self, min, max)
    return math.floor(self:nextReal(min, max) + 0.5)
end
function Random.prototype.nextReal(self, min, max)
    return self:next() % (max - min) + min
end
function Random.prototype.nextBool(self)
    return self:nextInt(0, 100) < 50
end
return ____exports
