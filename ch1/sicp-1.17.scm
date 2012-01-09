(define (mult2 a b)
	(cond ((= a 0) 0)
		((= b 0) 0)
		((= a 1) b)
		((even? a) (double (mult2 b (halve a))))
		(else (+ b (mult2 b (- a 1))))))

(define (even? n)
      (= (remainder n 2) 0))

(define (double x)
	(+ x x))

(define (halve x)
	(/ x 2))
