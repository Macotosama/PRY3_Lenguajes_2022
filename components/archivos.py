
from tokenize import String


class Archivos:
    def __init__(self) -> None:
        pass

    def leerArchivo(self, ruta) -> String:
        return self.abrirArchivo(ruta)

    def abrirArchivo(self, ruta):
        archivo = open(ruta, 'r')
        msg = archivo.read()
        return msg