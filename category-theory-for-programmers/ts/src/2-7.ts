interface Hashable { // do something to work with all types
    hash(): string;
}
// 1. memoize
function memoize<A extends Hashable, B>(fn: (x: A) => B): (x: A) => B {
    const memory = new Map<string, B>();
    return (data) => {
        const cachedValue = memory.get(data.hash());
        if (cachedValue) {
            return cachedValue;
        }
        return memory.set(data.hash(), fn(data)).get(data.hash())!; // should not ever be undefined
    }
}