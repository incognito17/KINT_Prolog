starter('gruener Salat').
starter('Melone').
starter('Tomatensalat').
starter('Kaninchenpastete').

main('Lachs').
main('Rindfleisch').
main('Pasta').

dessert('Kaese').
dessert('Joghurt').
dessert('Gebaeck').

menu(Status, X, Y, Z) :- Status = hungry, starter(X), main(Y), dessert(Z).
menu(Status, X, Y, Z) :- Status = not_so_hungry, starter(X), main(Y), Z = nothing.
menu(Status, X, Y, Z) :- Status = not_so_hungry, X = nothing, main(Y), dessert(Z).
menu(Status, X, Y, Z) :- Status = on_diet, starter(X), Y = nothing, Z = nothing.