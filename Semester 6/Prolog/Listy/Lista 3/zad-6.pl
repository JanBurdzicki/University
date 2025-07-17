solve(A, C, E, P, R, S, U) :-
    permutation(DigitSublist, [A, C, E, P, R, S, U]),
    sublist(DigitSublist, [0,1,2,3,4,5,6,7,8,9]),
    % length(DigitSublist, 7),
    U \= 0,
    P \= 0,
    concat_number([U, S, A], N),
    concat_number([U, S, S, R], M),
    Sum is N + M,
    concat_number([P, E, A, C, E], Sum).


% Funkcje pomocnicze
concat_number(Digits, Number) :-
    concat_number(Digits, Number, _).
concat_number([N], N, 1) :-
    !.
concat_number([Digit | Digits], N, Pow) :-
    concat_number(Digits, M, PrevPow),
    Pow is 10 * PrevPow,
    DigitVal is Pow * Digit,
    N is DigitVal + M.

sublist([], _).
sublist([H | T0], [H | T1]) :-
    sublist(T0, T1).
sublist(S, [_ | T]) :-
    sublist(S, T).
