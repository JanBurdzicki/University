s1(t, t, t, t, t, t).
s1(f, f, _, _, _, _).
s1(f, _, f, _, _, _).
s1(f, _, _, f, _, _).
s1(f, _, _, _, f, _).
s1(f, _, _, _, _, f).

s2(_, t, f, f, f, f).
s2(_, f, t, _, _, _).
s2(_, f, _, t, _, _).
s2(_, f, _, _, t, _).
s2(_, f, _, _, _, t).

s3(t, t, t, _, _, _).
s3(f, _, f, _, _, _).
s3(_, f, f, _, _, _).

s4(t, _, _, t, _, _).
s4(_, t, _, t, _, _).
s4(_, _, t, t, _, _).
s4(f, f, f, f, _, _).

s5(f, f, f, f, t, _).
s5(t, _, _, _, f, _).
s5(_, t, _, _, f, _).
s5(_, _, t, _, f, _).
s5(_, _, _, t, f, _).

s6(f, f, f, f, f, t).
s6(t, _, _, _, _, f).
s6(_, t, _, _, _, f).
s6(_, _, t, _, _, f).
s6(_, _, _, t, _, f).
s6(_, _, _, _, t, f).

solve(A, B, C, D, E, F) :-
 s1(A, B, C, D, E, F), s2(A, B, C, D, E, F), s3(A, B, C, D, E, F), s4(A, B, C, D, E, F), s5(A, B, C, D, E, F), s6(A, B, C, D, E, F).




% first(t, t, t, t, t, t).
% first(f, _, _, _, _, _).

% second(_, t, f, f, f, f).
% second(_, f, _, _, _, _).

% third(t, t, t, _, _, _).
% third(_, _, f, _, _, _).

% fourth(f, f, f, f, _, _).
% fourth(_, _, _, t, _, _).

% fifth(f, f, f, f, t, _).
% fifth(_, _, _, _, f, _).

% sixth(f, f, f, f, f, t).
% sixth(_, _, _, _, _, f).
