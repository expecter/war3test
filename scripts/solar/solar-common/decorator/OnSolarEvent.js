export default function OnSolarEvent(type) {
    return function (method, context) {
        se.on(type, (event, solarTrigger) => {
            method.apply(null, event);
        });
        return method;
    };
}
