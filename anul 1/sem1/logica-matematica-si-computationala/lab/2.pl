# http://swish.swi-prolog.org/
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

father_of(Father, Child) :- parent(Father, Child), male(Father).
mother_of(Mother, Child) :- parent(Mother, Child), female(Mother).
grandfather_of(Grandfather, Child) :- parent(Parent, Child), father_of(Grandfather, Parent).
sister_of(Sister, Person) :- female(Sister), parent(Parent, Sister), parent(Parent, Person), Sister \== Person.
brother_of(Brother, Person) :- male(Brother), parent(Parent, Brother), parent(Parent, Person), Brother \== Person.
aunt_of(Aunt, Person) :- parent(Parent, Person), sister_of(Aunt, Person),  Aunt \== Parent.
uncle_of(Uncle, Person) :- parent(Parent, Person), brother_of(Uncle, Person), Uncle \== Parent.