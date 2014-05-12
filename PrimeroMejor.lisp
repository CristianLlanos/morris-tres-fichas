
;---------------------------------------------------
; (primero-el-mejor A)
; 
; 


; PARECE QUE ESTO YA NO SE USARÁ
#| (defvar *Operadores*)
(defvar *Coordenadas*)
(setq *Operadores* '(1 2 3 4 5 6 7 8 9))
(setq *Coordenadas* '(
	(0 0) (0 1) (0 2)
	(2 0) (2 1) (2 2)
	(3 0) (3 1) (3 2))) |#

;---------------------------------------------------
; Posibilidades que tiene la posición actual de ser estado meta
; Revisa
;|X - O|
;|- - -|
;|- - -|
; Revisa todas las 8 maneras de poder ser estado meta y las cuneta
; una a una tomando en cuenta la ficha de la coordenada
#| 
(heuristica '(0 1))
|#
; Para este caso la ficha es X y debería retornar 2 que sería la
; vertical | y la diagonal \ no cuenta la horizontal - porque hay una O
(defun heuristica(Posicion)
	)

;---------------------------------------------------

;---------------------------------------------------
; Verificar si al poner la ficha en la posición actual forma un estado meta
;|X - X|
;|- - -|
;|- - -|
#| 
(podria-ser-meta-p 'X '(0 1))
|#
; Debe retornar T porque la horizontal si forma meta, aunque el resto no lo haga
; En caso que por ninguna de las 8 forma pueda ser meta, retornar NIL
(defun podria-ser-meta-p(Ficha Posicion)
	)
;---------------------------------------------------

;---------------------------------------------------
; Lista de hijos de la posición actual
; La lista debe ser de elementos a ser analizados que formarán parte de LE
; Tienen la forma:
; ( (A B) (heuristica y) )
#| 
(
	( ((0 0) (1 1)) 2 )
	( ((0 0) (1 2)) 4 )
	( ((0 0) (0 1)) 1 )
	( ((0 0) (2 1)) 3 )
)
|#
(defun hijos-de(Posicion)
	)
;---------------------------------------------------

;---------------------------------------------------
; Ordena elementos por su PESO o COSTO
; Un elemento es una lista con dos elementos:
; 	- Una lista con coordenadas (que representan movimientos)
; 	- Un número que representa el PESO dado por la función "heuristica"
; Su sintaxis es:
; ( (A B) (heuristica y) )
#|
(
	('(0 0) '(0 1)) ; Este par representa el movimiento
	2 ; Este número representa el COSTO dado por (heuristica '(0 1))
)
|#
; Un ejemplo
#| 
(setq LE '(
	( ((0 0) (1 1)) 2 )
	( ((0 0) (1 2)) 4 )
	( ((0 0) (0 1)) 1 )
	( ((0 0) (2 1)) 3 ) ) )

(ordenar-por-costo LE)
|#
; Debe retornar
#| 
(
	( ((0 0) (0 1)) 1 )
	( ((0 0) (1 1)) 2 )
	( ((0 0) (2 1)) 3 )
	( ((0 0) (1 2)) 4 )
)
|#

(defun ordenar-por-costo(LE)
	)

;---------------------------------------------------

;---------------------------------------------------
; Obetner las fichas del mismo tipo en una lista de coordenadas
;|X - X|
;|- - -|
;|- - -|
#| 
(obtener-fichas('X))
|#
; Debe retornar:
; ( (0 0) (0 2) )
(defun obtener-fichas(Ficha)
	)
;---------------------------------------------------

;---------------------------------------------------
; Obtener mejor posibilidad de juego
; ( (A B) COSTO )
#| 
(setq ListaPosibilidades '(
	( ((0 0) (1 1)) 2 )
	( ((0 0) (1 2)) 4 )
	( ((0 0) (0 1)) 1 )
	( ((0 0) (2 1)) 3 ) ) )

(mejor-posibilidad ListaPosibilidades)
|#
; Debe retornar la coordenada B del mejor COSTO
; Para este ejemplo sería (2 1)

(defun mejor-posibilidad(ListaPosibilidades)
	)
;---------------------------------------------------

;---------------------------------------------------
; Obetner el siguiente movimiento

(defun obtener-primero-mejor()
	(let (
		(ListaFichas (obtener-fichas *FichaO*))
		(PosiblesMovimientos ())
		(LE ())
		; (LV ())
		(P ())
		(PosicionAnalizada NIL)
		(Movimiento ()) )
		(progn
			(setq Movimiento
				(dolist (i ListaFichas) ; i es una coordenada en el tablero (x y)
					(setq LE (hijos-de i))
					; (setq LV (list i))
					(loop
						(when (null LE) (return NIL))
						(setq LE (ordenar-por-costo LE)) ; LE ordenado por COSTOS
						(setq P (car LE)) ; Movimiento analizado
						(setq PosicionAnalizada (cadr P)) ; Coordenada analizada
						; (setq LV (cons PosicionAnalizada LV))
						(setq LE (cdr LE)) ; Quita el elemento analizado
						(when (podria-ser-meta-p PosicionAnalizada) (return P))
						(cons P PosiblesMovimientos) ; Agrega el posible movimiento
						) ) )
			(if (null (Movimiento))
				(progn
					(setq Movimiento (mejor-posibilidad PosiblesMovimientos))
					(mover (car Movimiento) (cadr Movimiento)) ) ) ) ) )

;---------------------------------------------------

; Lista de sucesores de P
; (((x y) Costo Camino) ((x y) Costo Camino) ((x y) Costo Camino) ...)
#| (defun es-posible(Operador Coordenada)
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
) |#

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