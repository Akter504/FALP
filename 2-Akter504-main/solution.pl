god('T').

god('L').

god('D').

testimony('T',X,X).
testimony('L',X,Y):- not(X=Y).
testimony('D',_,_).

intsol(A,B,C):-
    god(A),
    god(B),
    not(A=B),
    god(C),
    not(A=C), not(B=C),
    testimony(A,B,'T'),
    testimony(B,B,'D'),
    testimony(C,B,'L').
