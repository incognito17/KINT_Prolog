teileListeAnPos(L, 0, [], L) :- !.
teileListeAnPos([H | T], 1, [H], T).
teileListeAnPos([H | T], X, [H | ResListTail], ResTailList) :- 
	N is X - 1, teileListeAnPos(T, N, ResListTail, ResTailList).
	

verbinde([],[]).
verbinde([L], L).
verbinde([H1, H2 | T], Result) :-
	append(H1, H2, ResHead), verbinde(T, ResTail), append(ResHead, ResTail, Result).