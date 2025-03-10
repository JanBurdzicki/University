eq_len([], []).
eq_len([_ | XS], [_ | YS]) :- eq_len(XS, YS).

sperm([], []).
sperm(XS, [HP | TP]) :-
    eq_len(XS, [HP | TP]),
    select(HP, XS, YS),
    sperm(YS, TP).

insert(X, XS, YS) :- select(X, YS, XS).

iperm(XS, YS) :- iperm(XS, YS, YS).
iperm([], [], []).
iperm([H | T], P, [_ | Bound]) :-
    iperm(T, P1, Bound),
    insert(H, P1, P).
