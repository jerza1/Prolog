bebida(agua).
bebida(refresco).
bebida(jugo).
bebida(vino).

% ! Operador de corte

paresbebida(X,Y):- bebida(X),bebida(Y).
paresbebida2(X,Y):- bebida(X),!,bebida(Y).
paresbebida3(X,Y):- bebida(X),bebida(Y),!.

%R1: si X < 3 entonces Y = 0
%R2: si X >= 3 y X < 6 entonces Y = 2
%R3: si X >= 6 entonces Y = 4

f(X,0):- X < 3.
f(X,2):- 3 =< X,X < 6.
f(X,4):- 6 =< X.

f2(X,0):- X < 3,!.
f2(X,2):- 3 =< X, X < 6,!.
f2(X,4):- 6 =< X.

f3(X,0):- X < 3,!.
f3(X,2):- X < 6,!.
f3(_X,4) .

max(X,Y,X):- X >= Y,!.
max(_X,Y,Y).

%positivo(3).
%true
%positivo(-3).
%false
positivo(X):- X > 0,!.

%negativo(3).
%false
%negativo(-3).
%true
negativo(X):-
	X < 0.

%dividePosNeg([-1,2,3,4],Neg,Pos).
%Neg = [-1]
%Pos = [2,3,4]
%X es negativo
%dividePosNeg([X|R],N,P):-
%	X < 0,
%	N = [X|Rn],
%	dividePosNeg(R,Rn,P).
%X es positivo
%dividePosNeg([X|R],N,P):-
%	X > 0,
%	P = [X|Rp],
%	dividePosNeg(R,N,Rp).
%X es negativo
dividePosNeg([],[],[]).
dividePosNeg([X|R],[X|R1],P):-
	X<0,
	!,
	dividePosNeg(R,R1,P).
%X es positivo
dividePosNeg([X|R],R1,[X|R2]):-
	dividePosNeg(R,R1,R2).

desde([X|R],X,[X|R]).
desde([X|R],Y,Res):-
	X\=Y,
	desde(R,Y,Res).
desde2([X|R],X,[X|R]):-!.

hasta2([X|_R],X,[X]):-!.
hasta2([X|R],Y,[X|Res]):-
	hasta2(R,Y,Res).

eliminaE([X|R],X,R):-!.
eliminaE([X|R],Y,[X|Res]):-
	eliminaE(R,Y,Res).

%analizaSec([1,5,7,9,4,3],Res).
%Res=[1,+,5,+,7,+,9,-,4,-,3].
analizaSec([X],[X]).
analizaSec([X,Y|R1],[X,+|R2]):-
	X < Y, !,
	analizaSec([Y|R1],R2).
analizaSec([X,Y|R1],[X,-|R2]):-
	%X >= Y,
	analizaSec([Y|R1],R2).
