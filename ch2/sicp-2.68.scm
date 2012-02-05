(define (encode-symbol symbol tree)
  (define (enc-sym-iter subtree bits)
    (if (leaf? subtree)
        bits
        (let ((left (left-branch subtree))
              (right (right-branch subtree)))
          (cond ((inlist? (symbols left) symbol)
                (enc-sym-iter left (cons 0 bits)))
                ((inlist? (symbols right) symbol)
                (enc-sym-iter right (cons 1 bits)))
                (else (error "Symbol not found"))))))
  (enc-sym-iter tree '()))

(define (inlist? l sym)
  (if (null? l)
      #f
      (if (eq? sym (car l))
          #t
          (inlist? (cdr l) sym))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
            (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))       

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (decode bits tree)

(define (decode-1 bits current-branch)
  (if (null? bits)
      '()
      (let ((next-branch
           (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
            (cons (symbol-leaf next-branch)
                  (decode-1 (cdr bits) tree))
            (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit - CHOOSE-BRANCH" bit))))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

