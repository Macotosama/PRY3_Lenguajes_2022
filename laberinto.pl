/** <Main> Prolog documentation processor

Este modulo se encarga de la carga de informacion del text y posterior creacion
de un alberinto con los datos necesarios para su finalizacion

@author Josue Torres N
@author Tim Scarlith G
@license GPL
*/
:- style_check(-singleton).

accionBasadaEnEstado(inter, up).
accionBasadaEnEstado(inter, down).
accionBasadaEnEstado(inter, left).
accionBasadaEnEstado(inter, right).

accionBasadaEnEstado(up, ar).


accionBasadaEnEstado(right, ad).

accionBasadaEnEstado(down, ab).

accionBasadaEnEstado(left, at).


/**
*
*Funcion encargada de evaluar el caso y el movimiento especifico es un movimiento legal que no sea inter
*Entradas:Dos strings
 */

evaluarCaso :-
    datoMovimiento(X), datoPosicion(Y), 
    accionBasadaEnEstado(X, Y).


/**
 * Funcion encargada de encontrar el elemento que se esta solicitado en una lista
 * Entradas: Filas, columnas, una matriz, el comando de movimiento(debe concidir con los siguientes: ar, ad, ab, at, inter)

 */
optenerElmentoEnPosicion(Filas,Columnas,Matriz,Movimiento):-
    nth0(Columnas,Matriz,X),
    nth0(Filas,X,Y),
    retractall(datoPosicion(_)),
    retractall(datoMovimiento(_)),

    asserta(datoPosicion(Y)),
    asserta(datoMovimiento(Movimiento)).

    
%%Se debe evaluar que el movimiento resultante y el que se deseo ingresar sean correspondientes.