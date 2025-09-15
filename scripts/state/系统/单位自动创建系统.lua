local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 10,["21"] = 10,["22"] = 11,["23"] = 11,["24"] = 12,["25"] = 12,["26"] = 25,["27"] = 25,["28"] = 25,["30"] = 34,["31"] = 34,["32"] = 34,["33"] = 35,["34"] = 36,["36"] = 34,["37"] = 34,["38"] = 32,["39"] = 42,["40"] = 44,["41"] = 45,["42"] = 46,["44"] = 48,["45"] = 48,["46"] = 48,["47"] = 49,["48"] = 48,["49"] = 48,["52"] = 54,["53"] = 55,["54"] = 56,["55"] = 57,["56"] = 57,["57"] = 57,["58"] = 58,["59"] = 59,["60"] = 60,["62"] = 57,["63"] = 57,["65"] = 42,["66"] = 68,["67"] = 70,["68"] = 71,["69"] = 72,["70"] = 73,["73"] = 77,["74"] = 78,["75"] = 79,["77"] = 81,["78"] = 81,["79"] = 81,["80"] = 81,["81"] = 82,["82"] = 83,["83"] = 84,["84"] = 85,["86"] = 87,["88"] = 89,["90"] = 90,["91"] = 90,["92"] = 91,["93"] = 92,["94"] = 93,["95"] = 94,["96"] = 95,["98"] = 97,["99"] = 98,["100"] = 99,["101"] = 100,["103"] = 102,["104"] = 102,["105"] = 102,["106"] = 102,["107"] = 102,["108"] = 102,["109"] = 102,["110"] = 104,["111"] = 105,["112"] = 106,["113"] = 107,["115"] = 109,["116"] = 109,["117"] = 109,["118"] = 109,["119"] = 109,["120"] = 109,["121"] = 109,["122"] = 109,["125"] = 113,["126"] = 114,["127"] = 116,["128"] = 117,["129"] = 118,["130"] = 119,["132"] = 121,["133"] = 121,["134"] = 121,["135"] = 121,["136"] = 121,["137"] = 121,["138"] = 121,["139"] = 121,["142"] = 90,["145"] = 68,["146"] = 131,["147"] = 132,["148"] = 132,["149"] = 132,["150"] = 133,["151"] = 133,["152"] = 133,["153"] = 134,["154"] = 135,["155"] = 135,["156"] = 135,["157"] = 135,["158"] = 135,["159"] = 135,["160"] = 135,["161"] = 135,["162"] = 133,["163"] = 133,["164"] = 132,["165"] = 132,["166"] = 131,["167"] = 140,["168"] = 141,["169"] = 141,["170"] = 141,["171"] = 142,["172"] = 142,["173"] = 142,["174"] = 143,["175"] = 144,["176"] = 144,["177"] = 144,["178"] = 144,["179"] = 144,["180"] = 144,["181"] = 144,["182"] = 144,["183"] = 142,["184"] = 142,["185"] = 141,["186"] = 141,["187"] = 140,["188"] = 150,["189"] = 151,["190"] = 152,["191"] = 152,["192"] = 152,["193"] = 152,["194"] = 152,["195"] = 152,["196"] = 152,["197"] = 153,["198"] = 154,["199"] = 155,["200"] = 156,["201"] = 157,["202"] = 159,["203"] = 150,["204"] = 26,["205"] = 28,["206"] = 30});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____VectorUtil = require("solar.solar-common.util.math.VectorUtil")
local VectorUtil = ____VectorUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____RectUtil = require("solar.solar-common.util.game.RectUtil")
local RectUtil = ____RectUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ObjectDataUtil = require("solar.solar-common.util.object.ObjectDataUtil")
local ObjectDataUtil = ____ObjectDataUtil.default
____exports.default = __TS__Class()
local _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF = ____exports.default
_____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF.name = "单位自动创建系统"
function _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF.prototype.____constructor(self)
    BaseUtil.runLater(
        1.1,
        function()
            for ____, cfg in ipairs(____exports.default.config) do
                ____exports.default:doWork(cfg)
            end
        end
    )
end
function _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF.doWork(self, cfg)
    if cfg.creationTime ~= nil then
        if cfg.creationTime == 0 then
            ____exports.default["立即创建单位"](____exports.default, cfg)
        else
            BaseUtil.runLater(
                cfg.creationTime,
                function()
                    ____exports.default["立即创建单位"](____exports.default, cfg)
                end
            )
        end
    else
        local loc = VectorUtil:getVector(cfg.loc)
        local size = (cfg.area or 300) + ____exports.default.nearCreateRange
        local rect = RectUtil.createRect(loc.x, loc.y, size * 2, size * 2)
        se:onEnterRect(
            rect,
            function(e, solarTrigger)
                if PlayerUtil:isUser(e.trigUnitOwner) then
                    ____exports.default["立即创建单位"](____exports.default, cfg)
                    solarTrigger:destroy()
                end
            end
        )
    end
end
_____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF["立即创建单位"] = function(self, cfg)
    local loc = VectorUtil:getVector(cfg.loc)
    if loc == nil then
        print(((("单位自动创建系统:位置不存在" .. tostring(cfg.id)) .. "[") .. tostring(cfg.loc)) .. "]")
        print_r(cfg)
        return
    end
    local player = nil
    if cfg.owner then
        player = Player(cfg.owner)
    end
    if ____exports.default.isCreateEnemyNameTextTagOnLoc and IsPlayerEnemy(
        PlayerUtil:firstOfUsers(),
        player
    ) then
        local actorType = ActorTypeUtil:getActorType(cfg.unitId)
        local text = actorType and actorType.name or actorType and actorType.id
        if not text then
            text = ObjectDataUtil:getUnitName(cfg.unitId)
        end
        ____exports.default:createTextTag(loc, text)
    end
    local count = cfg.count or 1
    do
        local i = 0
        while i < count do
            local x = loc.x
            local y = loc.y
            if cfg.area ~= nil then
                x = x + RandomUtil.nextInt(-cfg.area, cfg.area)
                y = y + RandomUtil.nextInt(-cfg.area, cfg.area)
            end
            if cfg.unitId then
                local face = 270
                if i > 0 then
                    face = RandomUtil.nextInt(0, 360)
                end
                local unit = ActorUnitUtil:createUnit(
                    player,
                    cfg.unitId,
                    x,
                    y,
                    face
                )
                if cfg.reviveTime then
                    local actorUnit = ActorUnitUtil:getActorUnit(unit)
                    if actorUnit == nil then
                        print("非演员单位不支持使用此系统复活参数！")
                    end
                    ____exports.default:setOnUnitDeath(
                        actorUnit,
                        cfg.reviveTime,
                        player,
                        cfg.unitId,
                        x,
                        y
                    )
                end
            end
            if cfg.itemId then
                local item = ActorItemUtil:createItem(cfg.itemId, x, y, player)
                if cfg.reviveTime then
                    local actorItem = ActorItemUtil:getActorItem(item)
                    if actorItem == nil then
                        print("非演员物品不支持使用此系统复活参数！")
                    end
                    ____exports.default:setOnDestroy(
                        actorItem,
                        cfg.reviveTime,
                        player,
                        cfg.itemId,
                        x,
                        y
                    )
                end
            end
            i = i + 1
        end
    end
end
function _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF.setOnUnitDeath(self, actorUnit, reviveTime, player, unitId, x, y)
    actorUnit:set(
        "onUnitDeath",
        function(____, actor, killingUnit)
            BaseUtil.runLater(
                reviveTime,
                function()
                    local temp = ActorUnitUtil:createActorUnit(player, unitId, x, y)
                    ____exports.default:setOnUnitDeath(
                        temp,
                        reviveTime,
                        player,
                        unitId,
                        x,
                        y
                    )
                end
            )
        end
    )
end
function _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF.setOnDestroy(self, actorUnit, reviveTime, player, itemId, x, y)
    actorUnit:set(
        "onDestroy",
        function(____, actor)
            BaseUtil.runLater(
                reviveTime,
                function()
                    local temp = ActorItemUtil:createActorItem(itemId, x, y, player)
                    ____exports.default:setOnDestroy(
                        temp,
                        reviveTime,
                        player,
                        itemId,
                        x,
                        y
                    )
                end
            )
        end
    )
end
function _____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF.createTextTag(self, loc, text)
    local textTagHandle = CreateTextTag()
    SetTextTagColor(
        textTagHandle,
        255,
        20,
        20,
        255
    )
    local fontSize = 10 * 0.0023
    text = TextUtil:removeColors(text)
    SetTextTagText(textTagHandle, text, fontSize)
    SetTextTagPos(textTagHandle, loc.x - #text / 2 * 15, loc.y, 220)
    SetTextTagPermanent(textTagHandle, true)
    return textTagHandle
end
_____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF.config = {}
_____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF.isCreateEnemyNameTextTagOnLoc = true
_____5355_4F4D_81EA_52A8_521B_5EFA_7CFB_7EDF.nearCreateRange = 1000
return ____exports
