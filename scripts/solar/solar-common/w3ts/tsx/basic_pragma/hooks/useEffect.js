/** @noSelfInFile **/
import { hookContext, hookMap } from "./context";
import { argsChanged } from "./helpers";
import "./reconcilerHooks";
export const useEffect = (callback, inputs) => {
    const index = hookContext.currentIndex++;
    const hooks = hookMap.get(hookContext.currentInstance);
    const oldState = hooks[index];
    const state = (oldState ??
        (hooks[index] = { type: "effect" }));
    if (state.type !== "effect")
        throw `Expected an effect hook at index ${index}, got ${state.type}`;
    if (!oldState ||
        (state.lastInputs && inputs && argsChanged(state.lastInputs, inputs))) {
        if (state.cleanup)
            state.cleanup();
        state.lastInputs = inputs;
        state.cleanup = callback();
    }
};
