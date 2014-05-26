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
		;(Tablero (copiar *Tablero*))
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
			(if (not (null uno)) (progn (setq Hijos (cons (list (list Posicion uno) (heuristica uno)) Hijos)) (derecha uno)) )
			
			(setq dos (derecha Posicion))
			(if (not (null dos)) (progn (setq Hijos (cons (list (list Posicion dos) (heuristica dos)) Hijos)) (izquierda dos)) )
			
			(setq tres (abajo Posicion))
			(if (not (null tres)) (progn (setq Hijos (cons (list (list Posicion tres) (heuristica tres)) Hijos)) (arriba tres)) )
			
			(setq cuatro (arriba Posicion))
			(if (not (null cuatro)) (progn (setq Hijos (cons (list (list Posicion cuatro) (heuristica cuatro)) Hijos)) (abajo cuatro)) )
			
			(setq cinco (diagonal-a-derecha Posicion))
			(if (not (null cinco)) (progn (setq Hijos (cons (list (list Posicion cinco) (heuristica cinco)) Hijos)) (diagonal-a-izquierda cinco)) )
			
			(setq seis (diagonal-a-izquierda Posicion))
			(if (not (null seis)) (progn (setq Hijos (cons (list (list Posicion seis) (heuristica seis)) Hijos)) (diagonal-a-derecha seis)) )
			
			(setq siete (diagonal-b-derecha Posicion))
			(if (not (null siete)) (progn (setq Hijos (cons (list (list Posicion siete) (heuristica siete)) Hijos)) (diagonal-b-izquierda siete)) )
			
			(setq ocho (diagonal-b-izquierda Posicion))
			(if (not (null ocho)) (progn (setq Hijos (cons (list (list Posicion ocho) (heuristica ocho)) Hijos)) (diagonal-b-derecha ocho)) )

			Hijos) ) )

;---------------------------------------------------