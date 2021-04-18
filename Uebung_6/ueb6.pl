same_element(X, L) :- member(X, L).
same_element([Head | _], L) :- member(Head, L).
same_element([_ | Tail], L) :- same_element(Tail, L).

twice([], []).
twice([Head | Tail], [Head, Head | DoubleTail]) :- twice(Tail, DoubleTail).

last_element([],[]).
last_element([X | []], X).
last_element([_ | Tail], LastElem) :- last_element(Tail, LastElem).


% Loesung von der Schule (Frau C. Schon).
element_at(1,[X|_],X).

element_at(N,[_|Rest],X):-
	NMinusEins is N - 1,
	element_at(NMinusEins,Rest,X).
	
	
my_reverse([],[]).
my_reverse([X], [X]).
my_reverse([Head | Tail], OutputList) :- my_reverse(Tail, LastEl), append(LastEl, [Head], OutputList).