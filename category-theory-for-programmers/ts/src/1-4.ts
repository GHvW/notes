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

function curried_composition<A, B, C>(f1: (x: A) => B): (f2: (x: B) => C) => ((x: A) => C) {
    return (f2) => (data: A) => f2(f1(data));
}

// 3. use composition to test identity
function test(): void {
    const myAge = (age: number) => `I'm ${age} years old.`;
    const charCount = (s: string) => s.length;

    const idOnA = composition<string, string, number>(identity, charCount);
    const idOnB = composition(myAge, identity);

    if (idOnA("Hello World!") === charCount("Hello World!")) {
        console.log("Id on A is good!");
    }

    if (idOnB(34) === myAge(34)) {
        console.log("Id on B is good!");
    }
}

test();