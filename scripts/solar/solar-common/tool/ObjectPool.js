/**
 * 对象池
 */
export default class ObjectPool {
    //对象
    objects = [];
    //对象是否空闲
    objectIdleStatus = [];
    _before_lastBorrowObjectIndex = -1;
    lastBorrowObjectIndex = -1;
    create = null;
    returnCallBack = null;
    maxTotal = 1000000;
    minIdle = 1;
    /**
     *
     * @param create = 创建对象的
     * @param returnCallBack
     */
    constructor(create, returnCallBack = null) {
        this.create = create;
        this.returnCallBack = returnCallBack;
    }
    /**
     * 提前准备池 使池至少拥有createCount个空闲对象
     */
    preparePool(idleCount = this.minIdle) {
        let tempIdleCount = 0;
        for (let i = 0; i < this.maxTotal; i++) {
            if (tempIdleCount >= idleCount) {
                return;
            }
            if (this.objectIdleStatus[i] == true) {
                tempIdleCount++;
            }
            else if (this.objects[i] == null) {
                this.objects[i] = this.create();
                this.objectIdleStatus[i] = true;
                tempIdleCount++;
            }
        }
    }
    /**
     * 获取一个对象
     * @param obj
     */
    borrowObject() {
        for (let i = 0; i < this.maxTotal; i++) {
            if (this.objectIdleStatus[i] == true) {
                this.lastBorrowObjectIndex = i;
                this.objectIdleStatus[i] = false;
                return this.objects[i];
            }
            else if (this.objects[i] == null) {
                this.objects[i] = this.create();
                this.lastBorrowObjectIndex = i;
                this.objectIdleStatus[i] = false;
                return this.objects[i];
            }
        }
        //超过最大数量
        return null;
    }
    /**
     * 返还一个对象
     * @param obj
     */
    returnObject(obj) {
        let isIdle = true;
        if (this.returnCallBack) {
            let flag = this.returnCallBack(obj);
            if (flag != null) {
                isIdle = flag;
            }
        }
        for (let i = 0; i < this.maxTotal; i++) {
            if (obj == this.objects[i]) {
                this.objectIdleStatus[i] = isIdle;
                return true;
            }
        }
        return false;
    }
    /**
     * 设置对象池所有对象的空闲状态
     */
    setAllIdleStatus(isIdle = true) {
        this._before_lastBorrowObjectIndex = this.lastBorrowObjectIndex;
        if (isIdle) {
            this.lastBorrowObjectIndex = -1;
        }
        else {
            this.lastBorrowObjectIndex = this.objects.length - 1;
        }
        for (let i = 0; i < this.objects.length; i++) {
            this.objectIdleStatus[i] = isIdle;
        }
    }
    /**
     * 遍历所有对象
     * @param callBack 返回值将 设置对象 是否空闲
     */
    forObjects(callBack) {
        for (let i = 0; i < this.objects.length; i++) {
            let isIdle = callBack(this.objects[i]);
            if (isIdle != null) {
                this.objectIdleStatus[i] = isIdle;
            }
        }
    }
    /**
     * 遍历所有空闲对象
     * @param callBack 返回值将 设置对象 是否空闲
     */
    forIdleObjects(callBack) {
        for (let i = 0; i < this.objectIdleStatus.length; i++) {
            if (this.objectIdleStatus[i] == true) {
                let isIdle = callBack(this.objects[i]);
                if (isIdle != null) {
                    this.objectIdleStatus[i] = isIdle;
                }
            }
        }
    }
    /**
     * 遍历所有活跃(非空闲)对象
     * @param callBack 返回值将 设置对象 是否空闲
     */
    forActiveObjects(callBack) {
        for (let i = 0; i < this.objects.length; i++) {
            if (this.objectIdleStatus[i] == false) {
                let isIdle = callBack(this.objects[i]);
                if (isIdle != null) {
                    this.objectIdleStatus[i] = isIdle;
                }
            }
        }
    }
    /**
     * 遍历所有脏对象
     * （参考test/模拟血条处清理未使用的血条）
     */
    forDirtyObjects(callBack) {
        let clearNum = 0;
        //如果本次获取的对象索引 大于上次获取的对象索引 则没有脏对象
        if (this.lastBorrowObjectIndex >= this._before_lastBorrowObjectIndex) {
            return clearNum;
        }
        // let start = Math.min(this._before_lastBorrowObjectIndex, this.lastBorrowObjectIndex)
        // let End = Math.max(this._before_lastBorrowObjectIndex, this.lastBorrowObjectIndex)
        // let start = Math.min(this._before_lastBorrowObjectIndex, this.lastBorrowObjectIndex)
        // let End = Math.max(this._before_lastBorrowObjectIndex, this.lastBorrowObjectIndex)
        //若本次 获取的对象索引 小于 上次获取的对象索引  则有脏对象
        for (let i = this.lastBorrowObjectIndex + 1; i <= this._before_lastBorrowObjectIndex; i++) {
            callBack(this.objects[i]);
            clearNum++;
        }
        return clearNum;
    }
    /**
     * 获取活跃的对象数量
     */
    getNumActive() {
        let num = 0;
        for (let i = 0; i < this.objectIdleStatus.length; i++) {
            if (this.objectIdleStatus[i] == false) {
                num++;
            }
        }
        return num;
    }
    /**
     * 获取空闲的对象数量
     */
    getNumIdle() {
        let num = 0;
        for (let i = 0; i < this.objectIdleStatus.length; i++) {
            if (this.objectIdleStatus[i] == true) {
                num++;
            }
        }
        return num;
    }
}
