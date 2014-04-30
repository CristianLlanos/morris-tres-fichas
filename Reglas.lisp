;---------------------------------------------------
; (poner-ficha A J)
;
; Toma como parámetros de entrada a las coordenas A (de la posición seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del posicionamiento (que sea correcto y justo). De ser válido
; el poscionamiento, retorna el cambio de turno de jugador, cambiando el valor de
; la variable global *Turno*. De ser inválido, retorna el valor NIL

(defun poner-ficha(Posicion Jugador)
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*)) )
	(if (and
				(< *NumeroFichas* 6)
					; Verificamos que aún se puedan
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(equal (nth (+ (* 3 (first Posicion)) (cadr Posicion)) *Tablero*) nil))
					; Verfica que la posición esté libre
			(progn
				(setf (nth
					(+ (* 3 (first Posicion)) (cadr Posicion)) *Tablero*)
					Ficha)
						; Poner la Ficha en la Posición Final
				(setq *NumeroFichas* (+ *NumeroFichas* 1))
					; Actualiza el número de fichas que hay en el tablero.
				(setq *Turno* (* *Turno* -1)) )
					; Cambiar de turno
		nil ) ; Retorna NIL en caso de que no sea posible el desplazamiento
	(mostrar-tablero) )

;---------------------------------------------------

;---------------------------------------------------
; (desplazar-izquierda A J)
;
; Toma como parámetros de entrada a las coordenas A (de la ficha seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del desplazamiento una pocisión hacia la izquierda (que sea correcto
; y justo). De ser válido el desplazamiento, retorna el cambio de turno de jugador,
; cambiando el valor de la variable global *Turno*. De ser inválido, retorna el valor NIL

(defun desplazar-izquierda(PosicionActual  Jugador)
	(setq PosicionSiguiente (list (first PosicionActual) (- (cadr PosicionActual) 1)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*)) )
	(if (and
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(> (first PosicionActual) 0)
					; x > 0
				(equal (nth (+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*) nil)
					; Verfica que la posición a la que se quiere mover esté libre
				(equal (nth (+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*) Ficha) )
					; Verifica que la ficha que quiere mover le corresponde
		(progn
			(setf (nth
				(+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*)
				Ficha)
					; Poner la Ficha en la Posición Final
			(setf (nth
				(+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*)
				nil)
					; Dejar vacía la Posición Inicial
			(setq *Turno* (* *Turno* -1)) )
				; Cambiar de turno
		nil ) ) ; Retorna NIL en caso de que no sea posible el desplazamiento

;------------------------------------------------

;---------------------------------------------------
; (desplazar-derecha A J)
;
; Toma como parámetros de entrada a las coordenas A (de la ficha seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del desplazamiento una pocisión hacia la derecha (que sea correcto
; y justo). De ser válido el desplazamiento, retorna el cambio de turno de jugador,
; cambiando el valor de la variable global *Turno*. De ser inválido, retorna el valor NIL

(defun desplazar-derecha(PosicionActual  Jugador)
	(setq PosicionSiguiente (list (first PosicionActual) (+ (cadr PosicionActual) 1)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*)) )
	(if (and
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(< (cadr PosicionActual) 2)
					; y < 2
				(equal (nth (+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*) nil)
					; Verfica que la posición a la que se quiere mover esté libre
				(equal (nth (+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*) Ficha) )
					; Verifica que la ficha que quiere mover le corresponde
		(progn
			(setf (nth
				(+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*)
				Ficha)
					; Poner la Ficha en la Posición Final
			(setf (nth
				(+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*)
				nil)
					; Dejar vacía la Posición Inicial
			(setq *Turno* (* *Turno* -1)) )
				; Cambiar de turno
		nil ) ) ; Retorna NIL en caso de que no sea posible el desplazamiento

;---------------------------------------------------

;---------------------------------------------------
; (desplazar-abajo A J)
;
; Toma como parámetros de entrada a las coordenas A (de la ficha seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del desplazamiento una pocisión hacia abajo (que sea correcto
; y justo). De ser válido el desplazamiento, retorna el cambio de turno de jugador,
; cambiando el valor de la variable global *Turno*. De ser inválido, retorna el valor NIL

(defun desplazar-abajo(PosicionActual Jugador)
	(setq PosicionSiguiente (list (+ (first PosicionActual) 1) (cadr PosicionActual)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*))
	)
	(if (and
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(< (first PosicionActual) 2)
					; x < 2
				(equal (nth (+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*) nil)
					; Verfica que la posición a la que se quiere mover esté libre
				(equal (nth (+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*) Ficha) )
					; Verifica que la ficha que quiere mover le corresponde
		(progn
			(setf (nth
				(+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*)
				Ficha)
					; Poner la Ficha en la Posición Final
			(setf (nth
				(+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*)
				nil)
					; Dejar vacía la Posición Inicial
			(setq *Turno* (* *Turno* -1)) )
				; Cambiar de turno
		nil ) ) ; Retorna NIL en caso de que no sea posible el desplazamiento

;---------------------------------------------------

;---------------------------------------------------
; (desplazar-arriba A J)
;
; Toma como parámetros de entrada a las coordenas A (de la ficha seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del desplazamiento una pocisión hacia arriba (que sea correcto
; y justo). De ser válido el desplazamiento, retorna el cambio de turno de jugador,
; cambiando el valor de la variable global *Turno*. De ser inválido, retorna el valor NIL

(defun desplazar-arriba(PosicionActual Jugador)
	(setq PosicionFinal (list (- (first PosicionActual) 1) (cadr PosicionActual)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*))
	)
	(if (and
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(> (first PosicionActual) 0)
					; x > 0
				(equal (nth (+ (* 3 (first PosicionFinal)) (cadr PosicionFinal)) *Tablero*) nil)
					; Verfica que la posición a la que se quiere mover esté libre
				(equal (nth (+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*) Ficha) )
					; Verifica que la ficha que quiere mover le corresponde
		(progn
			(setf (nth
				(+ (* 3 (first PosicionFinal)) (cadr PosicionFinal)) *Tablero*)
				Ficha)
					; Poner la Ficha en la Posición Final
			(setf (nth
				(+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*)
				nil)
					; Dejar vacía la Posición Inicial
			(setq *Turno* (* *Turno* -1)) )
				; Cambiar de turno
		nil ) ) ; Retorna NIL en caso de que no sea posible el desplazamiento

;---------------------------------------------------

;---------------------------------------------------
; (desplazar-diagonal-a-derecha A J) - / hacia la derecha
;
; Toma como parámetros de entrada a las coordenas A (de la ficha seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del desplazamiento de abajo hacia arriba, de izquierda a derecha
; (que sea correcto y justo). De ser válido el desplazamiento, retorna el cambio de
; turno de jugador, cambiando el valor de la variable global *Turno*. De ser inválido,
; retorna el valor NIL

(defun desplazar-diagonal-a-derecha(PosicionActual Jugador)
	(setq PosicionFinal (list (- (first PosicionActual) 1) (+ (cadr PosicionActual) 1)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*))
	)
	(if (and
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(find PosicionActual '((2 0) (1 1)) :test #'equal)
					; Verifica que esté en la diagonal y que se pueda mover la ficha
				(equal (nth (+ (* 3 (first PosicionFinal)) (cadr PosicionFinal)) *Tablero*) nil) )
					; Verfica que la posición a la que se quiere mover esté libre
			(progn
				(setf (nth
					(+ (* 3 (first PosicionFinal)) (cadr PosicionFinal)) *Tablero*)
					Ficha)
						; Poner la Ficha en la Posición Final
				(setf (nth
					(+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*)
					nil)
						; Dejar vacía la Posición Inicial
				(setq *Turno* (* *Turno* -1)) )
					; Cambiar de turno
			NIL) )

;---------------------------------------------------

;---------------------------------------------------
; (desplazar-diagonal-a-izquierda A J) - / hacia la izquierda
;
; Toma como parámetros de entrada a las coordenas A (de la ficha seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del desplazamiento de arriba hacia abajo, de izquierda a derecha
; (que sea correcto y justo). De ser válido el desplazamiento, retorna el cambio de
; turno de jugador, cambiando el valor de la variable global *Turno*. De ser inválido,
; retorna el valor NIL

(defun desplazar-diagonal-a-izquierda(PosicionActual Jugador)
	(setq PosicionFinal (list (+ (first PosicionActual) 1) (- (cadr PosicionActual) 1)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*))
	)
	(if (and
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(find PosicionActual '((0 2) (1 1)) :test #'equal)
					; Verifica que esté en la diagonal y que se pueda mover la ficha
				(equal (nth (+ (* 3 (first PosicionFinal)) (cadr PosicionFinal)) *Tablero*) nil) )
					; Verfica que la posición a la que se quiere mover esté libre
			(progn
				(setf (nth
					(+ (* 3 (first PosicionFinal)) (cadr PosicionFinal)) *Tablero*)
					Ficha)
						; Poner la Ficha en la Posición Final
				(setf (nth
					(+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*)
					nil)
						; Dejar vacía la Posición Inicial
				(setq *Turno* (* *Turno* -1)) )
					; Cambiar de turno
			NIL) )

;---------------------------------------------------

;---------------------------------------------------
; (desplazar-diagonal-b-izquierda A J) - \ hacia la izquierda
;
; Toma como parámetros de entrada a las coordenas A (de la ficha seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del desplazamiento de abajo hacia arriba, de derecha a izquierda
; (que sea correcto y justo). De ser válido el desplazamiento, retorna el cambio de
; turno de jugador, cambiando el valor de la variable global *Turno*. De ser inválido,
; retorna el valor NIL

(defun desplazar-diagonal-b-izquierda(PosicionActual Jugador)
	(setq PosicionFinal (list (- (first PosicionActual) 1) (- (cadr PosicionActual) 1)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*))
	)
	(if (and
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(= (first PosicionActual) (cadr PosicionActual))
					; x = y, con esto sabemos que está en la diagonal \
				(> (first PosicionActual) 0)
					; x > 0
				(equal (nth (+ (* 3 (first PosicionFinal)) (cadr PosicionFinal)) *Tablero*) nil) )
					; Verfica que la posición a la que se quiere mover esté libre
			(progn
				(setf (nth
					(+ (* 3 (first PosicionFinal)) (cadr PosicionFinal)) *Tablero*)
					Ficha)
						; Poner la Ficha en la Posición Final
				(setf (nth
					(+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*)
					nil)
						; Dejar vacía la Posición Inicial
				(setq *Turno* (* *Turno* -1)) )
					; Cambiar de turno
			NIL) )

;---------------------------------------------------

;---------------------------------------------------
; (desplazar-diagonal-b-derecha A J) - \ hacia la derecha
;
; Toma como parámetros de entrada a las coordenas A (de la ficha seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del desplazamiento de arriba hacia abajo, de izquierda a derecha
; (que sea correcto y justo). De ser válido el desplazamiento, retorna el cambio de
; turno de jugador, cambiando el valor de la variable global *Turno*. De ser inválido,
; retorna el valor NIL

(defun desplazar-diagonal-b-derecha(PosicionActual Jugador)
	(setq PosicionFinal (list (+ (first PosicionActual) 1) (+ (cadr PosicionActual) 1)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*))
	)
	(if (and
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(= (first PosicionActual) (cadr PosicionActual))
					; x = y, con esto sabemos que está en la diagonal \
				(< (first PosicionActual) 2)
					; x < 2
				(equal (nth (+ (* 3 (first PosicionFinal)) (cadr PosicionFinal)) *Tablero*) nil) )
					; Verfica que la posición a la que se quiere mover esté libre
			(progn
				(setf (nth
					(+ (* 3 (first PosicionFinal)) (cadr PosicionFinal)) *Tablero*)
					Ficha)
						; Poner la Ficha en la Posición Final
				(setf (nth
					(+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*)
					nil)
						; Dejar vacía la Posición Inicial
				(setq *Turno* (* *Turno* -1)) )
					; Cambiar de turno
			NIL) )

;---------------------------------------------------
