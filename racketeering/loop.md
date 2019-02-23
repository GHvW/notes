
Because I didn't know how to write a for loop but knew I had recursion
I thought I'd see what I'd come up with if I wrote a recursive for loop

```racket
#lang racket

(define (loop state predicate operation)
  (if (predicate state)
      state
      (loop (operation state) predicate operation)))
```

Usage
```racket
(loop 0 (lambda (x) (>= x 10))
        (lambda (x)
          (writeln x)
          (+ x 1)))
```