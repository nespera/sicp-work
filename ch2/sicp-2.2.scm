(define (make-segment a b)
  (cons a b))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (avg x y) (/ (+ x y) 2.0)) 

(define (midpoint-segment s)
  (let ((a (start-segment s))
        (b (end-segment s)))
    (make-point (avg (x-point a) (x-point b))
                (avg (y-point a) (y-point b))))) 
