reverse(XS, YS) :- reverse(XS, [], YS, YS).

reverse([], YS, YS, []).
reverse([X | XS], Acc, YS, [_ | YSGuard]) :-
    reverse(XS, [X | Acc], YS, YSGuard).
