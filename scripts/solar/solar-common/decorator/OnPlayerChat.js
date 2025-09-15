export default function OnPlayerChat(chatMessage) {
    return function (method, context) {
        se.onPlayerChat(chatMessage, () => {
            print("onPlayerChat测试:" + tostring(context.name));
            method.apply(null);
        });
        return method;
    };
}
