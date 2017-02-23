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

extraeU(LisE,Ultimo):-
	concatenar(_Xlis,[Ultimo],LisE).
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
%elimina el primer elemento que encuentra
%eliminaE([a,b,c],b,L).
%L = [a,c]

eliminaE([],_E,[]).

eliminaE([X|R],X,R).
eliminaE([X|R],E,Res):-
	X\=E,
	eliminaE(R,E,RR),
	Res = [X|RR].

%eliminar repetidos consecutivos
%eliminarRepC([a,b,c,c,d],Res).
%Res = [a,b,c,d]
eliminarRepC([],[]).
eliminarRepC([X],[X]).
eliminarRepC([X,X|R],RR):-
	eliminarRepC([X|R],RR).
eliminarRepC([X,Y|R],[X|RR]):-
	X\=Y,
	eliminarRepC([Y|R],RR).

%inserta(a,[b,c,d], L).
%L = [a,b,c,d];
%L = [b,a,c,d];
%L = [b,c,a,d];
%L = [b,c,d,a];
inserta(E,[],[E]).
inserta(E,[X|R],[E|[X|R]]).
inserta(E,[X|R],[X|RR]):-
	inserta(E,R,RR).

%selecciona([a,b,c],E).
%E = a;
%E = b;
%E = c;
selecciona([X|_R],[X]).
selecciona([_X|R],RR):-
	selecciona(R,RR).
%permutaciones([a,b,c],L).
%L = [a,b,c].
%L = [a,c,b].
%L = [b,a,c].
%L = [b,c,a].
%L = [c,a,b].
%L = [c,b,a].
concatenar([],X,X).
concatenar([X1|R1],X2,[X1|RR]):-
	concatenar(R1,X2,RR).

permutaciones([],[]).
permutaciones(L,[C|CL]):-
	concatenar(X,[C|Ys],L),
	concatenar(X,Ys,Zs),
	permutaciones(Zs,CL).
mujer(alma).
mujer(ana).
mujer(laura).
mujer(delia).
mujer(rosa).
mujer(sofia).
mujer(renata).
mujer(martha).
mujer(edith).
mujer(samantha).

hombre(juan).
hombre(pedro).
hombre(luis).
hombre(pablo).
hombre(antonio).
hombre(victor).
hombre(gabriel).
hombre(jose).
hombre(miguel).
hombre(angel).

alguienMujer([X|_R]):-
	mujer(X).
alguienMujer([_X|R]):-
	alguienMujer(R).

todosMujer([]).
todosMujer([X|R]):- mujer(X), todosMujer(R).

todosHombre([]).
todosHombre([X|R]):- hombre(X), todosHombre(R).

%cuentaVocales([1,a,2,e,i],NV).
%NV = 3
vocal(a).
vocal(e).
vocal(i).
vocal(o).
vocal(u).

numero2(0).
numero2(1).
numero2(2).
numero2(3).
numero2(4).
numero2(5).
numero2(6).
numero2(7).
numero2(8).
numero2(9).

cuentaV([],0).
cuentaV([X|R],S):-
	vocal(X),
	cuentaV(R,S2),
	S is S2 + 1.
cuentaV([X|R],S):-
	numero2(X),
	cuentaV(R,S).
%enckesimo([a,b,c,d],2,E).
%E = b
%enckesimo([a,b,c,d],3,E).
%E=c
enckesimo([X|_],1,X).
enckesimo([_|X],N,L):-
	N2 is N - 1,
	enckesimo(X,N2,L).
%cuentaRep([a,a,a,b,c],NR).
%NR = 3
cuentaRep([_],0).
cuentaRep([X,X|R],S):-
	cuentaRep([X|R],S2),
	S is S2 + 1.
cuentaRep([X,Y|_R],1):- X\=Y .
%ordenada([1,7,9]).
%true
%ordenada([7,1,2]).
%false
ordenada([_]).
ordenada([X,Y|R]):-
	X =< Y,
	ordenada([Y|R]).
%sumaLista([1,7,9],S).
%S = 17
sumaLista([],0).
sumaLista([X|R],S):-
	sumaLista(R,S2),
	S is X + S2.

%multiplicada([a,b,c],3,LR).
%LR = [a,a,a,b,b,b,c,c,c]
repetir(X,1,[X]).
repetir(X,N,[X|R]):-
	N > 1,
	N1 is N - 1,
	repetir(X,N1,R).

multiplicada([],_,[]).
multiplicada([X|R],N,LR):-
	repetir(X,N,LRX),
	multiplicada(R,N,LRR),
	concatenar(LRX,LRR,LR).

union_ord([X|R],[],[X|R]).
union_ord([],[X|R],[X|R]).
union_ord([X|XR],[Y|YR],[X|L]):-
	X < Y,
	union_ord(XR,[Y|YR],L).
union_ord([X|XR],[Y|YR],[Y|L]):-
	X >= Y,
	union_ord([X|XR],YR,L).