start :- consult('basePac.pl'),
         nl,
         insertar.

insertar :-
	write('Paciente : p, Estudio : e, EstudioPaciente : c  Guardar : g???'),
        read(Op),
        consulta(Op).

consulta(p):-
	write('ID?'),
	read(Id),
	write('Nombre?'),
	read(Nom),
	write('Edad?'),
	read(Ed),
	write('Origen?'),
	read(Or),
	assert(paciente(Id,Nom,Ed,Or)).

consulta(e):-
	write('ID?'),
	read(Id),
	write('Tipo de estudio?'),
	read(Tip),
	write('Resultado?'),
	read(Res),
	assert(estudio(Id,Tip,Res)).

consulta(c):-
	write('ID Estudio?'),
	read(Ide),
	write('ID Paciente?'),
	read(Idp),
	assert(e_p(Ide,Idp)).

consulta(g) :- write('Guardando datos'), nl,
                tell('basePac.pl'),
                listing(paciente),
                listing(estudio),
                listing(e_p),
                told,
                write('Listo.'), nl.


