
;---------------------------------------------------
; (primero-el-mejor A)
; 
; 

(defvar *LE*)
(defvar *LV*)
(defvar *p*)

(setq *LE* nil)
(setq *LV* nil)
(setq *P* nil)

;|X X n|
;|n O n|
;|O X O|

;/pásl/ ;)

(defun h(N Jugador) ; = F(N)
	; N = (x y), coordenada de posición en el tablero.
	(cond
		((= Jugador -1) (setq Ficha *FichaO*))
		((= Jugador 1) (setq Ficha *FichaH*)) )
	; Evaluar si puede ser meta /
	; Evaluar si puede ser meta \
	; Evaluar si puede ser meta --
	; Evaluar si puede ser meta |
	
	; Retorna Menor Costo
)

; (primero-el-mejor '(0 1))
(defun iteracion-pm(N)
	; Hallar su Costo -> h(N)
	; Agregar N a LE
	; LISTA = La primera lista dentro de LE
	; Coge *p* = último elemento de LISTA
	; Evalúa si *p* es estado meta
	; Caso Verdadero: FIN
	; Caso Falso:
	;	Coge los hijo de *p*
	;	Los agrega uno por uno al final de LISTA, creando nuevas listas en LE
	; Luego Ordena LE de menor a mayor Costo.
)

(defun primero-el-mejor(Jugador)
	; N es la posición actual o nodo de inicio de la búsqueda
)