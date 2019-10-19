let conjunction p q =
    p && q

// inclusive or
let disjunction p q =
    p || q

// xor
let xDisjunction p q =
    p <> q

let contrapositive p q =
    not p && not q

let inverse p q =
    q && p

