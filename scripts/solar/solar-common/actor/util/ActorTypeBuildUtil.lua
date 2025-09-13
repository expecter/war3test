local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 10,["24"] = 10,["25"] = 11,["26"] = 11,["27"] = 12,["28"] = 12,["29"] = 13,["30"] = 13,["31"] = 14,["32"] = 14,["33"] = 15,["34"] = 15,["35"] = 20,["36"] = 20,["37"] = 20,["39"] = 20,["40"] = 42,["41"] = 43,["42"] = 43,["43"] = 43,["44"] = 44,["45"] = 45,["46"] = 46,["47"] = 47,["48"] = 47,["49"] = 47,["50"] = 47,["51"] = 47,["52"] = 47,["53"] = 47,["54"] = 47,["56"] = 58,["57"] = 58,["58"] = 58,["59"] = 58,["60"] = 58,["61"] = 58,["62"] = 58,["63"] = 58,["64"] = 58,["65"] = 58,["66"] = 58,["67"] = 58,["68"] = 58,["69"] = 58,["70"] = 58,["71"] = 58,["72"] = 74,["73"] = 75,["74"] = 76,["75"] = 77,["76"] = 78,["77"] = 75,["78"] = 80,["79"] = 83,["80"] = 43,["81"] = 43,["82"] = 42,["83"] = 91,["84"] = 92,["87"] = 95,["88"] = 99,["89"] = 101,["90"] = 102,["93"] = 106,["94"] = 107,["97"] = 112,["98"] = 112,["99"] = 112,["100"] = 113,["101"] = 115,["102"] = 117,["103"] = 118,["104"] = 118,["105"] = 118,["106"] = 118,["107"] = 119,["108"] = 120,["109"] = 121,["111"] = 118,["112"] = 118,["113"] = 124,["114"] = 125,["115"] = 126,["116"] = 126,["117"] = 126,["118"] = 127,["119"] = 127,["120"] = 127,["121"] = 127,["122"] = 127,["123"] = 127,["124"] = 128,["125"] = 128,["126"] = 128,["127"] = 128,["128"] = 128,["129"] = 128,["130"] = 129,["131"] = 126,["132"] = 126,["134"] = 132,["135"] = 132,["136"] = 133,["137"] = 132,["140"] = 112,["141"] = 112,["142"] = 99,["143"] = 140,["144"] = 141,["145"] = 142,["148"] = 145,["149"] = 140,["150"] = 147,["151"] = 148,["152"] = 149,["153"] = 150,["154"] = 151,["157"] = 154,["158"] = 155,["159"] = 156,["160"] = 157,["161"] = 158,["162"] = 159,["163"] = 160,["164"] = 160,["165"] = 160,["166"] = 160,["167"] = 160,["168"] = 160,["169"] = 160,["170"] = 161,["171"] = 162,["173"] = 164,["174"] = 147,["175"] = 173,["176"] = 174,["177"] = 175,["178"] = 176,["179"] = 177,["180"] = 176,["181"] = 179,["182"] = 179,["183"] = 179,["184"] = 180,["185"] = 181,["186"] = 181,["187"] = 181,["188"] = 182,["189"] = 181,["190"] = 181,["191"] = 179,["192"] = 179,["193"] = 185,["194"] = 186,["195"] = 185,["197"] = 91,["198"] = 192,["199"] = 193,["200"] = 194,["202"] = 195,["203"] = 195,["204"] = 196,["205"] = 197,["206"] = 198,["207"] = 199,["208"] = 199,["209"] = 199,["210"] = 199,["212"] = 195,["217"] = 203,["218"] = 203,["220"] = 204,["221"] = 204,["223"] = 205,["224"] = 206,["225"] = 207,["226"] = 208,["228"] = 211,["229"] = 212,["230"] = 213,["231"] = 214,["232"] = 215,["233"] = 216,["234"] = 216,["235"] = 216,["236"] = 216,["238"] = 218,["244"] = 204,["247"] = 203,["250"] = 192,["251"] = 230,["252"] = 231,["253"] = 232,["256"] = 235,["257"] = 236,["258"] = 236,["259"] = 236,["260"] = 236,["261"] = 238,["262"] = 239,["265"] = 242,["266"] = 243,["268"] = 244,["269"] = 244,["270"] = 245,["271"] = 246,["272"] = 248,["273"] = 248,["274"] = 248,["275"] = 248,["276"] = 248,["277"] = 244,["281"] = 251,["282"] = 251,["283"] = 252,["284"] = 252,["285"] = 252,["286"] = 252,["287"] = 252,["288"] = 251,["291"] = 230,["292"] = 258,["293"] = 259,["294"] = 260,["295"] = 261,["296"] = 261,["297"] = 261,["298"] = 261,["299"] = 261,["300"] = 261,["301"] = 261,["302"] = 261,["303"] = 261,["304"] = 261,["305"] = 261,["306"] = 261,["307"] = 261,["309"] = 277,["310"] = 278,["311"] = 280,["312"] = 281,["313"] = 282,["314"] = 283,["316"] = 285,["317"] = 287,["318"] = 288,["319"] = 289,["320"] = 291,["321"] = 292,["322"] = 293,["324"] = 296,["325"] = 298,["326"] = 300,["327"] = 302,["328"] = 304,["329"] = 258,["330"] = 310,["331"] = 311,["332"] = 313,["333"] = 314,["334"] = 315,["335"] = 316,["337"] = 318,["338"] = 319,["339"] = 320,["340"] = 321,["342"] = 323,["343"] = 310,["344"] = 326,["345"] = 327,["346"] = 329,["347"] = 330,["348"] = 331,["349"] = 332,["351"] = 334,["352"] = 335,["353"] = 336,["354"] = 337,["356"] = 339,["357"] = 340,["358"] = 341,["359"] = 342,["360"] = 343,["361"] = 343,["362"] = 343,["363"] = 343,["364"] = 343,["367"] = 326,["368"] = 349,["369"] = 350,["370"] = 350,["371"] = 351,["372"] = 349,["373"] = 354,["374"] = 355,["375"] = 355,["376"] = 356,["377"] = 354,["378"] = 359,["379"] = 360,["380"] = 360,["381"] = 361,["382"] = 362,["384"] = 364,["385"] = 359,["386"] = 367,["387"] = 368,["388"] = 368,["389"] = 369,["390"] = 370,["392"] = 372,["393"] = 367,["394"] = 375,["395"] = 376,["396"] = 376,["397"] = 377,["398"] = 378,["400"] = 380,["401"] = 375,["402"] = 22,["403"] = 23,["404"] = 31,["405"] = 32,["406"] = 33,["407"] = 89,["408"] = 227});
local ____exports = {}
local ____ObjectDataUtil = require("solar.solar-common.util.object.ObjectDataUtil")
local ObjectDataUtil = ____ObjectDataUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____FrameCallbackUtil = require("solar.solar-common.util.frame.FrameCallbackUtil")
local FrameCallbackUtil = ____FrameCallbackUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____UnitTypeUtil = require("solar.solar-common.util.unit.UnitTypeUtil")
local UnitTypeUtil = ____UnitTypeUtil.default
local ____GroupUtil = require("solar.solar-common.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
local ____IconUtil = require("solar.solar-common.util.frame.IconUtil")
local IconUtil = ____IconUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
____exports.default = __TS__Class()
local ActorTypeBuildUtil = ____exports.default
ActorTypeBuildUtil.name = "ActorTypeBuildUtil"
function ActorTypeBuildUtil.prototype.____constructor(self)
end
function ActorTypeBuildUtil.warpUnit2BuildItem(self, unitIdOrActorId, onLocalClickCheck, onBuild)
    return ____exports.default.cache:get(
        "warpUnit2BuildItem:" .. unitIdOrActorId,
        function()
            local actorTypeId = "_sl_BuildAbility:" .. unitIdOrActorId
            local unitActorType = ActorTypeUtil:getActorType(unitIdOrActorId)
            if unitActorType == nil then
                unitActorType = {
                    name = ObjectDataUtil:getUnitName(unitIdOrActorId),
                    icon = ObjectDataUtil:getUnitArt(unitIdOrActorId),
                    describe = ObjectDataUtil:getUnitDataString(unitIdOrActorId, "Ubertip"),
                    goldCost = ObjectDataUtil:getUnitGoldCost(unitIdOrActorId),
                    lumberCost = ObjectDataUtil:getUnitDataNumber(unitIdOrActorId, "lumbercost"),
                    foodCost = ObjectDataUtil:getUnitDataNumber(unitIdOrActorId, "fused")
                }
            end
            local actorType = {
                id = actorTypeId,
                templateType = "建造物品",
                templateAllocPolicy = "actorTypeShare",
                class = ____exports.default._sl_baseUnitBuildAbilityClass,
                name = unitActorType.name or unitIdOrActorId,
                icon = unitActorType.icon,
                describe = unitActorType.describe,
                goldCost = unitActorType.goldCost,
                lumberCost = unitActorType.lumberCost,
                foodCost = unitActorType.foodCost,
                passive = false,
                maxCd = 0.5,
                uses = 1,
                destroyOnNoUses = true
            }
            ____exports.default:_sl_initBuildUnit()
            actorType.onUpdate = function(____, tempActor)
                local actor = tempActor
                local zwUnitId = ObjectDataUtil:getAbilityDataString(actor.abilityId, "UnitID")
                ____exports.default:mapUnit2zwUnitType(zwUnitId, unitIdOrActorId)
            end
            ActorTypeUtil:registerActorType(actorType)
            return actorType
        end
    )
end
function ActorTypeBuildUtil._sl_initBuildUnit(self)
    if ____exports.default._sl_inited then
        return
    end
    ____exports.default._sl_inited = true
    InputUtil:onUnitMouseDoubleClicked(function(e, solarTrigger, clickedUnit)
        local owningPlayer = GetOwningPlayer(clickedUnit)
        if owningPlayer ~= GetLocalPlayer() then
            return
        end
        local actorUnit = ActorUnitUtil:getActorUnit(clickedUnit)
        if actorUnit == nil then
            return
        end
        BaseUtil.runLater(
            0.1,
            function()
                ClearSelection()
                local needSelectUnits = {}
                GroupEnumUnitsOfPlayer(_sl_tempGroup1, owningPlayer, nil)
                GroupUtil["for"](
                    GroupUtil,
                    _sl_tempGroup1,
                    function(____, unit)
                        local tempUnit = ActorUnitUtil:getActorUnit(unit, actorUnit.actorTypeId)
                        if tempUnit then
                            needSelectUnits[#needSelectUnits + 1] = tempUnit.unit
                        end
                    end
                )
                local ox = actorUnit.unitX
                local oy = actorUnit.unitY
                __TS__ArraySort(
                    needSelectUnits,
                    function(____, a, b)
                        local ad = MathUtil.distanceBetweenPoints(
                            GetUnitX(a),
                            GetUnitY(a),
                            ox,
                            oy
                        )
                        local bd = MathUtil.distanceBetweenPoints(
                            GetUnitX(b),
                            GetUnitY(b),
                            ox,
                            oy
                        )
                        return ad - bd
                    end
                )
                do
                    local i = 0
                    while i < #needSelectUnits and i < 12 do
                        SelectUnit(needSelectUnits[i + 1], true)
                        i = i + 1
                    end
                end
            end
        )
    end)
    se:onUnitConstructStart(function(e)
        local realUnitType = ____exports.default.zwId2UnitIdMap[e.trigUnitTypeIdStr]
        if realUnitType == nil then
            return
        end
        UnitStateUtil:setMaxLife(e.trigUnit, realUnitType.maxLife or 100)
    end)
    se:onUnitConstructFinish(function(e)
        local trigUnit = e.trigUnit
        local trigUnitTypeIdStr = id2string(GetUnitTypeId(trigUnit))
        local realUnitType = ____exports.default.zwId2UnitIdMap[trigUnitTypeIdStr]
        if realUnitType == nil then
            return
        end
        local p = GetOwningPlayer(trigUnit)
        local x = GetUnitX(trigUnit)
        local y = GetUnitY(trigUnit)
        local facing = GetUnitFacing(trigUnit)
        local needSelectUnit = selection() == trigUnit
        RemoveUnit(trigUnit)
        local unit = ActorUnitUtil:createUnit(
            p,
            realUnitType.id,
            x,
            y,
            facing
        )
        if needSelectUnit then
            SelectUnit(unit, true)
        end
        se:emit("建造完成", unit)
    end)
    if FrameSetOriginButtonTexture then
        local trigger = CreateTrigger()
        TriggerRegisterGameEvent(trigger, EVENT_GAME_BUILD_SUBMENU)
        PlayerUtil:forPlayingPlayers(function(____, player)
            TriggerRegisterPlayerUnitEvent(trigger, player, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER, nil)
        end)
        TriggerAddAction(
            trigger,
            function()
                ____exports.default:updateCommandBarButtonTexture()
                BaseUtil.runLater(
                    0.1,
                    function()
                        ____exports.default:updateCommandBarButtonTexture()
                    end
                )
            end
        )
        FrameCallbackUtil:addFrameSetUpdateCallback(function()
            ____exports.default:updateCommandBarButtonTexture()
        end)
    end
end
function ActorTypeBuildUtil.updateCommandBarButtonTexture(self)
    local selectList = get_select_list()
    if selectList then
        do
            local i = 0
            while i < #selectList do
                local actorUnit = ActorUnitUtil:getActorUnit(selectList[i + 1])
                if actorUnit then
                    local selectButton = FrameGetInfoSelectButton(i)
                    FrameSetOriginButtonTexture(
                        selectButton,
                        actorUnit:getIcon()
                    )
                end
                i = i + 1
            end
        end
    end
    do
        local x = 0
        while x <= 3 do
            do
                local y = 0
                while y <= 2 do
                    do
                        local cmdButton = DzFrameGetCommandBarButton(y, x)
                        local ability, order, arg = button(x, y)
                        if ability == nil or ability == 0 then
                            goto __continue36
                        end
                        if (1096114805 == ability or 1095262837 == ability) and arg == 8 then
                            local unitIdStr = id2string(order)
                            local zwActorType = ____exports.default.zwId2UnitIdMap[unitIdStr]
                            if zwActorType and zwActorType.icon then
                                if ____exports.default:isLocalPlayerActorUnitTypeDisableState(zwActorType.id) then
                                    FrameSetOriginButtonTexture(
                                        cmdButton,
                                        IconUtil:getDisableIcon(zwActorType.icon)
                                    )
                                else
                                    FrameSetOriginButtonTexture(cmdButton, zwActorType.icon)
                                end
                            end
                        end
                    end
                    ::__continue36::
                    y = y + 1
                end
            end
            x = x + 1
        end
    end
end
function ActorTypeBuildUtil.setBuilds2unit(self, unit, builds)
    if not isEmbedJapi then
        print("无内置不支持此模拟建造方法!")
        return
    end
    ____exports.default:_sl_initBuildUnit()
    local BuildsStr = ObjectDataUtil:getUnitDataString(
        id2string(GetUnitTypeId(unit)),
        "Builds"
    )
    if BuildsStr == nil or #BuildsStr < 4 then
        log.errorWithTraceBack(ActorUnitUtil:getUnitName(unit) .. "的建造列表为空！只有建造者模版才能使用Builds模拟建造！")
        return
    end
    local zwIds = __TS__StringSplit(BuildsStr, ",")
    local player = GetOwningPlayer(unit)
    do
        local i = 0
        while i < #builds do
            ____exports.default:mapUnit2zwUnitType(zwIds[i + 1], builds[i + 1])
            local hideState = ____exports.default:isPlayerActorUnitTypeHideState(player, builds[i + 1])
            SetPlayerTechMaxAllowed(
                player,
                FourCC(zwIds[i + 1]),
                hideState and 0 or -1
            )
            i = i + 1
        end
    end
    do
        local i = #builds
        while i < #zwIds do
            SetPlayerTechMaxAllowed(
                player,
                FourCC(zwIds[i + 1]),
                0
            )
            i = i + 1
        end
    end
end
function ActorTypeBuildUtil.mapUnit2zwUnitType(self, zwUnitId, unitIdOrActorId)
    local unitActorType = ActorTypeUtil:getActorType(unitIdOrActorId)
    if unitActorType == nil then
        unitActorType = {
            id = unitIdOrActorId,
            name = ObjectDataUtil:getUnitName(unitIdOrActorId),
            icon = ObjectDataUtil:getUnitArt(unitIdOrActorId),
            model = ObjectDataUtil:getUnitFile(unitIdOrActorId, true),
            describe = ObjectDataUtil:getUnitDataString(unitIdOrActorId, "Ubertip"),
            maxLife = ObjectDataUtil:getUnitDataNumber(unitIdOrActorId, "HP"),
            goldCost = ObjectDataUtil:getUnitGoldCost(unitIdOrActorId),
            lumberCost = ObjectDataUtil:getUnitDataNumber(unitIdOrActorId, "lumbercost"),
            foodCost = ObjectDataUtil:getUnitDataNumber(unitIdOrActorId, "fused"),
            buildTime = ObjectDataUtil:getUnitDataNumber(unitIdOrActorId, "bldtm"),
            modelScale = ObjectDataUtil:getUnitDataNumber(unitIdOrActorId, "modelScale")
        }
    end
    ____exports.default.zwId2UnitIdMap[zwUnitId] = unitActorType
    local uid = FourCC(zwUnitId)
    local zwIds = ____exports.default.unitIdMapZwIds[unitActorType.id]
    if zwIds == nil then
        zwIds = {}
        ____exports.default.unitIdMapZwIds[unitActorType.id] = zwIds
    end
    zwIds[#zwIds + 1] = zwUnitId
    DzSetUnitTypeName(uid, unitActorType.name or unitActorType.id)
    UnitTypeUtil:setUnitIcon(uid, unitActorType.icon)
    UnitTypeUtil:setUnitTypeTip(uid, unitActorType.name or unitActorType.id)
    UnitTypeUtil:setUnitTypeUbertip(uid, unitActorType.describe)
    if unitActorType.modelScale then
        UnitTypeUtil:setUnitTypeModelScale(uid, unitActorType.modelScale)
    end
    EXSetUnitString(uid, 13, unitActorType.model)
    DzSetUnitDataCacheInteger(uid, 24, 0, unitActorType.buildTime or 3)
    DzSetUnitDataCacheInteger(uid, 32, 0, unitActorType.goldCost or 0)
    DzSetUnitDataCacheInteger(uid, 36, 0, unitActorType.lumberCost or 0)
    DzSetUnitDataCacheInteger(uid, 92, 0, unitActorType.foodCost or 0)
end
function ActorTypeBuildUtil.setPlayerActorUnitTypeDisable(self, player, actorUnitId, disable)
    local playerId = GetPlayerId(player)
    local cfg = ____exports.default.playerActorUnitTypeState[playerId]
    if cfg == nil then
        cfg = {}
        ____exports.default.playerActorUnitTypeState[playerId] = cfg
    end
    local cfgElement = cfg[actorUnitId]
    if cfgElement == nil then
        cfgElement = {}
        cfg[actorUnitId] = cfgElement
    end
    cfgElement.disable = disable
end
function ActorTypeBuildUtil.setPlayerActorUnitTypeHide(self, player, actorUnitId, hide)
    local playerId = GetPlayerId(player)
    local cfg = ____exports.default.playerActorUnitTypeState[playerId]
    if cfg == nil then
        cfg = {}
        ____exports.default.playerActorUnitTypeState[playerId] = cfg
    end
    local cfgElement = cfg[actorUnitId]
    if cfgElement == nil then
        cfgElement = {}
        cfg[actorUnitId] = cfgElement
    end
    cfgElement.hide = hide
    local zwIds = ____exports.default.unitIdMapZwIds[actorUnitId]
    if zwIds then
        for ____, zwId in ipairs(zwIds) do
            SetPlayerTechMaxAllowed(
                player,
                FourCC(zwId),
                hide and 0 or -1
            )
        end
    end
end
function ActorTypeBuildUtil.getPlayerActorUnitTypeState(self, player, id)
    local ____opt_2 = ____exports.default.playerActorUnitTypeState[GetPlayerId(player)]
    local element = ____opt_2 and ____opt_2[id]
    return element
end
function ActorTypeBuildUtil.getLocalPlayerActorUnitTypeState(self, id)
    local ____opt_4 = ____exports.default.playerActorUnitTypeState[GetPlayerId(GetLocalPlayer())]
    local element = ____opt_4 and ____opt_4[id]
    return element
end
function ActorTypeBuildUtil.isLocalPlayerActorUnitTypeDisableState(self, id)
    local ____opt_6 = ____exports.default.playerActorUnitTypeState[GetPlayerId(GetLocalPlayer())]
    local element = ____opt_6 and ____opt_6[id]
    if (element and element.disable) == true then
        return true
    end
    return false
end
function ActorTypeBuildUtil.isPlayerActorUnitTypeDisableState(self, player, id)
    local ____opt_10 = ____exports.default.playerActorUnitTypeState[GetPlayerId(player)]
    local element = ____opt_10 and ____opt_10[id]
    if (element and element.disable) == true then
        return true
    end
    return false
end
function ActorTypeBuildUtil.isPlayerActorUnitTypeHideState(self, player, id)
    local ____opt_14 = ____exports.default.playerActorUnitTypeState[GetPlayerId(player)]
    local element = ____opt_14 and ____opt_14[id]
    if (element and element.hide) == true then
        return true
    end
    return false
end
ActorTypeBuildUtil.zwId2UnitIdMap = {}
ActorTypeBuildUtil.unitIdMapZwIds = {}
ActorTypeBuildUtil.playerActorUnitTypeState = {}
ActorTypeBuildUtil.cache = __TS__New(Cache)
ActorTypeBuildUtil._sl_baseUnitBuildAbilityClass = "太阳单位演员技能建造"
ActorTypeBuildUtil._sl_inited = false
ActorTypeBuildUtil.map = {}
return ____exports
