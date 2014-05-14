;---------------------------------------------------
; Aquí se definen todos los estados meta
; y se guardan en la variable global *EstadosMeta*
; para que los datos puedan ser utilizados
; posteriormente.

(setq *EstadosMeta*
	'(
		((0 0) (1 0) (2 0)) ; Primera columna
		((0 1) (1 1) (2 1)) ; Segunda columna
		((0 2) (1 2) (2 2)) ; Tercera columna
		((0 0) (0 1) (0 2)) ; Primera fila
		((1 0) (1 1) (1 2)) ; Segunda fila
		((2 0) (2 1) (2 2)) ; Tercera fila
		((0 0) (1 1) (2 2)) ; Diagonal \
		((2 0) (1 1) (0 2)) ; Diagonal /
	)
)

;---------------------------------------------------

;---------------------------------------------------
; (esEstadoMeta A B C) Toma como parámentros a tres
; listas con la forma (x y) y retorna una lista
; con los mismos parámetros: (A B C) en caso de que
; estén incluidos en el conjunto de estados meta de
; la lista EstadosMeta, en caso contrario retorna NIL

(defun esEstadoMeta(a b c)
	(let ((booleano NIL))
		(progn
			(dolist (i *EstadosMeta*) ; i es un Estado Meta
				(if (and
					(find a i :test #'equal)
					(find b i :test #'equal)
					(find c i :test #'equal) )
					(setq booleano T) ) )
			booleano ) ) )

;---------------------------------------------------

;---------------------------------------------------
; (es-meta-potencial-p A B) Toma como parámentros a dos
; listas con la forma (x y) y retorna la posición que le falta
; para que forma un estado meta

(defun es-meta-potencial-p(a b)
	(dolist (i *EstadosMeta*) ; i es un Estado Meta
		(if (find a i :test #'equal)
			(progn
				(setq i (eliminar a i))
				(if (find b i :test #'equal)
					(progn
						(setq i (eliminar b i))
						(setq i (car i))
						(return i) ) ) ) ) ) )

;---------------------------------------------------