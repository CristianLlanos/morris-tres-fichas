;---------------------------------------------------
; (InicializarJuego) se encarga de poner los valores
; de las variables globales listas para empezar un
; nuevo juego

(defun InicializarJuego()
	(setq *Tablero* '(n n n n n n n n n))
	(setq *Posicion* '(-1 -1))
	(setq *Turno* 'h)

	(setq *hayGanadores* nil)
	;(setq *Niveles* 0)
	(setq *FichaH* 'x)
	(setq *FichaO* 'o)
)

;---------------------------------------------------