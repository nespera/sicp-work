(define (reverse l)
  (define (rev l r)
    (if (null? l)
      r
      (rev (cdr l) (cons (car l) r))))
  (rev l (list)))
