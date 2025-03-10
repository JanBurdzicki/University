% QUICKSORT (for O(n log n) median-of-three or rand pivot selection must be used)
quicksort([], []).
quicksort([H|T], Sorted) :-
    partition(H, T, Less, Greater),
    quicksort(Less, SortedLess),
    quicksort(Greater, SortedGreater),
    append(SortedLess, [H|SortedGreater], Sorted).

partition(_, [], [], []).
partition(Pivot, [H|T], [H|Less], Greater) :- H @=< Pivot, partition(Pivot, T, Less, Greater).
partition(Pivot, [H|T], Less, [H|Greater]) :- H @> Pivot, partition(Pivot, T, Less, Greater).


% MERGESORT
merge([], Xs, Xs).
merge(Xs, [], Xs).
merge([X|T1], [Y|T2], [X|M]) :- X @=< Y, merge(T1, [Y|T2], M).
merge([X|T1], [Y|T2], [Y|M]) :- X @> Y, merge([X|T1], T2, M).


split([], [], []).
split([X], [X], []).
split([X0, X1|Xs], [X0|Ys], [X1|Zs]) :- split(Xs, Ys, Zs).

mergesort([], []).
mergesort([X], [X]).
mergesort(Xs, Sorted) :-
    split(Xs, Ys, Zs),
    mergesort(Ys, YsSorted),
    mergesort(Zs, ZsSorted),
    merge(YsSorted, ZsSorted, Sorted).


% TREESORT (for O(n log n) BBST must be used)
treesort(List, Sorted) :-
    build_tree(List, Tree),
    inorder(Tree, Sorted).

build_tree([], nil).
build_tree([H|T], Tree) :-
    build_tree(T, TempTree),
    insert_tree(H, TempTree, Tree).

insert_tree(X, nil, tree(X, nil, nil)).
insert_tree(X, tree(Root, Left, Right), tree(Root, NewLeft, Right)) :- X @=< Root, insert_tree(X, Left, NewLeft).
insert_tree(X, tree(Root, Left, Right), tree(Root, Left, NewRight)) :- X @> Root, insert_tree(X, Right, NewRight).

inorder(nil, []).
inorder(tree(Root, Left, Right), Sorted) :-
    inorder(Left, LSorted),
    inorder(Right, RSorted),
    append(LSorted, [Root|RSorted], Sorted).


% HEAPSORT
heapsort(List, Sorted) :-
    build_heap(List, Heap),
    heap_to_sorted_list(Heap, Sorted).

build_heap(List, Heap) :- heapify(List, [], Heap).

heapify([], Heap, Heap).
heapify([H|T], Acc, Heap) :- insert_heap(H, Acc, NewAcc), heapify(T, NewAcc, Heap).

insert_heap(X, [], [X]).
insert_heap(X, [H|T], [X,H|T]) :- X @=< H, !.
insert_heap(X, [H|T], [H|NewT]) :- insert_heap(X, T, NewT).

heap_to_sorted_list([], []).
heap_to_sorted_list(Heap, [Min|Sorted]) :-
    extract_min(Heap, Min, NewHeap),
    heap_to_sorted_list(NewHeap, Sorted).

extract_min([Min|T], Min, T).
