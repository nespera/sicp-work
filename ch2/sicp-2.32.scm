(define (subsets s)
  (if (null? s)
    (list (list))
    (let ((rest (subsets (cdr s))))
      (append rest (map (cons-this (car s)) rest)))))

(define (cons-this x)
  (lambda (l) (cons x l))) 

