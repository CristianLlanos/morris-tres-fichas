;---------------------------------------------------
; (InicializarJuego) se encarga de poner los valores
; de las variables globales listas para empezar un
; nuevo juego

(defun inicializar-juego()
	(setq *Tablero* '(nil nil nil nil nil nil nil nil nil))
	;(setq *Posicion* '(-1 -1))
	(setq *Turno* 1)

	;(setq *hayGanadores* nil)
	;(setq *Niveles* 0)
	(setq *FichaH* 'x)
	(setq *FichaO* 'o)
	(setq *NumeroFichas* 0)
)

;---------------------------------------------------