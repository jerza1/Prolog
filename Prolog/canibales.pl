estado_inicial(mc,estado((3,3),(0,0),a)).
estado_final(mc,estado((0,0),(3,3),b)).

pasa(1,1).
pasa(0,1).
pasa(2,0).
pasa(1,0).
pasa(0,2).

a_salvo(CAF,MAF,CBF,MBF):-
	MAF > 0, MBF > 0,
	CAF =< MAF, CBF =< MBF.

a_salvo(_,MAF,CBF,MBF):- MAF = 0, MBF>0, CBF =<MBF.

a_salvo(CAF,MAF,_,MBF):- MAF > 0, MBF=0, CAF =<MAF.

a_salvo(_,MAF,_,MBF):- MAF = 0, MBF=0.


mover(mc,estado((CA,MA),(CB,MB),a),estado((CNA,MNA),(CNB,MNB),b)):-
	pasa(X,Y),
	CNA is CA-X, MNA is MA-Y,
	CNB is CB+X, MNB is MB+Y,
	CNA >= 0,
	a_salvo(CNA,MNA,CNB,MNB).

mover(mc,estado((CA,MA),(CB,MB),b),estado((CNA,MNA),(CNB,MNB),a)):-
	pasa(X,Y),
	CNB is CB-X, MNB is MB-Y,
	CNA is CA+X, MNA is MA+Y,
	CNB >= 0,
	a_salvo(CNA,MNA,CNB,MNB).



pertenece(X,[X|_]).
pertenece(X,[_|Ls]):-pertenece(X,Ls).

insertarFinal([],X,[X]).
insertarFinal([L|Ls],X,[L|R]):-insertarFinal(Ls,X,R).


busquedaProf(S,V,V):- estado_final(mc,S).
busquedaProf(S,V,LS):- mover(mc,S,NS),
                       not(pertenece(NS,V)),
                       insertarFinal(V,NS,NV),
                       busquedaProf(NS,NV,LS).

%CASO 1: SI SE LLEGA AL ESTADO FINAL, YA SE ENCONTRÓ LA SOLUCIÓN
resuelve(Problema,EdoN,_,[EdoN]):- estado_final(Problema,EdoN).

%CASO 2: SI NO SE  HA LLEGADO AL ESTADO FINAL, REALIZAR ACCIONES PARA
%        GENERAR UN NUEVO ESTADO
resuelve(Problema,Edo,Visitados,[Edo|EdoS]):- mover(Problema,Edo,EdoN),
          no_esta(EdoN,Visitados),
          resuelve(Problema,EdoN,[EdoN|Visitados],EdoS).

resuelveI(Problema):-estado_inicial(Problema,EdoI),
                                  resuelve(Problema,EdoI,[EdoI],[EdoI|Otros]),
                                  escribe([EdoI|Otros]).


resolverCanMis(mc,S):- busquedaProf(estado(mc,mc,0,0,0),[estado(mc,mc,0,0,0)],S).

