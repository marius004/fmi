# palindrome shit 
rev([], []).
rev([H], [H]).
rev([H|T], L) :- rev(T, L2), append(L2, [H], L).

same_list([], []).
same_list([A|T1], [A|T2]) :- 
  same_list(T1, T2).

palindrome(Lst) :- 
  rev(Lst, Rev),
  same_list(Lst, Rev).

# remove duplicates shit 
remove_duplicates([], []).
remove_duplicates([H|T], M) :-
  remove_duplicates(T, M),
  member(H, M).
remove_duplicates([H|T], [H|M]) :-
  remove_duplicates(T, M),
  member(H, M).
 
# atimes shit
# true <=> X appears exactly N times within the list 
atimes(_, [], 0).
atimes(N, [H|T], X) :- 
  X >= 0, 
  H == N, 
  Y is X - 1,
  atimes(N, T, Y).
atimes(N, [H|T], X) :- 
  X >= 0, 
  H /== N,
  atimes(N, T, X).

# insertion sort shit
insertsort([],[]).
insertsort([H|T],L) :- insertsort(T,L1), insert(H,L1,L).

insert(X,[],[X]).
insert(X,[H|T],[X|[H|T]]) :- X < H.
insert(X,[H|T],[H|L]) :- X >= H, insert(X,T,L).

# quicksort shit 
quicksort([], []).
quicksort([H|T],L) :- split(H,T,A,B), quicksort(A,M), quicksort(B,N), append(M,[H|N],L).

split(_,[],[],[]).
split(X,[H|T],[H|A],B) :- H < X, split(X,T,A,B).
split(X,[H|T],A,[H|B]) :- H >= X, split(X,T,A,B).