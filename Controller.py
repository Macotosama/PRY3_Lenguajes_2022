"""Módulo Main"""
from xml.etree.ElementTree import tostring, tostringlist
from pyswip import Prolog
from components.archivos import Archivos

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
        self.matriz = []
        # self.prolog.consult("laberinto.pl")
    
    def get_matrix(self):
        self.prolog.consult("laberinto.pl")
        archivoTemp = Archivos()
        self.matriz = archivoTemp.leer_archivo("D:/trabajis/Lenguajes/proyecto3/myFile.txt")
        # a = archivoTemp.leer_archivo("D:/trabajis/Lenguajes/proyecto3/myFile.txt")
        print(self.matriz)
        # self.prolog.query("readFile_Caller()")
        # c = list(self.prolog.query("hola(What)"))
        # c = list(self.prolog.query("archivo(What)"))
        # lista = [[9,2,4],[5,6,8]]
        # c = bool(list(self.prolog.query("optenerElmentoEnPosicion(0,1,"+ str(lista) +",2)")))
        c = self.realizar_movimiento()
        print(c)
        return c
        
    def realizar_movimiento(self):
        return bool(list(self.prolog.query("optenerElmentoEnPosicion(0,1,"+ str(self.matriz) +", up)")))