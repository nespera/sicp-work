(define (last-pair l)
  (if (= 1 (length l))
    l
    (last-pair (cdr l))))
