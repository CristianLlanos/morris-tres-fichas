; TE PUEDES AYUDAR DEL ARCHIVO AYUDA.LISP Y REGLASORDENADOR.LISP
(load "Ayuda.lisp")
(load "ReglasOrdenador.lisp")
; HELPERS
; (indice A)
; (poner-ficha Ficha A)
; (mover A B)
; (mover-ficha Ficha A B)
; (turno-de-ficha)
; (cambiar-turno)
; (es-movimiento-valido-fase-uno-p A J)
; (es-movimiento-valido-fase-dos-p A J)
;
; MOVIMIENTOS
; (izquierda A)
; (derecha A)
; (abajo A)
; (arriba A)
; (diagonal-a-derecha A)
; (diagonal-a-izquierda A)
; (diagonal-b-derecha A)
; (diagonal-b-izquierda A)

;---------------------------------------------------
; ESTE ES TU TABLERO DE PRUEBA
(setq
	*Tablero* '(X nil nil nil nil nil nil nil nil)
	*FichaH* 'X
	*FichaO* 'O
	*FichaVacia* NIL
	*TableroAuxiliar* ())

(defun tipo-ficha(Ficha)
  (cond
  	( (equal Ficha *FichaH*) *FichaH* )
  	( (equal Ficha *FichaO*) *FichaO* )
  	( (equal Ficha *FichaVacia*) '- ) ) )

;---------------------------------------------------
; ESTA FUNCIÓN MUESTRA EL TABLERO FORMATEADO

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
; Lista de hijos de la posición actual
; La lista debe ser de elementos a ser analizados que formarán parte de LE
; Tienen la forma:
; ( (A B) (heuristica y) )
#| 
(
	( ((0 0) (1 1)) 2 )
	( ((0 0) (1 2)) 4 )
	( ((0 0) (0 1)) 1 )
	( ((0 0) (2 1)) 3 )
)
|#
(defun hijos-de(Posicion)
	(let (
		(Hijos ())
		(Tablero *Tablero*)
		(uno NIL)
		(dos NIL)
		(tres NIL)
		(cuatro NIL)
		(cinco NIL)
		(seis NIL)
		(siete NIL)
		(ocho NIL) )
		(progn
			(setq uno (izquierda Posicion))
			(if (not (null uno)) (progn (setq Hijos (cons (list uno 'costo) Hijos)) (derecha uno)) )
			
			(setq dos (derecha Posicion))
			(if (not (null dos)) (progn (setq Hijos (cons (list dos 'costo) Hijos)) (izquierda dos)) )
			
			(setq tres (abajo Posicion))
			(if (not (null tres)) (progn (setq Hijos (cons (list tres 'costo) Hijos)) (arriba tres)) )
			
			(setq cuatro (arriba Posicion))
			(if (not (null cuatro)) (progn (setq Hijos (cons (list cuatro 'costo) Hijos)) (abajo cuatro)) )
			
			(setq cinco (diagonal-a-derecha Posicion))
			(if (not (null cinco)) (progn (setq Hijos (cons (list cinco 'costo) Hijos)) (diagonal-a-izquierda cinco)) )
			
			(setq seis (diagonal-a-izquierda Posicion))
			(if (not (null seis)) (progn (setq Hijos (cons (list seis 'costo) Hijos)) (diagonal-a-derecha seis)) )
			
			(setq siete (diagonal-b-derecha Posicion))
			(if (not (null siete)) (progn (setq Hijos (cons (list siete 'costo) Hijos)) (diagonal-b-izquierda siete)) )
			
			(setq ocho (diagonal-b-izquierda Posicion))
			(if (not (null ocho)) (progn (setq Hijos (cons (list ocho 'costo) Hijos)) (diagonal-b-derecha ocho)) )

			Hijos) ) )
;---------------------------------------------------

; (izquierda A)
; (derecha A)
; (abajo A)
; (arriba A)
; (diagonal-a-derecha A)
; (diagonal-a-izquierda A)
; (diagonal-b-derecha A)
; (diagonal-b-izquierda A)