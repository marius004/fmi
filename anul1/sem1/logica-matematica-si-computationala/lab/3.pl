rev([], []).
rev([H|T], M) :- rev(T, U), append(U, [H], M). 
palindrome(L) :- rev(L, L).

remove_duplicates([], []).
remove_duplicates([H|T], U) :- remove_duplicates(T, U), member(H, U).
remove_duplicates([H|T], [H|U]) :- remove_duplicates(T, U), not(member(H, U)).

atimes(_, [], 0). 
atimes(N, [N|T], W) :- atimes(N, T, Y), W is Y + 1.
atimes(N, [H|T], Y) :- atimes(N, T, Y), N \== H. 

insertsort([],[]).
insertsort([H|T],L) :- insertsort(T,L1), insert(H,L1,L).


insert(X, [], [X]).
insert(X, [H|T], [X|[H|T]]) :- X =< H.
insert(X, [H|T], [H|L]) :- X > H, insert(X, T, L).

quicksort([],[]).
quicksort([H|T],L) :-split(H,T,A,B), quicksort(A,M), quicksort(B,N),
append(M,[H|N],L).

split(_, [], [], []).
split(H, [X|T], A, [X|B]) :- split(H, T, A, B), H < X.
split(H, [X|T], [X|A], B) :- split(H, T, A, B), H >= X.

% arbori binari(vid, arb(R, T, U))

srd(vid,[]).
srd(arb(R,T,U),L) :- srd(T,L1), srd(U,L2),
append(L1,[R|L2],L).

bt_ins(X, vid, arb(X, vid, vid)).
bt_ins(X, arb(R, T, U), arb(R, V, U)) :- X < R, bt_ins(X, T, V).
bt_ins(X, arb(R, T, U), arb(R, T, V)) :- X >= R, bt_ins(X, U, V).

bt_list([], vid).
bt_list([H|T], V) :- bt_list(T, W), bt_list(H, W, V).

bt_sort(L, X) :- bt_list(L, T), srd(T, X).