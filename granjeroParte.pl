% Autor:
% Fecha: 02/12/2013
%% REPRESENTACIÓN
% representaremos el estado del problema por una estructura estado/4:
%
%    estado(Granjero,Lobo,Cabra,Col)
%
% donde cada componente representa el margen del rio en que se
% encuentra cada personaje (izq o der)

%ESTADO INICIAL
% al principio todos estan al mismo lado (izq)
estado_inicial(glcc, estado(izq,izq,izq,izq)).


%ESTADO FINAL
% al final deben estar todos al otro lado (der)
estado_final(glcc, estado(der,der,der,der)).


%%% ACCIONES
% movimientos posibles

% cruza el granjero con el lobo
mover(glcc,estado(X,X,Cabra,Col), estado(Y,Y,Cabra,Col)) :-
        cruza(X,Y),
        a_salvo(estado(Y,Y,Cabra,Col)).

% cruza el granjero con la cabra
mover(glcc,estado(X,Lobo,X,Col), estado(Y,Lobo,Y,Col)) :-
        cruza(X,Y),
        a_salvo(estado(Y,Lobo,Y,Col)).


% cruza el granjero con la col
mover(glcc,estado(X,Lobo,Cabra,X), estado(Y,Lobo,Cabra,Y)) :-
        cruza(X,Y),
        a_salvo(estado(Y,Lobo,Cabra,Y)).


% cruza el granjero solo
mover(glcc,estado(X,Lobo,Cabra,Col), estado(Y,Lobo,Cabra,Col)) :-
        cruza(X,Y),
        a_salvo(estado(Y,Lobo,Cabra,Col)).

cruza(izq,der).
cruza(der,izq).

% una configuracion es segura:

%1) si el granjero y la cabra estan en el mismo lado del rio
a_salvo(estado(X,_,X,_)).

% 2) si el granjero y la cabra estan en lados  distintos,
%    el lobo y la col deben estar con el granjero
a_salvo(estado(X,X,Y,X)):-
	X \= Y.

%%CLÁUSULAS PARA BUSCAR LA SOLUCIÓN

no_esta(_,[]).
no_esta(X,[Y|Ys]) :-
        X \== Y,
        no_esta(X,Ys).
%CASO 1: SI SE LLEGA AL ESTADO FINAL, YA SE ENCONTRÓ LA SOLUCIÓN
resuelve(Problema,EdoN,_,[EdoN]):- estado_final(Problema,EdoN).

%CASO 2: SI NO SE  HA LLEGADO AL ESTADO FINAL, REALIZAR ACCIONES PARA
%        GENERAR UN NUEVO ESTADO
resuelve(Problema,Edo,Visitados,[Edo|EdoS]):- mover(Problema,Edo,EdoN),
          no_esta(EdoN,Visitados),
          resuelve(Problema,EdoN,[EdoN|Visitados],EdoS).



%%CLÁSULA PRINCIPAL PARA RESOLVER EL PROBLEMA
resuelveI(Problema):-estado_inicial(Problema,EdoI),
                                  resuelve(Problema,EdoI,[EdoI],[EdoI|Otros]),
                                  escribe([EdoI|Otros]).

escribe([]).
escribe([X|RestoM]):- write(X),nl, escribe(RestoM).
