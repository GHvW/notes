#lang typed/racket

;;; recursive
(: f (-> Integer Integer))
(define (f n)
  (if (< n 3) n
        (+ (f (- n 1))
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3))))))

;;; iterative
(: f-iter (-> Integer Integer Integer Integer Integer Integer))
(define (f-iter x y total count n)
  (cond
    [(< n 3) n]
    [(= count n) total]
    [else (f-iter y total (+ (* 3 x) (* 2 y) total) (+ count 1) n)]))

(: f-p (-> Integer Integer))
(define (f-p n) (f-iter 0 1 2 2 n))

;Test
(f 10)
(f-p 10)