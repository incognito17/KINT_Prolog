compress([], []) :- !.
compress([X], [X]) :- !.
compress([X, X | InputTail], OutputTail) :- 
	X = X, !, compress([X | InputTail], OutputTail).

compress([X, Y | InputTail], [X | OutputTail]) :- 
	X \= Y, compress([Y | InputTail], OutputTail).





pack_list([], []) :- !.
pack_list([X], [[X]]) :- \+is_list(X), !.
pack_list([X], [X]) :- is_list(X), !.
pack_list([H1 | [H_InputTail | InputTail]], OutputTail) :- 
	H1 = H_InputTail, pack_list([[H1, H_InputTail] | InputTail], OutputTail), !.
	
pack_list([H1 | [H_InputTail | InputTail]], [H1 | OutputTail]) :- 
	H1 \= H_InputTail, \+member(H_InputTail, H1), is_list(H1), 
	pack_list([H_InputTail | InputTail], OutputTail), !.
	
pack_list([H1 | [H_InputTail | InputTail]], [[H1] | OutputTail]) :- 
	H1 \= H_InputTail, \+member(H_InputTail, H1), !, \+is_list(H1), 
	pack_list([H_InputTail | InputTail], OutputTail), !.
	
pack_list([H1 | [H_InputTail | InputTail]], OutputTail) :- 
	H1 \= H_InputTail, member(H_InputTail, H1), !, append(H1, [H_InputTail], Appended_List), 
	pack_list([Appended_List | InputTail], OutputTail), !.





encode([],[]).
encode([X], [1,X]) :- \+is_list(X), !.
encode([X], OutputList) :- 
	is_list(X), encode(X, OutputList), !.
	
encode(InputList, [[ListLength, Elem] | OutputList]) :- 
	\+append(InputList, _), pack_list(InputList, [H_packed | T_packed]), 
	length(H_packed, ListLength), member(Elem, H_packed), !, encode(T_packed, OutputList).
	
encode(InputList, [[ListLength, Elem] | OutputList]) :- 
	append(InputList, Single_lvl_list), pack_list(Single_lvl_list, [H_packed | T_packed]), 
	length(H_packed, ListLength), member(Elem, H_packed), !, encode(T_packed, OutputList).





mix([],[],[]) :- !.
mix([X], [], [X]) :- !.
mix([X | T], [], [X] | T) :- !.
mix([], [X], [X]) :- !.
mix([], [X | T], [X | T]) :- !.
mix([X], [Y], [X, Y]) :- X =< Y, !.
mix([X], [Y], [Y, X]) :- X > Y, !.
mix([X | InputTail1], [Y | InputTail2], [X | OutputTail]) :- X =< Y, !, mix(InputTail1, [Y | InputTail2], OutputTail).
mix([X | InputTail1], [Y | InputTail2], [Y | OutputTail]) :- X > Y, !, mix([X | InputTail1], InputTail2, OutputTail).




%% Loesung von Prof.:
% einfachster Fall: eine der beiden Eingabelisten ist leer. Dann wird die nichtleere Liste als Ergebnis übernommen
mischen(Xs,[],Xs).
mischen([],Ys,Ys).


% Die beiden Listen haben das gleiche Element im Kopf
mischen([X|Xs],[X|Ys],[X,X|Zs]):- 
	!,
	mischen(Xs,Ys,Zs).

% Der Kopf der ersten Liste ist kleiner als der Kopf der zweiten Liste. Der kleinere Kopf wird als Kopf der Ergebnisliste übernommen.
% Rekursiver Aufruf für den Rest der ersten Liste und der unveränderten zweiten Liste.
mischen([X|Xs],[Y|Ys],[X|Zs]):- 
	X<Y,
	!, 
	mischen(Xs,[Y|Ys],Zs).

% Der Kopf der zweiten Liste ist kleiner als der Kopf der ersten Liste. Der kleinere Kopf wird als Kopf der Ergebnisliste übernommen.
% Rekursiver Aufruf für die unveränderte erste Liste und den Rest der zweiten Liste.
mischen([X|Xs],[Y|Ys],[Y|Zs]):- 
	X>Y,
	!, 
	mischen([X|Xs],Ys,Zs).