(define (same-parity head . rest) 
  (define (equal-parity? a)
    (= (remainder head 2) (remainder a 2)))
  (define (sp-iter b r)
    (if (null? r)
      b
      (sp-iter 
        (if (equal-parity? (car r))
          (cons (car r) b)
          b)
        (cdr r))))
  (cons head (reverse (sp-iter (list) rest))))


