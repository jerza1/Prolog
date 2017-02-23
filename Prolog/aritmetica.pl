%longitud([1,2,3],R).
%R = 3
%longitud([1],R).
%R = 1
longitud([],0).
longitud([_|R],L):-
	longitud(R,L2),
	L is L2 + 1.

%longitud version2
longitud2([],0).
longitud2([_|R],L):-
	longitud2(R,L2),
	L = 1 + L2.

%maxlis([7,2,1],M).
%M = 7
%maslist([2,7,1],M)
%M = 7
maxlist([X],X).
maxlist([X|R],X):-
	maxlist(R,M),
	X > M.
maxlist([X|R],M):-
	maxlist(R,M),
	M > X.
%sumaLista([1,7,9],S).
%S = 17
sumaLista([],0).
sumaLista([X|R],S):-
	sumaLista(R,S2),
	S is X + S2.
%ordenada([1,7,9]).
%true
%ordenada([7,1,2]).
%false
ordenada([_]).
ordenada([X,Y|R]):-
	X =< Y,
	ordenada([Y|R]).
%cuentaRep([a,a,a,b,c],NR).
%NR = 3
cuentaRep([_],0).
cuentaRep([X,X|R],S):-
	cuentaRep([X|R],S2),
	S is S2 + 1.
cuentaRep([X,Y|_R],1):- X\=Y .
%cuentaVocales([1,a,2,e,i],NV).
%NV = 3
vocal(a).
vocal(e).
vocal(i).
vocal(o).
vocal(u).

numero(0).
numero(1).
numero(2).
numero(3).
numero(4).
numero(5).
numero(6).
numero(7).
numero(8).
numero(9).

cuentaV([],0).
cuentaV([X|R],S):-
	vocal(X),
	cuentaV(R,S2),
	S is S2 + 1.
cuentaV([X|R],S):-
	numero(X),
	cuentaV(R,S).
%enckesimo([a,b,c,d],2,E).
%E = b
%enckesimo([a,b,c,d],3,E).
%E=c
enckesimo([X|_],1,X).
enckesimo([_|X],N,L):-
	N2 is N - 1,
	enckesimo(X,N2,L).
%desde([a,b,c,d],2,L).
%L = [b,c,d]
%desde([a,b,c,d],3,L).
%L = [c,d]
desde([X|R],1,[X|R]).
desde([_X|R],N,L):-
	N2 is N - 1,
	desde(R,N2,L).

%hasta([a,b,c,d],2,L).
%L = [a,b]
%hasta([a,b,c,d],3,L).
%L = [a,b,c]
hasta([X|_],1,[X]).
hasta([X|R],N,[X|L]):-
	N2 is N - 1,
	hasta(R,N2,L).
