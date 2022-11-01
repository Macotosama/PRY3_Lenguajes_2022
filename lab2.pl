/**
*Función encargada de buscar el camino a la salida del mapa
*/

get_cell([R,C], Data,L):-
    nth0(R,Data,L1),
    nth0(C,L1,L).

labyrinth(Map, Start, Finish):-
    labyrinth(Map, Start, Finish,[], [],Solution),!,
    reverse(Solution,S),
    print(S).

labyrinth(_, Finish, Finish,_, Out,Out). %Unification of solution
labyrinth(Map, Start, Finish, Positions,Moves,Out) :-
move(Move),
update(Start, Move, NewState),
\+ member(NewState, Positions),
legal(NewState, Map),
labyrinth(Map, NewState, Finish,[NewState|Positions],[Move|Moves],Out).

legal( p(X,Y), Map) :-
X >= 0, 7>X,
Y >= 0, 7>Y,
get_cell([X,Y], Map, Z),
%write(Z),
Z \= x.

% UP
update(  p(X, Y), up, p(X_new, Y)  ) :-
    X_new is X - 1.

% DOWN
update(  p(X,Y), down, p(X_new, Y) ) :-
    X_new is X + 1.

% LEFT
update(  p(X,Y), left, p(X, Y_new)  ) :-
Y_new is Y - 1.

% RIGHT
update(  p(X,Y), right, p(X, Y_new)  ) :-
Y_new is Y + 1.

move(  up    ).
move(  down  ).
move(  left  ).
move(  right ).
/*
labyrinth([[e,e,w,w,w,w,w],[w,e,w,e,w,e,w],[w,e,w,e,w,e,w],[w,e,e,e,w,e,w],[w,e,w,e,w,e,w],[w,e,e,e,e,e,w],[e,w,w,w,w,e,e]], p(1,2), p(6,6), _).*/
labyrinth([[x,x,x,x,x,x,x,x,x,x,x],[x,ar,x,x,ad,ad,ad,inter,ad,inter,x],[i,inter,ad,ad,inter,x,x,ab,x,ab,x],[x,ab,x,x,x,inter,at,inter,x,ab,x],[x,ab,x,x,x,ab,x,ab,x,x,x],[x,ab,x,x,inter,inter,x,ab,x,inter,f],[x,ab,x,x,ab,x,x,inter,inter,inter,x],[x,ab,x,x,ab,x,x,x,ar,x,x],[x,ab,x,at,inter,inter,ad,ad,inter,at,x],[x,ab,x,ar,x,ab,x,x,ab,ar,x],[x,inter,ad,inter,x,inter,ad,x,ab,inter,x],[x,x,x,x,x,x,x,x,x,x,x]], p(2,1), p(5,10)).