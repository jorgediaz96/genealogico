padrede('juan','maria').
padrede('pablo','juan').
padrede('pablo','marcela').
padrede('carlos','debora').

hijode(A,B) :-padre(B,A).

abuelode(A,B) :- padrede(A,C), padrede(C,B).

hermanode(A,B):- padrede(C,A), padrede(C,B), A \== B.

familiarde(A,B) :- padrede(A,B).

familiarde(A,B) :- abuelode(A,B).

familiarde(A,B) :- hermanode(A,B).

bisAbueloDe(A,B) :- padreDe(A,C), padreDe(C,D),padreDe(D,B).

tatarAbueloDe(A,B) :- padreDe(A,C), padreDe(C,D),padreDe(D,E),padreDe(E,B).

nietoDe(A,B):- abueloDe(B,A).

bisNietoDe(A,B):- bisAbueloDe(B,A).

tataraNietoDe(A,B):- tatarAbueloDe(B,A).

hermanoDe(A,B) :- padreDe(C,A), padreDe(C,B), A \== B.

tioDe(A,B):- hermanoDe(A,C),padreDe(C,B).

sobrinoDe(A,B):- tioDe(B,A).

tioAbueloDe(A,B):-hermanoDe(A,C),abueloDe(C,B).

sobrinoNietoDe(A,B):-tioAbueloDe(B,A).

bisTioDe(A,B):-hermanoDe(A,C),bisAbueloDe(C,B).

bisSobrinoDe(A,B):-bisTioDe(B,A).

primoDe(A,B):- padreDe(C,A), padreDe(D,B),hermanoDe(C,D).