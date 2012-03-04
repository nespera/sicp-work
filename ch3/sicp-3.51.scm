(define (show x)
  (display-line x)
  x)

(define (display-line x)
  (newline)
  (display x))

(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons low 
          (delay (stream-enumerate-interval (+ low 1) high)))))

(define x (stream-map 
           show
           (stream-enumerate-interval 0 10)))

