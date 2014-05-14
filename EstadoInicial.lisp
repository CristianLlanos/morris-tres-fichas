;---------------------------------------------------
; (InicializarJuego) se encarga de poner los valores
; de las variables globales listas para empezar un
; nuevo juego

(defun inicializar-juego()
	(setq
		*Tablero* '(nil nil nil nil nil nil nil nil nil)
		*Turno* 1
		*hayGanador* NIL
		*FichaH* 'X
		*FichaO* 'O
		*NumeroFichas* 0
		*MaxNumFichas* 6
		*FichaVacia* NIL
		*Humano* 1
		*Ordenador* -1
		*Metas* '((0 1 2) (3 4 5) (6 7 8) (0 3 6) (1 4 7) (2 5 8) (0 4 8) (2 4 6)) )
)

;---------------------------------------------------
