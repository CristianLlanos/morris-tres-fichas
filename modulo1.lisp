;---------------------------------------------------
; Posibilidades que tiene la posición actual de ser estado meta
; Revisa
;|O O -|
;|- - -|
;|- - -|
; Revisa todas las 8 maneras de poder ser estado meta y las cuneta
; una a una tomando en cuenta la ficha de la coordenada
#| 
(heuristica '(0 1))
|#
; Para este caso la ficha es X y debería retornar 2 que sería la
; vertical | y la diagonal \ no cuenta la horizontal - porque hay una O

(defun convertir-a-numeros (v)
	(cond ((equal v 'O ) 1)
              ((equal v 'X ) 10)
              ((equal v *FichaVacia*) 0)
              )
)

(defun convertir-tablero ()
	(mapcar #'convertir-a-numeros *TableroAux* )
)

(defun suma-de-tripleta (tablero tripleta indice)
	(if (or (equal (car tripleta) indice) (equal (cadr tripleta) indice) (equal (caddr tripleta) indice))
		
          (+ (nth (car tripleta) tablero)
             (nth (cadr tripleta) tablero)
             (nth (caddr tripleta) tablero)) 

          -1   ;devuelve cero en caso negativo
	)
)

(defun calcula-suma (indice Tablero)
  (mapcar #'(lambda (tripleta) (suma-de-tripleta tablero tripleta indice)) *Metas*)
)

(defun heuristica (Posicion)
	(setq *TableroAux* (copiar *Tablero*))
	(let  ((suma (calcula-suma (indice Posicion) (convertir-tablero)))
		    (Valor-Heuristico 0) )
		(dolist (s suma)
			(cond 
				  ((equal 0 s) (setf Valor-Heuristico (+ Valor-Heuristico 1)))					
				  ((equal 1 s) (setf Valor-Heuristico (+ Valor-Heuristico 1)))
				  ((equal 2 s) (setf Valor-Heuristico (+ Valor-Heuristico 2)))
				  ((equal 3 s) (setf Valor-Heuristico (+ Valor-Heuristico 100)))			  
			)
		)
		Valor-Heuristico ) )


;---------------------------------------------------