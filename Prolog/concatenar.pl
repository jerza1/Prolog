concatenar([X1|R1],[],[X1|R1]).
concatenar([],[X2|R2],[X2|R2]).

concatenar([X1|R1],[X2|R2],[X1|R]):-
	concatenar(R1,[X2|R2],R).
%borra3u(,Z):-


