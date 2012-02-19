(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
            (/ trials-passed trials))
          ((experiment)
            (iter (- trials-remaining 1)
                  (+ trials-passed 1)))
          (else
            (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (integral-experiment)
    (P (random-in-range x1 x2) (random-in-range y1 y2)))
  (monte-carlo trials integral-experiment))

(define (pi-estimate trials)
  (define (circle-predicate x y)
    (<= (+ (square (- x 5.0)) (square (- y 7.0))) 9.0))
  (* 4.0 (estimate-integral circle-predicate 2.0 8.0 4.0 10.0 trials)))
