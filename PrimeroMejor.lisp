;---------------------------------------------------
; Obtener el siguiente movimiento

(defun obtener-primero-mejor()
	(let (
		(ListaFichas ())
		(PosiblesMovimientos ())
		(LE ())
		(P ())
		(PosicionAnalizada NIL)
		(Movimiento ()) )
		(progn
			(if (es-primera-fase-p)
				(progn ; Primera FASE
					(if (= *NumeroFichas* 3) ; En el caso especial, para evitar que gane el oponente fácilmente
						(progn
							(setq ListaFichas (obtener-fichas *FichaH*))
							(let ((Posicion (es-meta-potencial-p (car ListaFichas) (cadr ListaFichas))))
								(if (and (not (NULL Posicion)) (equal (nth (indice Posicion) *Tablero*) *FichaVacia*))
									(progn
										(setq Movimiento Posicion)
										(poner-ficha *FichaO* Movimiento))
									(progn
										(setq ListaFichas (obtener-fichas-vacias))
										(setq Movimiento (caar ListaFichas))
										(poner-ficha *FichaO* Movimiento) ) ) ) )
						(progn
							(setq ListaFichas (obtener-fichas-vacias))
							(setq Movimiento (caar ListaFichas))
							(poner-ficha *FichaO* Movimiento) ) )
					(aumentar-numero-fichas) )
				(progn ; Segunda FASE
					(setq ListaFichas (obtener-fichas *FichaO*))
					(dolist (i ListaFichas) ; i es una coordenada en el tablero (x y)
						(setq LE (hijos-de i))
						(loop
							(when (NULL LE) (return NIL))
							(setq LE (ordenar-por-costo LE)) ; LE ordenado por BENEFICIO
							(setq P (car LE)) ; Movimiento analizado
							(setq PosicionAnalizada (cadar P)) ; Coordenada analizada
							(setq LE (cdr LE)) ; Quita el elemento analizado
							(when (podria-ser-meta-2-p (caar P) PosicionAnalizada) (return (setq Movimiento (car P))))
							(setq PosiblesMovimientos (cons P PosiblesMovimientos)) ; Agrega el posible movimiento
						) )
					(if (NULL Movimiento)
						(setq Movimiento (mejor-posibilidad PosiblesMovimientos)) )
					(mover (car Movimiento) (cadr Movimiento)) ) )
			(cambiar-turno)
			Movimiento ) ) )

;---------------------------------------------------