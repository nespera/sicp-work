(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (gcd a b)
      (if (= b 0)
          a
          (gcd b (remainder a b))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
     (newline)
     (display (numer x))
     (display "/")
     (display (denom x)))

(define (sign x) (if (= x 0) 0 (/ x (abs x))))

(define (make-rat n d)
  (define (make-rat-sign n d s)
     (let ((g (gcd n d)))
       (cons (* s (/ n g)) (/ d g))))
  (make-rat-sign (abs n) (abs d) (* (sign n) (sign d))))

