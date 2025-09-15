/** @noSelfInFile **/
import { Handle } from "./handle";
import DataBase from "../../common/DataBase";
export class DialogButton extends Handle {
    constructor(whichDialog, text, hotkey = 0, quit = false, score = false) {
        if (Handle.initFromHandle()) {
            super();
        }
        else if (!quit) {
            super(DialogAddButton(whichDialog.handle, text, hotkey));
        }
        else {
            super(DialogAddQuitButton(whichDialog.handle, score, text, hotkey));
        }
    }
    get solarData() {
        return DataBase.getDialogButtonSolarData(this.handle);
    }
    set solarData(obj) {
        DataBase.setDataByHandle("+dlb", this.handle, obj);
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
export class Dialog extends Handle {
    constructor() {
        super(Handle.initFromHandle() ? undefined : DialogCreate());
    }
    /**
     * 添加按钮
     * @param text
     * @param hotkey
     * @param quit
     * @param score
     */
    addButton(text, hotkey = 0, quit = false, score = false) {
        return new DialogButton(this, text, hotkey, quit, score);
    }
    /**
     * 清除
     */
    clear() {
        DialogClear(this.handle);
    }
    /**
     * 销毁
     */
    destroy() {
        DialogDestroy(this.handle);
    }
    /**
     * 显示
     */
    display(whichPlayer, flag) {
        DialogDisplay(whichPlayer.handle, this.handle, flag);
    }
    /**
     * 设置消息
     */
    setMessage(whichMessage) {
        DialogSetMessage(this.handle, whichMessage);
    }
    /**
     * 从handle封装对话框
     */
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
