;---------------------------------------------------
; Funciones en este archivo:
;
; (indice A)
; (aumentar-numero-fichas)
; (poner-ficha Ficha A)
; (mover A B)
; (mover-ficha Ficha A B)
; (turno-de-ficha)
; (obtener-ficha Posicion)
; (cambiar-turno)
; (es-movimiento-valido-fase-uno-p A J)
; (es-movimiento-valido-fase-dos-p A J)
; (tipo-ficha Ficha)
; (mostrar-tablero)
; (copiar A)
; (sort (copy-seq ListaConSublistasSegundoElemento) #'list>)
; (es-primera-fase-p)
;---------------------------------------------------

;---------------------------------------------------
; (indice A)
; Recibe como parámetro una coordenada  A (x,y) y devuelve su índice en el tablero

(defun indice(Posicion)
	(+ (* 3 (first Posicion)) (cadr Posicion))
)

;---------------------------------------------------

;---------------------------------------------------
; (aumentar-numero-fichas)
; Actualiza el número de fichas que hay en el tablero.

(defun aumentar-numero-fichas()
	(setq *NumeroFichas* (+ *NumeroFichas* 1)) )

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
; (obtener-ficha Posicion)

(defun obtener-ficha(Posicion)
  (nth (indice Posicion) *Tablero*) )

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
        ;((= (cadr a) (cadr b)) (list> (rest a) (rest b)))
        (t (>= (cadr a) (cadr b))) ))

;---------------------------------------------------

;---------------------------------------------------
; (es-primera-fase-p)
; T si lo es, NIL si es segunda fase

(defun es-primera-fase-p() (< *NumeroFichas* *MaxNumFichas*))

;---------------------------------------------------

;---------------------------------------------------
; (coordenada Indice)
; Retorna una coordenada en el tablero

(defun coordenada(Indice)
	(cond
		( (eq Indice 1) (list 0 0) )
		( (eq Indice 2) (list 0 1) )
		( (eq Indice 3) (list 0 2) )
		( (eq Indice 4) (list 1 0) )
		( (eq Indice 5) (list 1 1) )
		( (eq Indice 6) (list 1 2) )
		( (eq Indice 7) (list 2 0) )
		( (eq Indice 8) (list 2 1) )
		( (eq Indice 9) (list 2 2) ) ) )

;---------------------------------------------------

;---------------------------------------------------
; (obtner-fichas Ficha)

(defun obtener-fichas(Ficha)
	(let ((lista ()))
		(progn
			(loop for x from 0 to 2 do
		    	(loop for y from 0 to 2 do
		        (if (eq (nth (+ (* 3 x) y) *tablero*) Ficha)
		        	 (setq lista (cons (list x y) lista)) ) ) )
		    lista ) ) )

;---------------------------------------------------

;---------------------------------------------------
; (estado-del-juego)

(defun estado-del-juego()
	(let (
		(FichasHumano (obtener-fichas *FichaH*))
		(FichasOrdenador (obtener-fichas *FichaO*)) )
		(progn
			(if (= (length FichasHumano) 3) ; Si el humano tiene sus fichas completas
			 	(if (esEstadoMeta
				 		(nth 0 FichasHumano)
				 		(nth 1 FichasHumano)
				 		(nth 2 FichasHumano) )
				 	(progn
				 		(format t "~%~%~%¡Ganaste!")
				 		(setq *hayGanador* T) ) ) )
			(if (= (length FichasOrdenador) 3) ; Si el humano tiene sus fichas completas
			 	(if (esEstadoMeta
				 		(nth 0 FichasOrdenador)
				 		(nth 1 FichasOrdenador)
				 		(nth 2 FichasOrdenador) )
				 	(progn
				 		(format t "~%~%~%¡Perdiste!")
				 		(setq *hayGanador* T) ) ) ) ) ) )

;---------------------------------------------------