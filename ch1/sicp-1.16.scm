(define (fast-expt b n)
      (cond ((= n 0) 1)
            ((even? n) (square (fast-expt b (/ n 2))))
            (else (* b (fast-expt b (- n 1))))))

(define (fast-expt2 b n)
	(fe2-iter b n 1))

(define (fe2-iter b n a)
	(cond ((= n 0) a)
		((even? n) (fe2-iter (square b) (- (/ n 2) 1) (* a (square b))))
		(else (fe2-iter b (- n 1) (* a b)))))

(define (even? n)
      (= (remainder n 2) 0))
