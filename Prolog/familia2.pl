progenitor(jose,sara).
progenitor(mary,sara).
progenitor(sara,pam).
progenitor(john,pam).
progenitor(pam,bob).
progenitor(tom,bob).
progenitor(tom,liz).
progenitor(bob,ann).
progenitor(bob,pat).
progenitor(pat,jim).

mujer(pam).
mujer(liz).
mujer(ann).
mujer(pat).
mujer(mary).
mujer(sara).

hombre(jose).
hombre(john).
hombre(bob).
hombre(tom).
hombre(jim).

nacion(jose,mexicano).
nacion(john,britanico).
nacion(tom,mexicano).
nacion(bob,mexicano).
nacion(mary,mexicana).
nacion(sara,britanica).
nacion(pam,canadiense).
nacion(pat,china).


descendiente(X,Y):-
	progenitor(Y,X).

madre(X,Y):-
	progenitor(X,Y),
	mujer(X).

padre(X,Y):-
	progenitor(X,Y),
	hombre(X).

abuelo(X,Y):-
	padre(X,Z),
	progenitor(Z,Y).

abuela(X,Y):-
	madre(X,Z),
	progenitor(Z,Y).

hermano(X,Y):-
	progenitor(Z,X),
	progenitor(Z,Y),
	hombre(X).

hermana(X,Y):-
	progenitor(Z,X),
	progenitor(Z,Y),
	mujer(X).

tia(X,Y):-
	progenitor(Z,Y),
	hermana(X,Z).

tio(X,Y):-
	progenitor(Z,Y),
	hermano(X,Z).

nieto(X,Y):-
	hombre(X),
	progenitor(Y,Z),
	progenitor(Z,X).

nieta(X,Y):-
	mujer(X),
	progenitor(Y,Z),
	progenitor(Z,X).

ancestroR(Z,X):-
	progenitor(Z,Y),
	ancestroR(Y,X).

ancestroR(Z,X):-
	progenitor(Z,X).

nacionalidad(X,Nac):-
	nacion(X,Nac).

nacionalidad(X,Nac):-
	progenitor(Z,X),
	nacionalidad(Z,Nac).
