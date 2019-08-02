#lang typed/racket

;;; Compute elements of Pascal's triangle via a recursive process

(: pascal-tri (-> Integer Integer Integer))
(define (pascal-tri row col)
  (if (or (= col 0) (= col row))
      1
      (+ (pascal-tri (- row 1) (- col 1))
         (pascal-tri (- row 1) col))))

;Test
(pascal-tri 10 5)
