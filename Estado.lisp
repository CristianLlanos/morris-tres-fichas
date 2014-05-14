;---------------------------------------------------
; Estas son las variables que serán utilizadas a lo 
; largo de toda la codificación del juego de Morris

(defvar *Tablero*) ; Tablero de 3x3
(defvar *TableroAux*) ; Tablero auxiliar para operaciones
(defvar *EstadosMeta*) ; Todos los estados Meta
(defvar *Turno*) ; Humano: 1, Ordenador: -1
(defvar *Humano*) ; Humano: 1
(defvar *Ordenador*) ; Ordenador: -1
(defvar *hayGanador*) ; Booleano
(defvar *FichaH*) ; Ficha del Humano: X
(defvar *FichaO*) ; Ficha del Ordenador: O
(defvar *FichaVacia*) ; Por defecto NIL
(defvar *NumeroFichas*) ; Contador de fichas
(defvar *MaxNumFichas*) ; Constante 6 fichas
(defvar *Metas*) ; Sigue el concepto de "tripletas"

;---------------------------------------------------