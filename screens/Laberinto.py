"""Módulo Screens"""
import tkinter as tk
from Controller import Controler
from style import styles

class Laberinto(tk.Frame):
    """
    Encargado de controlar la ventana de laberito.

    Attributes:
        manager (str): Instancia para controlar la ventana
    """
    def __init__(self, parent, manager):
        """
        Inicializa el objeto de tipo Laberinto.

        Args:
            parent (Manager): Contenedor del contenedor del frame actual
            manager: Clase encargada de manejar las ventajas
        """

        super().__init__(parent)
        self.manager = manager
        self.init_widgets()
    
    def init_widgets(self):
        """
        Inicia las configuraciones de las ventana

        Args:
            self (Laberinto): Ventana actual
        """

        tk.Label(
            self,
            text="Crea o realiza tests",
            justify=tk.CENTER,
            **styles.STYLE
        ).pack(
            **styles.PACK
        )