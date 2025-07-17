connection(wroclaw, warszawa).
connection(warszawa, gliwice).
connection(gliwice, warszawa).
connection(katowice, wroclaw).
connection(katowice, krakow).
connection(warszawa, katowice).
connection(krakow, warszawa).

trip(From, To, Route) :-
    trip(From, To, [To], Route).

trip(From, To, Acc, [From | Acc]) :-
    connection(From, To).
trip(From, To, Acc, Route) :-
    connection(Intermediate, To),
    not(member(Intermediate, Acc)),
    trip(From, Intermediate, [Intermediate | Acc], Route).

/*
trip(A, B, Path) :- trip(A, B, [A], Path).
trip(A, B, Visited, [B|Visited]) :- connection(A, B), !.
trip(A, B, Visited, Path) :-
    connection(A, C),
    C \= B,
    \+ member(C, Visited),
    trip(C, B, [C|Visited], Path).
*/