import DebugSgpUtil from "@/DebugSgpUtil";
export default function AddCustomMenu(menuName, category = "基础", editorActionCommand, editorActionCommandParams) {
    return function (method, context) {
        DebugSgpUtil.addCustomMenu(menuName, method, category, editorActionCommand, editorActionCommandParams);
        return method;
    };
}
