local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 3,["13"] = 3,["14"] = 10,["15"] = 11,["16"] = 10,["17"] = 18,["18"] = 19,["19"] = 18,["20"] = 27,["21"] = 27,["22"] = 27,["24"] = 28,["25"] = 27,["26"] = 37,["27"] = 37,["28"] = 37,["30"] = 38,["31"] = 39,["32"] = 40,["33"] = 37,["34"] = 50,["35"] = 50,["36"] = 50,["38"] = 51,["39"] = 52,["40"] = 53,["41"] = 50,["42"] = 62,["43"] = 62,["44"] = 62,["46"] = 63,["47"] = 63,["48"] = 63,["49"] = 64,["50"] = 63,["51"] = 63,["52"] = 66,["53"] = 62,["54"] = 74,["55"] = 74,["56"] = 74,["58"] = 75,["59"] = 75,["60"] = 75,["61"] = 75,["62"] = 75,["63"] = 75,["64"] = 75,["65"] = 75,["66"] = 75,["67"] = 76,["68"] = 77,["69"] = 78,["70"] = 79,["71"] = 80,["72"] = 74,["73"] = 88,["74"] = 88,["75"] = 88,["77"] = 89,["78"] = 89,["79"] = 89,["80"] = 89,["81"] = 89,["82"] = 89,["83"] = 89,["84"] = 89,["85"] = 89,["86"] = 90,["87"] = 91,["88"] = 92,["89"] = 93,["90"] = 94,["91"] = 95,["92"] = 96,["93"] = 97,["94"] = 98,["95"] = 88,["96"] = 4});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
____exports.default = __TS__Class()
local SoundUtil = ____exports.default
SoundUtil.name = "SoundUtil"
function SoundUtil.prototype.____constructor(self)
end
function SoundUtil.playMusic(self, musicFilePath)
    PlayMusic(musicFilePath)
end
function SoundUtil.playThematicMusic(self, musicFilePath)
    PlayThematicMusic(musicFilePath)
end
function SoundUtil.playSound(self, musicFilePath, dur)
    if dur == nil then
        dur = 1000
    end
    PlaySound(musicFilePath)
end
function SoundUtil.playSoundOnUnit(self, musicFilePath, dur, unit)
    if dur == nil then
        dur = 1000
    end
    local sound = ____exports.default:getSoundHandleFromSoundFilePath(musicFilePath, dur)
    AttachSoundToUnit(sound, unit)
    StartSound(sound)
end
function SoundUtil.playSoundOnPos(self, musicFilePath, dur, x, y)
    if dur == nil then
        dur = 1000
    end
    local sound = ____exports.default:getSoundHandleFromSoundFilePath(musicFilePath, dur)
    SetSoundPosition(sound, x, y, 0)
    StartSound(sound)
end
function SoundUtil.getSoundHandleFromSoundFilePath(self, musicFilePath, dur)
    if dur == nil then
        dur = 1000
    end
    local sound = ____exports.default.cache:get(
        (musicFilePath .. ":3D:") .. tostring(dur),
        function()
            return ____exports.default:createSound3D(musicFilePath, dur)
        end
    )
    return sound
end
function SoundUtil.createSound(self, musicFilePath, dur)
    if dur == nil then
        dur = 1000
    end
    local sound = CreateSound(
        musicFilePath,
        false,
        false,
        false,
        10,
        10,
        ""
    )
    SetSoundDuration(sound, dur)
    SetSoundChannel(sound, 0)
    SetSoundVolume(sound, 127)
    SetSoundPitch(sound, 1)
    return sound
end
function SoundUtil.createSound3D(self, musicFilePath, dur)
    if dur == nil then
        dur = 1000
    end
    local sound = CreateSound(
        musicFilePath,
        false,
        true,
        true,
        10,
        10,
        "DefaultEAXON"
    )
    SetSoundDuration(sound, dur)
    SetSoundChannel(sound, 0)
    SetSoundVolume(sound, 127)
    SetSoundPitch(sound, 1)
    SetSoundDistances(sound, 0, 10000)
    SetSoundDistanceCutoff(sound, 3000)
    SetSoundConeAngles(sound, 0, 0, 127)
    SetSoundConeOrientation(sound, 0, 0, 0)
    return sound
end
SoundUtil.cache = __TS__New(Cache)
return ____exports
