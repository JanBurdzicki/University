next([1]).
next([C | X]) :-
    next(X),
    (C = 0; C = 1).

rbin([0]).
rbin(X) :- next(X).

bin([0]).
bin([1|T]) :- bin(T, []).

bin(A, A).
bin(X, A) :-
    bin(X, [C|A]),
    (C = 0; C = 1).
