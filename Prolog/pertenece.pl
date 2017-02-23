pertenece(X,[X|R]).

pertenece(X,[_Y|R]):-
	pertenece(X,R).
