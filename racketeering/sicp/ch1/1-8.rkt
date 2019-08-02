#lang typed/racket

(: cube (-> Float Float))
(define (cube x) (* x x x))

(: square (-> Float Float))
(define (square x) (* x x))

(: close-enough? (-> Float Float Boolean))
(define (close-enough? guess old-guess)
  (<= (abs (- guess old-guess)) (* guess 0.001)))

(: improve (-> Float Float Float))
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(: cube-rt-iter (-> Float Float Float Float))
(define (cube-rt-iter guess old-guess x)
  (if (close-enough? guess old-guess)
    guess
    (cube-rt-iter (improve guess x) guess x)))

(: cube-rt (-> Float Float))
(define (cube-rt x) (cube-rt-iter 1.0 0.0 x))


;;Test
(cube-rt 27.0)