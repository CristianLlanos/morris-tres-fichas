(setq EstadosMeta
	'( ; Conjunto de estados
		((0 0) (1 0) (2 0)) ; Primera columna
		((0 1) (1 1) (2 1)) ; Segunda columna
		((0 2) (1 2) (2 2)) ; Tercera columna
		((0 0) (0 1) (0 2)) ; Primera fila
		((1 0) (1 1) (1 2)) ; Segunda fila
		((2 0) (2 1) (2 2)) ; Tercera fila
		((0 0) (1 1) (2 2)) ; Diagonal \
		((2 0) (1 1) (0 2)) ; Diagonal /
		;Sí, debe ser global
	)
)

(setq d '(0 0))
(setq e '(1 0))
(setq f '(2 0))

(defun esEstadoMeta(a b c)
	(setq Estado (list a b c))
	(find Estado EstadosMeta :test #'equal)
)


;ESTAS FUNCIONES NO SON ÚTILES, PERO QUEDAN PARA CONSULTAR LA ESTRUCTURA
; |
; V

#| (dolist (x EstadosMeta)
		(print (list "Estado Meta: " x))
		)
	) |#
#| (defun esMetaVertical1(PosActual PosMas1 PosMas2) ; PosActual=(1,1) PosMas1=(2,1) PosMas2=(3,1)
	(if
		((and (= (first PosActual) 0) (= (rest PosActual) (rest PosMas1) (rest PosMas2)))
		(progn
			(if
				(= (+ (first PosActual) 1) (first PosMas1))
				(progn
					(if
						(= (+ (first PosActual) 2) (first PosMas2))
						(print "Verdadero")
						(print "Falso")
					)
				)
				(print "Falso")
			)
		)
		(print "Falso")
	)
) |#