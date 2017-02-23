%interseccion([a,b,c],[a,c,e],R).
%R = [a,c]
%interseccion([a,b,c],[d,e,c],R).
%R = [c]
pertenece(X,[X|_R]).

pertenece(X,[_Y|R]):-
	pertenece(X,R).

interseccion([],[_X|_R],[]).
interseccion([X1|R1],[X2|R2],Res):-
	Res = [X1|RR],
	pertenece(X1,[X2|R2]),
	interseccion(R1,[X2|R2],RR),!.

interseccion([X1|R1],[X2|R2],Res):-
	not(pertenece(X1,[X2|R2])),
	interseccion(R1,[X2|R2],Res).

%union([a,b,c],[a,c,e],R).
%R = [a,b,c,e]
union([X|R],[],[X|R]).
union([X1|R1],[X2|R2],[X2|RR]):-
	not(pertenece(X2,[X1|R1])),
	union([X1|R1],R2,RR).

union([X1|R1],[X2|R2],Res):-
	pertenece(X2,[X1|R1]),
	union([X1|R1],R2,Res).

%diferencia([a,b,c],[d,e,c],Res).
%Res = [a,b]
diferencia([],[_X|_R],[]).
diferencia([X1|R1],[X2|R2],[X1|RR]):-
	not(pertenece(X1,[X2|R2])),
	diferencia(R1,[X2|R2],RR),!.

diferencia([X1|R1],[X2|R2],RR):-
	pertenece(X1,[X2|R2]),
	diferencia(R1,[X2|R2],RR).

%clasificaRep([a,a,a,b,c,c,c,c,d,d],LR).
%LR = [3-a,1-b,4-c,2-d]
%termino(1,X,X).
%termino(N,X,N-X):-
%	N > 1.

contar(_,[],0,[]).
contar(X,[X|R1],N,L2):-
	contar(X,R1,N2,L2),
	N is N2 + 1.
contar(X,[Y|R],0,[Y|R]):-
	X\=Y.
clasificaRep([],[]).
clasificaRep([X|L1],[N-X|L2]):-
	contar(X,[X|L1],N,L3),
	clasificaRep(L3,L2).
	
%decodifica([3-a,1-b,4-c,2-d],LR).
%LR = [a,a,a,b,c,c,c,c,d,d]
decodifica([],[]).
decodifica([1-X|L1],[X|L2]):-
	!,decodifica(L1,L2).
decodifica([N-X|L1],[X|L2]):-
	!, N1 is N - 1,
	decodifica([N1-X|L1],L2).
decodifica([X|L1],[X|L2]):-
	decodifica(L1,L2).

%suma_posiciones([2,3,5,1,9],2,R).
%R = 4
%suma_posiciones([2,5,1,7,9,8,7],3,R).
%R = 9

elemento([X|R],1,X,R).
elemento([_|R1],N,X,R2):-
%	N > 1,
	M is N-1,
	elemento(R1,M,X,R2).

suma_posiciones([X|R],N,S):-
	elemento([X|R],N,E,L1),!,
	suma_posiciones(L1,N,S1),
	S is E + S1.
suma_posiciones(_,_,0).

%analizaSec([1,5,7,9,4,3],Res).
%Res=[1,+,5,+,7,+,9,-,4,-,3].
analizaSec([X],[X]).
analizaSec([X,Y|R1],[X,+|R2]):-
	X < Y, !,
	analizaSec([Y|R1],R2).
analizaSec([X,Y|R1],[X,-|R2]):-
	%X >= Y,
	analizaSec([Y|R1],R2).
