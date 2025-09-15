/** @noSelfInFile **/
const baseCreateFrame = () => {
    throw "Adapter has not implemented createFrame";
};
const baseCleanupFrame = () => {
    throw "Adapter has not implemented cleanupFrame";
};
const baseUpdateFrameProperties = () => {
    throw "Adapter has not implemented updateFrameProperties";
};
const baseGetParent = () => {
    throw "Adapter has not implemented getParent";
};
const baseScheduleUpdate = () => {
    throw "Adapter has not implemented scheduleUdate";
};
const internalAdapter = {
    createFrame: baseCreateFrame,
    cleanupFrame: baseCleanupFrame,
    updateFrameProperties: baseUpdateFrameProperties,
    getParent: baseGetParent,
    scheduleUpdate: baseScheduleUpdate,
};
export const adapter = internalAdapter;
export const setAdapter = (adapter) => {
    // We do this just to ensure we set all methods on internalAdapter
    internalAdapter.createFrame = adapter.createFrame ?? baseCreateFrame;
    internalAdapter.cleanupFrame = adapter.cleanupFrame ?? baseCleanupFrame;
    internalAdapter.getParent = adapter.getParent ?? baseGetParent;
    internalAdapter.updateFrameProperties =
        adapter.updateFrameProperties ?? baseUpdateFrameProperties;
    internalAdapter.scheduleUpdate =
        adapter.scheduleUpdate ?? baseScheduleUpdate;
};
