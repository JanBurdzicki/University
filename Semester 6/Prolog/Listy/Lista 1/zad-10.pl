even(X) :- length(X, N), 0 is N mod 2.
% even([]).
% even([_, _|T]) :- even(T).

palindrome(X) :- reverse(X, X).
% palindrome([]).
% palindrome([_]).
% palindrome([H | T]) :- last(H, T), init(T, X), palindrome(X).

singleton([_]).

head(H, [H|_]).

last([H], H).
last([_|T], H) :- last(T, H).

tail(T, [_|T]).

init([_], []).
init([H|T], [H|R]) :- init(T, R).

prefix(P, L) :- append(P, _, L).
% prefix([], _).
% prefix([H | T0], [H | T1]) :- prefix(T0, T1).

suffix(L, S) :- append(_, S, L).
% suffix(X, X).
% suffix(X, [_ | T]) :- suffix(X, T).
