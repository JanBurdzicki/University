concatenated_twice(X, Y) :- append(X, X, Y).
# delete_element(X, T, R) :- select(X, T, R).
delete_element(X, [X|T], T).
delete_element(X, [H|T], [H|R]) :- delete_element(X, T, R).
add_to_list(X, L, Y) :- append(L, X, Y).
