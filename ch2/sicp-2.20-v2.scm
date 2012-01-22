(define (same-parity head . rest) 
  (define (equal-parity? a)
    (= (remainder head 2) (remainder a 2)))
  (define (sp-iter r)
    (if (null? r)
      r
      (if (equal-parity? (car r))
          (cons (car r) (sp-iter (cdr r)))
          (sp-iter (cdr r)))))
  (cons head (sp-iter rest)))


