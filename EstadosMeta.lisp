#| (setq EstadosMeta
	'( ; Conjunto de estados
		()
		()
		()
	)
) |#

(setq a '(1 1))
(setq b '(2 1))
(setq c '(3 1))

(defun esMetaVertical1(x y z) ; x=(1,1) y=(2,1) z=(3,1)
	(if (= (first x) 1)
		(progn (if (= (+ (first x) 1) (first y))
				(progn (if ((= (+ (first x) 2) (first z))
							(print T)
							)
						)
				)
			)
		)
	)
	(print nil)
)