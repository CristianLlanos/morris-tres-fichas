;---------------------------------------------------
; Funciones en este archivo:
;
; (indice A)
; (poner-ficha Ficha A)
; (mover A B)
; (mover-ficha Ficha A B)
; (turno-de-ficha)
; (cambiar-turno)
; (es-movimiento-valido-fase-uno-p A J)
; (es-movimiento-valido-fase-dos-p A J)
; (tipo-ficha Ficha)
; (mostrar-tablero)
; (copiar A)
;---------------------------------------------------

;---------------------------------------------------
; (indice A)
; Recibe como parámetro una coordenada  A (x,y) y devuelve su índice en el tablero

(defun indice(Posicion)
	(+ (* 3 (first Posicion)) (cadr Posicion))
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
	(let ( (Ficha (nth (indice PosicionActual) *Tablero*)) )
		(if (and
			(not (equal Ficha *FichaVacia*))
				; Verifica que la ficha a mover sea realmente una ficha
			(equal (nth (indice PosicionSiguiente) *Tablero*) *FichaVacia*) )
				; Verfica que la posición a la que se quiere mover esté libre
		(progn
			(poner-ficha Ficha PosicionSiguiente)
					; Poner la Ficha en la Posición Final
			(poner-ficha *FichaVacia* PosicionActual)
					; Dejar vacía la Posición Inicial
			PosicionSiguiente ) ) ) )
				; Retorna la siguiente posición si fue excitoso
				; Retorna NIL en caso de que no sea posible el desplazamiento

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
			(poner-ficha Ficha PosicionSiguiente)
					; Poner la Ficha en la Posición Final
			(poner-ficha *FichaVacia* PosicionActual)
					; Dejar vacía la Posición Inicial
			PosicionSiguiente ) ) )

;---------------------------------------------------

;---------------------------------------------------
; (turno-de-ficha)
; Retorna el tipo de ficha {X,O} con la que corresponde jugar en el momento actual

(defun turno-de-ficha()
	(cond
		((= *Turno* *Ordenador*) *FichaO*)
		((= *Turno* *Humano*) *FichaH*) ) )

;---------------------------------------------------

;---------------------------------------------------
; (cambiar-turno)
; Cambiar el turno del jugador actual {-1, 1} = {Ordenador, Humano}

(defun cambiar-turno()
	(setq *Turno* (* *Turno* -1))
)

;---------------------------------------------------

;---------------------------------------------------
; (es-movimiento-valido-fase-uno-p A J)
; Predicado que verifica la validez del movimiento a realizar.
; Necesita como parámetros la coordenada y el jugador.

(defun es-movimiento-valido-fase-uno-p(Posicion Jugador)
	(and
		(< *NumeroFichas* *MaxNumfichas*)
			; Verifica que el juego esté en la seguda fase del juego
		(= *Turno* Jugador)
			; Verifica que le corresponda el turno (que le toque jugar)
		(equal (nth (indice Posicion) *Tablero*) *FichaVacia*) ) )
			; Verfica que la posición esté libre
		; Verdadero si es válido
		; Falso si no es válido

;---------------------------------------------------

;---------------------------------------------------
; (es-movimiento-valido-fase-dos-p A J)
; Predicado que verifica la validez del movimiento a realizar.
; Necesita como parámetros la coordenada y el jugador.

(defun es-movimiento-valido-fase-dos-p(PosicionActual Jugador)
	(let ((Ficha (turno-de-ficha)))
		(and
			(= *NumeroFichas* *MaxNumfichas*)
				; Verifica que el juego esté en la seguda fase del juego
			(= *Turno* Jugador)
				; Verifica que le corresponda el turno (que le toque jugar)
			(equal (nth (indice PosicionActual) *Tablero*) Ficha) ) ) )
				; Verifica que la ficha que quiere mover le corresponde
		; Verdadero si es válido
		; Falso si no es válido

;---------------------------------------------------

;---------------------------------------------------
; (tipo-ficha Ficha)

(defun tipo-ficha(Ficha)
  (cond
  	( (equal Ficha *FichaH*) *FichaH* )
  	( (equal Ficha *FichaO*) *FichaO* )
  	( (equal Ficha *FichaVacia*) '- ) ) )

;---------------------------------------------------

;---------------------------------------------------
; (mostrar-tablero)

(defun mostrar-tablero()
  (let
      ((tablero *tablero*))
    (format t "~&| ~s ~s ~s | ~&| ~s ~s ~s | ~&| ~s ~s ~s |"
	    (tipo-ficha (nth 0 tablero))
	    (tipo-ficha (nth 1 tablero))
	    (tipo-ficha (nth 2 tablero))
	    (tipo-ficha (nth 3 tablero))
	    (tipo-ficha (nth 4 tablero))
	    (tipo-ficha (nth 5 tablero))
	    (tipo-ficha (nth 6 tablero))
	    (tipo-ficha (nth 7 tablero))
	    (tipo-ficha (nth 8 tablero)) ) ) )

;---------------------------------------------------

;---------------------------------------------------
; (copiar A)
; Copia el valor de una variable para poder ser asignado a otra

(defun copiar(dato) dato)

;---------------------------------------------------

;---------------------------------------------------
; (sort (copy-seq Lista) #'list>)
; Para ordenar por el segundo elemento de Mayor a menor

(defun list> (a b)
  (cond ((null a) (not (null b)))
        ((null b) nil)
        ((= (cadr a) (cadr b)) (list> (rest a) (rest b)))
        (t (> (cadr a) (cadr b))) ))

;---------------------------------------------------