(define (pascal row column) 
	(cond ((< column 1) 0)
		((> column row) 0)
		((= row 1) 1)
		(else (+ (pascal (- row 1) (- column 1)) 
			(pascal (- row 1) column))))) 
