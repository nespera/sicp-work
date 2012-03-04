(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons low
          (delay (stream-enumerate-interval (+ low 1) high)))))

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq
  (stream-map accum
              (stream-enumerate-interval 1 20)))

(define y (stream-filter even? seq))

(define z (stream-filter
  (lambda (x) (= (remainder x 5) 0)) seq))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

