#lang racket

(require rackunit)

(define (negatives n)
	(build-list n (lambda (x) (- (+ x 1))) ))

(check-equal? (negatives 5) `(-1 -2 -3 -4 -5))

(negatives 5)

(define (reciprocals n)
	(build-list n (lambda (x) (/ (+ x 1))) ) )

(check-equal? (reciprocals 5) `(1 1/2 1/3 1/4 1/5))

(reciprocals 5)

(define (evens n)
	(build-list n (lambda (x) (* x 2))) )

(check-equal? (evens 5) `(0 2 4 6 8))

(evens 5)

(define (identityM n)
	(build-list n (lambda (x) (build-list n (lambda (y) (if (= x y) 1 0))))))

(check-equal? (identityM 3) `((1 0 0) (0 1 0) (0 0 1)))

(identityM 3)

(check-equal? (identityM 5) `((1 0 0 0 0) (0 1 0 0 0) (0 0 1 0 0) (0 0 0 1 0) (0 0 0 0 1)))

(identityM 5)
