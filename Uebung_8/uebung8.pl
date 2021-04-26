init(kiel).

edge(kiel,hamburg).
edge(kiel,berlin).
edge(hamburg,duesseldorf).
edge(hamburg,dortmund).
edge(duesseldorf,koblenz).
edge(koblenz,mainz).
edge(koblenz,wiesbaden).
edge(mainz,wiesbaden).
edge(wiesbaden,mainz).
edge(wiesbaden,frankfurt).
edge(berlin,frankfurt).

is_goal(frankfurt).



search_width(F0) :-
	writeln(F0), select_node(Node, F0, _), is_goal(Node), !.
	
search_width(F0) :-
	writeln(F0), select_node(Node, F0, F1), neighbors(Node, NN), add_to_frontier(NN, F1, F2), search_width(F2).
	


select_node(Node, [Node | Frontier], Frontier).


neighbors(N, NN) :- findall(Neighbor, edge(N, Neighbor), NN). 

add_to_frontier(Neighbors, Frontier1, Frontier2) :- append(Frontier1, Neighbors, Frontier2).
