/** @noSelfInFile **/
import { Handle } from "./handle";
export var ImageType;
(function (ImageType) {
    ImageType[ImageType["Selection"] = 1] = "Selection";
    ImageType[ImageType["Indicator"] = 2] = "Indicator";
    ImageType[ImageType["OcclusionMask"] = 3] = "OcclusionMask";
    ImageType[ImageType["Ubersplat"] = 4] = "Ubersplat";
})(ImageType || (ImageType = {}));
export class Image extends Handle {
    constructor(file, sizeX, sizeY, sizeZ, posX, posY, posZ, originX, originY, originZ, imageType) {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateImage(file, sizeX, sizeY, sizeZ, posX, posY, posZ, originX, originY, originZ, imageType));
        }
    }
    destroy() {
        DestroyImage(this.handle);
    }
    setAboveWater(flag, useWaterAlpha) {
        SetImageAboveWater(this.handle, flag, useWaterAlpha);
    }
    setColor(red, green, blue, alpha) {
        SetImageColor(this.handle, red, green, blue, alpha);
    }
    setConstantHeight(flag, height) {
        SetImageConstantHeight(this.handle, flag, height);
    }
    setPosition(x, y, z) {
        SetImagePosition(this.handle, x, y, z);
    }
    setRender(flag) {
        SetImageRenderAlways(this.handle, flag);
    }
    setType(imageType) {
        SetImageType(this.handle, imageType);
    }
    show(flag) {
        ShowImage(this.handle, flag);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
