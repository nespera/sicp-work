(define (make-monitored f)
  (let ((count 0))
    (lambda (arg)
      (cond ((eq? arg 'how-many-calls?) count)
            ((eq? arg 'reset-count)
              (begin (set! count 0) 0))
            (else 
              (begin (set! count (+ count 1))
                     (f arg)))))))

