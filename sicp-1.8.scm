(define (cbrt-iter guess prev-guess x)
      (if (good-enough? guess prev-guess x)
          guess
          (cbrt-iter (improve guess x)
                     guess
                     x)))

(define (improve y x)
      (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (cbrt x)
    (cbrt-iter 1.0 0.0 x))

(define (good-enough? guess prev-guess x)
      (< (/ (abs (- prev-guess guess)) guess) 0.001))

