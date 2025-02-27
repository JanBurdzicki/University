direct_connection(wroclaw, warszawa).
direct_connection(wroclaw, krakow).
direct_connection(wroclaw, szczecin).
direct_connection(szczecin, lublin).
direct_connection(szczecin, gniezno).
direct_connection(warszawa, katowice).
direct_connection(gniezno, gliwice).
direct_connection(lublin, gliwice).

% connection/2:
connection(X, Y) :- direct_connection(X, Y).
connection(X, Y) :- direct_connection(X, Z), connection(Z, Y).

