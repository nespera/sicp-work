(define (sqrt x)  
  (define (sqrt-iter guess prev)
        (if (good-enough? guess prev)
            guess
            (sqrt-iter (improve guess)
                       guess)))
  (define (improve guess)
        (average guess (/ x guess)))
  (define (good-enough? guess prev)
        (< (/ (abs (- prev guess)) guess) 0.001))
  (sqrt-iter 1.0 0.0))

(define (average x y)
      (/ (+ x y) 2))
