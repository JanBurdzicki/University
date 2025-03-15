% Inne rozwiązanie: prefix(X, Y) :- append(X, _, Y).
my_prefix([], _).
my_prefix([H|T], [H|S]) :- my_prefix(T, S).

% append(_, X, Y).
suffix(X, X).
suffix(S, [_|T]) :- suffix(S, T).

segment([], _).
segment(X, Y) :-
    % X = [_|_], % TODO: wsm niepotrzebne
    suffix(S, Y),
    prefix(X, S).

sublist([], _).
sublist([H|T0], [H|T1]) :- sublist(T0, T1).
sublist(S, [_|T]) :- sublist(S, T).
