byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
 
byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).
 
byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

travel(X,Y) :- byCar(X,Y).
travel(X,Y) :- byTrain(X,Y).
travel(X,Y) :- byPlane(X,Y).
travel(X,Y) :- byCar(X, Z), travel(Z, Y).
travel(X,Y) :- byTrain(X, Z), travel(Z, Y).
travel(X,Y) :- byPlane(X, Z), travel(Z, Y).

travel(X,Y) :- onestep(X,Y).
travel(X,Y) :- onestep(X,Z),
               travel(Z,Y).

onestep(X,Y) :- byCar(X,Y).
onestep(X,Y) :- byTrain(X,Y).
onestep(X,Y) :- byPlane(X,Y).

% Document only the path, without type of transport
% travel(X, Y, go(X, Y)) :- onestep(X, Y).
% travel(X,Y,go(X,Z,Path)) :- onestep(X,Z),
                            travel(Z,Y,Path).
							
							
travel(X,Y,go(X,Y,Transport)) :- onestep(X,Y,Transport).
travel(X,Y,go(X,Z,Transport,Path)) :- onestep(X,Z,Transport),
                            travel(Z,Y,Path).

onestep(X,Y,byCar) :- byCar(X,Y).
onestep(X,Y,byTrain) :- byTrain(X,Y).
onestep(X,Y,byPlane) :- byPlane(X,Y).