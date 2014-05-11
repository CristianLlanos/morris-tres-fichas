;---------------------------------------------------
; Ordena elementos por su PESO o COSTO
; Un elemento es una lista con dos elementos:
; 	- Una lista con coordenadas (que representan movimientos)
; 	- Un número que representa el PESO dado por la función "heuristica"
; Su sintaxis es:
; ( (x y) (heuristica y) )
#|
(
	('(0 0) '(0 1)) ; Este par representa el movimiento
	2 ; Este número representa el COSTO dado por (heuristica '(0 1))
)
|#
; Un ejemplo
#| 
(setq LE '(
	( ((0 0) (1 1)) 2 )
	( ((0 0) (1 2)) 4 )
	( ((0 0) (0 1)) 1 )
	( ((0 0) (2 1)) 3 ) ) )

(ordenar-por-costo LE)
|#
; Debe retornar:
#| 
(
	( ((0 0) (0 1)) 1 )
	( ((0 0) (1 1)) 2 )
	( ((0 0) (2 1)) 3 )
	( ((0 0) (1 2)) 4 )
)
|#

(defun ordenar-por-costo(LE)
	)

;---------------------------------------------------