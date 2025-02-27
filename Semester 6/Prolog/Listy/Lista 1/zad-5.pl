parent(adam, helen).
parent(adam, ivonne).
parent(adam, anna).
parent(eve, helen).
parent(eve, ivonne).
parent(eve, anna).
parent(john, joshua).
parent(helen, joshua).
parent(ivonne, david).
parent(mark, david).

male(adam). male(john). male(david). male(mark). male(joshua).
female(eve). female(helen). female(ivonne). female(anna).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
sister(X, Y) :- sibling(X, Y), female(X).
grandson(X, Y) :- parent(Y, Z), parent(Z, X), male(X).
cousin(X, Y) :- parent(Z, X), parent(W, Y), sibling(Z, W).
descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- parent(Y, Z), descendant(X, Z).
is_mother(X) :- female(X), parent(X, _).
is_father(X) :- male(X), parent(X, _).
