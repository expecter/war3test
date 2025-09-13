local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 7,["7"] = 7,["8"] = 8,["9"] = 8,["10"] = 9,["11"] = 9,["12"] = 10,["13"] = 10,["14"] = 11,["15"] = 11,["16"] = 12,["17"] = 12,["18"] = 14,["19"] = 14,["20"] = 24,["21"] = 24,["22"] = 24,["23"] = 36,["24"] = 36,["25"] = 36,["27"] = 37,["28"] = 38,["29"] = 39,["30"] = 40,["33"] = 44,["34"] = 45,["35"] = 46,["36"] = 47,["37"] = 48,["38"] = 49,["39"] = 50,["40"] = 51,["41"] = 53,["42"] = 53,["43"] = 53,["44"] = 55,["45"] = 57,["46"] = 58,["48"] = 53,["49"] = 53,["51"] = 63,["52"] = 63,["53"] = 63,["54"] = 65,["55"] = 66,["56"] = 68,["59"] = 71,["60"] = 63,["61"] = 63,["62"] = 44,["63"] = 75,["64"] = 76,["65"] = 77,["68"] = 82,["69"] = 83,["70"] = 83,["71"] = 83,["72"] = 84,["73"] = 85,["74"] = 83,["75"] = 83,["76"] = 75,["77"] = 89,["78"] = 90,["79"] = 90,["80"] = 90,["81"] = 91,["82"] = 91,["83"] = 91,["84"] = 92,["85"] = 93,["86"] = 93,["87"] = 93,["88"] = 94,["89"] = 93,["90"] = 93,["91"] = 93,["92"] = 96,["93"] = 96,["94"] = 96,["95"] = 96,["96"] = 96,["97"] = 96,["98"] = 96,["100"] = 99,["101"] = 99,["102"] = 99,["103"] = 99,["104"] = 99,["105"] = 99,["106"] = 99,["108"] = 91,["109"] = 91,["110"] = 91,["111"] = 91,["112"] = 90,["113"] = 90,["115"] = 36,["116"] = 115,["117"] = 117,["118"] = 118,["119"] = 119,["120"] = 121,["121"] = 122,["122"] = 123,["123"] = 124,["124"] = 125,["128"] = 129,["130"] = 131,["132"] = 133,["133"] = 134,["134"] = 135,["135"] = 137,["136"] = 137,["137"] = 137,["138"] = 139,["139"] = 140,["140"] = 141,["141"] = 137,["142"] = 137,["143"] = 118,["144"] = 145,["145"] = 146,["146"] = 147,["147"] = 148,["148"] = 148,["149"] = 149,["150"] = 150,["152"] = 152,["155"] = 156,["156"] = 157,["157"] = 158,["161"] = 154,["168"] = 162,["170"] = 146,["171"] = 115,["172"] = 26});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____UnitDeathTimeUtil = require("solar.solar-common.util.unit.UnitDeathTimeUtil")
local UnitDeathTimeUtil = ____UnitDeathTimeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local ____ItemUtil = require("solar.solar-common.util.game.ItemUtil")
local ItemUtil = ____ItemUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
____exports.default = __TS__Class()
local SolarDataClearState = ____exports.default
SolarDataClearState.name = "SolarDataClearState"
function SolarDataClearState.prototype.____constructor(self, delay)
    if delay == nil then
        delay = ____exports.default.config.delay
    end
    ____exports.default.config.delay = delay
    handleReuseMinTime = math.min(delay, ____exports.default.config.heroDealy) - 1
    if handleReuseMinTime < 8 then
        log.errorWithTraceBack("清理的延迟不得小于8秒")
        return
    end
    se:onUnitDeath(function(e)
        local whichUnit = e.trigUnit
        handle_ref(whichUnit)
        UnitDeathTimeUtil:setDeathTime(whichUnit, _g_time)
        local rDelay = ____exports.default.config.delay
        if e.isHeroUnitTrig then
            rDelay = ____exports.default.config.heroDealy
        elseif ____exports.default.config.removeUnitDelay > 1 then
            BaseUtil.runLater(
                ____exports.default.config.removeUnitDelay,
                function()
                    if not UnitStateUtil:isAlive(whichUnit) then
                        UnitDeathTimeUtil:clearDeathTime(whichUnit)
                        RemoveUnit(whichUnit)
                    end
                end
            )
        end
        BaseUtil.runLater(
            rDelay,
            function()
                if not UnitStateUtil:isAlive(whichUnit) then
                    if not UnitDeathTimeUtil:hasDeathTime(whichUnit) or UnitDeathTimeUtil:isTimeOfDeathExceeded(whichUnit, rDelay - 0.001) then
                        DataBase:clearUnitSolarData(whichUnit)
                    end
                end
                handle_unref(whichUnit)
            end
        )
    end)
    se:onUnitPawnItem(function(e)
        local item = GetSoldItem()
        if not IsHandle(item) then
            return
        end
        handle_ref(item)
        BaseUtil.runLater(
            ____exports.default.config.removeUnitDelay,
            function()
                handle_unref(item)
                RemoveItem(item)
            end
        )
    end)
    if ____exports.default.config.openClearCmd then
        se:playerChat(
            "-c",
            function()
                BaseUtil.runLater(
                    1,
                    function(count, maxCount)
                        if count == maxCount then
                            ItemUtil:forItemsInRect(
                                GetPlayableMapRect(),
                                function(item)
                                    RemoveItem(item)
                                end,
                                false
                            )
                            DisplayTimedTextToPlayer(
                                GetLocalPlayer(),
                                0,
                                0,
                                10,
                                "|cffff0000【系统提示】清理地面物品完毕!"
                            )
                        else
                            DisplayTimedTextToPlayer(
                                GetLocalPlayer(),
                                0,
                                0,
                                10,
                                "|cffff0000【系统提示】清理地面物品倒计时:" .. tostring(maxCount - count)
                            )
                        end
                    end,
                    6,
                    true
                )
            end
        )
    end
end
function SolarDataClearState._sl_hookClearHandle(self)
    local jassRemoveUnit = RemoveUnit
    _G.RemoveUnit = function(whichUnit)
        if IsHandle(whichUnit) then
            local actorList = ActorUtil:getUnitAllActorList(whichUnit)
            if actorList ~= nil and #actorList > 0 then
                for ____, actor in ipairs(actorList) do
                    if actor ~= nil then
                        actor:destroy(true)
                    end
                end
            end
            DataBase:clearUnitSolarData(whichUnit)
        else
            log.errorWithTraceBack("你正在删除一个空的单位handle！请使用IsHandle判断是否有值!")
        end
        handle_ref(whichUnit)
        UnitDeathTimeUtil:setDeathTime(whichUnit)
        jassRemoveUnit(whichUnit)
        BaseUtil.runLater(
            handleReuseMinTime + 2,
            function()
                DataBase:clearUnitSolarData(whichUnit)
                UnitDeathTimeUtil:clearDeathTime(whichUnit)
                handle_unref(whichUnit)
            end
        )
    end
    local jassRemoveItem = RemoveItem
    _G.RemoveItem = function(whichItem)
        if IsHandle(whichItem) then
            local ____opt_0 = DataBase:getItemSolarData(whichItem, false)
            local actor = ____opt_0 and ____opt_0._SL_solarActorItem
            if actor then
                actor:destroy(true)
            end
            DataBase:clearItemSolarData(whichItem)
            do
                local function ____catch(e)
                    print("jassRemoveItem崩溃:" .. tostring(whichItem))
                    if isDebug then
                        log.errorWithTraceBack((("jassRemoveItem崩溃:" .. tostring(whichItem)) .. " name=") .. ActorItemUtil:getItemName(whichItem))
                    end
                end
                local ____try, ____hasReturned = pcall(function()
                    jassRemoveItem(whichItem)
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        else
            log.errorWithTraceBack("你正在删除一个空的物品handle！请使用IsHandle判断是否有值!")
        end
    end
end
SolarDataClearState.config = {removeUnitDelay = 10, delay = 32, heroDealy = 200, openClearCmd = true}
return ____exports
