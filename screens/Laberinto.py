import tkinter as tk
from Controller import Controler
from style import styles

class Laberinto(tk.Frame):
    def __init__(self, parent, manager):
        super().__init__(parent)
        self.manager = manager
        self.init_widgets()
    
    def init_widgets(self):
        tk.Label(
            self,
            text="Crea o realiza tests",
            justify=tk.CENTER,
            **styles.STYLE
        ).pack(
            **styles.PACK
        )