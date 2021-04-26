%Blatt 8 Aufgabe 2 8 KI WS 20/21
%gibt Pfade und Frontier aus
%variabler Start
%variables Ziel
%Beschreibung des Graphen: %Beschreibung des Graphen
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
edge(berlin, frankfurt).




% Aufruf mit: Suchstrategie
%  + Strategie: bfs fuer Breitensuche, dfs fuer Tiefensuche
%  + Start: Startknoten
%  + Ziel: Zielknoten
%  - Pfad: gibt den Pfad vom Startknoten zum Zielknoten aus, den die
%  gewaehlte Suchstrategie findet

finde(Strategie,Start,Ziel,Pfad):-
	%rufe Suche mit Frontier = Pfad, der nur aus dem Startknoten besteht, auf
	suche(Strategie,Ziel,[[Start]],Pfad).

% einfachster Fall: Pfad wird aus der Frontier genommen, bei
% dem das Ziel erreicht ist
% Frontier ist Liste von Pfaden (= Liste von Knoten)
suche(_,Ziel,Frontier,[Ziel|Pfad]):-
	%nimm einen Pfad aus der Frontier, dieser fuehrt bereits zum Zielknoten
	choose([Ziel|Pfad],Frontier,_),
	%gibt die aktuelle Frontier aus
	writeln(''),
	writeln('Frontier:'),
	prettylist(Frontier),
	!.
 
%Breitensuche
%Zielknoten noch nicht erreicht, suche rekursiv fuer alle Nachbarknoten
suche(bfs,Ziel,Frontier,Loesung):-
	%gibt die aktuelle Frontier aus
	writeln(''),
	writeln('Frontier:'),
	prettylist(Frontier),
	%nimm einen Pfad aus der Frontier
	choose([KnotenA|PfadA],Frontier,Pfade),
	%finde alle Nachbarknoten, die noch nicht im Pfad enthalten sind
	findall([KnotenN|[KnotenA|PfadA]],(edge(KnotenA,KnotenN),\+(member(KnotenN,[KnotenA|PfadA]))),GefundenePfade),
	%haenge die neuen Pfade hinten an die Frontier an
    append(Pfade,GefundenePfade,NeuePfade),
	suche(bfs,Ziel,NeuePfade,Loesung).

%Tiefensuche
suche(dfs,Ziel,Frontier,Loesung):-
	%gibt die aktuelle Frontier aus
	writeln(''),
	writeln('Frontier:'),
	prettylist(Frontier),
	%nimm einen Pfad aus der Frontier
	choose([KnotenA|PfadA],Frontier,Pfade),
	%finde alle Nachbarknoten, die noch nicht im Pfad enthalten sind
	findall([KnotenN|[KnotenA|PfadA]],(edge(KnotenA,KnotenN),\+(member(KnotenN,[KnotenA|PfadA]))),GefundenePfade),
	%Tiefensuche: h‰nge die neuen Pfade vorne an die Frontier an
	append(GefundenePfade,Pfade,NeuePfade),
	suche(dfs,Ziel,NeuePfade,Loesung).


%von vorne aus der Frontier einen Pfad entnehmen
choose(X,[X|R],R).

 
prettylist([]).
 
prettylist([H|T]):-
	writeln(H),
	prettylist(T).

