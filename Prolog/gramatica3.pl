inicio(F):- write('Dame una frase:\n'),
	read(MF),
	atomic_list_concat(L,' ',MF),
	oracion(L,F).

oracion --> gn(_G,N),gv(N).
gn(G,N) --> det(G,N),nom(G,N).
gv(N) --> vi(N).
gv(N) --> vt(N), gn(_G,_N).
gv(N) --> vt(N).
det(h,sg) --> [el]; [un].
det(h,pl) --> [los]; [unos].
det(m,sg) --> [la]; [una].
det(m,pl) --> [las]; [unas].
vi(sg) --> [ladra].
vi(pl) --> [ladran].
vt(sg) --> [muerde]; [come]; [lee]; [estudia].
vt(pl) --> [muerden]; [comen]; [leen]; [estudian].
nom(h,sg) --> [nino]; [hombre]; [estudiante].
nom(h,pl) --> [ninos]; [hombres]; [estudiantes].
nom(m,sg) --> [mujer]; [nina]; [manzana].
nom(m,pl) --> [mujeres]; [ninas]; [manzanas].
