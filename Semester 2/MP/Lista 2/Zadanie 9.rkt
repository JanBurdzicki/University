#lang racket

(define (select xs)
	(define (it xs minimum previous acc)
		(if (null? xs)
			acc
			(it (cdr xs)
				(if (< (car xs) minimum)
					(car xs)
					minimum)
			(append previous (list(car xs)))
            (if(< (car xs) minimum)
               (append (list(car xs))
                       previous
                       (cdr xs))
               acc))))

	(if (null? xs)
		xs
		(it xs (car xs) null xs)))

(define (select-sort xs)
	(define (it xs acc)

    (if (null? xs)
        acc
        (it (cdr (select xs))
            (append acc
				(list (car(select xs)))))))
	(it xs null))

(select (list 20 10 1))
(select (list 4 3 1 2 5))

(select-sort (list 15 -2 123 22 3))
(select-sort (list 1 5 0 7 1 4 1 0))