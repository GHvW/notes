// 1. identity
function identity<A>(data: A): A {
    return data;
}

// 2. composition
function composition<A, B, C>(f1: (x: A) => B, f2: (x: B) => C): (x: A) => C {
    return (data) => {
        return f2(f1(data));
    }
}
