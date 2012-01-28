(define (square x) (* x x))

(define (tree-map f tree)
  (map (lambda (s)
	(if (pair? s)
          (square-tree s)
          (f s)))
       tree))

(define (square-tree tree) (tree-map square tree))

