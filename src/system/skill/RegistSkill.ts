import { BaseSkill } from "./BaseSkill"

let M_registClazz = new Map<string,Class<BaseSkill>>()

export function RegistSkill(clazzName:string){
    return function (clazz:Class<BaseSkill>){
        if(M_registClazz.get(clazzName)){
            print("重复注册技能",clazzName)
            return
        }

        M_registClazz.set(clazzName,clazz)
    }
}

export function GetTlSkillClazz():Class<BaseSkill>[]{
    let tl:Class<BaseSkill>[] = []
    for(let [name,clazz] of M_registClazz){
        tl.push(clazz)
    }
    return tl
}