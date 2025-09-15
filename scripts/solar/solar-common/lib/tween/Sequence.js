/**
 * Utils
 */
export default class Sequence {
    static _nextId = 0;
    static nextId() {
        return Sequence._nextId++;
    }
}
