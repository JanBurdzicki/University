% friends(me, my_cat).
% likes(X, Y) :- friends(X, Y).
% likes(X, Y) :- friends(Y, X).
% likes(B, W) :- bird(B), worm(W).
% likes(C, F) :- cat(C), fish(F).
% cat(my_cat).
% eats(my_cat, X) :- likes(my_cat, X).

% 1. Ptaki lubią dżdżownice.
likes(bird, worm).

% 2. Koty lubią ryby.
likes(my_cat, fish).

% 3. Przyjaciele lubią się wzajemnie.
likes(X, Y) :- friends(X, Y).
likes(X, Y) :- friends(Y, X).

% 4. Mój kot jest moim przyjacielem.
friends(me, my_cat).

% 5. Mój kot jada wszystko to, co lubi.
eats(my_cat, X) :- likes(my_cat, X).
