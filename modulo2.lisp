;---------------------------------------------------
; Verificar si al poner la ficha en la posición actual forma un estado meta
;|X - X|
;|- - -|
;|- - -|
#| 
(podria-ser-meta-p 'X '(0 1))
|#

(defun obtener-fichas(Ficha)
	(let ((lista ()))
		(progn
			(loop for x from 0 to 2 do
		    	(loop for y from 0 to 2 do
		        (if (eq (nth (+ (* 3 x) y) *tablero*) Ficha)
		        	 (setq lista (cons (list x y) lista)) ) ) )
		    lista ) ) )

(defun evaluar-ficha(Posicion)
	(list Posicion (heuristica Posicion) ) )

(defun obtener-fichas-vacias()
	(sort (copy-seq (mapcar #'evaluar-ficha (obtener-fichas *FichaVacia*))) #'list>) )

(defun podria-ser-meta-p(Ficha Posicion)
	(let (
		(valores (obtener-fichas Ficha))
		(primero ())
		(segundo ()) )
		(progn
			(setq primero (first valores))
			(setq segundo (second valores))
			(esEstadoMeta Posicion primero segundo) ) ) )

(defun podria-ser-meta-2-p(PosicionActual PosicionSiguiente)
	(let (
		(Ficha (obtener-ficha PosicionActual))
		(valores ())
		(primero ())
		(segundo ()) )
		(progn
			(setq valores (eliminar PosicionActual (obtener-fichas Ficha)))
			(setq primero (first valores))
			(setq segundo (second valores))
			(esEstadoMeta PosicionSiguiente primero segundo) ) ) )