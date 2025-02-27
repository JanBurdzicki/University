not_happy(X) :- dragon(X), lives_in_zoo(X).
happy(X) :- animal(X), contacts(X, nice_people).
nice_people(X) :- visits_zoo(X).
contacts(X, Y) :- animal(X), visits_zoo(Y).
