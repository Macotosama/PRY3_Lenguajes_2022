"""Módulo Main"""
from pyswip import Prolog

# prolog = Prolog()

# prolog.consult("laberint.pl")

# c = bool(list(prolog.query("gato(pena)")))
# print(c)

class Controler():
    """
    Encargado de manejar la comunicacion entre python y prolog.

    Attributes:
        prolog (Prolog): Instancia para la comunicacion con prolog
    """
    def __init__(self):
        """
        Inicializa el objeto de tipo Controler.
        """
        self.prolog = Prolog()
        # self.prolog.consult("laberinto.pl")
    
    def get_matrix(self):
        self.prolog.consult("laberinto.pl")
        c = bool(list(self.prolog.query("readFile_Caller()")))
        # c = bool(list(self.prolog.query("hola(adios)")))
        return c
        