(define (sqrt-iter guess prev-guess x)
      (new-if (good-enough? guess prev-guess x)
          guess
          (sqrt-iter (improve guess x)
                     guess
                     x)))
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (improve guess x)
      (average guess (/ x guess)))

(define (sqrt x)
    (sqrt-iter 1.0 0.0 x))

(define (average x y)
      (/ (+ x y) 2))

(define (good-enough? guess prev-guess x)
      (< (/ (abs (- prev-guess guess)) guess) 0.001))

(define (square x) (* x x))
