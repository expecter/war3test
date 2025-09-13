local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 8,["16"] = 8,["17"] = 9,["18"] = 9,["19"] = 10,["20"] = 10,["21"] = 11,["22"] = 11,["23"] = 14,["24"] = 14,["25"] = 14,["27"] = 14,["28"] = 23,["29"] = 23,["30"] = 23,["32"] = 24,["33"] = 24,["34"] = 24,["35"] = 24,["36"] = 24,["37"] = 25,["38"] = 26,["40"] = 28,["41"] = 29,["43"] = 31,["44"] = 31,["45"] = 31,["46"] = 34,["47"] = 35,["48"] = 35,["49"] = 35,["50"] = 35,["51"] = 35,["53"] = 36,["54"] = 36,["55"] = 37,["56"] = 38,["59"] = 41,["60"] = 46,["62"] = 48,["63"] = 36,["66"] = 51,["67"] = 31,["68"] = 31,["69"] = 54,["70"] = 55,["72"] = 58,["73"] = 23,["74"] = 65,["76"] = 66,["77"] = 66,["78"] = 67,["79"] = 68,["80"] = 69,["81"] = 70,["82"] = 71,["85"] = 66,["88"] = 65,["89"] = 83,["90"] = 83,["91"] = 83,["93"] = 83,["94"] = 83,["96"] = 84,["97"] = 85,["98"] = 86,["100"] = 87,["101"] = 87,["102"] = 88,["103"] = 89,["105"] = 87,["108"] = 92,["110"] = 94,["111"] = 95,["113"] = 97,["114"] = 83,["115"] = 104,["116"] = 104,["117"] = 104,["119"] = 105,["120"] = 106,["121"] = 107,["122"] = 108,["123"] = 109,["124"] = 110,["127"] = 113,["128"] = 104,["129"] = 120,["130"] = 120,["131"] = 120,["133"] = 121,["134"] = 122,["135"] = 123,["136"] = 124,["137"] = 125,["138"] = 126,["141"] = 129,["142"] = 120,["143"] = 136,["144"] = 137,["145"] = 138,["147"] = 141,["148"] = 141,["149"] = 141,["150"] = 141,["151"] = 141,["152"] = 142,["153"] = 143,["154"] = 144,["156"] = 146,["157"] = 147,["158"] = 148,["160"] = 150,["161"] = 136,["162"] = 156,["163"] = 157,["164"] = 157,["166"] = 157,["167"] = 157,["169"] = 158,["170"] = 159,["171"] = 159,["172"] = 159,["173"] = 159,["174"] = 159,["175"] = 159,["176"] = 159,["177"] = 160,["179"] = 161,["180"] = 161,["182"] = 162,["183"] = 163,["186"] = 167,["187"] = 168,["188"] = 169,["190"] = 171,["191"] = 172,["195"] = 161,["198"] = 175,["199"] = 156,["200"] = 181,["201"] = 182,["202"] = 183,["203"] = 184,["205"] = 185,["206"] = 185,["208"] = 186,["209"] = 187,["212"] = 190,["213"] = 191,["214"] = 192,["216"] = 194,["217"] = 195,["221"] = 185,["224"] = 198,["225"] = 181,["226"] = 204,["227"] = 205,["228"] = 205,["230"] = 205,["231"] = 205,["233"] = 206,["234"] = 207,["235"] = 207,["236"] = 207,["237"] = 207,["238"] = 207,["239"] = 207,["240"] = 207,["241"] = 208,["243"] = 209,["244"] = 209,["246"] = 210,["247"] = 211,["250"] = 215,["251"] = 216,["252"] = 217,["254"] = 219,["255"] = 220,["259"] = 209,["262"] = 223,["263"] = 204,["264"] = 229,["265"] = 229,["266"] = 229,["268"] = 229,["269"] = 229,["271"] = 229,["272"] = 229,["274"] = 230,["275"] = 230,["276"] = 230,["277"] = 230,["278"] = 230,["279"] = 230,["280"] = 230,["281"] = 231,["282"] = 232,["284"] = 235,["285"] = 235,["286"] = 235,["287"] = 236,["288"] = 236,["289"] = 236,["290"] = 236,["291"] = 236,["292"] = 236,["293"] = 237,["294"] = 237,["295"] = 237,["296"] = 237,["297"] = 237,["298"] = 237,["299"] = 238,["300"] = 235,["301"] = 235,["302"] = 240,["303"] = 229,["304"] = 246,["305"] = 246,["306"] = 246,["308"] = 246,["309"] = 246,["311"] = 246,["312"] = 246,["314"] = 247,["315"] = 248,["316"] = 248,["317"] = 248,["318"] = 248,["319"] = 248,["320"] = 248,["321"] = 248,["322"] = 249,["323"] = 250,["325"] = 251,["326"] = 251,["328"] = 252,["329"] = 253,["332"] = 256,["333"] = 257,["334"] = 258,["336"] = 260,["337"] = 261,["339"] = 263,["340"] = 264,["344"] = 251,["347"] = 267,["348"] = 268,["349"] = 246,["350"] = 276,["351"] = 277,["352"] = 278,["353"] = 278,["354"] = 278,["355"] = 278,["356"] = 278,["357"] = 278,["358"] = 278,["359"] = 279,["360"] = 280,["361"] = 276,["362"] = 286,["363"] = 287,["364"] = 288,["365"] = 288,["366"] = 288,["367"] = 288,["368"] = 288,["369"] = 288,["370"] = 288,["371"] = 289,["372"] = 290,["373"] = 286,["374"] = 303,["375"] = 304,["376"] = 304,["377"] = 304,["378"] = 304,["379"] = 304,["380"] = 304,["381"] = 304,["382"] = 305,["385"] = 308,["386"] = 309,["387"] = 310,["388"] = 311,["391"] = 303,["392"] = 319,["393"] = 320,["394"] = 320,["395"] = 320,["396"] = 320,["397"] = 320,["398"] = 320,["399"] = 320,["400"] = 321,["403"] = 324,["404"] = 325,["405"] = 326,["406"] = 327,["407"] = 328,["410"] = 331,["411"] = 319,["412"] = 343,["413"] = 344,["414"] = 344,["415"] = 344,["416"] = 344,["417"] = 344,["418"] = 344,["419"] = 344,["420"] = 345,["423"] = 348,["424"] = 349,["426"] = 343,["427"] = 361,["428"] = 362,["429"] = 363,["430"] = 364,["431"] = 365,["432"] = 366,["434"] = 367,["435"] = 367,["436"] = 368,["437"] = 369,["438"] = 370,["439"] = 371,["440"] = 371,["441"] = 371,["442"] = 371,["443"] = 371,["444"] = 371,["445"] = 371,["447"] = 372,["448"] = 372,["449"] = 373,["450"] = 374,["453"] = 377,["454"] = 378,["456"] = 380,["457"] = 372,["460"] = 367,["463"] = 383,["464"] = 384,["465"] = 361,["466"] = 392,["467"] = 393,["468"] = 394,["469"] = 395,["470"] = 396,["473"] = 392,["474"] = 406,["475"] = 407,["476"] = 408,["477"] = 409,["478"] = 410,["479"] = 411,["480"] = 412,["484"] = 416,["485"] = 417,["488"] = 406,["489"] = 428,["490"] = 429,["491"] = 430,["492"] = 431,["493"] = 431,["494"] = 431,["495"] = 431,["496"] = 431,["497"] = 432,["498"] = 433,["500"] = 434,["501"] = 434,["502"] = 435,["503"] = 436,["506"] = 439,["507"] = 440,["508"] = 441,["509"] = 442,["512"] = 445,["515"] = 448,["516"] = 434,["521"] = 451,["522"] = 451,["523"] = 452,["524"] = 453,["527"] = 456,["528"] = 457,["529"] = 458,["532"] = 461,["534"] = 464,["535"] = 451,["539"] = 467,["540"] = 468,["541"] = 428,["542"] = 477,["543"] = 478,["544"] = 479,["545"] = 479,["546"] = 479,["547"] = 479,["548"] = 479,["549"] = 480,["550"] = 481,["552"] = 482,["553"] = 482,["554"] = 483,["555"] = 484,["558"] = 487,["559"] = 488,["561"] = 490,["562"] = 482,["566"] = 493,["568"] = 495,["569"] = 477,["570"] = 504,["571"] = 505,["572"] = 506,["573"] = 506,["574"] = 506,["575"] = 506,["576"] = 506,["578"] = 507,["579"] = 507,["580"] = 508,["581"] = 509,["584"] = 512,["585"] = 513,["587"] = 515,["588"] = 507,["591"] = 517,["592"] = 504,["593"] = 527,["594"] = 527,["595"] = 527,["597"] = 528,["598"] = 529,["600"] = 530,["601"] = 530,["602"] = 531,["603"] = 532,["606"] = 535,["607"] = 536,["609"] = 538,["610"] = 530,["613"] = 540,["614"] = 527,["615"] = 544,["616"] = 545,["617"] = 546,["618"] = 544,["619"] = 550,["620"] = 551,["621"] = 552,["622"] = 553,["624"] = 555,["625"] = 556,["627"] = 558,["628"] = 559,["629"] = 560,["630"] = 561,["631"] = 563,["632"] = 564,["633"] = 564,["634"] = 564,["635"] = 564,["636"] = 564,["637"] = 564,["638"] = 565,["639"] = 566,["640"] = 567,["643"] = 570,["644"] = 550,["645"] = 574,["646"] = 575,["647"] = 576,["648"] = 577,["649"] = 578,["650"] = 579,["651"] = 579,["652"] = 579,["653"] = 579,["654"] = 579,["655"] = 579,["656"] = 580,["657"] = 581,["658"] = 582,["661"] = 585,["662"] = 574,["663"] = 593,["664"] = 593,["665"] = 593,["667"] = 593,["668"] = 593,["670"] = 593,["671"] = 593,["673"] = 593,["674"] = 593,["676"] = 594,["677"] = 595,["680"] = 599,["681"] = 601,["682"] = 603,["683"] = 604,["684"] = 605,["685"] = 606,["687"] = 607,["688"] = 607,["690"] = 608,["691"] = 609,["694"] = 612,["695"] = 613,["696"] = 614,["697"] = 615,["698"] = 616,["699"] = 617,["700"] = 618,["703"] = 621,["704"] = 622,["706"] = 624,["709"] = 607,["712"] = 593,["713"] = 15});
local ____exports = {}
local ____GroupUtil = require("solar.solar-common.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____GameCenter = require("solar.solar-common.common.GameCenter")
local GameCenter = ____GameCenter.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
____exports.default = __TS__Class()
local SelectUtil = ____exports.default
SelectUtil.name = "SelectUtil"
function SelectUtil.prototype.____constructor(self)
end
function SelectUtil.getAnHero(playerIndex, clearCache)
    if clearCache == nil then
        clearCache = false
    end
    local ____opt_0 = DataBase:getPlayerSolarData(
        Player(playerIndex),
        false
    )
    local hero = ____opt_0 and ____opt_0.hero
    if hero then
        return hero
    end
    if clearCache then
        ____exports.default.cache:remove("PlayerHero:" .. tostring(playerIndex))
    end
    local cacheUnitHandle = ____exports.default.cache:get(
        "PlayerHero:" .. tostring(playerIndex),
        function()
            local group = _sl_tempGroup1
            GroupEnumUnitsOfPlayer(
                group,
                Player(playerIndex),
                nil
            )
            do
                local i = 0
                while i <= 1000000 do
                    local unitHandle = FirstOfGroup(group)
                    if not IsHandle(unitHandle) then
                        break
                    end
                    if IsUnitType(unitHandle, UNIT_TYPE_HERO) and not IsUnitType(unitHandle, UNIT_TYPE_PEON) and not IsUnitType(unitHandle, UNIT_TYPE_SUMMONED) and not IsUnitIllusion(unitHandle) and not IsUnitHidden(unitHandle) then
                        return unitHandle
                    end
                    GroupRemoveUnit(group, unitHandle)
                    i = i + 1
                end
            end
            return nil
        end
    )
    if IsHandle(cacheUnitHandle) then
        return cacheUnitHandle
    end
    return nil
end
function SelectUtil.forUserPlayerHero(callBack)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                local anHero = ____exports.default.getAnHero(GetPlayerId(tempPlayer))
                if IsHandle(anHero) then
                    callBack(nil, anHero, tempPlayer)
                end
            end
            i = i + 1
        end
    end
end
function SelectUtil.getAnEnemy(playerIndex, canAttack)
    if playerIndex == nil then
        playerIndex = 0
    end
    if canAttack == nil then
        canAttack = true
    end
    local enemyUnits = ____exports.default.getAllEnemys(playerIndex)
    if canAttack then
        local canAttackEnemyUnits = {}
        do
            local i = 0
            while i < #enemyUnits do
                if not UnitStateUtil:isInvulnerable(enemyUnits[i + 1]) then
                    canAttackEnemyUnits[#canAttackEnemyUnits + 1] = enemyUnits[i + 1]
                end
                i = i + 1
            end
        end
        enemyUnits = canAttackEnemyUnits
    end
    if enemyUnits == nil or #enemyUnits == 0 then
        return nil
    end
    return enemyUnits[GetRandomInt(0, #enemyUnits - 1) + 1]
end
function SelectUtil.getAllEnemys(playerIndex)
    if playerIndex == nil then
        playerIndex = 0
    end
    local enemyUnits = {}
    local allUnits = GameCenter:getAllUnits()
    local player = Player(playerIndex)
    for ____, unit in ipairs(allUnits) do
        if IsUnitEnemy(unit, player) and UnitAlive(unit) and GetPlayerId(GetOwningPlayer(unit)) < 12 then
            enemyUnits[#enemyUnits + 1] = unit
        end
    end
    return enemyUnits
end
function SelectUtil.getAllEnemysLength(playerIndex)
    if playerIndex == nil then
        playerIndex = 0
    end
    local allUnits = GameCenter:getAllUnits()
    local player = Player(playerIndex)
    local count = 0
    for ____, unit in ipairs(allUnits) do
        if IsUnitEnemy(unit, player) and UnitAlive(unit) and GetPlayerId(GetOwningPlayer(unit)) < 12 then
            count = count + 1
        end
    end
    return count
end
function SelectUtil.getRealSelectUnit()
    if isEmbedJapi then
        return GetRealSelectUnit()
    end
    GroupEnumUnitsSelected(
        _tempGroup,
        GetLocalPlayer(),
        nil
    )
    local unit = FirstOfGroup(_tempGroup)
    if not IsHandle(unit) then
        return nil
    end
    GroupRemoveUnit(_tempGroup, unit)
    if IsHandle(FirstOfGroup(_tempGroup)) then
        return nil
    end
    return unit
end
function SelectUtil.forAllyUnitsInRange(center, radius, callback, x, y)
    if x == nil then
        x = GetUnitX(center)
    end
    if y == nil then
        y = GetUnitY(center)
    end
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRange(
        group,
        x,
        y,
        radius,
        nil
    )
    local myPlayer = GetOwningPlayer(center)
    do
        local i = 0
        while i <= 1000000 do
            do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                GroupRemoveUnit(group, unitHandle)
                if not UnitAlive(unitHandle) then
                    goto __continue37
                end
                if IsUnitAlly(unitHandle, myPlayer) then
                    callback(nil, unitHandle)
                end
            end
            ::__continue37::
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forEnemyUnitsInRect(center, rect, callback)
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRect(group, rect, nil)
    local myPlayer = GetOwningPlayer(center)
    do
        local i = 0
        while i <= 1000000 do
            do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                GroupRemoveUnit(group, unitHandle)
                if not UnitAlive(unitHandle) then
                    goto __continue43
                end
                if IsUnitEnemy(unitHandle, myPlayer) then
                    callback(nil, unitHandle)
                end
            end
            ::__continue43::
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forEnemyUnitsInRange(center, radius, callback, x, y)
    if x == nil then
        x = GetUnitX(center)
    end
    if y == nil then
        y = GetUnitY(center)
    end
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRange(
        group,
        x,
        y,
        radius,
        nil
    )
    local myPlayer = GetOwningPlayer(center)
    do
        local i = 0
        while i <= 1000000 do
            do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                GroupRemoveUnit(group, unitHandle)
                if not UnitAlive(unitHandle) then
                    goto __continue49
                end
                if IsUnitEnemy(unitHandle, myPlayer) then
                    callback(nil, unitHandle)
                end
            end
            ::__continue49::
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.getEnemyUnitsInRangeOrderByDistance(center, radius, x, y, notInvulnerable)
    if x == nil then
        x = GetUnitX(center)
    end
    if y == nil then
        y = GetUnitY(center)
    end
    if notInvulnerable == nil then
        notInvulnerable = true
    end
    local enemyUnits = ____exports.default.getEnemyUnitsInRange(
        center,
        radius,
        x,
        y,
        notInvulnerable
    )
    if enemyUnits == nil or #enemyUnits == 0 then
        return enemyUnits
    end
    __TS__ArraySort(
        enemyUnits,
        function(____, a, b)
            local aD = MathUtil.distanceBetweenPoints(
                x,
                y,
                GetUnitX(a),
                GetUnitY(a)
            )
            local bD = MathUtil.distanceBetweenPoints(
                x,
                y,
                GetUnitX(b),
                GetUnitY(b)
            )
            return aD - bD
        end
    )
    return enemyUnits
end
function SelectUtil.getEnemyUnitsInRange(center, radius, x, y, notInvulnerable)
    if x == nil then
        x = GetUnitX(center)
    end
    if y == nil then
        y = GetUnitY(center)
    end
    if notInvulnerable == nil then
        notInvulnerable = true
    end
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRange(
        group,
        x,
        y,
        radius,
        nil
    )
    local units = {}
    local myPlayer = GetOwningPlayer(center)
    do
        local i = 0
        while i <= 1000000 do
            do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                GroupRemoveUnit(group, unitHandle)
                if not UnitStateUtil:isAlive(unitHandle) then
                    goto __continue58
                end
                if notInvulnerable and UnitStateUtil:isInvulnerable(unitHandle) then
                    goto __continue58
                end
                if IsUnitEnemy(unitHandle, myPlayer) then
                    units[#units + 1] = unitHandle
                end
            end
            ::__continue58::
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
    return units
end
function SelectUtil.getUnitsInRange(x, y, radius)
    GroupClear(_tempGroup)
    GroupEnumUnitsInRange(
        tempGroup,
        x,
        y,
        radius,
        nil
    )
    local units = GroupUtil:toArray(tempGroup)
    return units
end
function SelectUtil.forUnitsInRange(x, y, radius, callback)
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRange(
        group,
        x,
        y,
        radius,
        nil
    )
    GroupUtil["for"](GroupUtil, group, callback)
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forEnemyUnitsInLine(whoEnemy, lineX, lineY, lineLen, lineFaceAngle, lineWidth, callback)
    local unitsInLine = ____exports.default.getUnitsInLine(
        lineX,
        lineY,
        lineLen,
        lineFaceAngle,
        lineWidth
    )
    if unitsInLine == nil or #unitsInLine == 0 then
        return
    end
    local myPlayer = GetOwningPlayer(whoEnemy)
    for ____, unit in ipairs(unitsInLine) do
        if IsUnitEnemy(unit, myPlayer) then
            callback(nil, unit)
        end
    end
end
function SelectUtil.getEnemyUnitsInLine(whoEnemy, lineX, lineY, lineLen, lineFaceAngle, lineWidth)
    local unitsInLine = ____exports.default.getUnitsInLine(
        lineX,
        lineY,
        lineLen,
        lineFaceAngle,
        lineWidth
    )
    if unitsInLine == nil or #unitsInLine == 0 then
        return
    end
    local result = {}
    local myPlayer = GetOwningPlayer(whoEnemy)
    for ____, unit in ipairs(unitsInLine) do
        if IsUnitEnemy(unit, myPlayer) then
            result[#result + 1] = unit
        end
    end
    return result
end
function SelectUtil.forUnitsInLine(lineX, lineY, lineLen, lineFaceAngle, lineWidth, callback)
    local unitsInLine = ____exports.default.getUnitsInLine(
        lineX,
        lineY,
        lineLen,
        lineFaceAngle,
        lineWidth
    )
    if unitsInLine == nil or #unitsInLine == 0 then
        return
    end
    for ____, unit in ipairs(unitsInLine) do
        callback(nil, unit)
    end
end
function SelectUtil.getUnitsInLine(lineX, lineY, lineLen, lineFaceAngle, lineWidth)
    local stepLen = lineWidth / 2
    local count = math.ceil(lineLen / stepLen)
    local result = {}
    local group = GroupUtil.groupObjectPool:borrowObject()
    local lineFaceHD = MathUtil.angle2radian(lineFaceAngle)
    do
        local i = 1
        while i < count do
            local dist = stepLen * i
            local x = lineX + dist * Cos(lineFaceHD)
            local y = lineY + dist * Sin(lineFaceHD)
            GroupEnumUnitsInRange(
                group,
                x,
                y,
                lineWidth,
                nil
            )
            do
                local j = 0
                while j <= 100000 do
                    local unitHandle = FirstOfGroup(group)
                    if not IsHandle(unitHandle) then
                        break
                    end
                    if not __TS__ArrayIncludes(result, unitHandle) then
                        result[#result + 1] = unitHandle
                    end
                    GroupRemoveUnit(group, unitHandle)
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
    return result
end
function SelectUtil.forAllAliveUnits(callback)
    local allUnits = GameCenter:getAllUnits()
    for ____, unitHandle in ipairs(allUnits) do
        if UnitAlive(unitHandle) then
            callback(nil, unitHandle)
        end
    end
end
function SelectUtil.forAllUnits(callback, unitType)
    local allUnits = GameCenter:getAllUnits()
    if unitType then
        local unitTypeNum = FourCC(unitType)
        for ____, unitHandle in ipairs(allUnits) do
            if unitTypeNum == GetUnitTypeId(unitHandle) then
                callback(nil, unitHandle)
            end
        end
    else
        for ____, unitHandle in ipairs(allUnits) do
            callback(nil, unitHandle)
        end
    end
end
function SelectUtil.getPlayerUnits(playerIndex, unitType, onlyAlive)
    local resultUnits = {}
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsOfPlayer(
        group,
        Player(playerIndex),
        nil
    )
    if unitType then
        local unitTypeNum = FourCC(unitType)
        do
            local i = 0
            while i <= 1000000 do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                if unitTypeNum == GetUnitTypeId(unitHandle) then
                    if onlyAlive == true then
                        if UnitAlive(unitHandle) then
                            resultUnits[#resultUnits + 1] = unitHandle
                        end
                    else
                        resultUnits[#resultUnits + 1] = unitHandle
                    end
                end
                GroupRemoveUnit(group, unitHandle)
                i = i + 1
            end
        end
    else
        do
            local i = 0
            while i <= 1000000 do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                if onlyAlive == true then
                    if UnitAlive(unitHandle) then
                        resultUnits[#resultUnits + 1] = unitHandle
                    end
                else
                    resultUnits[#resultUnits + 1] = unitHandle
                end
                GroupRemoveUnit(group, unitHandle)
                i = i + 1
            end
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
    return resultUnits
end
function SelectUtil.forPlayerUnits(callback, playerIndex, unitType)
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsOfPlayer(
        group,
        Player(playerIndex),
        nil
    )
    if unitType then
        local unitTypeNum = FourCC(unitType)
        do
            local i = 0
            while i <= 1000000 do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                if unitTypeNum == GetUnitTypeId(unitHandle) then
                    callback(nil, unitHandle)
                end
                GroupRemoveUnit(group, unitHandle)
                i = i + 1
            end
        end
    else
        GroupUtil["for"](GroupUtil, group, callback)
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forPlayerAliveUnits(callback, playerIndex)
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsOfPlayer(
        group,
        Player(playerIndex),
        nil
    )
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(group)
            if not IsHandle(unitHandle) then
                break
            end
            if UnitStateUtil:isAlive(unitHandle) then
                callback(nil, unitHandle)
            end
            GroupRemoveUnit(group, unitHandle)
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forAllEnemyUnits(callback, whoseEnemy)
    if whoseEnemy == nil then
        whoseEnemy = Player(0)
    end
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRect(group, bj_mapInitialPlayableArea, nil)
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(group)
            if not IsHandle(unitHandle) then
                break
            end
            if IsUnitEnemy(unitHandle, whoseEnemy) then
                callback(nil, unitHandle)
            end
            GroupRemoveUnit(group, unitHandle)
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.getRandomEnemyInRange(whichUnit, range)
    local units = ____exports.default.getEnemyUnitsInRange(whichUnit, range)
    return ArrayUtil:randomElement(units)
end
function SelectUtil.getNearestEnemyInRange(whichUnit, maxRange)
    local enemyUnits = ____exports.default.getEnemyUnitsInRange(whichUnit, maxRange)
    if enemyUnits == nil then
        return nil
    end
    if #enemyUnits == 1 then
        return enemyUnits[1]
    end
    local minDis = maxRange
    local minDisUnit = enemyUnits[1]
    local bx = GetUnitX(whichUnit)
    local by = GetUnitY(whichUnit)
    for ____, enemyUnit in ipairs(enemyUnits) do
        local distance = MathUtil.distanceBetweenPoints(
            bx,
            by,
            GetUnitX(enemyUnit),
            GetUnitY(enemyUnit)
        )
        if distance < minDis then
            minDis = distance
            minDisUnit = enemyUnit
        end
    end
    return minDisUnit
end
function SelectUtil.getFarthestEnemyInRange(whichUnit, range)
    local units = ____exports.default.getEnemyUnitsInRange(whichUnit, range)
    local returnUnitHandle = nil
    local tempDistance = -1
    for ____, unitHandle in ipairs(units) do
        local distance = MathUtil.distanceBetweenPoints(
            GetUnitX(whichUnit),
            GetUnitY(whichUnit),
            GetUnitX(unitHandle),
            GetUnitY(unitHandle)
        )
        if tempDistance < 0 or distance > tempDistance then
            returnUnitHandle = unitHandle
            tempDistance = distance
        end
    end
    return returnUnitHandle
end
function SelectUtil.forLocalCameraUnits(inCameraUnitsCallback, outCameraUnitsCallback, frustumTop, frustumBottom, frustumLeft, frustumRight)
    if frustumTop == nil then
        frustumTop = 0.56
    end
    if frustumBottom == nil then
        frustumBottom = 0.13
    end
    if frustumLeft == nil then
        frustumLeft = 0
    end
    if frustumRight == nil then
        frustumRight = 0.8
    end
    if not isEmbedJapi then
        log.errorWithTraceBack("没有内置japi环境！")
        return
    end
    local minX, maxY = screen_to_world(frustumLeft, 0.6 - frustumTop)
    local maxX, max2Y = screen_to_world(frustumRight, 0.6 - frustumTop)
    local max2X, minY = screen_to_world(frustumRight, 0.6 - frustumBottom)
    local tempGroup = _sl_tempGroup2
    GroupClear(tempGroup)
    GroupEnumUnitsInRect(tempGroup, bj_mapInitialPlayableArea, nil)
    do
        local i = 0
        while i <= 1000000 do
            do
                local unitHandle = FirstOfGroup(tempGroup)
                if not IsHandle(unitHandle) then
                    break
                end
                local x = GetUnitX(unitHandle)
                if x > minX and x < maxX then
                    local y = GetUnitY(unitHandle)
                    if y > minY and y < maxY then
                        inCameraUnitsCallback(nil, unitHandle)
                        GroupRemoveUnit(tempGroup, unitHandle)
                        goto __continue145
                    end
                end
                if outCameraUnitsCallback then
                    outCameraUnitsCallback(nil, unitHandle)
                end
                GroupRemoveUnit(tempGroup, unitHandle)
            end
            ::__continue145::
            i = i + 1
        end
    end
end
SelectUtil.cache = __TS__New(Cache)
return ____exports
