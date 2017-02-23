es_un(pez,animal).
es_un(ave,animal).

es_un(albatro,ave).
es_un(rapaz,ave).
es_un(aguila,rapaz).
es_un(halcon,rapaz).
es_un(buitre,rapaz).
es_un('aguila perdicera',aguila).
es_un(calzada,aguila).
es_un('cernicalo primilla',halcon).
es_un('cernicalo vulgar',halcon).
es_un(espada,pez).
es_un(salmon,pez).
es_un(atun,pez).
es_un(marlin,pez).


vive(ave,arboles).
vive(pez,mar).

come(ave,semillas).
come(pez,plantas).

peso(aguila,regular).

tam(aguila,mediano).
tam(salmon,mediano).

comeC(A,C):-
	come(A,C).

comeC(A,C):-
	es_un(A,T),
	comeC(T,C).

viveC(A,V):-
	vive(A,V).

viveC(A,V):-
	es_un(A,T),
	viveC(T,V).

es_unC(A,E):-
	es_un(A,E).

es_unC(A,E):-
	es_un(A,T),
	es_unC(T,E).




