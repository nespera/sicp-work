(define (unique-pairs n)
  (define (pairs-less-than y)
    (map (lambda(x) (list y x)) (enumerate-interval 1 (- y 1))))
  (accumulate (lambda (x l) (append (pairs-less-than x) l)) 
              '() 
              (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
     (filter prime-sum? (unique-pairs n))))

(define (prime-sum? pair)
      (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
      (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
    
(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ low 1) high))))(define (enumerate-interval low high)
      (if (> low high)
          '()
          (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
      (accumulate op initial (cdr sequence)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))
