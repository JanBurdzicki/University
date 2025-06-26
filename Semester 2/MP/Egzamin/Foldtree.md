```racket
(define (fold-tree f x t)
  (if (leaf? t)
      x
	  (f (fold-tree f x (node-l t))
	     (node-elem t)
		 (fold-tree f x (node-r t)))))

(define (tree-sum t)
  (fold-tree + 0 t))

(define (tree-flip t)
  (fold-tree (lambda (l x r) (node r x l)) (leaf) t))

(define (tree-height t)
  (fold-tree (lambda (l x r) (if (> l r) (+ l 1) (+ r 1))) 0 t))

(define (tree-span t)
  (define (minimum l x r)
    (cond [(and (< l x) (< l r)) l]
          [(and (< x l) (< x r)) x]
          [(and (< r l) (< r l)) r]))

  (define (maximum l x r)
    (cond [(and (> l x) (> l r)) l]
          [(and (> x l) (> x r)) x]
          [(and (> r l) (> r l)) r]))

  (define result-l (fold-tree minimum +inf.0 t))
  (define result-r (fold-tree maximum -inf.0 t))

  (cons result-l result-r))

(define (flatten t)
  (fold-tree (lambda (l x r) (append l (list x) r)) null t))

(define example-tree (node (node (leaf) 1 (leaf))
						   2
						   (node (node (leaf) 3 (leaf))
								 4
								 (node (leaf) 5 (leaf)))))


(tree-sum example-tree)
(tree-flip example-tree)
```



https://discord.com/channels/750465923877699716/813086749999366184/1145317170667073577


Gramatyki

https://discord.com/channels/750465923877699716/813086749999366184/1104331696184238201