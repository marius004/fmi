distance((X1, Y1), (X2, Y2), X) :- X is sqrt((X1 - X2)**2 + (Y1 - Y2)**2).

parent(bob, lisa).
parent(bob, paul).
parent(bob, mary).
parent(juliet, lisa).
parent(juliet, paul).
parent(juliet, mary).
parent(peter, harry).
parent(lisa, harry).
parent(mary, dony).
parent(mary, sandra).

ancestor_of(X,Y) :- parent(X,Y).
ancestor_of(X,Y) :- parent(X,Z), ancestor_of(Z,Y).

fib(0, 1).
fib(1, 1).
fib(X, Y) :- X > 1, A is X - 1, B is X - 2,
    fib(A, M), fib(B, N),
    Y is M + N.

fibg(0, 1, 0).
fibg(1, 1, 1).
fibg(N, X, P) :- A is N - 1, fibg(A, P, Z), X is P + Z.

# lista in prolog e de doua tipuri(vida [], [H|T](head and tail))
# [5|[7|[3|[]]]] = [5|[7, 3]] = [5,7 ,3]
# [7]
# [5, 7]

# cum calculam lungimea unei liste
lg([], 0).
lg([_|T]) :- lg(T, Y), X is Y + 1

line(0, _) :- nl.
line(X, C) :- X >= 1, write(C), X1 is X - 1, line(X1, C).

element_of(X,[X| ]).
element_of(X, [_|Tail]) :- element_of(X, Tail).

concat_lists([], List, List).
concat_lists([Elem | List1], List2, [Elem | List3]) :- concat_lists(List1, List2, List3).