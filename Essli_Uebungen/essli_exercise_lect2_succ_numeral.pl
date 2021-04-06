numeral(0).
numeral(succ(X)) :- numeral(X).

greater_than(succ(_),0).
greater_than(succ(X),succ(Y)) :- greater_than(X,Y).

add(0,N,N).
add(succ(X),N,succ(XPlusN)) :- add(X,N,XPlusN).