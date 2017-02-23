inicio:-
	consult('capitales.pl'),
	nl, write('CAPITALES DE MÉXICO'), nl,
	consulta.

consulta:-
	write('¿Cuál es la capital de...? '),
	read(E),
	procesa(E).

otra('s'):- consulta,!.
otra('n'):-
	write('¡¡Guardando cambio de capitales...!!'),nl,
	tell('capitales.pl'),
	listing(capital),
	told,
	write('Adios'),nl.

%Existe el estado
procesa(E):-
	capital(E,C),
	write('La capital de '),
	write(E),
	write(' es '),
	write(C), nl,
	write('¿Consultar otra vez?(s/n)'),
	read(R),
	otra(R).

%No existe el estado
procesa(E):-
	not(capital(E,C)),
	write('***No hay registro de ese estado***'),nl,
	write('Por favor, dime su capital:'),nl,
	read(C),
	assert(capital(E,C)),
	write('¿Consultar otra vez?(s/n)'),
	read(R),
	otra(R).
