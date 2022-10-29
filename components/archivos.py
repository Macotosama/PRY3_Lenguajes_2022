
class Archivos:
    def __init__(self) -> None:
        pass

    def leer_archivo(self, ruta):
        return self.abrir_archivo(ruta)

    def abrir_archivo(self, ruta):
        archivo = open(ruta, 'r')
        msg = archivo.read()
        matriz = self.string_matriz(msg)
        archivo.close()
        return matriz

    def string_matriz(self, archivo):
        newlist = self.limpiar_lista(self.string_split(archivo, "."))
        newlist = self.recorre_split(newlist, '\n')
        newlist = self.recorre_split(newlist, '[')
        newlist = self.recorre_split(newlist, ']')
        newlist = self.recorre_split_final(newlist, ',')
        # splitPunto = archivo.split("/n")
        return newlist

    def recorre_split_final(self, archivo, token):
        newlist = []
        for x in archivo:
            newlist += [self.limpiar_lista(self.string_split(x, token))]
        return newlist


    def recorre_split(self, archivo, token):
        newlist = []
        for x in archivo:
            newlist += self.limpiar_lista(self.string_split(x, token))
        return newlist

    def string_split(self, archivo, token):
        return archivo.split(token)

    def limpiar_lista(self, archivo):
        return [x for x in archivo if x != '']