/** <Main> Prolog documentation processor

Este modulo se encarga de la carga de informacion del text y posterior creacion
de un alberinto con los datos necesarios para su finalizacion

@author Josue Torres N
@author Tim Scarlith G
@license GPL
*/

/**
 * readFile_Caller(Lines:string) is nondet
 *
 * Encargada de leer archivos de texto.
 */
readFile_Caller(Lines):-
    open('D:/trabajis/Lenguajes/proyecto3/myFile.txt', read, Str),
    read_file(Str,Lines),
    close(Str).
    %write(Lines), nl; 
    
%Funcion de apoyo a la funncion de readFile_Caller.
read_file(Stream,[]) :-
    at_end_of_stream(Stream).

%Funcion de apoyo a la funncion de readFile_Caller.
read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    read_file(Stream,L).

/**
*Funcion encargada de evaluar el movimiento especifico inter 
*Entradas:Dos strings
*
 */
evaluarCosoAUX(Y,RespuestaMovimiento):-
    ConstanteMovimiento is 2,
    (Y=:=ConstanteMovimiento)->RespuestaMovimiento is 1;
    RespuestaMovimiento is 0.
/**
*
*Funcion encargada de evaluar el caso y el movimiento especifico es un movimiento legal que no sea inter
*Entradas:Dos strings
 */
evaluarCaso(Y,Movimiento):-
    (Y=:=Movimiento)->RespuestaMovimiento is 1,
    /**
*RespuestaMovimiento is 0, */
    evaluarCosoAUX(Y,RespuestaMovimiento).
/**
 * Funcion encargada de encontrar el elemento que se esta solicitado en una lista
 * Entradas: Filas, columnas, una matriz, el comando de movimiento(debe concidir con los siguientes: ar, ad, ab, at, inter)

 */
optenerElmentoEnPosicion(Fila,Columna,Matriz,Movimiento):-
    nth0(Columnas,Matriz,X),
    nth0(Filas,X,Y),
    evaluarCaso(Y,Movimiento).
%Se debe evaluar que el movimiento resultante y el que se deseo ingresar sean correspondientes. 
 