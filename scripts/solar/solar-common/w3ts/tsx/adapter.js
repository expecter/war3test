/** @noSelfInFile **/
import { flushUpdates, } from "./basic_pragma";
import AdapterUtil, { tooltipMap } from "./AdapterUtil";
import CreateFrameUtil from "./CreateFrameUtil";
/**
 * Sets the UI scale for pixel measurements. Defaults to 1600.
 */
let updateScheduled = false;
const schedulingTimer = CreateTimer();
export const adapter = {
    createFrame: (jsxType, parentFrame, props) => {
        return CreateFrameUtil.createFrame(jsxType, parentFrame, props);
    },
    cleanupFrame: (frame) => {
        DzDestroyFrame(frame);
        const existingTooltip = tooltipMap["FT_" + frame];
        if (existingTooltip)
            adapter.cleanupFrame(existingTooltip);
    },
    updateFrameProperties: (frame, prevProps, nextProps) => {
        let prop;
        // Clear removed props
        for (prop in prevProps) {
            if (!(prop in nextProps)) {
                try {
                    AdapterUtil.setProp(frame, prop);
                }
                catch (err) {
                    print(err);
                }
            }
        }
        // Add new props
        for (prop in nextProps) {
            if (nextProps[prop] !== prevProps[prop]) {
                try {
                    AdapterUtil.setProp(frame, prop, nextProps[prop], prevProps[prop]);
                }
                catch (err) {
                    print(err);
                }
            }
        }
    },
    getParent: (frame) => DzFrameGetParent(frame),
    scheduleUpdate: () => {
        if (updateScheduled)
            return;
        updateScheduled = true;
        TimerStart(schedulingTimer, 0, false, () => {
            updateScheduled = false;
            flushUpdates();
        });
    },
};
