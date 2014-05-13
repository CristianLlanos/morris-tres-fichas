;---------------------------------------------------
; (InicializarJuego) se encarga de poner los valores
; de las variables globales listas para empezar un
; nuevo juego

(defun inicializar-juego()
	(setq
		*Tablero* '(nil nil nil nil nil nil nil nil nil)
		;(setq *Posicion* '(-1 -1))
		*Turno* 1
		;(setq *hayGanadores* nil)
		;(setq *Niveles* 0)
		*FichaH* 'X
		*FichaO* 'O
		*NumeroFichas* 0
		*MaxNumFichas* 6
		*FichaVacia* NIL
		*Humano* 1
		*Ordenador* -1
	)
)

;---------------------------------------------------
