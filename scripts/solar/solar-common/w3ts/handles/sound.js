/** @noSelfInFile **/
import { Handle } from "./handle";
export class Sound extends Handle {
    constructor(fileName, looping, is3D, stopWhenOutOfRange, fadeInRate, fadeOutRate, eaxSetting) {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateSound(fileName, looping, is3D, stopWhenOutOfRange, fadeInRate, fadeOutRate, eaxSetting));
        }
    }
    // public get dialogueSpeakerNameKey() {
    //   return GetDialogueSpeakerNameKey(this.handle);
    // }
    //
    // public set dialogueSpeakerNameKey(speakerName: string) {
    //   SetDialogueSpeakerNameKey(this.handle, speakerName);
    // }
    //
    // public get dialogueTextKey() {
    //   return GetDialogueTextKey(this.handle);
    // }
    //
    // public set dialogueTextKey(dialogueText: string) {
    //   SetDialogueTextKey(this.handle, dialogueText);
    // }
    get duration() {
        return GetSoundDuration(this.handle);
    }
    set duration(duration) {
        SetSoundDuration(this.handle, duration);
    }
    get loading() {
        return GetSoundIsLoading(this.handle);
    }
    get playing() {
        return GetSoundIsPlaying(this.handle);
    }
    killWhenDone() {
        KillSoundWhenDone(this.handle);
    }
    registerStacked(byPosition, rectWidth, rectHeight) {
        RegisterStackedSound(this.handle, byPosition, rectWidth, rectHeight);
    }
    setChannel(channel) {
        SetSoundChannel(this.handle, channel);
    }
    setConeAngles(inside, outside, outsideVolume) {
        SetSoundConeAngles(this.handle, inside, outside, outsideVolume);
    }
    setConeOrientation(x, y, z) {
        SetSoundConeOrientation(this.handle, x, y, z);
    }
    setDistanceCutoff(cutoff) {
        SetSoundDistanceCutoff(this.handle, cutoff);
    }
    setDistances(minDist, maxDist) {
        SetSoundDistances(this.handle, minDist, maxDist);
    }
    // public setFacialAnimationFilepath(animationSetFilepath: string) {
    //   SetSoundFacialAnimationSetFilepath(this.handle, animationSetFilepath);
    // }
    //
    // public setFacialAnimationGroupLabel(groupLabel: string) {
    //   SetSoundFacialAnimationGroupLabel(this.handle, groupLabel);
    // }
    //
    // public setFacialAnimationLabel(animationLabel: string) {
    //   SetSoundFacialAnimationLabel(this.handle, animationLabel);
    // }
    setParamsFromLabel(soundLabel) {
        SetSoundParamsFromLabel(this.handle, soundLabel);
    }
    setPitch(pitch) {
        SetSoundPitch(this.handle, pitch);
    }
    /**
     * Must be called immediately after starting the sound
     * @param millisecs
     */
    setPlayPosition(millisecs) {
        SetSoundPlayPosition(this.handle, millisecs);
    }
    setPosition(x, y, z) {
        SetSoundPosition(this.handle, x, y, z);
    }
    setVelocity(x, y, z) {
        SetSoundVelocity(this.handle, x, y, z);
    }
    setVolume(volume) {
        SetSoundVolume(this.handle, volume);
    }
    start() {
        StartSound(this.handle);
    }
    stop(killWhenDone, fadeOut) {
        StopSound(this.handle, killWhenDone, fadeOut);
    }
    unregisterStacked(byPosition, rectWidth, rectHeight) {
        UnregisterStackedSound(this.handle, byPosition, rectWidth, rectHeight);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
    static getFileDuration(fileName) {
        return GetSoundFileDuration(fileName);
    }
}
