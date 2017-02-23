%provedores(Scodigo,Snombre,estatus,ciudad)
provedores(s1,juan,20,madrid).
provedores(s2,pedro,10,castellon).
provedores(s3,raquel,30,alicante).
provedores(s4,maria,20,valencia).
provedores(s5,luis,30,castellon).

%partes(Pcodigo, Pnombre,color,peso,ciudad)
partes(p1,mesa,verde,20,castellon).
partes(p2,silla,verde,6,castellon).
partes(p3,armario,azul,60,alicante).
partes(p4,sofa,amarillo,55,valencia).
partes(p5,cama,marron,20,madrid).
partes(p6,libreria,roja,70,castellon).

%provpart(Scodigo,Pcodigo,Cantidad)
provpart(s1,p1,300).
provpart(s1,p2,200).
provpart(s1,p3,400).
provpart(s1,p4,300).
provpart(s1,p5,700).
provpart(s1,p6,100).
provpart(s2,p1,300).
provpart(s2,p2,400).
provpart(s3,p2,200).
provpart(s4,p2,200).
provpart(s4,p4,300).
provpart(s5,p5,400).

p_color(N):-
	partes(Ip,_,roja,_,_),
	provpart(Is,Ip,_),
	provedores(Is,N,_,_).
todos_roja(L):-
	setof(N,p_color(N),L).

p_cast(N):-
	partes(Ip,_,_,_,castellon),
	provpart(Ip2,Ip,_),
	provedores(Ip2,N,_,_).
castellon(L):-
	setof(N,p_cast(N),L).

provsinP2(N):-
	provedores(Ip,N,_,_),
	not(provpart(Ip,p2,_)).

todossinP2(L):- findall(N,provsinP2(N),L).

cantidad(Prov,Cant):-
	provedores(Id,Prov,_,_),
	findall(C,provpart(Id,_,C),L),
	suma(L,Cant).

suma([],0).
suma([A|R],Cant):-
	suma(R,C),
	Cant is C + A.

totalPartes(L):-
	findall((P,C),cantidad(P,C),L).
