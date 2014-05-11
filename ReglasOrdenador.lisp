#| 
	Reglas implementadas tal y como están especificadas en el documento del proyecto
 |#

(defun izquierda(PosicionActual)
	(let ( (PosicionSiguiente (list (first PosicionActual) (- (cadr PosicionActual) 1))) )
		(if (and
				(> (cadr PosicionActual) 0)
					; y > 0
				(equal (nth (indice PosicionSiguiente) *Tablero*) *FichaVacia*) )
					; Verfica que la posición a la que se quiere mover esté libre
			(mover PosicionActual PosicionSiguiente) ) ) )

(defun derecha(PosicionActual)
	(let ( (PosicionSiguiente (list (first PosicionActual) (+ (cadr PosicionActual) 1))) )
		(if (and
				(< (cadr PosicionActual) 2)
					; y < 2
				(equal (nth (indice PosicionSiguiente) *Tablero*) *FichaVacia*) )
					; Verfica que la posición a la que se quiere mover esté libre
			(mover PosicionActual PosicionSiguiente) ) ) )

(defun abajo(PosicionActual)
	(let ( (PosicionSiguiente (list (+ (first PosicionActual) 1) (cadr PosicionActual))) )
		(if (and
				(< (car PosicionActual) 2)
					; x < 2
				(equal (nth (indice PosicionSiguiente) *Tablero*) *FichaVacia*) )
					; Verfica que la posición a la que se quiere mover esté libre
			(mover PosicionActual PosicionSiguiente) ) ) )

(defun arriba(PosicionActual)
	(let ( (PosicionSiguiente (list (- (first PosicionActual) 1) (cadr PosicionActual))) )
		(if (and
				(> (first PosicionActual) 0)
					; x > 0
				(equal (nth (indice PosicionSiguiente) *Tablero*) *FichaVacia*) )
					; Verfica que la posición a la que se quiere mover esté libre
			(mover PosicionActual PosicionSiguiente) ) ) )

(defun diagonal-a-derecha(PosicionActual)
	(let ( (PosicionSiguiente (list (- (first PosicionActual) 1) (+ (cadr PosicionActual) 1))) )
		(if (and
				(find PosicionActual '((2 0) (1 1)) :test #'equal)
					; Verifica que esté en la diagonal y que se pueda mover la ficha
				(equal (nth (indice PosicionSiguiente) *Tablero*) *FichaVacia*) )
					; Verfica que la posición a la que se quiere mover esté libre
			(mover PosicionActual PosicionSiguiente) ) ) )

(defun diagonal-a-izquierda(PosicionActual)
	(let ( (PosicionSiguiente (list (+ (first PosicionActual) 1) (- (cadr PosicionActual) 1))) )
		(if (and
				(find PosicionActual '((0 2) (1 1)) :test #'equal)
					; Verifica que esté en la diagonal y que se pueda mover la ficha
				(equal (nth (indice PosicionSiguiente) *Tablero*) *FichaVacia*) )
					; Verfica que la posición a la que se quiere mover esté libre
			(mover PosicionActual PosicionSiguiente) ) ) )

(defun diagonal-b-izquierda(PosicionActual)
	(let ( (PosicionSiguiente (list (- (first PosicionActual) 1) (- (cadr PosicionActual) 1))) )
		(if (and
				(= (first PosicionActual) (cadr PosicionActual))
					; x = y, con esto sabemos que está en la diagonal \
				(> (first PosicionActual) 0)
					; x > 0
				(equal (nth (indice PosicionSiguiente) *Tablero*) *FichaVacia*) )
					; Verfica que la posición a la que se quiere mover esté libre
			(mover PosicionActual PosicionSiguiente) ) ) )

(defun diagonal-b-derecha(PosicionActual)
	(let ( (PosicionSiguiente (list (+ (first PosicionActual) 1) (+ (cadr PosicionActual) 1))) )
		(if (and
				(= (first PosicionActual) (cadr PosicionActual))
					; x = y, con esto sabemos que está en la diagonal \
				(< (first PosicionActual) 2)
					; x < 2
				(equal (nth (indice PosicionSiguiente) *Tablero*) *FichaVacia*) )
					; Verfica que la posición a la que se quiere mover esté libre
			(mover PosicionActual PosicionSiguiente) ) ) )

(defun diagonal-b-izquierda(PosicionActual)
	(let ( (PosicionSiguiente (list (- (first PosicionActual) 1) (- (cadr PosicionActual) 1))) )
		(if (and
				(= (first PosicionActual) (cadr PosicionActual))
					; x = y, con esto sabemos que está en la diagonal \
				(> (first PosicionActual) 0)
					; x > 0
				(equal (nth (indice PosicionSiguiente) *Tablero*) *FichaVacia*) )
					; Verfica que la posición a la que se quiere mover esté libre
			(mover PosicionActual PosicionSiguiente) ) ) )