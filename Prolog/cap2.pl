start :- consult('capitales.pl'),
         nl,
         write('Escribe los nombres completamente en min�sculas,'), nl,
         write('seguidos de un punto.'), nl,
         nl,
         process_a_query.

process_a_query :- write('Pa�s? '),
                   read(Pais),
                   answer(Pais).

% Si el usuario ingresa "stop.", entonces grabar la nueva
% base de conocimientos y salir.
answer(stop) :- write('Grabando la base de conocimientos...'), nl,
                tell('capitales.pl'),
                listing(capital),
                told,
                write('Listo.'), nl.

% Si el pa�s ya est� en la base de conocimientos, entonces retornar
% el nombre de su capital.
answer(Pais) :- capital(Pais, Ciudad),
                write('La capital de '),
                write(Pais),
                write(' es '),
                write(Ciudad), nl,
                nl,
                process_a_query.

% Si el pa�s no est� en la base de conocimientos, entonces pedir
% el nombre de la capital e ingresar este fact a la base.
answer(Pais) :- \+ capital(Pais, Ciudad),
                write('No conozco la capital de ese pa�s.'), nl,
                write('Por favor, dime cual es.'), nl,
                write('Capital? '),
                read(Ciudad),
                write('Gracias.'), nl, nl,
                assert(capital(Pais, Ciudad)),
                process_a_query.
