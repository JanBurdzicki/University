% adjacent(A, B, List) - means that either A is directly left of B in List or A is directly right of B in List
adjacent(A, B, List) :- nextto(A, B, List); nextto(B, A, List).

% Pięć kolorowych domów stoi w rzędzie. Każdy dom ma właściciela, który posiada zwierzę, ulubiony gatunek papierosów i ulubiony napój.

solve(VodkaDrinker, ElephantOwner) :-
  length(Houses, 5),                                                          % 1. Jest 5 domów.
  member(house(red, english, _, _, _), Houses),                               % 2. Anglik mieszka w czerwonym domu.
  member(house(_, spanish, dog, _, _), Houses),                               % 3. Hiszpan ma psa.
  member(house(green, _, _, coffee, _), Houses),                              % 4. W zielonym domu piją kawę.
  member(house(_, russian, _, tea, _), Houses),                               % 5. Rosjanin pije herbatę.
  adjacent(house(white, _, _, _, _), house(green, _, _, _, _), Houses),       % 6. Zielony dom sąsiaduje z białym. (w ang. wersji jest nextto, bo zielony jest na prawo od białego)
  member(house(_, _, snail, _, winstons), Houses),                            % 7. Właściciel węża pali Winstony.
  member(house(yellow, _, _, _, kools), Houses),                              % 8. W żółtym domu palą Koole.
  nth1(3, Houses, house(_, _, _, milk, _)),                                   % 9. W domu znajdującym się pośrodku piją mleko.
  nth1(1, Houses, house(_, norwegian, _, _, _)),                              % 10. Norweg mieszka w pierwszym domu od lewej.
  adjacent(house(_, _, _, _, chesterfields), house(_, _, fox, _, _), Houses), % 11. Palacz Chesterfieldów jest sąsiadem właściciela lisa.
  adjacent(house(_, _, _, _, kools), house(_, _, horse, _, _), Houses),       % 12. W domu sąsiadującym z domem właściciela konia palą Koole.
  member(house(_, _, _, juice, lucky_strikes), Houses),                       % 13. Palacz Lucky Strike’ów pije sok.
  member(house(_, japanese, _, _, kents), Houses),                            % 14. Japończyk pali Kenty.
  adjacent(house(_, norwegian, _, _, _), house(blue, _, _, _, _), Houses),    % 15. Norweg sąsiaduje z niebieskim domem.
  member(house(_, VodkaDrinker, _, vodka, _), Houses),                        % Kto pije wódkę?
  member(house(_, ElephantOwner, elephant, _, _), Houses).                    % Kto jest właścicielem słonia?
