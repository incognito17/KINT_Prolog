swap(leaf(A),leaf(A)).

swap(tree(Links,Rechts),tree(SwapRechts,SwapLinks)):-
	swap(Links,SwapLinks),
	swap(Rechts,SwapRechts).