info(Archivo, Ficha, Titulo, Autor, Clasif, Anio, Ejem, Area):-
	rdf(Archivo, 'Biblioteca/ficha', Ficha),
	rdf(Archivo, 'Biblioteca/titulo', Titulo),
	rdf(Archivo, 'Biblioteca/autor',  Autor),
	rdf(Archivo, 'Biblioteca/clasificacion', Clasif),
	rdf(Archivo, 'Biblioteca/anio', Anio),
	rdf(Archivo, 'Biblioteca/ejemplares', Ejem),
	rdf(Archivo, 'Biblioteca/area', Area).

%Buscar por ficha
busqueda(Palabra,Res):-
	rdf(X, 'Biblioteca/ficha', literal(Palabra)),
	setof((Palabra, Titulo, Autor, Clasif, Anio, Ejem, Area),
		info(X, literal(Palabra), literal(Titulo), literal(Autor),
		     literal(Clasif), literal(Anio), literal(Ejem), literal(Area)),
		Res).

%Buscar por titulo
busqueda(Palabra,Res):-
	rdf(X, 'Biblioteca/titulo', literal(Palabra)),
	setof((Ficha, Palabra, Autor, Clasif, Anio, Ejem, Area),
		info(X, literal(Ficha), literal(Palabra), literal(Autor),
		     literal(Clasif), literal(Anio), literal(Ejem), literal(Area)),
		Res).

%Buscar por autor
busqueda(Palabra,Res):-
	rdf(X, 'Biblioteca/autor', literal(Palabra)),
	setof((Ficha, Titulo, Palabra, Clasif, Anio, Ejem, Area),
		info(X, literal(Ficha), literal(Titulo), literal(Palabra),
		     literal(Clasif), literal(Anio), literal(Ejem), literal(Area)),
		Res).


%Buscar por clasificacion
busqueda(Palabra,Res):-
	rdf(X, 'Biblioteca/clasificacion', literal(Palabra)),
	setof((Ficha, Titulo, Autor, Palabra, Anio, Ejem, Area),
		info(X, literal(Ficha), literal(Titulo), literal(Autor),
		     literal(Palabra), literal(Anio), literal(Ejem), literal(Area)),
		Res).

%Buscar por anio
busqueda(Palabra,Res):-
	rdf(X, 'Biblioteca/anio', literal(Palabra)),
	setof((Ficha, Titulo, Autor, Clasif, Palabra, Ejem, Area),
		info(X, literal(Ficha), literal(Titulo), literal(Autor),
		     literal(Clasif), literal(Palabra), literal(Ejem), literal(Area)),
		Res).

%Buscar por numero de ejemplares
busqueda(Palabra,Res):-
	rdf(X, 'Biblioteca/ejemplares', literal(Palabra)),
	setof((Ficha, Titulo, Autor, Clasif, Anio, Palabra, Area),
		info(X, literal(Ficha), literal(Titulo), literal(Autor),
		     literal(Clasif), literal(Anio), literal(Palabra), literal(Area)),
		Res).

busqueda(Palabra,Res):-
	rdf(X, 'Biblioteca/area', literal(Palabra)),
	setof((Ficha, Titulo, Autor, Clasif, Anio, Ejem,Palabra),
		info(X, literal(Ficha), literal(Titulo), literal(Autor),
		     literal(Clasif), literal(Anio), literal(Ejem), literal(Palabra)),
		Res).


busqueda(Palabra,Res):-
	rdf(_, 'Biblioteca/tema', literal(Palabra),W) ,
	compound_name_arguments(W,_,[L|_]),
	setof((Ficha,Titulo,Autor,Clasif,Anio,Ejem,Area),
		info(L, literal(Ficha), literal(Titulo), literal(Autor),
		     literal(Clasif), literal(Anio), literal(Ejem), literal(Area)),
		Res).

busqueda(Palabra,Res):-
	rdf(_, 'Biblioteca/subtema', literal(Palabra),W) ,
	compound_name_arguments(W,_,[L|_]),
	setof((Ficha,Titulo,Autor,Clasif,Anio,Ejem,Area),
		info(L, literal(Ficha), literal(Titulo), literal(Autor),
		     literal(Clasif), literal(Anio), literal(Ejem), literal(Area)),
		Res).

area(Palabra,Res):-
	rdf(X, 'Biblioteca/area', literal(Palabra)),
	setof((Ficha, Titulo, Autor, Clasif, Anio, Ejem,Palabra),
		info(X, literal(Ficha), literal(Titulo), literal(Autor),
		     literal(Clasif), literal(Anio), literal(Ejem), literal(Palabra)),
		Res).
anio(Palabra,Res):-
	rdf(X, 'Biblioteca/anio', literal(Palabra)),
	setof((Ficha, Titulo, Autor, Clasif, Palabra, Ejem, Area),
		info(X, literal(Ficha), literal(Titulo), literal(Autor),
		     literal(Clasif), literal(Palabra), literal(Ejem), literal(Area)),
		Res).
autor(Palabra,Res):-
	rdf(X, 'Biblioteca/autor', literal(Palabra)),
	setof((Ficha, Titulo, Palabra, Clasif, Anio, Ejem, Area),
		info(X, literal(Ficha), literal(Titulo), literal(Palabra),
		     literal(Clasif), literal(Anio), literal(Ejem), literal(Area)),
		Res).
