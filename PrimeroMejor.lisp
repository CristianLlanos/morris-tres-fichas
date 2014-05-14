;---------------------------------------------------
; Obtener el siguiente movimiento

(defun obtener-primero-mejor()
	(let (
		(ListaFichas ())
		(PosiblesMovimientos ())
		(LE ())
		; (LV ())
		(P ())
		(PosicionAnalizada NIL)
		(Movimiento ())
		(Oponente ()) )
		(progn
			(if (es-primera-fase-p)
				(progn ; Primera FASE
					(if (= *NumeroFichas* 3)
						(progn
							(setq Oponente (obtener-fichas *FichaH*))
							(let ((Posicion (es-meta-potencial-p (car Oponente) (cadr Oponente))))
								(if (not (NULL Posicion))
									(poner-ficha *FichaO* Posicion)
									(progn
										(setq ListaFichas (obtener-fichas-vacias))
										(poner-ficha *FichaO* (caar ListaFichas))) ) ) )
						(progn
							(setq ListaFichas (obtener-fichas-vacias))
							(poner-ficha *FichaO* (caar ListaFichas)) ) )
					(aumentar-numero-fichas) )
				(progn ; Segunda FASE
					(setq ListaFichas (obtener-fichas *FichaO*))
					;(setq Movimiento
					; (print ListaFichas);---------------
					(dolist (i ListaFichas) ; i es una coordenada en el tablero (x y)
						(setq LE (hijos-de i))
						; (setq LV (list i))
						; (print LE);-----------
						; (print LV);-----------
						(loop
							; (print 'otro-loop);-----------
							; (print i);----------------
							(when (NULL LE) (return NIL))
							(setq LE (ordenar-por-costo LE)) ; LE ordenado por BENEFICIO
							(setq P (car LE)) ; Movimiento analizado
							(setq PosicionAnalizada (cadar P)) ; Coordenada analizada
							; (print 'PosicionAnalizada);----------
							; (print PosicionAnalizada);-----------
							; (print (cadr P));-----------
							; (setq LV (cons PosicionAnalizada LV))
							(setq LE (cdr LE)) ; Quita el elemento analizado
							(when (podria-ser-meta-2-p (caar P) PosicionAnalizada) (return (setq Movimiento (car P))))
							(setq PosiblesMovimientos (cons P PosiblesMovimientos)) ; Agrega el posible movimiento
						) )
					(if (NULL Movimiento)
						(setq Movimiento (mejor-posibilidad PosiblesMovimientos)) )
					; (print PosiblesMovimientos);----------
					; (print Movimiento);----------
					(mover (car Movimiento) (cadr Movimiento))
				) )
			(cambiar-turno)
			#| (mostrar-tablero) |# ) ) )

;---------------------------------------------------