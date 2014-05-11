
;---------------------------------------------------
; (primero-el-mejor A)
; 
; 

(defvar *Operadores*)
(defvar *Coordenadas*)
(setq *Operadores* '(1 2 3 4 5 6 7 8 9))
(setq *Coordenadas* '(
	(0 0) (0 1) (0 2)
	(2 0) (2 1) (2 2)
	(3 0) (3 1) (3 2)))

;|x o x|	
;|n n n|	A(2,2)->E(2) 
;|o x o|
; mayor posibilidad de convertirse en estado
; meta
; GANAR -> Orientado O
; EMPATE-MOMENTANEO -> Orientado X

; (busqueda-primero-el-mejor '(0 0) '(0 2))
; LE: (((0 0) 2))
; P: ((0 0) 2)
;	(0 0) (0 2) -->
; LV: ((0 0))
; Hijo: (1 0)
; Sucesor: ((1 0) 3)

; Lista de sucesores de P
; (((x y) Costo Camino) ((x y) Costo Camino) ((x y) Costo Camino) ...)
(defun es-posible(Operador Coordenada)
	(cond
		((equal Operador 1) (progn
			(setq Tablero *Tablero*)
			(poner-ficha Coordenada)
			) )
	)
)
(defun obtener-hijo(Padre Operador)
	; Padre es (x y)
	(setq Hijo (es-posible Operador Padre))
	(if (null Hijo)
		NIL
			; Cuando no es posible aplicar el operador, retorna NIL
		Hijo )
			; De ser posible, retorna el Hijo
)
(defun hijos-de(P LV EstadoFinal)
	(setq sucesores ())
	(dolist (Operador *Operadores*)
		(setq Hijo (obtener-hijo (car P) Operador))
		(if
			(and
				(not (null Hijo))
					; Que sea un hijo válido
				(not (numberp (position Hijo LV))))
					; Que no esté en LV
			(progn
				(setq sucesor (list Hijo (heuristica Hijo EstadoFinal) (append (caddr P) (list Hijo))))
					; Crea un sucesor ((x y) Costo Camino)
					; Crea el camino agregandose a sí mismo al final
				(setq sucesores (cons sucesor sucesores))
					; Agrega el nuevo sucesor a la lista de sucesores por el inicio
			) )
	sucesores
		; Retorna los sucesores
	)
)

(defun busqueda-primero-el-mejor(EstadoInicial EstadoFinal) ; ambos estados con coordenadas (x,y)
	(setq LE (list (list EstadoInicial (heuristica EstadoInicial EstadoFinal))))
		; Cada elemento de LE será una tupla de (((x y) Costo))
		; El primer elemento de LE es el EstadoInicial cuyo costo es el valor de la heurística
	(setq LV ())
	(loop
		(when (null LE) (return NIL))
			; Cuando la lista de espera LE esté vacía retorna NIL y finaliza el bucle
		(setq P (car LE))
			; Coge el primer elemento de la lista de espera LE
		(setq LE (cdr LE))
			; Le quitamos el elemento actual a la lista de espera LE
		(setq LV (cons (car P) LV))
			; Agrega el elemento actual a la lista de validados LV
		(when (= (car P) EstadoFinal) (return T))
			; Cuando el elemento actual es la meta, retorna T y finaliza el bucle
		(setq NuevosSucesores (hijos-de P LV EstadoFinal))
			; Lista de sucesores de P
			; (((x y) Costo Camino) ((x y) Costo Camino) ((x y) Costo Camino) ...)
			; Un hijo de P
			; ((x y) Costo Camino)
		(setq LE (append NuevosSucesores LE))
			; Agrega los sucesores de P a la lista de espera LE
		(setq LE (ordenar-por-costo LE))
			; Ordena la lista de espera LE de acuerdo a su costo
	)
)

#| (defun h(N Jugador) ; = F(N)
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
) |#