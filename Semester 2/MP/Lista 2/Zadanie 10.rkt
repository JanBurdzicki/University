#lang racket

(define (split xs)
	(define size_xs (floor (/ (length xs) 2)))

    (define (loop xs acc)
		(if (< (length xs) (+ size_xs  1))
			(cons acc xs)
			(loop (cdr xs)
                (cons (car xs) acc))))
	(loop xs null))

;(split (list 20 10 76 54 4 24 22))
;(car(split (list 20 10 76 54 4 24 22)))
;(cdr(split (list 20 10 76 54 4 24 22)))

(define (merge xs ys)
	(define (loop xs ys acc)
		(if (and (null? xs) (null? ys))
			acc
			(if (null? xs)
				(loop xs (cdr ys) (append acc (list(car ys))))
				(if (null? ys)
					(loop (cdr xs) ys (append acc (list(car xs))))
					(if ( > (car xs) (car ys))
						(loop xs (cdr ys) (append acc (list(car ys))))
						(loop (cdr xs) ys (append acc (list(car xs)))))))))
	(loop xs ys null))
;(merge (list 20 30 52) (list 50 55 100))

(define (merge-sort xs)
	(if (or (= (length xs) 1) (= (length xs) 0))
		xs
		(merge (merge-sort(car (split xs)))(merge-sort(cdr (split xs))))))

(merge-sort (list 3 2 34 4))