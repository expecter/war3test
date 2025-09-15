var FrameEvent;
(function (FrameEvent) {
    FrameEvent[FrameEvent["controlClick"] = 1] = "controlClick";
    FrameEvent[FrameEvent["mouseEnter"] = 2] = "mouseEnter";
    FrameEvent[FrameEvent["mouseLeave"] = 3] = "mouseLeave";
    FrameEvent[FrameEvent["mouseUp"] = 4] = "mouseUp";
    FrameEvent[FrameEvent["mouseDown"] = 5] = "mouseDown";
    FrameEvent[FrameEvent["mouseWheel"] = 6] = "mouseWheel";
    FrameEvent[FrameEvent["checkboxChecked"] = 7] = "checkboxChecked";
    FrameEvent[FrameEvent["checkboxUnchecked"] = 8] = "checkboxUnchecked";
    FrameEvent[FrameEvent["editboxTextChanged"] = 9] = "editboxTextChanged";
    FrameEvent[FrameEvent["popupmenuItemChanged"] = 10] = "popupmenuItemChanged";
    FrameEvent[FrameEvent["mouseDoubleClick"] = 12] = "mouseDoubleClick";
})(FrameEvent || (FrameEvent = {}));
export default FrameEvent;
