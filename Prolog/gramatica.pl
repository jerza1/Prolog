%Lenguaje a*b*c*
%phrase(s,[a,a,b,c]).
%true
%s([a,b,c],Z).
%Z = [];
%Z = [c];
%Z = [b,c];
%Z = [a,b,c].

s --> a,b,c.
a -->[a],a.
a -->[].
b -->[b],b.
b -->[].
c -->[c],c.
c -->[].

oracion --> gn,gv.
gn --> det,nom.
gv --> verbo.
det --> [el]; [la].
nom -->[nino]; [hombre]; [estudiante]; [mujer]; [nina].
verbo -->[come]; [lee]; [estudia].


