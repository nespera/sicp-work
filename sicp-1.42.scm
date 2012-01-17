(define (compose f g)
  (lambda (x) (f (g x)))) 

(define (inc x) (+ x 1))

;returns 49
(display ((compose square inc) 6))
