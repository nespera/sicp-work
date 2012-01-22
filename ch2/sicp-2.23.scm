(define (for-each proc l)
  (cond ((null? l) #t)
    (else (proc (car l)) (for-each proc (cdr l)))))
