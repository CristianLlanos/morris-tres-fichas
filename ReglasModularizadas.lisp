#|
	En este archivo están definidas las funciones de las reglas del juego
	Morris de tres jugadores especificadas en el documento. Varias de estas
	funciones dependen directamente de otras funciones difinidas en el archivo
	"Ayuda.lisp".
|#

;---------------------------------------------------
; Carga de las funciones de ayuda.

(load "Ayuda.lisp")
(load "ReglasOrdenador.lisp")

;---------------------------------------------------

#| PRIMERA FASE |#
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
	(if (and
			(es-movimiento-valido-fase-uno-p Posicion Jugador)
				; Comprueba que el movimiento es válido para proceder a ejecutarlo
			(poner-ficha (turno-de-ficha) Posicion) )
				; Poner la Ficha en la Posición
		(progn
			(setq *NumeroFichas* (+ *NumeroFichas* 1))
				; Actualiza el número de fichas que hay en el tablero.
			(cambiar-turno) )
				; Cambiar de turno
		(print 'Movimiento-invalido) )
		(mostrar-tablero) )

;---------------------------------------------------

#| SEGUNDA FASE |#
;---------------------------------------------------
; (desplazar-izquierda A J)
;
; Toma como parámetros de entrada a las coordenas A (de la ficha seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del desplazamiento una pocisión hacia la izquierda (que sea correcto
; y justo). De ser válido el desplazamiento, retorna el nuevo turno,
; cambiando el valor de la variable global *Turno*. De ser inválido, retorna el valor *FichaVacia*

(defun desplazar-izquierda(PosicionActual  Jugador)
	(if (and
			(es-movimiento-valido-fase-dos-p PosicionActual Jugador)
				; Comprueba que el movimiento es válido para proceder a ejecutarlo
			(izquierda PosicionActual) )
				; Ejecución del movimiento
		(cambiar-turno) )
			; Cambia el turno al otro jugador
		(mostrar-tablero) )

;------------------------------------------------

;---------------------------------------------------
; (desplazar-derecha A J)
;
; Toma como parámetros de entrada a las coordenas A (de la ficha seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del desplazamiento una pocisión hacia la derecha (que sea correcto
; y justo). De ser válido el desplazamiento, retorna el nuevo turno,
; cambiando el valor de la variable global *Turno*. De ser inválido, retorna el valor *FichaVacia*

(defun desplazar-derecha(PosicionActual  Jugador)
	(if (and
			(es-movimiento-valido-fase-dos-p PosicionActual Jugador)
				; Comprueba que el movimiento es válido para proceder a ejecutarlo
			(derecha PosicionActual) )
				; Ejecución del movimiento
		(cambiar-turno) )
			; Cambia el turno al otro jugador
		(mostrar-tablero) )

;---------------------------------------------------

;---------------------------------------------------
; (desplazar-abajo A J)
;
; Toma como parámetros de entrada a las coordenas A (de la ficha seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del desplazamiento una pocisión hacia abajo (que sea correcto
; y justo). De ser válido el desplazamiento, retorna el nuevo turno,
; cambiando el valor de la variable global *Turno*. De ser inválido, retorna el valor *FichaVacia*

(defun desplazar-abajo(PosicionActual Jugador)
	(if (and
			(es-movimiento-valido-fase-dos-p PosicionActual Jugador)
				; Comprueba que el movimiento es válido para proceder a ejecutarlo
			(abajo PosicionActual) )
				; Ejecución del movimiento
		(cambiar-turno) )
			; Cambia el turno al otro jugador
		(mostrar-tablero) )

;---------------------------------------------------

;---------------------------------------------------
; (desplazar-arriba A J)
;
; Toma como parámetros de entrada a las coordenas A (de la ficha seleccionada)
; y J (el jugador que llama a la función, con el valor de -1 para el ordenador
; o 1 para el humano).
; 
; Evalúa la validez del desplazamiento una pocisión hacia arriba (que sea correcto
; y justo). De ser válido el desplazamiento, retorna el nuevo turno,
; cambiando el valor de la variable global *Turno*. De ser inválido, retorna el valor *FichaVacia*

(defun desplazar-arriba(PosicionActual Jugador)
	(if (and
			(es-movimiento-valido-fase-dos-p PosicionActual Jugador)
				; Comprueba que el movimiento es válido para proceder a ejecutarlo
			(arriba PosicionActual) )
				; Ejecución del movimiento
		(cambiar-turno) )
			; Cambia el turno al otro jugador
		(mostrar-tablero) )

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
; retorna el valor *FichaVacia*

(defun desplazar-diagonal-a-derecha(PosicionActual Jugador)
	(if (and
			(es-movimiento-valido-fase-dos-p PosicionActual Jugador)
				; Comprueba que el movimiento es válido para proceder a ejecutarlo
			(diagonal-a-derecha PosicionActual) )
				; Ejecución del movimiento
		(cambiar-turno) )
			; Cambia el turno al otro jugador
		(mostrar-tablero) )

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
; retorna el valor *FichaVacia*

(defun desplazar-diagonal-a-izquierda(PosicionActual Jugador)
	(if (and
			(es-movimiento-valido-fase-dos-p PosicionActual Jugador)
				; Comprueba que el movimiento es válido para proceder a ejecutarlo
			(diagonal-a-izquierda PosicionActual) )
				; Ejecución del movimiento
		(cambiar-turno) )
			; Cambia el turno al otro jugador
		(mostrar-tablero) )

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
; retorna el valor *FichaVacia*

(defun desplazar-diagonal-b-derecha(PosicionActual Jugador)
	(if (and
			(es-movimiento-valido-fase-dos-p PosicionActual Jugador)
				; Comprueba que el movimiento es válido para proceder a ejecutarlo
			(diagonal-b-derecha PosicionActual) )
				; Ejecución del movimiento
		(cambiar-turno) )
			; Cambia el turno al otro jugador
		(mostrar-tablero) )

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
; retorna el valor *FichaVacia*

(defun desplazar-diagonal-b-izquierda(PosicionActual Jugador)
	(if (and
			(es-movimiento-valido-fase-dos-p PosicionActual Jugador)
				; Comprueba que el movimiento es válido para proceder a ejecutarlo
			(diagonal-b-izquierda PosicionActual) )
				; Ejecución del movimiento
		(cambiar-turno) )
			; Cambia el turno al otro jugador
		(mostrar-tablero) )

;---------------------------------------------------