(define (cube x) (* x x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
      (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (term-y k) (* (coeff-y k) (f (+ a (* k h)))))
  (define (coeff-y k) 
    (cond ((= 0 k) 1)
	   ((= n k) 1)
	   ((even? k) 2)
	   (else 4)))
  (define (simp-int-iter step)
    (cond ((= 0 step) term-y 0)
	  (else (+ (term-y step) (simp-int-iter (- step 1))))))
  (* (/ h 3.0) (simp-int-iter n)))

