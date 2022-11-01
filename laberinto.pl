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

accionBasadaEnEstado(up, ar).


accionBasadaEnEstado(right, ad).

accionBasadaEnEstado(down, ab).

accionBasadaEnEstado(left, at).


obtenerMatriz(X):-
    globalMatriz(X).
/**
*Funcion de leer 
*Entrada: Una variable
 */
%Funcion encargada de leer archivos de texto.
readFile_Caller(Dirrecion):-
    open('D:/trabajis/Lenguajes/proyecto3/myFile.txt', read, Str),
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
    datoMovimiento(X), datoPosicion(Y), 
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
    nth0(Columnas,M,X),
    nth0(Filas,X,Y),
    retractall(datoPosicion(_)),
    retractall(datoMovimiento(_)),

    asserta(datoPosicion(Y)),
    asserta(datoMovimiento(Movimiento)).

    
%%Se debe evaluar que el movimiento resultante y el que se deseo ingresar sean correspondientes.
