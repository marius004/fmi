distance((A, B), (C, D), X) :- 
  X is sqrt((A - C) ** 2 + (B - D) ** 2).

fib(0, 0).
fib(1, 1).
fib(N, F) :- 
  N > 1, 
  N1 is N - 1, 
  N2 is N - 2, 
  fib(N1, F1), 
  fib(N2, F2), 
  F is F1 + F2.

line(0, _).
line(X, C) :- X > 0, write(C), X1 is X - 1, line(X1, C).

scalarMult(_, [], []).
scalarMult(N, [H|T], [X|Y]) :-
  X is N * H,
  scalarMult(N, T, Y).

dot([], [], 0).
dot([H1|T1], [H2|T2], S) :-
  dot(T1, T2, S2)
  S is H1 * H2  + S2. 

max([], 0).
max([H], H).

max([H|T], H) :- 
  max(T, SubResult), 
  SubResult < H. 

max([H|T], SubResult) :- 
  max(T, SubResult), 
  SubResult >= H.