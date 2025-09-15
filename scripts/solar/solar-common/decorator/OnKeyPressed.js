import InputUtil from "@/InputUtil";
export default function OnKeyPressed(key) {
    return function (method, context) {
        InputUtil.onKeyPressed(key, () => {
            print("OnKeyPressed测试:" + tostring(context.name));
            method.apply(null);
        });
        return method;
    };
}
