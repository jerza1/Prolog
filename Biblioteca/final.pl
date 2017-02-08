:- use_module(library(tabular)). %libreria para crear la tabla de resultados
:- use_module(library(autowin)). %libreria que ajusta las celdas de la tabla al  contenido

:-  new(V,dialog('Asistente inteligente')), %Creamos la ventana principal
    new(E,label(saludo,'Hola, ¿En qué te puedo ayudar?')), %Etiqueta de saludo
    new(Buscar,text_item(consulta)),send(Buscar,label,''), %Caja de texto para las consultas
    new(P,picture(size := size(950,400))),%Área donde se muestra la tabla de resultados
    send(P,label,'Resultados'), %Etiqueta del área de resultados
    new(Cons,button('Consultar',and(message(@prolog,limpiar,P),message(@prolog,cargar),message(@prolog,analizar,Buscar,P)))),
    %Al presionar el botón Consultar llama a los siguientes predicados
    %lipiar(P) Limpia el area de resultados
    %cargar Carga la base de datos rdf
    %analizar(Buscar,P) Comenzar busqueda
    new(@boton, button('Salir',and(message(@prolog,salir),message(V, free),message(V, destroy),message(@boton, free)))),
    %@boton Finalizar el sistema de busqueda
    %salir Libera rdf cargados
    %free(V) Borra ventana
    %destroy(V) Cierra la ventana
    %free(@boton) Borra boton consultar
    send_list(V,append,[E,Buscar,Cons,@boton,P]), %Agregamos los elementos a la ventana principal
    send(V,open). %Abre la ventana principal

cargar:-
    [library(rdf)],
    use_module(library(semweb/rdf_db)),
    expand_file_name('ALG/*.rdf',A),
    expand_file_name('GC/*.rdf',G),
    expand_file_name('SO/*.rdf',S),
    expand_file_name('*.rdf',E),
    rdf_load([A,E,G,S],[format(xml)]),
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
          ( setof(W,anio(Consulta,W),Result) -> tabla(P,Result),length(Result,Lon),send(P,label,string('Resultados %d',Lon)) ;
	    send(P,display,text('No hay resultados'),point(20,20))
	  );
        R1 == 'autor' ->
          atomic_list_concat(R2,' ',Aux),
          upcase_atom(Aux,Consulta),
          ( setof(W,autor(Consulta,W),Result) -> tabla(P,Result),length(Result,Lon),send(P,label,string('Resultados %d',Lon));
	    send(P,display,text('No hay resultados'),point(20,20))
	  );
        atomic_list_concat([R1|R2],' ',Aux),
          upcase_atom(Aux,Consulta),
          (  setof(W,busqueda(Consulta,W),Result) -> tabla(P,Result),length(Result,Lon),send(P,label,string('Resultados %d',Lon));
	     send(P,display,text('No hay resultados'),point(20,20))
	  )
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
    Result=..[_,Lista|_],Lista=..[_,Ficha,R1|_],
    R1=..[_,Titulo,R2|_],R2=..[_,Autor,R3|_],
    R3=..[_,Clasf,R4|_],R4=..[_,Anio,R5|_],
    R5=..[_,Ejem,Area|_],
    send_list(Tab,[next_row,
                    append(Ficha, bold),
                    append(Titulo),
                    append(Autor),
                    append(Clasf),
                    append(Anio),
                    append(Ejem),
                    append(Area),
                    next_row]
	     ),
    resultados(Res,P,Tab).

salir:-
    nl,expand_file_name('ALG/*.rdf',A),
    expand_file_name('GC/*.rdf',G),
    expand_file_name('SO/*.rdf',S),
    expand_file_name('*.rdf',E),
    borrar(A),borrar(G),borrar(S),borrar(E),nl.

borrar([]).
borrar([A|R]):-
    rdf_unload(A),borrar(R).

limpiar(P):- send(P,clear).



