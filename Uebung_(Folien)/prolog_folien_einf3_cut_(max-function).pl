max(X,Y,Y) :- X =< Y, !.
max(X,Y,X) :- X>Y.


class(Number,positive) :- Number > 0, !.
class(0,zero) :- !.
class(Number,negative) :- Number < 0, !.


concat([],L,L):-!.
concat([H|T],L,[H|Result]) :-
concat(T,L,Result).

remove(_,[],[]).
remove(X, InputList, OutputList) :- \+member(X, InputList), !, OutputList = InputList.
remove(X, [H_InputList | T_OutputList], OutputList) :- H_InputList = X, !, OutputList = T_OutputList.
remove(X, [H_InputList | T_OutputList], [H_InputList | OutputList]) :- H_InputList \= X, remove(X, T_OutputList, OutputList).

