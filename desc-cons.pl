escala(Figura,Factor,FiguraN):-
	Figura=..[Tipo|Parametros],
	multiplicaList(Parametros,Factor,NParams),
	FiguraN=..[Tipo|NParams].

multiplicaList([], S, S).

multiplicaList([L|R], F, S):-
          F2 is F * L,
          multiplicaList(R, F2, S).