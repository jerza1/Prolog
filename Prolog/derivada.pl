%casos base
derivada(N,_,0):- number(N),!.
derivada(X,X,1).
derivada(sin(X),X,cos(X)).
derivada(cos(X),X,-sin(X)).
derivada(X^N,X,N*X^NN):-number(N),!, N > 0, NN is N - 1.


%derivada de suma
derivada(A+B,X,DA+DB):-	derivada(A,X,DA),derivada(B,X,DB).

%derivada de resta
derivada(A-B,X,DA-DB):-	derivada(A,X,DA),derivada(B,X,DB).

%derivada de un producto
%caso 1: constante por función
derivada(N*A,X,N*DA):- number(N), !,derivada(A,X,DA).

%caso 2: función por función
%derivada(A*B,X,N*DA):-	number(N), !,derivada(A,X,DA).
derivada(N*A,X,N*DA + A*DN):-	derivada(N,X,DN),derivada(A,X,DA).

%derivada de un cociente
%caso1: constante sobre función derivada(N/A,X,N)
derivada(N/A,X,(-N*DA)/A*A):-	number(N),derivada(A,X,DA).

%caso2: cociente de funciones
derivada(N/A,X,(DN*A - N*DA)/A*A):-
	not(number(N)),
	derivada(N,X,DN),
	derivada(A,X,DA).

