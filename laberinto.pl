/** <Main> Prolog documentation processor

Este modulo se encarga de la carga de informacion del text y posterior creacion
de un alberinto con los datos necesarios para su finalizacion

@author Josue Torres N
@author Tim Scarlith G
@license GPL
*/
:- style_check(-singleton).


estadoGanador(f).
/**
accionBasadaEnEstado(inter, up).
accionBasadaEnEstado(inter, down).
accionBasadaEnEstado(inter, left).
accionBasadaEnEstado(inter, right).
accionBasadaEnEstado(right, inter).
accionBasadaEnEstado(up, ar).
accionBasadaEnEstado(right, ad).
accionBasadaEnEstado(down, ab).
accionBasadaEnEstado(left, at).*/



accionBasadaEnEstado(right, right).
accionBasadaEnEstado(right, inter).

accionBasadaEnEstado(down, down).
accionBasadaEnEstado(down, inter).

accionBasadaEnEstado(up, up).
accionBasadaEnEstado(up, inter).

accionBasadaEnEstado(left, inter).
accionBasadaEnEstado(left, left).

accionBasadaEnEstado(inter, inter).
accionBasadaEnEstado(inter, left).
accionBasadaEnEstado(inter, down).
accionBasadaEnEstado(inter, up).
accionBasadaEnEstado(inter, right).
accionBasadaEnEstado(inter, f).

accionBasadaEnEstado(i, inter).
accionBasadaEnEstado(i, left).
accionBasadaEnEstado(i, down).
accionBasadaEnEstado(i, up).
accionBasadaEnEstado(i, right).

obtenerMatriz(X):-
    globalMatriz(X).
/**
*Funcion de leer 
*Entrada: Una variable
 */
%Funcion encargada de leer archivos de texto.
readFile_Caller(Dirrecion):-
    %open('D:/trabajis/Lenguajes/proyecto3/myFile.txt', read, Str),
    open('C:/Users/Usuario/Desktop/pry03/PRY3_Lenguajes_2022/myFile.txt', read, Str),
    read_file(Str,Lines, _),
    close(Str),
    asserta(globalMatriz(Lines)), buscarInicio.
    %write(Lines), nl; 
    
%Funcion de apoyo a la funncion de readFile_Caller.
read_file(_,[], R) :-
    R == end_of_file, !.
%Funcion de apoyo a la funncion de readFile_Caller.
read_file(Stream,[X|L], R) :-
    read(Stream,X),
    read_file(Stream,L, X).


%Funcion encargada de encontrar el elemento que se esta solicitando en la lista y guardarlo.
evaluarElementoEnposicion(Fila,Columna,Matriz,Movimiento):-
nth0(Columnas,Matriz,X),
nth0(Filas,X,Y).

 


/**
*Funcion encargada de buscar la i o elemento inical
*Entradas:Na
*/
buscarInicio:-
    globalMatriz([A|B]),
    member(i,A),
    I is 0,
    J is 0,
    buscarEnColumnas(I,J,A),!.

/**
*Funcion encargada de buscar la i o elemento inical
*Entradas:Na
*/
buscarInicio:-
    globalMatriz([A|B]),
    not(member(i,A)),
    I is 1,
    J is 0,
    buscarEnFilas(I,J,B).

buscarInicio.
/**
*Funcion auxiliar de buscar la buscarInicio o elemento iniciando desde las filas
*Entradas:Na
*/
buscarEnFilas(I,J,[A|B]):-
    member(i,A),
    buscarEnColumnas(I,J,A).
/**
*Funcion auxiliar de buscar la buscarInicio o elemento iniciando desde las filas
*Entradas:Na
*/
buscarEnFilas(I,J,[A|B]):-
    not(member(i,A)),
    R is I+1,
    buscarEnFilas(R,J,B).
buscarEnFilas(_,_,[]).
/**
*Funcion auxiliar de buscar la buscarInicio o elemento iniciando desde las columnas
*Entradas:Na
*/
buscarEnColumnas(I,J,[A|B]) :-
    A == i,
    write("tramado"),
    asserta(posicionActual(I,J)),
    asserta(datoActual(i)), !.
/**
*Funcion auxiliar de buscar la buscarInicio o elemento iniciando desde las columnas
*Entradas:Na
*/
buscarEnColumnas(I,J,[A|B]):-
    not(A == i),
    R is J+1,
    write("sigue"),
    buscarEnColumnas(I,R,B).
buscarEnColumnas(_,_,[]).




/**
*
*Funcion encargada de evaluar el caso y el movimiento especifico es un movimiento legal que no sea inter
*Entradas:Na
 */
evaluarCaso :-
    %datoMovimiento(X), datoPosicion(Y), write(X), write(Y),
    datoActual(X), datoPosicion(Y),
    accionBasadaEnEstado(X, Y),
    retractall(datoActual(_)),
    asserta(datoActual(Y)),
    retractall(datoPosicion(_)).

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
optenerElmentoEnPosicion(Filas,Columnas):-
    globalMatriz(M),
    nth0(Filas,M,X),
    nth0(Columnas,X,Y),
    retractall(datoPosicion(_)),
    

    asserta(datoPosicion(Y)).
    

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
