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


%Funcion encargada de encontrar el elemento que se esta solicitando en la lista y guardarlo.
evaluarElementoEnposicion(Fila,Columna,Matriz,Movimiento):-
nth0(Columnas,Matriz,X),
nth0(Filas,X,Y).

 