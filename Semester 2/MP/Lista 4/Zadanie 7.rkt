#lang racket

(require rackunit)

(define empty-queue
	(cons (list) (list)))
(define (empty? q)
	(and (null? (car q)) (null? (cdr q))))

empty-queue

(check-true (equal? empty-queue (cons null null)))

(car empty-queue)

(define test (cons (append (car empty-queue) (list 2)) (append (cdr empty-queue) (list 10 15))))

(cdr test)

(empty? test)

(define (front q)
	(if (empty? q)
		null
		(if (null? (car q))
			(car (reverse (cdr q)))
			(caar q))))
(define (pop q)
	(if (empty? q)
		empty-queue
		(if (null? (car q))
			(cons  (cdr (reverse (cdr q))) null)
			(if (null? (cdar q))
				(cons null (cdr q))
				(cons (cdar q) (cdr q))))))

(define (push-back x q)
	(if (null? (cdr q))
		(cons (car q) (cons x null))
		(cons (car q) (cons x  (cdr q)))))

(cons 5 (cons 2 (cons 3 null)))

(define tescior (cons 5 ( cons 2 null)))

(cddr (reverse tescior))

(push-back 2 (pop (pop (push-back 8 (push-back 8 (push-back 8 (pop (push-back 3 (push-back 2 empty-queue)))))))))

(push-back 6 (push-back 5 (push-back 4 (pop (push-back 3 (push-back 2 empty-queue))))))