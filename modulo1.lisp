;---------------------------------------------------
; ESTE ES TU TABLERO DE PRUEBA
(setq
	*Tablero* '(X X nil nil nil nil nil nil nil)
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

(defun esEstadoMeta (a b c)
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

(defun indice (Posicion)
	(+ (* 3 (first Posicion)) (cadr Posicion))
)

(setf tablero-aux *tablero*)

(defun convertir-a-numeros (v)
	(cond ((equal v 'X ) 1)
              ((equal v 'O ) 10)
              ((equal v nil) 0)
              )
)

(defun convertir-tablero ()
	(mapcar #'convertir-a-numeros tablero-aux )
)

(defun heuristica (Posicion)

	(let  ((suma (calcula-suma (indice Posicion) (convertir-tablero)))
		    (Valor-Heuristico 0)
		   )

		(dolist (s suma)
			(cond 
				  ((equal 1 s) (setf Valor-Heuristico (+ Valor-Heuristico 1)))
				  ((equal 2 s) (setf Valor-Heuristico (+ Valor-Heuristico 2)))
				  
			)
		)

		 Valor-Heuristico

	

)
)

(setf *tripletas* '((0 1 2) (3 4 5) (6 7 8) 	 (0 3 6) (1 4 7) (2 5 8)          (0 4 9) (2 4 6))
 ) 

(defun suma-de-tripleta (tablero tripleta indice)
	(if (or (equal (car tripleta) indice) (equal (cadr tripleta) indice) (equal (caddr tripleta) indice))
		
          (+ (nth (car tripleta) tablero)
             (nth (cadr tripleta) tablero)
             (nth (caddr tripleta) tablero)) 

          0   ;devuelve cero en caso negativo
	)
)

(defun calcula-suma (indice Tablero)
  (mapcar #'(lambda (tripleta) (suma-de-tripleta tablero tripleta indice)) *tripletas*)
)


;---------------------------------------------------