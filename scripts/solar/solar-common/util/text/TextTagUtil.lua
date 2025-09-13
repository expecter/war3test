local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 4,["9"] = 4,["10"] = 4,["12"] = 4,["13"] = 17,["14"] = 17,["15"] = 17,["17"] = 17,["18"] = 17,["20"] = 17,["21"] = 17,["23"] = 17,["24"] = 17,["26"] = 17,["27"] = 17,["29"] = 19,["30"] = 19,["31"] = 19,["32"] = 19,["33"] = 19,["34"] = 19,["35"] = 19,["36"] = 19,["37"] = 19,["38"] = 19,["39"] = 17,["40"] = 33,["41"] = 33,["42"] = 33,["44"] = 33,["45"] = 33,["47"] = 33,["48"] = 33,["50"] = 33,["51"] = 33,["53"] = 33,["54"] = 33,["56"] = 34,["57"] = 35,["58"] = 35,["59"] = 35,["60"] = 35,["61"] = 35,["62"] = 35,["63"] = 35,["64"] = 36,["65"] = 37,["66"] = 38,["67"] = 39,["68"] = 40,["69"] = 41,["70"] = 42,["72"] = 44,["73"] = 33,["74"] = 47,["75"] = 47,["76"] = 47,["78"] = 47,["79"] = 47,["81"] = 48,["82"] = 48,["83"] = 48,["84"] = 48,["85"] = 48,["86"] = 48,["87"] = 48,["88"] = 48,["89"] = 48,["90"] = 47,["91"] = 58,["92"] = 58,["93"] = 58,["95"] = 58,["96"] = 58,["98"] = 59,["99"] = 59,["100"] = 59,["101"] = 59,["102"] = 59,["103"] = 59,["104"] = 59,["105"] = 59,["106"] = 59,["107"] = 58,["108"] = 69,["109"] = 69,["110"] = 69,["112"] = 69,["113"] = 69,["115"] = 70,["116"] = 70,["117"] = 70,["118"] = 70,["119"] = 70,["120"] = 70,["121"] = 70,["122"] = 70,["123"] = 70,["124"] = 69,["125"] = 80,["126"] = 80,["127"] = 80,["129"] = 80,["130"] = 80,["132"] = 81,["133"] = 81,["134"] = 81,["135"] = 81,["136"] = 81,["137"] = 81,["138"] = 81,["139"] = 81,["140"] = 81,["141"] = 80,["142"] = 84,["143"] = 84,["144"] = 84,["146"] = 84,["147"] = 84,["149"] = 85,["150"] = 85,["151"] = 85,["152"] = 85,["153"] = 85,["154"] = 85,["155"] = 85,["156"] = 85,["157"] = 85,["158"] = 84,["159"] = 88,["160"] = 88,["161"] = 88,["163"] = 88,["164"] = 88,["166"] = 89,["167"] = 89,["168"] = 89,["169"] = 89,["170"] = 89,["171"] = 89,["172"] = 89,["173"] = 89,["174"] = 89,["175"] = 88,["176"] = 92,["177"] = 92,["178"] = 92,["180"] = 92,["181"] = 92,["183"] = 93,["184"] = 93,["185"] = 93,["186"] = 93,["187"] = 93,["188"] = 93,["189"] = 93,["190"] = 93,["191"] = 93,["192"] = 92,["193"] = 100,["194"] = 101,["195"] = 101,["196"] = 101,["197"] = 101,["198"] = 101,["199"] = 100});
local ____exports = {}
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
____exports.default = __TS__Class()
local TextTagUtil = ____exports.default
TextTagUtil.name = "TextTagUtil"
function TextTagUtil.prototype.____constructor(self)
end
function TextTagUtil.text(text, unit, fontSize, lifespan, red, green, blue)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    if red == nil then
        red = 255
    end
    if green == nil then
        green = 255
    end
    if blue == nil then
        blue = 255
    end
    return ____exports.default.textOnPos(
        text,
        GetUnitX(unit) - fontSize * 8,
        GetUnitY(unit),
        fontSize,
        lifespan,
        red,
        green,
        blue
    )
end
function TextTagUtil.textOnPos(text, x, y, fontSize, lifespan, red, green, blue)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    if red == nil then
        red = 255
    end
    if green == nil then
        green = 255
    end
    if blue == nil then
        blue = 255
    end
    local textTagHandle = CreateTextTag()
    SetTextTagColor(
        textTagHandle,
        red,
        green,
        blue,
        255
    )
    SetTextTagPos(textTagHandle, x, y, 150)
    fontSize = fontSize * 0.0023
    SetTextTagText(textTagHandle, text, fontSize)
    SetTextTagVelocity(textTagHandle, 0, 0.04)
    SetTextTagPermanent(textTagHandle, false)
    if lifespan > 0 then
        SetTextTagLifespan(textTagHandle, lifespan)
    end
    return textTagHandle
end
function TextTagUtil.textInfo(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        200,
        200,
        200
    )
end
function TextTagUtil.textWarn(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        255,
        0,
        0
    )
end
function TextTagUtil.textSuccess(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        50,
        255,
        50
    )
end
function TextTagUtil.textFail(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        255,
        0,
        0
    )
end
function TextTagUtil.textGold(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        255,
        208,
        76
    )
end
function TextTagUtil.textLumber(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        77,
        208,
        108
    )
end
function TextTagUtil.textExp(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        53,
        149,
        196
    )
end
function TextTagUtil.setRandomVelocity(texttag)
    SetTextTagVelocity(
        texttag,
        RandomUtil.nextLocalReal(-0.1, 0.1),
        RandomUtil.nextLocalReal(0.01, 0.1)
    )
end
return ____exports
