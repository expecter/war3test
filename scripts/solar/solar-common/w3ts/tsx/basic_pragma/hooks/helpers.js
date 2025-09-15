/** @noSelfInFile **/
export const argsChanged = (oldArgs, newArgs) => oldArgs.length !== newArgs.length ||
    newArgs.some((arg, index) => arg !== oldArgs[index]);
