on(a,b).
on(b,c).
on(c,d).

above(X,Y) :- on(X,Y).
above(X,Y) :- on(X,Z), above(Z,Y).


rev_list([],[]).
rev_list([H | T], ResTail) :- rev_list(T, ReverseTail), append(ReverseTail, [H], ResTail).

palindrom([]).
palindrom(L) :- rev_list(L, RevL), RevL = L.