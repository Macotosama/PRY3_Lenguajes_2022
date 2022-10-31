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
Z \= w .

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