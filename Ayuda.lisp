;---------------------------------------------------
; Funciones en este archivo:
; (indice A)
; (poner A J)
; (poner-ficha Ficha A)
; (mover A B)
; (mover-ficha Ficha A B)
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
; (poner A J)
;
; Toma como parámetros de entrada a las coordenas A (de la posición seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del posicionamiento (que sea correcto y justo). De ser válido
; el poscionamiento, retorna la "posición" afectada, cambiando el valor de
; la variable global *Turno*. De ser inválido, retorna el valor *FichaVacia*

(defun poner(Posicion Jugador)
	(setq Ficha (turno-de-ficha))
	(if (and
				(< *NumeroFichas* *MaxNumfichas*)
					; Verificamos que esté en la primera fase del juego
				(= *Turno* Jugador)
					; Verifica que le corresponda el turno (que le toque jugar)
				(equal (nth (indice Posicion) *Tablero*) *FichaVacia*))
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
		*FichaVacia* ) ; Retorna *FichaVacia* en caso de que no sea posible el desplazamiento
	;(mostrar-tablero)
	)

;---------------------------------------------------

;---------------------------------------------------
; (poner-ficha Ficha A)
; Recibe como parámetro una coordenada  A (x,y) y un tipo de ficha {X,O}
; Coloca el valor de la ficha en la posición indicada en el tablero del juego.

(defun poner-ficha(Ficha Posicion)
	(setf (nth (indice Posicion) *Tablero*) Ficha)
)

;---------------------------------------------------

;---------------------------------------------------
;---------------------------------------------------
;---------------------------------------------------
; (mover A B)
; Toma como parámetros de entrada dos coordenadas (x, y) A y B
; Pone el valor de la coordenada A en la posición B y luego deja
; el valor de A en *FichaVacia*

(defun mover(PosicionActual PosicionSiguiente)
	(cond
		((eq (nth (indice PosicionActual) *Tablero*) 'O) (setq Ficha *FichaO*))
		((eq (nth (indice PosicionActual) *Tablero*) 'X) (setq Ficha *FichaH*)) )
	(if (equal (nth (indice PosicionSiguiente) *Tablero*) *FichaVacia*)
				; Verfica que la posición a la que se quiere mover esté libre
		(progn
			(poner Ficha PosicionSiguiente)
					; Poner la Ficha en la Posición Final
			(poner *FichaVacia* PosicionActual)
					; Dejar vacía la Posición Inicial
			PosicionSiguiente )
		*FichaVacia* )
)

;---------------------------------------------------

;---------------------------------------------------
; (mover-ficha Ficha A B)
; Toma como parámetros de entrada una ficha {X,O} y dos coordenadas (x, y) A y B
; Pone el valor de la coordenada A en la posición B y luego deja
; el valor de A en *FichaVacia*

(defun mover-ficha(Ficha PosicionActual PosicionSiguiente)
	(if (and 
				(equal (nth (indice PosicionActual) *Tablero*) Ficha)
				(equal (nth (indice PosicionSiguiente) *Tablero*) *FichaVacia*) )
				; Verfica que la posición a la que se quiere mover esté libre
		(progn
			(poner Ficha PosicionSiguiente)
					; Poner la Ficha en la Posición Final
			(poner *FichaVacia* PosicionActual)
					; Dejar vacía la Posición Inicial
			PosicionSiguiente )
		*FichaVacia* )
)

;---------------------------------------------------

;---------------------------------------------------
; (turno-de-ficha)
; Retorna el tipo de ficha {X,O} con la que corresponde jugar en el momento actual

(defun turno-de-ficha()
	(cond
		((= *Turno* *Ordenador*) *FichaO*)
		((= *Turno* *Humano*) *FichaH*) )
)

;---------------------------------------------------

;---------------------------------------------------
; (cambiar-turno)
; Cambiar el turno del jugador actual {-1, 1} = {Ordenador, Humano}

(defun cambiar-turno()
	(setq *Turno* (* *Turno* -1))
)

;---------------------------------------------------