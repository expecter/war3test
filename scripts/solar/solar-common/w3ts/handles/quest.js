/** @noSelfInFile **/
import { Handle } from "./handle";
export class QuestItem extends Handle {
    constructor(whichQuest) {
        if (Handle.initFromHandle()) {
            super();
        }
        else {
            super(QuestCreateItem(whichQuest.handle));
        }
    }
    /**
     * 任务物品介绍
     */
    setDescription(description) {
        QuestItemSetDescription(this.handle, description);
    }
    /**
     * 任务条件完成
     */
    get completed() {
        return IsQuestItemCompleted(this.handle);
    }
    /**
     * 任务物品发货
     */
    set completed(completed) {
        QuestItemSetCompleted(this.handle, completed);
    }
}
export class Quest extends Handle {
    constructor() {
        super(Handle.initFromHandle() ? undefined : CreateQuest());
    }
    /**
     * 任务完成
     */
    get completed() {
        return IsQuestCompleted(this.handle);
    }
    /**
     * 任务完成
     */
    set completed(completed) {
        QuestSetCompleted(this.handle, completed);
    }
    /**
     * 任务找到
     */
    get discovered() {
        return IsQuestDiscovered(this.handle);
    }
    /**
     * 任务找到
     */
    set discovered(discovered) {
        QuestSetDiscovered(this.handle, discovered);
    }
    /**
     * 允许任务
     */
    get enabled() {
        return IsQuestEnabled(this.handle);
    }
    /**
     * 允许任务
     */
    set enabled(enabled) {
        QuestSetEnabled(this.handle, enabled);
    }
    /**
     * 任务失败
     */
    get failed() {
        return IsQuestFailed(this.handle);
    }
    /**
     * 任务失败
     */
    set failed(failed) {
        QuestSetFailed(this.handle, failed);
    }
    /**
     * 任务是必须完成的
     */
    get required() {
        return IsQuestRequired(this.handle);
    }
    /**
     * 任务是必须完成的
     */
    set required(required) {
        QuestSetRequired(this.handle, required);
    }
    addItem(description) {
        const questItem = new QuestItem(this);
        questItem.setDescription(description);
        return questItem;
    }
    destroy() {
        DestroyQuest(this.handle);
    }
    setDescription(description) {
        QuestSetDescription(this.handle, description);
    }
    setIcon(iconPath) {
        QuestSetIconPath(this.handle, iconPath);
    }
    setTitle(title) {
        QuestSetTitle(this.handle, title);
    }
    static flashQuestDialogButton() {
        FlashQuestDialogButton();
    }
    static forceQuestDialogUpdate() {
        ForceQuestDialogUpdate();
    }
    static fromHandle(handle) {
        return this.getObject(handle);
    }
}
