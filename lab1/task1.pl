% Марьян Александр Олегович(М8О-213Б-22)(№13).

length_f([], 0).
length_f([_|T], N) :-
    length_f(T, N1),
    N is N1 + 1.

member_f(Elem,[Elem|_]).
member_f(Elem,[_|Tail]) :-
    member_f(Elem,Tail).

append_f([], List, List).
append_f([Head|Tail1], List2, [Head|Result]) :-
    append_f(Tail1, List2, Result).

remove_f(_, [], []).
remove_f(X, [X|T], NewT) :-
    remove_f(X, T, NewT).
remove_f(X, [H|T], [H|NewT]) :-
    X \= H,
    remove_f(X, T, NewT).

permute_f([], []).
permute_f(L, [X | T]) :-
    select(X, L, R), % Выбираем X из L и возвращаем R (L без X)
    permute_f(R, T).

sublist_f([],[]).
sublist_f(S,L):-
    append_f(_, L1,L), append_f(S,_,L1).

%Variant(13 mod 19)+1)
func4_without_stdrd_prdt(_, 0, []).
func4_without_stdrd_prdt([X|Tail], Length, [X|List1]) :-
    Length > 0,
    NewLength is Length - 1,
    func4_without_stdrd_prdt(Tail, NewLength, List1).
func4(_,0,[]).
func4(Tail, Length, List1) :-
    length(List1, Length),
    append(List1, _, Tail).

%Variant(N+5) mod 20 + 1
max_f([H|Tail], Max, Index) :-
    max_f(Tail, TempMax, TempIndex),
    (H > TempMax -> (Max = H, Index = 0); (Max = TempMax, Index is TempIndex + 1)).

max_f([], -9999, -1).


find_perm_shortened_arr(List,Perm) :- % Получаем список до Max, и находим все перестановки такого списка.
    max_f(List,_,Index),
    func4(List,Index,TruncatedList),
    permute_f(TruncatedList,Perm).
