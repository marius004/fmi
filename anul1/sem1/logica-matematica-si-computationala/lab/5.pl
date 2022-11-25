vars(X, [X]) :- atom(X).
vars(non(X), L) :- vars(X, L).
vars(imp(X, Y), V) :- vars(X, L), vars(Y, M), union(L, M, V).
vars(sau(X, Y), V) :- vars(X, L), vars(Y, M), union(L, M, V).
vars(si(X, Y), V) :- vars(X, L), vars(Y, M), union(L, M, V).

val(V, [_|T], A) :- val(V,T,A).
val(V, [(V, A)|_], A).



bnon(0, 1).
bnon(1, 0).

bsau(1, _, 1).
bsau(_, 1, 1).
bsau(_, _, 0).

bsi(0, 0, 0).
bsi(0, 1, 0).
bsi(1, 1, 1).
bsi(1, 0, 0).

bimp(X, Y, Z) :- bnon(X, NX), bsau(NX, Y, Z).

eval(A, L, R) :- atom(A), val(A, L, R).
eval(imp(A, B), L, R) :- eval(A, L, AA), eval(B, L, BB), bimp(AA, BB, R).
eval(sau(A, B), L, R) :- eval(A, L, AA), eval(B, L, BB), bsau(AA, BB, R).
eval(si(A, B), L, R) :- eval(A, L, AA), eval(B, L, BB), bsi(AA, BB, R).
eval(non(A), L, R) :- eval(A, L, AA), bnon(AA, R).

evals(_, [], []).
evals(V, [T|H], [R|Z]) :- eval(V, T, R), evals(V, H, Z).

evs([], [[]]).
evs([X|T], L) :- evs(T, M), adauga(X, M, L).

adauga(_, [], []).
adauga(X, [E|T], [[(X, 0)|E],[(X, 1)|E]|L]) :- adauga(X, T, L).

all_evals(X, Y) :- vars(X, S), evs(S, L), evals(X, L, Y).

taut(X) :- all_evals(X, Y), toate_unu(Y).
toate_unu([]).
toate_unu([1|T]) :- toate_unu(T).