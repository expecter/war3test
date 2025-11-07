import { BaseHero } from "./BaseHero"


let M_registClazz = new Map<string,Class<BaseHero>>()

export function RegistHero(clazzName:string){
    return function (clazz:Class<BaseHero>){
        if(M_registClazz.get(clazzName)){
            print("重复注册英雄",clazzName)
            return
        }

        M_registClazz.set(clazzName,clazz)
    }
}

export function GetTlHeroClazz():Class<BaseHero>[]{
    let tl:Class<BaseHero>[] = []
    for(let [name,clazz] of M_registClazz){
        tl.push(clazz)
    }
    return tl
}