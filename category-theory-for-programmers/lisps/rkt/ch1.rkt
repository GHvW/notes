#lang typed/racket

(require threading)

(: identity (All (a) (-> a a)))
(define (identity it) it)

(: compose (All (a b c) (-> (-> a b) (-> b c) (-> a c))))
(define (compose f1 f2)
    (lambda ([data : a]) (f2 (f1 data))))