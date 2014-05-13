;---------------------------------------------------
; Verificar si al poner la ficha en la posición actual forma un estado meta
;|X - X|
;|- - -|
;|- - -|
#| 
(podria-ser-meta-p 'X '(0 1))
|#

(defun podria-ser-meta-p(Ficha Posicion)
	(setq valores (obtener-fichas Ficha))
	(setq primero (first valores))
	(setq segundo (second valores))
	(setq booleano (esEstadoMeta Posicion primero segundo))
	booleano )

(defun obtener-fichas(Ficha)
	(setq lista ())
    (loop for x from 0 to 2 do
    	(loop for y from 0 to 2 do
        (if (eq (nth (+ (* 3 x) y) *tablero*) Ficha)
        	 (setq lista (cons (list x y) lista)) ) ) )
    lista )


