#lang racket

(define (mrev! mx mxs)
	(cond [(null? mxs) mx]
		  [(null? (mcdr mxs))
		   ; nowy pierwszy
		   (begin
                     (set-mcdr! mxs mx)
                     mxs)]
		   ; rest to będzie nowy początek
		  [else (let ([rest (mrev! mxs (mcdr mxs))])
			     (begin
                               (set-mcdr! mxs mx)
                               rest))]))

(define (mreverse! mxs)
  (if (null? mxs)
      mxs
      (let ([new-mxs (mrev! mxs (mcdr mxs))])
           (begin
             ; zwolnienie pamięci
             (set-mcdr! mxs null)
             new-mxs))))

(define (mlist xs)
  (if (null? xs)
      null
	  (mcons (car xs) (mlist (cdr xs)))))

(define (last mxs)
  (if (null? (mcdr mxs))
      mxs
	  (last (mcdr mxs))))

(define (cycle! mxs)
  (if (null? mxs)
      null
	  (begin
            (set-mcdr! (last mxs) mxs)
            mxs)))

(define (display-first-n mxs n)
	(cond [(zero? n) (displayln (void))]
		  [(null? mxs) (displayln (void))]
		  [else (begin (display (mcar mxs))
					   (display-first-n (mcdr mxs) (- n 1)))]))

(define mlista (mlist (list 1 2 3 4 5 6 7 8)))

; (mreverse! mlista)
(display-first-n (mreverse! mlista) 100)
