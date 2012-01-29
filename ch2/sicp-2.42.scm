; queens as defined in the book
(define (queens board-size)
     (define (queen-cols k)
       (if (= k 0)
           (list empty-board)
           (filter
            (lambda (positions) (safe? k positions))
            (flatmap
             (lambda (rest-of-queens)
               (map (lambda (new-row)
                      (adjoin-position new-row
                                       k
                                       rest-of-queens))
                    (enumerate-interval 1 board-size)))
             (queen-cols (- k 1))))))
     (queen-cols board-size))

; my code....

(define empty-board (list))

(define (adjoin-position row col board) (cons (list row col) board))

(define (get-from-col k positions)
    (if (null? positions)
        '()
        (if (= k (caar positions))
            (car positions)
            (get-from-col k (cdr positions)))))

(define (remove-col k positions)
   (let ((to-remove (get-from-col k positions)))
     (if (null? to-remove)
        positions
        (filter (lambda (x) (not (equal-pos to-remove x))) positions))))

(define (equal-pos x y)
  (and (same-col x y) (same-row x y)))

(define (same-col x y)
  (= (car x) (car y)))

(define (same-row x y)
  (= (cadr x) (cadr y)))

(define (same-diag x y)
  (= (abs (- (car x) (car y))) (abs (- (cadr x) (cadr y)))))

(define (unsafe k board)
  (let ((candidate (get-from-col k board))
        (rest (remove-col k board)))
  (if (null? candidate)
    '()
    (filter (lambda (x) (same-col x candidate))
      (filter (lambda (x) (same-row x candidate))
        (filter (lambda (x) (same-diag x candidate))
                rest))))))

(define (safe? k board)
  (null? (unsafe k board)))

; These were defined earlier

(define (filter predicate sequence)
     (cond ((null? sequence) '())
           ((predicate (car sequence))
            (cons (car sequence)
                  (filter predicate (cdr sequence))))
           (else (filter predicate (cdr sequence)))))

(define (enumerate-interval low high)
      (if (> low high)
          '()
          (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
      (accumulate append '() (map proc seq)))

 (define (accumulate op initial sequence)
     (if (null? sequence)
         initial
         (op (car sequence)
             (accumulate op initial (cdr sequence)))))
