prime(2) :- !.
prime(N) :-
    N > 2,
    N mod 2 =\= 0,
    \+ (between(2, N-1, X), N mod X =:= 0).