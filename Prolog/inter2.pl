siguiente:-
	new(V2,dialog('Hola que hace')),
	send(V2,open).

:- new(Vent, dialog('Pantalla inicio')),
	new(B1, button('Iniciar',message(@prolog,siguiente))),
	send(Vent, append, B1),
	send(Vent,open).

