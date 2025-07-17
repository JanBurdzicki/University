/*
sum(X, Y, Z) :-
    number(X),
    number(Y),
    !,
    Z is X + Y.
sum(X, Y, Z) :-
    number(X),
    number(Z),
    !,
    Y is Z - X.
sum(X, Y, Z) :-
    number(Y),
    number(Z),
    !,
    X is Z - Y.
sum(X, Y, Z) :-
    number(X),
*/

sum(X, Y, Z) :- var(X), var(Y), var(Z), between(-1000, 1000, X), between(-1000, 1000, Y), Z is X + Y.
sum(X, Y, Z) :- var(X), var(Y), integer(Z), between(0, Z, X), Y is Z - X.

sum(X, Y, Z) :- var(X), integer(Y), integer(Z), X is Z - Y, !.
sum(X, Y, Z) :- integer(X), var(Y), integer(Z), Y is Z - X, !.
sum(X, Y, Z) :- integer(X), integer(Y), var(Z), Z is X + Y, !.


/*
sum(X, Y, Z) :- integer(X), integer(Y), Z is X + Y, !.
sum(X, Y, Z) :- integer(X), integer(Z), Y is Z - X, !.
sum(X, Y, Z) :- integer(Y), integer(Z), X is Z - Y, !.
*/

