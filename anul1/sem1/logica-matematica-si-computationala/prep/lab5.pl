vars(V, [V]) :- atom(V).
vars(non(X), S) :- vars(X, S).
vars(si(X, Y), S) :- vars(X, S1), vars(Y, S2), union(S1, S2, S).
vars(sau(X, Y), S) :- vars(X, S1), vars(Y, S2), union(S1, S2, S).
vars(imp(X, Y), S) :- vars(X, S1), vars(Y, S2), union(S1, S2, S).

val(V, [(V, A)|_], A).
val(V, [_|T], A) :- val(V, T, A).

# non x  
bnon(0, 1).
bnon(1, 0).
# a si b 
bsi(0, 0, 0).
bsi(0, 1, 0).
bsi(1, 0, 0).
bsi(1, 1, 1).
# a sau b 
bsau(0, 0, 0).
bsau(0, 1, 1).
bsau(1, 0, 1).
bsau(1, 1, 1).

# X -> Y = (non X) sau Y
bimp(X, Y, Z) :- bnon(X, NX), bsau(NX, Y, Z).

# eval(imp(b,d),[(a,1), (b,0), (d,1)],A)
eval(X, L, A) :- atom(X), val(X, L, A).
eval(impl(X, Y), L, A) :-
  eval(X, L, XV),
  eval(Y, L, YV),
  bimpl(XV, YV, A).
eval(si(X, Y), L, A) :-
  eval(X, L, XV),
  eval(Y, L, YV),
  bsi(XV, YV, A).
eval(sau(X, Y), L, A) :-
  eval(X, L, XV),
  eval(Y, L, YV),
  bsau(XV, YV, A).
eval(non(X), L, A) :- 
  eval(X, L, XV),
  bnon(X, A).

evals(_, [], []).
evals(X, [H|T], [A|B]) :- 
  eval(X, H, A)
  evals(X, T, B).

evs([], [[]]).
evs([V|T], Es) :- evs(T, Esp), adauga(V, Esp, Es).
adauga(_, [], []).
adauga(V, [E|T], [[(V, 0)|E], [(V,1)|E]|Es]) :- adauga(V, T, Es).

all_evals(X, As) :- vars(X, S), evs(S, ES), evals(X, Es, As).

all_ones([]).
all_ones([1|T]) :- all_ones(T).
taut(X) :- all_evals(X, As), all_ones(As).