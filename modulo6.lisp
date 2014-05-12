;---------------------------------------------------
; Obtener mejor posibilidad de juego
; ( (A B) COSTO )
 
#| (setq ListaPosibilidades '(
	( ((0 0) (1 1)) 2 )
	( ((0 0) (1 2)) 4 )
	( ((0 0) (0 1)) 1 )
	( ((0 0) (2 1)) 3 ) ) )
 |#


; Debe retornar la coordenada B del mejor COSTO
; Para este ejemplo sería (1 2)

(defun mejor-posibilidad(ListaPosibilidades)
	(let (
		(Mayor ())
		(Mejor ()) )
		(progn
			; Burbuja
			(setq Mayor (cadar ListaPosibilidades))
			(dolist (i ListaPosibilidades)
				(if (< Mayor (cadr i))
					(progn
						(setq Mayor (cadr i))
						(setq Mejor i) ) ) )
			(cadar Mejor) ) ) )
;---------------------------------------------------

; (mejor-posibilidad ListaPosibilidades)