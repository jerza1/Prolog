%persona(Nombre,Altura,Color_pelo,Color_ojos,Lleva_gafas).

persona(maria,60,negro,marrones,si_gafas).
persona(luis,60,negro,cafe,no_gafas).
persona(antonio,70,castanio,cafe,no_gafas).
persona(ana,40,morado,avellana,si_gafas).
persona(laura,60,castanio,marrones,si_gafas).
persona(maribel,60,rojo,avellana,no_gafas).
persona(edith,60,castanio,marrones,no_gafas).
persona(jose,80,negro,cafe,no_gafas).
persona(victor,50,negro,marrones,si_gafas).
persona(jorge,60,negro,rojos,si_gafas).

%Misma altura, color de ojos diferente
q1(P1,P2):-
	persona(P1,A,_,C1,_),
	persona(P2,A,_,C2,_),
        C1\=C2.

%Mismo color de ojos, sin gafas y color de pelo diferente
q2(P1,P2):-
	persona(P1,_,Cab1,Oj,no_gafas),
	persona(P2,_,Cab2,Oj,no_gafas),
	Cab1\=Cab2.

%Mismo color de pelo, altura diferente
q3(P1,P2):-
	persona(P1,A1,Cab,_,_),
	persona(P2,A2,Cab,_,_),
	altura(A1,A2).

altura(A1,A2):-
	(A1-10)>=A2 | (A2-10)>=A1.

consulta1(L):-
	setof((P1,P2),q1(P1,P2),L).

consulta2(L):-
	setof((P1,P2),q2(P1,P2),L).

consulta3(L):-
	setof((P1,P2),q3(P1,P2),L).

parejas(L):-
	consulta1(L) | consulta2(L) | consulta3(L).
