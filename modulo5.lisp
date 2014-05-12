;---------------------------------------------------
; ESTE ES TU TABLERO DE PRUEBA
(setq
	*Tablero* '(x nil x nil nil nil nil nil nil)
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