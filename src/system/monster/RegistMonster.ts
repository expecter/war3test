import { BaseMonster } from "./BaseMonster"


let M_registClazz = new Map<string,Class<BaseMonster>>()

export function RegistMonster(clazzName:string){
    return function (clazz:Class<BaseMonster>){
        if(M_registClazz.get(clazzName)){
            print("重复注册怪物",clazzName)
            return
        }

        M_registClazz.set(clazzName,clazz)
    }
}

export function GetTlMonsterClazz():Class<BaseMonster>[]{
    let tl:Class<BaseMonster>[] = []
    for(let [name,clazz] of M_registClazz){
        tl.push(clazz)
    }
    return tl
}