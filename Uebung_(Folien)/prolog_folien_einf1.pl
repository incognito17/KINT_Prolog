eating(dudley).
happy(aunt_petunia) :- happy(dudley).
happy(uncle_vernon) :- happy(dudley),
unhappy(harry).
happy(dudley) :- kicking(dudley,harry).
happy(dudley) :- eating(dudley).
kicking(dudley,ron).
unhappy(ron).

wizard(harry).
fears(dudley, hagrid).
magical(X) :- wizard(X).
hates(uncle_vernon, X) :- magical(X).
hates(aunt_petunia, X) :- magical(X).
hates(aunt_petunia, X) :- fears(dudley, X).