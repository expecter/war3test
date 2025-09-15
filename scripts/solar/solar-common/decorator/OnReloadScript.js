export default function OnReloadScript(method, context) {
    se.on("_sl_重载脚本", data => {
        method();
    });
    return method;
}
