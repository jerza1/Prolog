:-new(Jarvis,dialog('Asistente inteligente')),
	new(E,label(saludo,'Hola, ¿En qué te puedo ayudar?')),
	new(T,text_item('Escribe tu consulta')),
	new(S,button('Salir',message(Jarvis,destroy))),
	new(P,picture),
	new(B,button('Consultar',message(@prolog,imprime,T,P))),
	send_list(Jarvis,append,[E,T,B,S,P]),
	send(Jarvis,open).
imprime(T,P):-get(T,value,Text), send(P,display,text(Text)).
