import DataBase from "@/DataBase";
import ArrayUtil from "@/ArrayUtil";
/**
 * 品级相关API
 */
export default class GradeUtil {
    /**
     * 获取一个随机单位id 根据品级
     * @param grade
     * @param clazzs 限定类别
     */
    static getRandomUnitIdByGrade(grade, ...clazzs) {
        let gradeIds = GradeUtil.getUnitGradeIds(...clazzs);
        let ids = gradeIds[grade];
        if (ids == null || ids.length == 0) {
            return null;
        }
        return ArrayUtil.randomElement(ids);
    }
    /**
     * 获取一个随机物品id 根据品级
     * @param grade
     * @param clazzs 限定类别
     */
    static getRandomItemIdByGrade(grade, ...clazzs) {
        let gradeIds = GradeUtil.getItemGradeIds(...clazzs);
        let ids = gradeIds[grade];
        if (ids == null || ids.length == 0) {
            return null;
        }
        return ArrayUtil.randomElement(ids);
    }
    /**
     * 获取单位的品级信息
     */
    static getUnitGradeIds(...clazzs) {
        let gradeIds = {};
        DataBase.forUnitTypeSolarDatas((id, solarData) => {
            if (solarData.grade) {
                if (clazzs && clazzs.length > 0 && !clazzs.includes(solarData.class)) {
                    return;
                }
                let ids = gradeIds[solarData.grade];
                if (ids == null) {
                    ids = [];
                    gradeIds[solarData.grade] = ids;
                }
                ids.push(id);
            }
        });
        return gradeIds;
    }
    /**
     * 获取物品的品级信息
     */
    static getItemGradeIds(...clazzs) {
        let gradeIds = {};
        DataBase.forItemTypeSolarDatas((id, solarData) => {
            if (solarData.grade) {
                if (clazzs && clazzs.length > 0 && !clazzs.includes(solarData.class)) {
                    return;
                }
                let ids = gradeIds[solarData.grade];
                if (ids == null) {
                    ids = [];
                    gradeIds[solarData.grade] = ids;
                }
                ids.push(id);
            }
        });
        return gradeIds;
    }
    /**
     * 获取技能的品级信息
     */
    static getAbilityGradeIds(...clazzs) {
        let gradeIds = {};
        DataBase.forAbilityTypeSolarDatas((id, solarData) => {
            if (solarData.grade) {
                if (clazzs && clazzs.length > 0 && !clazzs.includes(solarData.class)) {
                    return;
                }
                let ids = gradeIds[solarData.grade];
                if (ids == null) {
                    ids = [];
                    gradeIds[solarData.grade] = ids;
                }
                ids.push(id);
            }
        });
        return gradeIds;
    }
    /**
     * 设置物品类型的品级
     * @param id
     * @param grade
     * @param clazz 类别
     */
    static setItemTypeGrade(id, grade, clazz) {
        let solarData = DataBase.getItemTypeSolarData(id, true);
        solarData.grade = grade;
        if (clazz) {
            solarData.class = clazz;
        }
    }
    /**
     * 设置单位类型的品级
     * @param id
     * @param grade
     * @param clazz 类别
     */
    static setUnitTypeGrade(id, grade, clazz) {
        let solarData = DataBase.getUnitTypeSolarData(id, true);
        solarData.grade = grade;
        if (clazz) {
            solarData.class = clazz;
        }
    }
    /**
     * 设置技能类型的品级
     * @param id
     * @param grade
     * @param clazz 类别
     */
    static setAbilityTypeGrade(id, grade, clazz) {
        let solarData = DataBase.getAbilityTypeSolarData(id, true);
        solarData.grade = grade;
        if (clazz) {
            solarData.class = clazz;
        }
    }
    /**
     * 获取单位类型品级
     * @param id
     */
    static getUnitTypeGrade(id) {
        return DataBase.getUnitTypeSolarData(id)?.grade;
    }
    /**
     * 获取物品类型品级
     * @param id
     */
    static getItemTypeGrade(id) {
        return DataBase.getItemTypeSolarData(id)?.grade;
    }
}
