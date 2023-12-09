move(In,Out):-
	append(S,['_','w'|T],In),
	append(S,['w','_'|T],Out).
move(In,Out):-
	append(S,['b','_'|T],In),
	append(S,['_','b'|T],Out).
move(In,Out):-
	append(S,['_','b','w'|T],In),
	append(S,['w','b','_'|T],Out).
move(In,Out):-
	append(S,['b','w','_'|T],In),
	append(S,['_','w','b'|T],Out).

prolong([X|T],[Y,X|T]):-
	move(X,Y),
	not(member(Y,[X|T])).

dpth([X|T],X,[X|T]).
dpth(P,X,R):-
	prolong(P,O),
	dpth(O,X,R).

dpth_search(In,Out):-
	get_time(TimeStart),
	dpth([In],Out,Sub),
	get_time(TimeEnd),
	Time is TimeEnd - TimeStart,
	print(Sub),nl, nl,
	length(Sub, Len),write('Solution length: '),writeln(Len),
	write('Time:'),writeln(Time),nl.

bdth([[X|T]|_],X,[X|T]).
bdth([P|QI],X,R):-
	findall(W,prolong(P,W),T),
	append(QI,T,QO),!,
	bdth(QO,X,R).
bdth([_|T],Out,L):- bdth(T,Out,L).

bdth_search(In,Out):-
	get_time(TimeStart),
	bdth([[In]],Out,Sub),
	get_time(TimeEnd),
	Time is TimeEnd - TimeStart,
	print(Sub),nl, nl,
	length(Sub, Len),write('Solution length: '),writeln(Len),
	write('Time:'),writeln(Time),nl.

int(1).
int(N):- int(M), N is M+1.

iter([X|T],X,[X|T],0).
iter(P,X,R,N):-
	N>0, prolong(P,W),
	N1 is N-1,
	iter(W,X,R,N1).

iter_search(In,Out):-
	get_time(TimeStart),
	int(Level),
	(Level>100,!;iter([In],Out,Sub,Level)),
	get_time(TimeEnd),
	Time is TimeEnd - TimeStart,
	print(Sub),nl, nl,
	length(Sub, Len),write('Solution length: '),writeln(Len),
	write('Time:'),writeln(Time),nl.

print([_]):-!.
print([B|T]):-
	print(T),nl,write(B).

solve:-
	In = ['b', 'b', 'b', 'b', '_', 'w', 'w', 'w'],
	Out = ['w', 'w', 'w', '_', 'b', 'b', 'b', 'b'],
	writeln('Iterative'),
	iter_search(In, Out),

	writeln('DFS'),
	dpth_search(In, Out),

	writeln('BFS'),
	bdth_search(In,Out),
        !.
