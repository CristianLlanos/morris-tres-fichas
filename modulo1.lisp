;---------------------------------------------------
; ESTE ES TU TABLERO DE PRUEBA
(setq
	*Tablero* '(nil nil nil nil nil nil nil nil nil)
	*FichaH* 'X
	*FichaO* 'O
	*FichaVacia* NIL)

(defun tipo-ficha(Ficha)
  (cond
  	( (equal Ficha *FichaH*) *FichaH* )
  	( (equal Ficha *FichaO*) *FichaO* )
  	( (equal Ficha *FichaVacia*) '- ) ) )

;---------------------------------------------------
; ESTA FUNCIÓN MUESTRA EL TABLERO FORMATEADO

(defun mostrar-tablero()
  (let
      ((tablero *tablero*))
    (format t "~&| ~s ~s ~s | ~&| ~s ~s ~s | ~&| ~s ~s ~s |"
	    (tipo-ficha (nth 0 tablero))
	    (tipo-ficha (nth 1 tablero))
	    (tipo-ficha (nth 2 tablero))
	    (tipo-ficha (nth 3 tablero))
	    (tipo-ficha (nth 4 tablero))
	    (tipo-ficha (nth 5 tablero))
	    (tipo-ficha (nth 6 tablero))
	    (tipo-ficha (nth 7 tablero))
	    (tipo-ficha (nth 8 tablero)) ) ) )

;---------------------------------------------------

;---------------------------------------------------
; Aquí se definen todos los estados meta
; y se guardan en la variable global *EstadosMeta*
; para que los datos puedan ser utilizados
; posteriormente.

(setq *EstadosMeta*
	'(
		((0 0) (1 0) (2 0)) ; Primera columna
		((0 1) (1 1) (2 1)) ; Segunda columna
		((0 2) (1 2) (2 2)) ; Tercera columna
		((0 0) (0 1) (0 2)) ; Primera fila
		((1 0) (1 1) (1 2)) ; Segunda fila
		((2 0) (2 1) (2 2)) ; Tercera fila
		((0 0) (1 1) (2 2)) ; Diagonal \
		((2 0) (1 1) (0 2)) ; Diagonal /
	)
)

;---------------------------------------------------

;---------------------------------------------------
; (esEstadoMeta A B C) Toma como parámentros a tres
; listas con la forma (x y) y retorna una lista
; con los mismos parámetros: (A B C) en caso de que
; estén incluidos en el conjunto de estados meta de
; la lista EstadosMeta, en caso contrario retorna NIL

(defun esEstadoMeta(a b c)
	(let ( (Estado (list a b c)) )
		(find Estado *EstadosMeta* :test #'equal) ) )

;---------------------------------------------------

;---------------------------------------------------
; ESTO ES LO QUE FALTA
;---------------------------------------------------

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