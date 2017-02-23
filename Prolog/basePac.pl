:- dynamic paciente/1.


:- dynamic paciente/2.


paciente(p1, juan, 20, huajuapan).
paciente(p2, pedro, 20, acatlan).
paciente(p3, raquel, 20, nochixtlan).
paciente(p4, maria, 20, tamazulapan).
paciente(p5, sara, 20, huajuapan).
paciente(p6, monica, 20, huajolotitlan).

:- dynamic estudio/1.


:- dynamic estudio/2.


estudio(e1, sangre_glucemia, 100).
estudio(e2, radio_torax, normal).
estudio(e3, sangre_glucemia, 200).
estudio(e4, sangre_glucemia, 80).
estudio(e5, mamografia, normal).
estudio(e6, mamografia, birads4).
estudio(e7, biobsia, maligno).
estudio(e8, biobsia, benigno).
estudio(e9, mamografia, birads2).
estudio(e10, mamografia, birads4).

:- dynamic e_p/1.


:- dynamic e_p/2.

e_p(e1, p1).
e_p(e2, p1).
e_p(e4, p1).
e_p(e3, p2).
e_p(e5, p3).
e_p(e6, p4).
e_p(e7, p4).
e_p(e9, p5).
e_p(e10, p6).
e_p(e8, p6).

