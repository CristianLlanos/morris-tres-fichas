;---------------------------------------------------
; Funciones en este archivo:
; (indice A)
; (poner A Ficha)
; (mover A B)
; (turno-de-ficha)
; (cambiar-turno)
;---------------------------------------------------

;---------------------------------------------------
; (indice A)
; Recibe como parámetro una coordenada  A (x,y) y devuelve su índice en el tablero

(defun indice(Posicion)
	(+ (* 3 (first Posicion)) (cadr Posicion))
)

;---------------------------------------------------

;---------------------------------------------------
; (poner A Ficha)
; Recibe como parámetro una coordenada  A (x,y) y un tipo de ficha {X,O}
; Coloca el valor de la ficha en la posición indicada en el tablero del juego.

(defun poner(Ficha Posicion)
	(setf (nth (indice Posicion) *Tablero*) Ficha)
)

;---------------------------------------------------

;---------------------------------------------------
;---------------------------------------------------
;---------------------------------------------------
; (mover A B)
; Toma como parámetros de entrada dos coordenadas (x, y) A y B
; Pone el valor de la coordenada A en la posición B y luego deja
; el valor de A en NIL

(defun mover(PosicionActual PosicionSiguiente)
	(cond
		((eq (nth (indice PosicionActual) *Tablero*) 'O) (setq Ficha *FichaO*))
		((eq (nth (indice PosicionActual) *Tablero*) 'X) (setq Ficha *FichaH*)) )
	(if (equal (nth (indice PosicionSiguiente) *Tablero*) nil)
				; Verfica que la posición a la que se quiere mover esté libre
		(progn
			(poner Ficha PosicionSiguiente)
					; Poner la Ficha en la Posición Final
			(poner NIL PosicionActual)
					; Dejar vacía la Posición Inicial
			PosicionSiguiente )
		nil )
)

;---------------------------------------------------

;---------------------------------------------------
; (mover-ficha Ficha A B)
; Toma como parámetros de entrada una ficha {X,O} y dos coordenadas (x, y) A y B
; Pone el valor de la coordenada A en la posición B y luego deja
; el valor de A en NIL

(defun mover-ficha(Ficha PosicionActual PosicionSiguiente)
	(cond
		((eq (nth (indice PosicionActual) *Tablero*) 'O) (setq Ficha *FichaO*))
		((eq (nth (indice PosicionActual) *Tablero*) 'X) (setq Ficha *FichaH*)) )
	(if (equal (nth (indice PosicionSiguiente) *Tablero*) nil)
				; Verfica que la posición a la que se quiere mover esté libre
		(progn
			(poner Ficha PosicionSiguiente)
					; Poner la Ficha en la Posición Final
			(poner NIL PosicionActual)
					; Dejar vacía la Posición Inicial
			PosicionSiguiente )
		nil )
)

;---------------------------------------------------

;---------------------------------------------------
; (turno-de-ficha)
; Retorna el tipo de ficha {X,O} con la que corresponde jugar en el momento actual

(defun turno-de-ficha()
	(cond
		((= *Turno* -1) *FichaO*)
		((= *Turno* 1) *FichaH*) )
)

;---------------------------------------------------

;---------------------------------------------------
; (cambiar-turno)
; Cambiar el turno del jugador actual {-1, 1} = {Ordenador, Humano}

(defun cambiar-turno()
	(setq *Turno* (* *Turno* -1))
)

;---------------------------------------------------

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
	(setq Ficha (turno-de-ficha))
	(if (and
				(< *NumeroFichas* *MaxNumfichas*)
					; Verificamos que esté en la primera fase del juego
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(equal (nth (indice Posicion) *Tablero*) nil))
					; Verfica que la posición esté libre
			(progn
				(poner Ficha Posicion)
						; Poner la Ficha en la Posición
				(setq *NumeroFichas* (+ *NumeroFichas* 1))
					; Actualiza el número de fichas que hay en el tablero.
				(cambiar-turno)
					; Cambiar de turno
				Posicion
				; Retorna T si se hizo el cambio con éxito
			)
		nil ) ; Retorna NIL en caso de que no sea posible el desplazamiento
	;(mostrar-tablero)
	)

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
	(setq Ficha (turno-de-ficha))
	(if (and
				(= *NumeroFichas* *MaxNumfichas*)
					; Verifica que el juego esté en la seguda fase del juego
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(> (first PosicionActual) 0)
					; x > 0
				(equal (nth (indice PosicionSiguiente) *Tablero*) nil)
					; Verfica que la posición a la que se quiere mover esté libre
				(equal (nth (indice PosicionActual) *Tablero*) Ficha) )
					; Verifica que la ficha que quiere mover le corresponde
		(progn
			(poner Ficha PosicionSiguiente)
					; Poner la Ficha en la Posición Siguiente
			(poner NIL PosicionActual)
					; Dejar vacía la Posición Inicial
			(cambiar-turno)
				; Cambiar de turno
			PosicionSiguiente )
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
	(setq Ficha (turno-de-ficha))
	(if (and
				(= *NumeroFichas* *MaxNumfichas*)
					; Verifica que el juego esté en la seguda fase del juego
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(< (cadr PosicionActual) 2)
					; y < 2
				(equal (nth (indice PosicionSiguiente) *Tablero*) nil)
					; Verfica que la posición a la que se quiere mover esté libre
				(equal (nth (indice PosicionActual) *Tablero*) Ficha) )
					; Verifica que la ficha que quiere mover le corresponde
		(progn
			(poner Ficha PosicionSiguiente)
					; Poner la Ficha en la Posición Siguiente
			(poner NIL PosicionActual)
					; Dejar vacía la Posición Inicial
			(cambiar-turno)
				; Cambiar de turno
			PosicionSiguiente )
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
	(setq Ficha (turno-de-ficha))
	(if (and
				(= *NumeroFichas* *MaxNumfichas*)
					; Verifica que el juego esté en la seguda fase del juego
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(< (first PosicionActual) 2)
					; x < 2
				(equal (nth (indice PosicionSiguiente) *Tablero*) nil)
					; Verfica que la posición a la que se quiere mover esté libre
				(equal (nth (indice PosicionActual) *Tablero*) Ficha) )
					; Verifica que la ficha que quiere mover le corresponde
		(progn
			(poner Ficha PosicionSiguiente)
					; Poner la Ficha en la Posición Siguiente
			(poner NIL PosicionActual)
					; Dejar vacía la Posición Inicial
			(cambiar-turno)
				; Cambiar de turno
			PosicionSiguiente )
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
	(setq PosicionSiguiente (list (- (first PosicionActual) 1) (cadr PosicionActual)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*))
	)
	(if (and
				(= *NumeroFichas* *MaxNumfichas*)
					; Verifica que el juego esté en la seguda fase del juego
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
			(setq *Turno* (* *Turno* -1))
				; Cambiar de turno
			PosicionSiguiente )
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
	(setq PosicionSiguiente (list (- (first PosicionActual) 1) (+ (cadr PosicionActual) 1)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*))
	)
	(if (and
				(= *NumeroFichas* *MaxNumfichas*)
					; Verifica que el juego esté en la seguda fase del juego
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(find PosicionActual '((2 0) (1 1)) :test #'equal)
					; Verifica que esté en la diagonal y que se pueda mover la ficha
				(equal (nth (+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*) nil) )
					; Verfica que la posición a la que se quiere mover esté libre
			(progn
				(setf (nth
					(+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*)
					Ficha)
						; Poner la Ficha en la Posición Final
				(setf (nth
					(+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*)
					nil)
						; Dejar vacía la Posición Inicial
				(setq *Turno* (* *Turno* -1))
					; Cambiar de turno
				PosicionSiguiente )
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
	(setq PosicionSiguiente (list (+ (first PosicionActual) 1) (- (cadr PosicionActual) 1)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*))
	)
	(if (and
				(= *NumeroFichas* *MaxNumfichas*)
					; Verifica que el juego esté en la seguda fase del juego
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(find PosicionActual '((0 2) (1 1)) :test #'equal)
					; Verifica que esté en la diagonal y que se pueda mover la ficha
				(equal (nth (+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*) nil) )
					; Verfica que la posición a la que se quiere mover esté libre
			(progn
				(setf (nth
					(+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*)
					Ficha)
						; Poner la Ficha en la Posición Final
				(setf (nth
					(+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*)
					nil)
						; Dejar vacía la Posición Inicial
				(setq *Turno* (* *Turno* -1))
					; Cambiar de turno
				PosicionSiguiente )
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
	(setq PosicionSiguiente (list (- (first PosicionActual) 1) (- (cadr PosicionActual) 1)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*))
	)
	(if (and
				(= *NumeroFichas* *MaxNumfichas*)
					; Verifica que el juego esté en la seguda fase del juego
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(= (first PosicionActual) (cadr PosicionActual))
					; x = y, con esto sabemos que está en la diagonal \
				(> (first PosicionActual) 0)
					; x > 0
				(equal (nth (+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*) nil) )
					; Verfica que la posición a la que se quiere mover esté libre
			(progn
				(setf (nth
					(+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*)
					Ficha)
						; Poner la Ficha en la Posición Final
				(setf (nth
					(+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*)
					nil)
						; Dejar vacía la Posición Inicial
				(setq *Turno* (* *Turno* -1))
					; Cambiar de turno
				PosicionSiguiente )
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
	(setq PosicionSiguiente (list (+ (first PosicionActual) 1) (+ (cadr PosicionActual) 1)))
		; Calcula la posición siguiente
	(cond
		((= *Turno* -1) (setq Ficha *FichaO*))
		((= *Turno* 1) (setq Ficha *FichaH*))
	)
	(if (and
				(= *NumeroFichas* *MaxNumfichas*)
					; Verifica que el juego esté en la seguda fase del juego
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(= (first PosicionActual) (cadr PosicionActual))
					; x = y, con esto sabemos que está en la diagonal \
				(< (first PosicionActual) 2)
					; x < 2
				(equal (nth (+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*) nil) )
					; Verfica que la posición a la que se quiere mover esté libre
			(progn
				(setf (nth
					(+ (* 3 (first PosicionSiguiente)) (cadr PosicionSiguiente)) *Tablero*)
					Ficha)
						; Poner la Ficha en la Posición Final
				(setf (nth
					(+ (* 3 (first PosicionActual)) (cadr PosicionActual)) *Tablero*)
					nil)
						; Dejar vacía la Posición Inicial
				(setq *Turno* (* *Turno* -1))
					; Cambiar de turno
				PosicionSiguiente )
			NIL) )

;---------------------------------------------------
