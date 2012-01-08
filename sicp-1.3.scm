(define (sqtop2 x y z) 
	(-
		(+ (square x) (square y) (square z))
		(square (min x y z))
	)
)
