/** <Main> Prolog documentation processor

Este modulo se encarga de la carga de informacion del text y posterior creacion
de un alberinto con los datos necesarios para su finalizacion

@author Josue Torres N
@author Tim Scarlith G
@license GPL
*/


accionBasadaEnEstado('up', 'inter').
accionBasadaEnEstado('down', 'inter').
accionBasadaEnEstado('left', 'inter').
accionBasadaEnEstado('right', 'inter').

accionBasadaEnEstado('up', 'ar').

accionBasadaEnEstado('right', 'ad').

accionBasadaEnEstado('down', 'ab').

accionBasadaEnEstado('left', 'at').


/**
*
*Funcion encargada de evaluar el caso y el movimiento especifico es un movimiento legal que no sea inter
*Entradas:Dos strings
 */

 %evaluarCaso('inter', Movimiento):- accionBasadaEnEstado(Movimiento, 'inter').
 %evaluarCaso('ar', Movimiento):- accionBasadaEnEstado(Movimiento, 'ar').
 %evaluarCaso('ad', Movimiento):- accionBasadaEnEstado(Movimiento, 'ad').
 %evaluarCaso('ab', Movimiento):- accionBasadaEnEstado(Movimiento, 'ab').
 %evaluarCaso('at', Movimiento):- accionBasadaEnEstado(Movimiento, 'at').

evaluarCaso(Y,Movimiento):-
    (Y='inter')->accionBasadaEnEstado(Movimiento, 'inter');
    (Y='ar')->accionBasadaEnEstado(Movimiento, 'ar');
    (Y='ad')->accionBasadaEnEstado(Movimiento, 'ad');
    (Y='ab')->accionBasadaEnEstado(Movimiento, 'ab');
    (Y='at')->accionBasadaEnEstado(Movimiento, 'at').
    %accionBasadaEnEstado(Y, Movimiento).%->RespuestaMovimiento is 1,
    %RespuestaMovimiento is 0.

/**
 * Funcion encargada de encontrar el elemento que se esta solicitado en una lista
 * Entradas: Filas, columnas, una matriz, el comando de movimiento(debe concidir con los siguientes: ar, ad, ab, at, inter)

 */
optenerElmentoEnPosicion(Fila,Columna,Matriz,Movimiento):-
    nth0(Columnas,Matriz,X),
    nth0(Filas,X,Y),
    evaluarCaso(Y,Movimiento).
%Se debe evaluar que el movimiento resultante y el que se deseo ingresar sean correspondientes. 
 