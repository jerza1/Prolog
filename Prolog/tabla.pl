simple_table :-
        new(P, picture),
        send(P, layout_manager, new(T, table)),
        send(T, border, 1),
        send(T, frame, box),
        send(T, append, text('Ficha')),
        send(T, append, text('Titulo')),
        send(T, append, text('Autor')),
        send(T, append, text('Clasificación')),
        send(T, append, text('Anio')),
	send(T, append, text('Ejemplares')),
        send(T, append, text('Area')),
        send(T, next_row),
        send(T, append,
             new(C1, table_cell(text(6709, font := bold)))),
        send(C1, col_span, 2),
        send(C1, halign, center),
        send(P, open).

ask_name(Name) :-
        new(D, dialog('Register')),
        send(D, append(new(NameItem, text_item(name)))),
        send(D, append(button(ok, message(D, return,
                                          NameItem?selection)))),
        send(D, append(button(cancel, message(D, return, @nil)))),
        send(D, default_button(ok)),
        get(D, confirm, Rval),
        free(D),
        Rval \== @nil,
        Name = Rval.
algo:-
	new(V,dialog('algo')),
	new(T, text_item(height, 0)),
	send(T, type, int),
	send(T, length, 80),
	send(V,append,T),
	send(V,open).
create_window :-
	new(D, dialog('Create a new window')),
	send(D, append, new(Label, text_item(label, 'Untitled'))),
	send(D, append, new(Class, menu(class, choice))),
	send_list(Class, append,
		  [ class(window),
		    class(picture),
		    class(dialog),
		    class(browser),
		    class(view)
		  ]),
	send(D, append,
	     new(Width, slider(width, 100, 1000, 400))),
	send(D, append,
	     new(Height, slider(height, 100, 1000, 200))),
	send(D, append,
	     button(create,message(@prolog, create_window,
				   Class?selection,
				   Label?selection,
				   Width?selection,
				   Height?selection))),
	send(D, append,
	     button(cancel, message(D, destroy))),
	send(D, open).
create_window(Class, Label, Width, Height) :-
	get(Class, instance, Label, Window),
	send(Window?frame, set, @default, @default, Width, Height),
	send(Window, open).
edit_box(Box) :-
	new(D, dialog(string('Edit box %N', Box))),
	send(D, append,
	     text_item(name, Box?name, message(Box, name, @arg1))),
	send(D, append,
	     new(S, slider(pen, 0, 10, Box?pen, message(Box, pen, @arg1)))),
	send(S, width, 50),
	send(D, append, button(apply)),
	send(D, append, button(restore)),
	send(D, append, button(cancel, message(D, destroy))),
	send(D, default_button, apply),
	send(D, open).







