% append(+, ?), +, gdzie + niepuste
append([], []).
append([Xs | Xss], Ys) :-
    append(Xs, Zs, Ys),
    append(Xss, Zs).
