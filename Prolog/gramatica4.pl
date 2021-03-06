lex(el,articulo,singular).
lex(los,articulo,plural).
lex(gato,nombre,singular).
lex(gatos,nombre,plural).
lex(perro,nombre,singular).
lex(perros,nombre,plural).
lex(pescado,nombre,singular).
lex(pescados,nombre,plural).
lex(carne,nombre,singular).
lex(carnes,nombre,plural).
lex(come,verbo,singular).
lex(comen,verbo,plural).

oracion(o(SN,SV)) --> sgN(SN,N), sgV(SV,N).

sgN(sn(S),N) --> nombre(S,N).

sgN(sn(A,S),N) --> articulo(A,N), nombre(S,N).

sgV(sv(V,S),N) --> verbo(V,N), sgN(S,_).

articulo(art(Palabra),N) --> [Palabra],
	{lex(Palabra, articulo,N)}.

nombre(nom(Palabra),N) --> [Palabra],
	{lex(Palabra, nombre,N)}.

verbo(verb(Palabra),N) --> [Palabra],
	{lex(Palabra, verbo,N)}.
