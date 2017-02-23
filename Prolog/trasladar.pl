concatenar([],X,X).
concatenar([X1|R1],X2,[X1|RR]):-
	concatenar(R1,X2,RR).
borrar3U(LisE,LisR):-
	concatenar(LisR,[_X,_Y,_Z],LisE).

extraeU(LisE,Ultimo):-
	concatenar(_Xlis,[Ultimo],LisE).

borrarDSec(ListaE,Secuencia,LR):-
	concatenar(LR,_Sobra,ListaE),
	concatenar(_PrimeroP,Secuencia,LR).

%trasladar([1,2,3],R).
%R=[uno,dos,tres].
numero(0,cero).
numero(1,uno).
numero(2,dos).
numero(3,tres).
numero(4,cuatro).
numero(5,cinco).
numero(6,seis).
numero(7,siete).
numero(8,ocho).
numero(9,nueve).

trasladar([],[]).
trasladar([Ln|R], [L|Res]):-
	numero(Ln,L),
	trasladar(R,Res).

extraeUR([X],X).
extraeUR([_X|R], Ult):-
	extraeU(R,Ult).

%Reversa
%reversa(ListaE,ListaR).
%reversa([a,b,c,d],R).
%R=[d,c,b,a].

reversa([X],[X]).

reversa([X|R],[Y|RR]):-
	extraeU([X|R],Y),
	concatenar(Res,[Y],[X|R]),
	reversa(Res,RR).

%palindromo([o,s,o]).
%true
palindromo([X|R]):-
	reversa([X|R],[X|R]).

%par([a,b]).
%true
%impar([a,b]).
%false
par([]).
par([_X|R]):-
	impar(R).
impar([_X]).
impar([_X|R]):-
	par(R).

%sustituye([e,b,d,e,c],e,u,L).
%L=[u,b,d,u,c]
%Caso base:
sustituye([],_TS,_NT,[]).
%Primer caso: TS es el primero de la lista
sustituye([TS|R],TS,NT,[NT|RR]):-
	sustituye(R,TS,NT,RR).

%Segundo caso: TS no es el primero de la lista
sustituye([X|R],TS,NT,[X|RR]):-
	X\=TS,
	sustituye(R,TS,NT,RR).

%duplicar([a,b,c],L).
%L=[a,a,b,b,c,c]
duplicar([],[]).
duplicar([X|R],[X,X|RR]):-
	duplicar(R,RR).
