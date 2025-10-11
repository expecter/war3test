import STimer from "@/STimer";
import UnitUtil from "@/UnitUtil";
import ActorTypeUtil from "@/util/ActorTypeUtil";

export default class 沟壑{

    private sTimer: STimer = null;
    constructor(){
        this.sTimer = new STimer();
        let actorType = ActorTypeUtil.getActorType("沟壑")
        actorType.onAction=(actor, x, y, targetUnit)=>{
            actor.unit
            this.Trig_gouhe_Actions()
        }
    }
    private udg_dummy: destructable[] = [];
    Trig_gouhe_Actions (): void {
        let udg_tarloc = GetSpellTargetLoc();
        let udg_triunitloc = GetUnitLoc(GetTriggerUnit());
        bj_forLoopAIndex = 1;
        bj_forLoopAIndexEnd = 20;
        while (true) {
            if (bj_forLoopAIndex > bj_forLoopAIndexEnd) break;
            let udg_loc = PolarProjectionBJ(udg_triunitloc, I2R((GetForLoopIndexA() * 60)), AngleBetweenPoints(udg_triunitloc, udg_tarloc));
            MoveLocation(udg_loc, this.checkX(GetLocationX(udg_loc)), this.checkY(GetLocationY(udg_loc)));
            // 此处JASS为判断边界,超出边界使udg_loc为边界值,新手可不用
            CreateDestructableLoc(FourCC('B000'), udg_loc, GetRandomReal(0.00, 360.00), 0.50, GetRandomInt(0, 2));
            this.udg_dummy[GetForLoopIndexA()] = GetLastCreatedDestructable();
            AddSpecialEffectLocBJ(udg_loc, "Abilities\\Spells\\Other\\Volcano\\VolcanoDeath.mdl");
            DestroyEffectBJ(GetLastCreatedEffectBJ());
            RemoveLocation(udg_loc);
            bj_forLoopAIndex = bj_forLoopAIndex + 1;
        }
       
        this.sTimer.start(8, () => {
            bj_forLoopBIndex = 1;
            bj_forLoopBIndexEnd = 20;
            while (true) {
                if (bj_forLoopBIndex > bj_forLoopBIndexEnd) break;
                RemoveDestructable(this.udg_dummy[GetForLoopIndexB()]);
                bj_forLoopBIndex = bj_forLoopBIndex + 1;
            }
            RemoveLocation(udg_tarloc);
            RemoveLocation(udg_triunitloc);
        }, false)
        // TriggerSleepAction(8.00);
        
    }

    //判断X坐标是否出界,出界返回边界值
    checkX (x: number): number {

        let r: number = GetRectMinX(bj_mapInitialPlayableArea) + 50;

        if ((x < r))
            return r;
        r = GetRectMaxX(bj_mapInitialPlayableArea) - 50;
        if ((x > r))
            return r;
        return x;
    }
    //判断Y坐标是否出界,出界返回边界值
    checkY (y: number): number {

        let r: number = GetRectMinY(bj_mapInitialPlayableArea) + 50;

        if ((y < r))
            return r;
        r = GetRectMaxY(bj_mapInitialPlayableArea) - 50;
        if ((y > r))
            return r;
        return y;
    }
}