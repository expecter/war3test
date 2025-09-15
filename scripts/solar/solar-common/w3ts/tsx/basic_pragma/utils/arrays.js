import { isLua } from "../common";
export const getLength = (arr) => isLua
    ? Object.keys(arr).reduce((max, key) => {
        const keyAsNumber = parseInt(key);
        if (typeof keyAsNumber === "number")
            return max > keyAsNumber ? max : keyAsNumber;
        return max;
    }, 0)
    : arr.length;
/**
 * Removes nils from the array
 */
export const compact = (arr) => {
    const length = getLength(arr);
    const newArr = [];
    for (let i = 0; i < length; i++) {
        const val = arr[i];
        if (val != null)
            newArr.push(val);
    }
    return newArr;
};
export const forEach = (arr, fn) => {
    const length = getLength(arr);
    for (let i = 0; i < length; i++)
        fn(arr[i], i);
};
