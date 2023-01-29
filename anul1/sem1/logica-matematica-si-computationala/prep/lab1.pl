female(mary).
female(sandra).
female(juliet).
female(lisa).
male(peter).
male(paul).
male(dony).
male(bob).
male(harry).
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

father_of(Father, Child) :- male(Father), parent(Father, Child).
mother_of(Mother, Child) :- female(Mother), parent(Mother, Child).
grandfather_of(Grandfather, Child) :- 
  father_of(Grandfather, Parent), 
  father_of(Parent, Child), 
grandmother_of(Grandmother, Child) :-
  mather_of(Grandmother, Parent),
  mother_of(Parent, Child),
brother_of(Brother, Person) :- 
  male(Brother)
  parent_of(Parent, Brother),
  parent_of(Parent, Person), 
  Brother \== Person.
aunt_of(Aunt, Person) :-
  parent(Parent, Person),
  sister_of(Aunt, Parent),
  Aunt \== Parent.
uncle_of(Uncle, Person) :-
  parent(Parent, Person),
  brother_of(Uncle, Parent),
  Uncle \== Parent.