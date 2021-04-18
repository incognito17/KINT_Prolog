/* Personen */
person(hans).
person(klara).
person(sabrina).
person(kevin).

/* Tiere */
hund(fido).

/* Geschlecht */
weiblich(klara).
weiblich(sabrina).
maennlich(hans).
maennlich(kevin).
maennlich(fido).

/* Fakten */
frau(X) :- person(X), weiblich(X).
mann(X) :- person(X), maennlich(X).
