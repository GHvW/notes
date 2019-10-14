#lang typed/racket

(require threading)

(: identity (All (a) (-> a a)))
(define (identity it) it)
