(define (make-f)
  (define last 1)
  (define (next x)
    (set! last (* last x))
    last)
  next)

(define f (make-f))
