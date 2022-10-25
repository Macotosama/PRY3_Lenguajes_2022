from pyswip import Prolog

# prolog = Prolog()

# prolog.consult("laberint.pl")

# c = bool(list(prolog.query("gato(pena)")))
# print(c)

class Controler():
    def __init__(self):
        self.prolog = Prolog()
        self.prolog.consult("laberinto.pl")
        