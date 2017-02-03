escribeLista([]):-nl.
escribeLista([X|Resto]):-write(X),put(32),escribeLista(Resto).

acontecimiento(1505,['Euclides',traducido,al,latin]).
acontecimiento(1523,['Chistian','II',huye,de,'Dinamarca']).
consulta:-write('¿Que fecha desea consultar?'),put(32),
				read(D),
				acontecimiento(D,S),
				escribeLista(S),
				write('¿Desea continuar? (S/N)'),
				put(32),read(X),
				continuar(X).
continuar('s'):-!,consulta.
