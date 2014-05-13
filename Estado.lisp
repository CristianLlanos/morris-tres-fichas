;---------------------------------------------------
; Estas son las variables que serán utilizadas a lo 
; largo de toda la codificación del juego de Morris

(defvar *Tablero*) ; Tablero de 3x3
(defvar *TableroAux*)
;(defvar *PosicionActual*) ; Posición
;(defvar *PosicionSiguiente*) ; Posición
(defvar *EstadosMeta*)
(defvar *Turno*) ; Humano: 1, Ordenador: -1
(defvar *Humano*) ; Humano: 1
(defvar *Ordenador*) ; Ordenador: -1

;(defvar *Arbol*) ; Arbol de estados
;(defvar *Niveles*) ; Niveles del árbol de estados (si es necesario)
;(defvar *hayGanadores*) ; Booleano
(defvar *FichaH*) ; Ficha del Humano: X
(defvar *FichaO*) ; Ficha del Ordenador: O
(defvar *FichaVacia*) ; Por defecto NIL

(defvar *NumeroFichas*) ; Contador de fichas
(defvar *MaxNumFichas*) ; Constante 6 fichas

;---------------------------------------------------