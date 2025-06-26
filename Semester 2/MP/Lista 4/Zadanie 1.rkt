#lang racket

(define t
	(node
		(node (leaf) 2 (leaf))
		5
		(node (node (leaf) 6 (leaf))
			8
			(node (leaf) 9 (leaf)))))

; Stan pamieci przed wykonaniem wstawienia do drzewa BST
;					[ ][5][ ]
;		   /						 \
;	  [ ][2][ ]					  [ ][8][ ]
;	   /	 \				/					\
;	 [x]	 [x]	   [ ][6][ ]   			 [ ][9][ ]
;	 				    /	  \	   			  /	    \
;					  [x]	  [x] 			[x]	 	[x]

; Stan pamieci po wykonaniu wstawienia wartosci 7 do drzewa BST

;					 [ ][5][ ]
;		    /						 \
;	   [ ][2][ ]					  [ ][8][ ]
;	    /	 \				/					\
;	  [x]	 [x]	   [ ][6][ ]   			 [ ][9][ ]
;	 					/	  \	   			  /	    \
;					  [x]  [ ][7][ ] 		[x]	 	[x]
;							 /	  \
;						   [x]	  [x]

; Fragmenty drzewa t są współdzielone między drzewem t i (insert-bst 7 t):
; * lewe poddrzewo 5
; * lewe poddrzewo 6
; * prawe poddrzewo 8