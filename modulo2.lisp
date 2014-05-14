;---------------------------------------------------
; Verificar si al poner la ficha en la posición actual forma un estado meta
;|X - X|
;|- - -|
;|- - -|
#| 
(podria-ser-meta-p 'X '(0 1))
|#

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