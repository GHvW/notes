#lang typed/racket

(: square (-> Float Float))
(define (square x) (* x x))

(: average (-> Float Float Float))
(define (average x y) (/ (+ x y) 2))

(: improve (-> Float Float Float))
(define (improve guess x) (average guess (/ x guess)))

(: new-good-enough? (-> Float Float Boolean))
(define (new-good-enough? guess old-guess)
  (<= (abs (- old-guess guess)) (* guess 0.001)))

(: sqrt-iter (-> Float Float Float Float))
(define (sqrt-iter guess old-guess x)
  (if (new-good-enough? guess old-guess)
      guess
      (sqrt-iter (improve guess x) guess
                 x)))

(: sqrt (-> Float Float))
(define (sqrt x) (sqrt-iter 1.0 0.0 x))

;;Test
(sqrt 4.0)