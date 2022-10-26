"""Módulo Main"""
import tkinter as tk
from typing import Container
from Controller import Controler
from screens.Laberinto import Laberinto
from style import styles

class Manager(tk.Tk):
    """
    Encargado de controlar la interfaz grafica.

    Attributes:
        title (str): Titulo de la aplicacion
        controler (Controler): Comunicacion con la logica de prolog
        container (Frame): Frame principal de la aplicacion, contiene toda la interfaz
    """
    def __init__(self, *args, **kwargs):
        """
        Inicializa el objeto de tipo Manager.

        Args:
            *args (tupla): Argumentos iniciadores del programa
            **kwargs (tupla): Argumentos iniciadores del programa
        """

        super().__init__(*args, **kwargs)
        self.title("Laberinto")
        self.controler = Controler()
        self.container = tk.Frame(self)
        self.container.pack(
            side=tk.TOP,
            fill=tk.BOTH,
            expand=True
        )
        self.container.configure(
            background=styles.BACKGROUND
        )
        self.container.grid_columnconfigure(0, weight=1)
        self.container.grid_rowconfigure(0, weight=1)
        self.frame = {}
        pantallas = (Laberinto, )
        for F in pantallas:
            frame = F(self.container, self)
            self.frame[F] = frame
            frame.grid(row=0, column=0, sticky=tk.NSEW)

    def show_frame(self, container):
        """
        Muestra el frame.

        Args:
            self (Manager): Contenedor actual
            container (Laberinto): Ventana actual
        """
        frame = self.frames[container]
        frame.tkraise()