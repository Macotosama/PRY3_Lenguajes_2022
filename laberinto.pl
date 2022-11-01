/** <Main> Prolog documentation processor

Este modulo se encarga de la carga de informacion del text y posterior creacion
de un alberinto con los datos necesarios para su finalizacion

@author Josue Torres N
@author Tim Scarlith G
@license GPL
*/
:- style_check(-singleton).


estadoGanador(f).

accionBasadaEnEstado(inter, up).
accionBasadaEnEstado(inter, down).
accionBasadaEnEstado(inter, left).
accionBasadaEnEstado(inter, right).

accionBasadaEnEstado(right, inter).



accionBasadaEnEstado(up, ar).


accionBasadaEnEstado(right, ad).

accionBasadaEnEstado(down, ab).

accionBasadaEnEstado(left, at).


obtenerMatriz:-
    globalMatriz(X).
/**
*Funcion de leer 
*Entrada: Una variable
 */
%Funcion encargada de leer archivos de texto.
readFile_Caller(Lines):-
    open('C:/Users/Usuario/Desktop/pry03/PRY3_Lenguajes_2022/myFile.txt', read, Str),
    read_file(Str,Lines),
    close(Str),
    asserta(globalMatriz(Lines)).
    %write(Lines), nl; 
    
%Funcion de apoyo a la funncion de readFile_Caller.
read_file(Stream,[]) :-
    at_end_of_stream(Stream).
%Funcion de apoyo a la funncion de readFile_Caller.
read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    read_file(Stream,L).


%Funcion encargada de encontrar el elemento que se esta solicitando en la lista y guardarlo.
evaluarElementoEnposicion(Fila,Columna,Matriz,Movimiento):-
nth0(Columnas,Matriz,X),
nth0(Filas,X,Y).

 


/**
*
*Funcion encargada de evaluar el caso y el movimiento especifico es un movimiento legal que no sea inter
*Entradas:Na
 */
evaluarCaso :-
    datoMovimiento(X), datoPosicion(Y), write(X), write(Y),
    accionBasadaEnEstado(X, Y).
    
/**
*Funcion encargada de evaluar si ya se llego al punto de gane 
*Entradas:Na
*/
evaluargane:-
    datoPosicion(Y),
    estadoGanador(Y).
/**
 * Funcion encargada de encontrar el elemento que se esta solicitado en una lista
 * Entradas: Filas, columnas, una matriz, el comando de movimiento(debe concidir con los siguientes: ar, ad, ab, at, inter)
 */
optenerElmentoEnPosicion(Filas,Columnas,Movimiento):-
    globalMatriz(M),
    nth0(Filas,M,X),
    nth0(Columnas,X,Y),
    retractall(datoPosicion(_)),
    retractall(datoMovimiento(_)),

    asserta(datoPosicion(Y)),
    asserta(datoMovimiento(Movimiento)).

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
%%Se debe evaluar que el movimiento resultante y el que se deseo ingresar sean correspondientes.
