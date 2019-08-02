#lang typed/racket

(: square (-> Integer Integer))
(define (square x) (* x x))

(: sum-squares (-> Integer Integer Integer))
(define (sum-squares x y) (+ (square x) (square y)))

(: ex-one-three (-> Integer Integer Integer Integer))
(define (ex-one-three x y z)
  (cond
    [(and (< x y) (< x z)) (sum-squares y z)]
    [(and (< y x) (< y z)) (sum-squares x z)]
    [else (sum-squares x y)]))

;Test
(square 3) ;9
(sum-squares 3 4) ;25
(ex-one-three 3 4 5) ;41
(ex-one-three 4 3 5) ;41
(ex-one-three 5 4 3) ;41