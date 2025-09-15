/** @noSelfInFile **/
import { useReducer } from "./useReducer";
export const useState = (initialState) => useReducer((oldState, v) => {
    if (typeof v !== "function")
        return v;
    return v(oldState);
}, initialState);
export const useForceUpdate = () => {
    const [, setTick] = useState(0);
    const update = () => {
        setTick((tick) => tick + 1);
    };
    return update;
};
