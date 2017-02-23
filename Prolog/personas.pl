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

alguienHombre([X|_R]):-
	hombre(X).
alguienHombre([_X|R]):-
	alguienHombre(R).

todosHombre([]).
todosHombre([X|R]):- hombre(X), todosHombre(R).

todosiguales([_X]).
todosiguales([X,X|R]):-
	todosiguales([X|R]).

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
%eliminaRepC([a,b,c,c,d],Res).
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

%menos(X,[X|L],L).
%menos(X,[C|L],[C|LX]):-
%	menos(X,L,LX).
%permutacion(L,[C|CL]):-
%menos(C,L,LC),
%permutacion(LC,CL).
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
