from pyswip import Prolog

prolog = Prolog()

prolog.consult("laberint.pl")

c = bool(list(prolog.query("gato(pena)")))
print(c)