:- use_module(library(tabular)).
:- use_module(library(autowin)).

:-  new(V,dialog('Asistente inteligente')),
    new(E,label(saludo,'Hola, ¿En qué te puedo ayudar?')),
    new(Buscar,text_item(consulta)),send(Buscar,label,''),
    new(P,picture(size := size(950,400))),send(P,label,'Resultados'),
    new(Cons,button('Consultar',and(message(@prolog,limpiar,P),message(@prolog,cargar),message(@prolog,analizar,Buscar,P)))),
    new(@boton, button('Salir',and(message(@prolog,salir), message(V, destroy),message(V, free),message(@boton, free)))),
    send_list(V,append,[E,Buscar,Cons,@boton,P]),
    send(V,open).

cargar:-
    [library(rdf)],
    use_module(library(semweb/rdf_db)),
    expand_file_name('ALG/*.rdf',A),
%   expand_file_name('GC/*.rdf',G),
%   expand_file_name('SO/*.rdf',S),
    expand_file_name('*.rdf',E),
    rdf_load([A,E],[format(xml)]),
    consult('gramatica.pl'),
    consult('buscador.pl').

analizar(B,P):-
    get(B,value,Frase),
    downcase_atom(Frase,Aux1),
    atomic_list_concat(Lista,' ',Aux1),
    oracion(Lista,[R1|R2]),
    (	R1 == 'año' ->
          atomic_list_concat(R2,' ',Aux),
          upcase_atom(Aux,Consulta),
          ( setof(W,anio(Consulta,W),Result) -> tabla(P,Result) ; send(P,display,text('No hay resultados'),point(20,20)));
      R1 == 'autor' ->
          atomic_list_concat(R2,' ',Aux),
          upcase_atom(Aux,Consulta),
          ( setof(W,autor(Consulta,W),Result) -> tabla(P,Result); send(P,display,text('No hay resultados'),point(20,20)));
      atomic_list_concat([R1|R2],' ',Aux),
        upcase_atom(Aux,Consulta),
        (setof(W,busqueda(Consulta,W),Result) -> tabla(P,Result); send(P,display,text('No hay resultados'),point(20,20)))
    ).

tabla(P,Result):-
    send(P, display, new(T, tabular)),
    send(T, border, 1),
    send(T, cell_spacing, -1),
    send(T, rules, all),
    send_list(T,
        [ append('Ficha', bold, center),
          append('Titulo', bold, center),
          append('Autor', bold, center),
          append('Clasificación', bold, center),
          append('Anio', bold, center),
          append('Ejemplares', bold, center),
          append('Area', bold, center)]),
    resultados(Result,P,T).

resultados([],_,_).
resultados([Result|Res],P,Tab):-
    Result=..[_,Lista|_],Lista=..[_,Ficha,R1|_],R1=..[_,Titulo,R2|_],R2=..[_,Autor,R3|_],
    R3=..[_,Clasf,R4|_],R4=..[_,Anio,R5|_],R5=..[_,Ejem,Area|_],
    send_list(Tab,[next_row,
                    append(Ficha, bold),
                    append(Titulo),
                    append(Autor),
                    append(Clasf),
                    append(Anio),
                    append(Ejem),
                    append(Area),
            next_row]),
    resultados(Res,P,Tab).

salir:-
    nl,expand_file_name('ALG/*.rdf',A),borrar(A),
    rdf_unload('Descripción_GC.rdf'),rdf_unload('Descripción_ALG.rdf'), rdf_unload('Descripción_SO.rdf'),nl.

borrar([]).
borrar([A|R]):-
    rdf_unload(A),borrar(R).

limpiar(P):- send(P,clear).



