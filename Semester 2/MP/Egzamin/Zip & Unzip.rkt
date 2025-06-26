#lang racket

(require rackunit)

(define (zip xs ys)
  (define f1
    (lambda (y acc) (cons (cons (cons y (cadr acc)) (car acc)) (cddr acc))))
  (define f2
    (lambda (y acc) (cons (cons (cons (cadr acc) y) (car acc)) (cddr acc))))

  (foldl cons null (cond [(<= (length xs) (length ys))
                          (car (foldl f1 (cons null ys) xs))]
                         [else
						  (car (foldl f2 (cons null xs) ys))])))

(define (unzip-foldr xs)
  (foldr (lambda (x acc) (list (cons (car x) (car acc))
                                       (cons (cdr x) (cadr acc))))
        (list null null)
         xs))

(define (unzip-foldl xs)
  (let ([result (foldl (lambda (x acc) (list (cons (car x) (car acc))
                               (cons (cdr x) (cadr acc))))
        (list null null)
         xs)])
       (map reverse result)))

; (zip '(1 2 3)   '(a b c d))

(define (my-zip xs ys)
  (define (cut-list n xs)
    (if (= n 0)
        null
        (cons (car xs) (cut-list (- n 1) (cdr xs)))))

  (cond [(= (length xs) (length ys)) (map cons xs ys)]
        [(< (length xs) (length ys)) (map cons xs (cut-list (length xs) ys))]
        [(> (length xs) (length ys)) (map cons (cut-list (length ys) xs) ys)]))

(define (my-unzip xs)
  (list (map car xs) (map cdr xs)))


(my-zip '(1 2 3)   '(a b c d))
(my-zip '(1 2 3 4)   '(a b c d))
(my-zip '(1 2 3 4 5)   '(a b c d))

(my-unzip (my-zip '(1 2 3)   '(a b c d)))
(my-unzip (my-zip '(1 2 3 4)   '(a b c d)))
(my-unzip (my-zip '(1 2 3 4 5)   '(a b c d)))

(unzip-foldr (my-zip '(1 2 3)   '(a b c d)))
(unzip-foldr (my-zip '(1 2 3 4)   '(a b c d)))
(unzip-foldr (my-zip '(1 2 3 4 5)   '(a b c d)))

(unzip-foldl (my-zip '(1 2 3)   '(a b c d)))
(unzip-foldl (my-zip '(1 2 3 4)   '(a b c d)))
(unzip-foldl (my-zip '(1 2 3 4 5)   '(a b c d)))

(check-equal? (zip '(1 2 3)   '(a b c))   '((1 . a) (2 . b) (3 . c)))
(check-equal? (zip '(1 2 3)   '(a b c d)) '((1 . a) (2 . b) (3 . c)))
(check-equal? (zip '(1 2 3 4) '(a b c))   '((1 . a) (2 . b) (3 . c)))

(define (my-even-pos xs)
  (define (add-index-to-elem xs)
    (define (add-index x xs)
      (if (null? xs)
          null
          (cons (cons (car xs) x) (add-index (+ x 1) (cdr xs)))))

    (add-index 0 xs))

  (define (list-fst-elem-of-elem xs)
    (map (lambda (x) (car x)) xs))

  (define (get-even-pos-elem xs)
    (filter (lambda (x) (even? (cdr x))) xs))

  (list-fst-elem-of-elem (get-even-pos-elem (add-index-to-elem xs))))

(define (even-pos xs)
  (foldl cons null (cdr (foldl (lambda (e acc)
                                 (if (= (modulo (car acc) 2) 0)
                                     (cons (+ (car acc) 1) (cons e (cdr acc)))
                                     (cons (+ (car acc) 1) (cdr acc))))
                               (cons 0 null)
                               xs))))

(check-equal? (even-pos '(0 1))         '(0))
(check-equal? (even-pos '(0 1 2 3))     '(0 2))
(check-equal? (even-pos '(0 1 2 3 4 5)) '(0 2 4))

(check-equal? (my-even-pos '(0 1))         '(0))
(check-equal? (my-even-pos '(0 1 2 3))     '(0 2))
(check-equal? (my-even-pos '(0 1 2 3 4 5)) '(0 2 4))

(my-even-pos '(0 1 2 3 4 5))
