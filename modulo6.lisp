;---------------------------------------------------
; Obtener mejor posibilidad de juego
; ( (A B) BENEFICIO )
 
#| (setq ListaPosibilidades '(
	( ((0 0) (1 1)) 2 )
	( ((0 0) (1 2)) 4 )
	( ((0 0) (0 1)) 1 )
	( ((0 0) (2 1)) 3 ) ) )
 |#


; Debe retornar la coordenada B del mejor BENEFICIO
; Para este ejemplo sería (1 2)

(defun mejor-posibilidad(ListaPosibilidades)
	(caar (sort (copy-seq ListaPosibilidades) #'list>)) )

;---------------------------------------------------
