export default class HeroUtil {
    /**
     * 是英雄
     */
    static isHero(handle) {
        return IsHeroUnitId(GetUnitTypeId(handle));
    }
    /**
     * 获取英雄主属性
     */
    static getHeroPrimary(handle) {
        let objIdStr = id2string(GetUnitTypeId(handle));
        let obj = _g_objs.unit[objIdStr];
        return obj.Primary;
    }
    /**
     * 获取英雄主属性 成长
     * 每等级提升
     */
    static getHeroPrimaryPlus(handle) {
        let objIdStr = id2string(GetUnitTypeId(handle));
        let obj = _g_objs.unit[objIdStr];
        let primaryPlus = obj[obj.Primary + "plus"];
        return Number(primaryPlus ?? '0');
    }
    /**
     * 获取英雄属性 成长
     * 每等级提升
     * 返回 力量 敏捷 智力的 每级成长值
     */
    static getHeroPlus(handle) {
        let objIdStr = id2string(GetUnitTypeId(handle));
        let obj = _g_objs.unit[objIdStr];
        return [Number(obj["STRplus"]), Number(obj["AGIplus"]), Number(obj["INTplus"])];
    }
    static addHeroProperty(handle, addStr, addAgi = addStr, addInt = addStr) {
        if (addStr != 0) {
            let newVal = GetHeroStr(handle, false) + addStr;
            if (!isBigAttributeMode) {
                newVal = Math.min(newVal, 21_0000_0000);
            }
            SetHeroStr(handle, newVal, true);
        }
        if (addAgi != 0) {
            let newVal = GetHeroAgi(handle, false) + addAgi;
            if (!isBigAttributeMode) {
                newVal = Math.min(newVal, 21_0000_0000);
            }
            SetHeroAgi(handle, newVal, true);
        }
        if (addInt != 0) {
            let newVal = GetHeroInt(handle, false) + addInt;
            if (!isBigAttributeMode) {
                newVal = Math.min(newVal, 21_0000_0000);
            }
            SetHeroInt(handle, newVal, true);
        }
    }
    static addHeroPropertyP(handle, includeBonuses, addStrP, addAgiP = addStrP, addIntP = addStrP) {
        if (addStrP != 0) {
            let newVal = GetHeroStr(handle, includeBonuses) * (1 + addStrP);
            if (!isBigAttributeMode) {
                newVal = Math.min(newVal, 21_0000_0000);
            }
            SetHeroStr(handle, newVal, true);
        }
        if (addAgiP != 0) {
            let newVal = GetHeroAgi(handle, includeBonuses) * (1 + addAgiP);
            if (!isBigAttributeMode) {
                newVal = Math.min(newVal, 21_0000_0000);
            }
            SetHeroAgi(handle, newVal, true);
        }
        if (addIntP != 0) {
            let newVal = GetHeroInt(handle, includeBonuses) * (1 + addIntP);
            if (!isBigAttributeMode) {
                newVal = Math.min(newVal, 21_0000_0000);
            }
            SetHeroInt(handle, newVal, true);
        }
    }
    /**
     * 设置三维属性
     * @param handle
     * @param newStr
     * @param newAgi
     * @param newInt
     */
    static setHeroProperty(handle, newStr, newAgi, newInt) {
        if (isBigAttributeMode) {
            SetHeroStr(handle, newStr, true);
            SetHeroAgi(handle, newAgi, true);
            SetHeroInt(handle, newInt, true);
        }
        else {
            SetHeroStr(handle, Math.min(newStr, 21_0000_0000), true);
            SetHeroAgi(handle, Math.min(newAgi, 21_0000_0000), true);
            SetHeroInt(handle, Math.min(newInt, 21_0000_0000), true);
        }
    }
    /**
     * 增加属性
     * @param handle
     * @param key
     * @param addVal
     */
    static addHeroPropertyByKey(handle, key, addVal) {
        if (key == "STR") {
            let newVal = GetHeroStr(handle, false) + addVal;
            if (!isBigAttributeMode) {
                newVal = Math.min(newVal, 21_0000_0000);
            }
            SetHeroStr(handle, newVal, true);
        }
        else if (key == "AGI") {
            let newVal = GetHeroAgi(handle, false) + addVal;
            if (!isBigAttributeMode) {
                newVal = Math.min(newVal, 21_0000_0000);
            }
            SetHeroAgi(handle, newVal, true);
        }
        else if (key == "INT") {
            let newVal = GetHeroInt(handle, false) + addVal;
            if (!isBigAttributeMode) {
                newVal = Math.min(newVal, 21_0000_0000);
            }
            SetHeroInt(handle, newVal, true);
        }
    }
    /**
     * 增加力量
     * @param handle
     * @param addVal
     */
    static addStr(handle, addVal) {
        let newVal = GetHeroStr(handle, false) + addVal;
        if (!isBigAttributeMode) {
            newVal = Math.min(newVal, 21_0000_0000);
        }
        SetHeroStr(handle, newVal, true);
    }
    /**
     * 增加敏捷
     * @param handle
     * @param addVal
     */
    static addAgi(handle, addVal) {
        let newVal = GetHeroAgi(handle, false) + addVal;
        if (!isBigAttributeMode) {
            newVal = Math.min(newVal, 21_0000_0000);
        }
        SetHeroAgi(handle, newVal, true);
    }
    /**
     * 增加智力
     * @param handle
     * @param addVal
     */
    static addInt(handle, addVal) {
        let newVal = GetHeroInt(handle, false) + addVal;
        if (!isBigAttributeMode) {
            newVal = Math.min(newVal, 21_0000_0000);
        }
        SetHeroInt(handle, newVal, true);
    }
    /**
     * 获取英雄主属性的属性值
     * includeBonuses (默认 白字加绿字奖励)
     */
    static getHeroPrimaryValue(handle, includeBonuses = true) {
        let Primary = HeroUtil.getHeroPrimary(handle);
        if (Primary == "STR") {
            return GetHeroStr(handle, includeBonuses);
        }
        else if (Primary == "AGI") {
            return GetHeroAgi(handle, includeBonuses);
        }
        else if (Primary == "INT") {
            return GetHeroInt(handle, includeBonuses);
        }
        return 0;
    }
    /**
     * 添加英雄主属性的属性值
     * 白字
     */
    static addHeroPrimary(handle, addVal) {
        let Primary = HeroUtil.getHeroPrimary(handle);
        HeroUtil.addHeroPropertyByKey(handle, Primary, addVal);
        return 0;
    }
    /**
     * 获取英雄绿字主属性
     * @param handle
     */
    static getHeroPrimaryBonusValue(handle) {
        let Primary = HeroUtil.getHeroPrimary(handle);
        if (Primary == "STR") {
            return GetHeroStr(handle, true) - GetHeroStr(handle, false);
        }
        else if (Primary == "AGI") {
            return GetHeroAgi(handle, true) - GetHeroAgi(handle, false);
        }
        else if (Primary == "INT") {
            return GetHeroInt(handle, true) - GetHeroInt(handle, false);
        }
        return 0;
    }
    /**
     * 获取英雄全属性属性
     * @param handle
     * @param includeBonuses
     */
    static getFullProperty(handle, includeBonuses = true) {
        let fullProperty = GetHeroStr(handle, includeBonuses);
        fullProperty = fullProperty + GetHeroAgi(handle, includeBonuses);
        fullProperty = fullProperty + GetHeroInt(handle, includeBonuses);
        return fullProperty;
    }
    /**
     * 获取英雄全属性属性 的比例
     * @param handle
     * @param strScale
     * @param agiScale
     * @param intScale
     */
    static getPropertyWithScale(handle, strScale = 0, agiScale = 0, intScale = 0) {
        let fullProperty = 0;
        if (strScale != 0) {
            fullProperty = fullProperty + (GetHeroStr(handle, true) * strScale);
        }
        if (agiScale != 0) {
            fullProperty = fullProperty + (GetHeroAgi(handle, true) * agiScale);
        }
        if (intScale != 0) {
            fullProperty = fullProperty + (GetHeroInt(handle, true) * intScale);
        }
        return fullProperty;
    }
}
