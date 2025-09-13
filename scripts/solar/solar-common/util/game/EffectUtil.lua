local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 7,["14"] = 7,["15"] = 7,["17"] = 7,["18"] = 13,["19"] = 14,["20"] = 16,["21"] = 17,["23"] = 19,["24"] = 20,["25"] = 21,["27"] = 23,["30"] = 27,["31"] = 28,["32"] = 29,["33"] = 30,["35"] = 32,["37"] = 34,["40"] = 13,["41"] = 42,["42"] = 43,["43"] = 44,["44"] = 45,["46"] = 47,["47"] = 47,["48"] = 47,["49"] = 48,["50"] = 47,["51"] = 47,["53"] = 42,["54"] = 60,["55"] = 60,["56"] = 60,["58"] = 61,["59"] = 62,["61"] = 64,["62"] = 65,["63"] = 66,["65"] = 68,["67"] = 60,["68"] = 75,["69"] = 75,["70"] = 75,["72"] = 77,["73"] = 78,["74"] = 79,["76"] = 81,["77"] = 81,["78"] = 81,["79"] = 82,["80"] = 81,["81"] = 81,["83"] = 75,["84"] = 93,["85"] = 94,["86"] = 95,["87"] = 93,["88"] = 102,["89"] = 103,["90"] = 104,["91"] = 105,["94"] = 108,["95"] = 111,["96"] = 112,["97"] = 102,["98"] = 122,["99"] = 123,["102"] = 127,["103"] = 128,["106"] = 125,["108"] = 125,["115"] = 122});
local ____exports = {}
local ____TargetAttach = require("solar.solar-common.constant.TargetAttach")
local TargetAttach = ____TargetAttach.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____HandleUtil = require("solar.solar-common.util.lang.HandleUtil")
local HandleUtil = ____HandleUtil.default
local japi = require("jass.japi")
____exports.default = __TS__Class()
local EffectUtil = ____exports.default
EffectUtil.name = "EffectUtil"
function EffectUtil.prototype.____constructor(self)
end
function EffectUtil.addSpecialEffect(self, modelName, x, y, size, displayPlayer)
    if displayPlayer == nil then
        if settings.isEffectDisplay == false then
            return AddSpecialEffect("", x, y)
        else
            local e = AddSpecialEffect(modelName, x, y)
            if size ~= nil then
                ____exports.default:setEffectSize(e, size, modelName)
            end
            return e
        end
    else
        if displayPlayer == GetLocalPlayer() then
            local e = AddSpecialEffect(modelName, x, y)
            if size ~= nil then
                ____exports.default:setEffectSize(e, size, modelName)
            end
            return e
        else
            return AddSpecialEffect("", x, y)
        end
    end
end
function EffectUtil.addSpecialEffectAndDestroy(self, modelName, x, y, size, lifeTime)
    local effect = ____exports.default:addSpecialEffect(modelName, x, y, size)
    if lifeTime == nil or lifeTime == 0 then
        DestroyEffect(effect)
    else
        BaseUtil.runLater(
            lifeTime,
            function()
                DestroyEffect(effect)
            end
        )
    end
end
function EffectUtil.addSpecialEffectTarget(self, modelName, targetWidget, attachPointName, size)
    if attachPointName == nil then
        attachPointName = TargetAttach.origin
    end
    if settings.isEffectDisplay == false then
        return AddSpecialEffectTarget("", targetWidget, attachPointName)
    else
        local e = AddSpecialEffectTarget(modelName, targetWidget, attachPointName)
        if size ~= nil then
            ____exports.default:setEffectSize(e, size, modelName)
        end
        return e
    end
end
function EffectUtil.addSpecialEffectTargetAndDestroy(self, modelName, targetWidget, attachPointName, size, lifeTime)
    if attachPointName == nil then
        attachPointName = TargetAttach.origin
    end
    local effect = ____exports.default:addSpecialEffectTarget(modelName, targetWidget, attachPointName, size)
    if lifeTime == nil or lifeTime == 0 then
        DestroyEffect(effect)
    else
        BaseUtil.runLater(
            lifeTime,
            function()
                DestroyEffect(effect)
            end
        )
    end
end
function EffectUtil.setEffectFacing(self, effect, facingAngle)
    EXEffectMatReset(effect)
    EXEffectMatRotateZ(effect, facingAngle)
end
function EffectUtil.destroyEffectNoDeathAnim(self, effect)
    if isDebug then
        if not HandleUtil:isHandleType(effect, "+EIP") then
            log.errorWithTraceBack("当前特效不是点特效，请不要使用过时的handle。如果是绑定到单位的特效请手动使用DestroyEffect销毁!")
        end
    end
    EXSetEffectSize(effect, 0)
    EXSetEffectZ(effect, -5000)
    DestroyEffect(effect)
end
function EffectUtil.setEffectSize(self, e, size, modlePath)
    EXSetEffectSize(e, size)
    do
        local function ____catch(e)
            print(tostring(e))
            print((((("SetPariticle2Size不支持此模型。pariticle=" .. tostring(e)) .. " size=") .. tostring(size)) .. " modlePath=") .. tostring(modlePath))
        end
        local ____try, ____hasReturned = pcall(function()
            local ____opt_0 = japi.SetPariticle2Size
            if ____opt_0 ~= nil then
                ____opt_0(japi, e, size)
            end
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
end
return ____exports
