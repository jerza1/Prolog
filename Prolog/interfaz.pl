%new(V1,V2)
%V1 referencia del obj a crear
%V2 constructor

:-pce_image_directory('./imagenes').
resource(imagen1,image,image('uno.jpg')).
resource(imagen2,image,image('dos.jpg')).

sumar(N1,N2,R):-atom_number(N1,N1c),atom_number(N2,N2c),
	Res is N1c + N2c,
	send(R,selection,Res).

:- new(Dialogo ,dialog('Ejemplo1')),
	new(E,label(nombre,'Hola Prolog')),
	new(Ei,label(nombre2,resource(imagen1))),
	new(T1,text_item('Ingrese el numero')),
	new(T2,text_item('Ingrese el numero2')),
	new(T3,text_item('Resultado = ')),
	new(B1,button('Sumar',
		      message(@prolog, sumar,T1?selection,
			      T2?selection,T3))),
	new(B2,button('Salir',message(Dialogo,destroy))),
	new(Ve ,popup),
	send_list(Ve, append,[menu_item('Cambiar Imagen',message(@prolog,cambiar,Ei)),
			    menu_item('Imagen inicial',message(@prolog,inicial,Ei)),
			    menu_item('Salir',message(Dialogo,destroy))]),
	send(Ei,popup,Ve),
	send(E,font,font(times,bold,15)),
	send(T3,editable,false),
	send_list(Dialogo,append,[E,Ei,T1,
				  T2,T3,B1,B2]),
	send(Dialogo,open).

cambiar(X):-send(X,selection,resource(imagen2)).
inicial(X):-send(X,selection,resource(imagen1)).

