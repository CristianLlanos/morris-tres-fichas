;Función para validaqr que el espacio ocupado
;po la posición siguiente se encuentre vacio

(defun esValido(possgte *tabl*)
	(setq x first possgte)
	(setq y second possgte)
	(setq temp ( nth (- (+ (* 3 x) y) 1) *tabl*))

	(if (eq temp 0)
		(return t)
		(return nil))
	)

; regla1

(defun DespIzquierda(*posact* *turn* )
	(setq sgte (list (first *posact*) (- (nth 1 *posact* ) 1)))
		(if (and (> (nth 1 *posact*) 0) (esValido(sgte *Tablero*)))
		(setq *PosicionSiguiente* sgte)
		(format t "ocupado")
	)

	; Cambiamos al turno (setq *turn* 'r)

	(return *PosicionSiguiente* )

)