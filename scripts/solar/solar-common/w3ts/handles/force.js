/** @noSelfInFile **/
import { Handle } from "./handle";
import { MapPlayer } from "./player";
export class Force extends Handle {
    constructor() {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(CreateForce());
        }
    }
    /**
     * 添加玩家 [R]
     */
    addPlayer(whichPlayer) {
        ForceAddPlayer(this.handle, whichPlayer.handle);
    }
    /**
     * 清除玩家
     */
    clear() {
        ForceClear(this.handle);
    }
    /**
     * 删除玩家组 [R]
     */
    destroy() {
        DestroyForce(this.handle);
    }
    /**
     * 匹配联盟
     */
    enumAllies(whichPlayer, filter) {
        ForceEnumAllies(this.handle, whichPlayer.handle, filter);
    }
    /**
     * 匹配敌对
     */
    enumEnemies(whichPlayer, filter) {
        ForceEnumEnemies(this.handle, whichPlayer.handle, filter);
    }
    /**
     * 匹配玩家
     */
    enumPlayers(filter) {
        ForceEnumPlayers(this.handle, filter);
    }
    /**
     * 匹配玩家 [countLimit 上限]
     */
    enumPlayersCounted(filter, countLimit) {
        ForceEnumPlayersCounted(this.handle, filter, countLimit);
    }
    /**
     * 选取所有玩家在玩家组做动作(单一的)
     */
    for(callback) {
        ForForce(this.handle, callback);
    }
    /**
     * 选取所有玩家在玩家组做动作(单一的)
     */
    getPlayers() {
        const players = [];
        ForForce(this.handle, () => players.push(MapPlayer.fromEnum()));
        return players;
    }
    /**
     * 玩家在玩家组
     */
    hasPlayer(whichPlayer) {
        return IsPlayerInForce(whichPlayer.handle, this.handle);
    }
    /**
     * 移除玩家 [R]
     */
    removePlayer(whichPlayer) {
        ForceRemovePlayer(this.handle, whichPlayer.handle);
    }
    /**
     * 从handle获取封装类
     */
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
