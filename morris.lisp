;Programa principal
;Estructura del proyecto

; Librería gráfica LTK
;(load "ltk")
; Es necesario esto
;(in-package :ltk)

;---------------------------------------------------

;---------------------------------------------------
; Definición del juego

(load "Estado.lisp")
	; Aquí van las variables globales.
(load "EstadoInicial.lisp")
(load "EstadosMeta.lisp")
;---------------------------------------------------
; Carga de las funciones de ayuda.

(load "Ayuda.lisp")
(load "ReglasOrdenador.lisp")

;---------------------------------------------------
(load "ReglasModularizadas.lisp")
(load "Modulo1.lisp")
(load "Modulo2.lisp")
(load "Modulo3.lisp")
(load "Modulo4.lisp")
(load "Modulo6.lisp")
(load "PrimeroMejor.lisp")
(load "Modulo7")

;---------------------------------------------------

;---------------------------------------------------

(defun morris()
	(inicializar-juego)
	(jugar)
)

(morris)

; (mostrar-tablero)


;(setq *Tablero* '(nil x nil o o x nil x o) *NumeroFichas* 6)
;(setq *Tablero* '(nil 1 nil 10 10 1 nil 1 10) *NumeroFichas* 6)
;(setq *Tablero* '(nil nil nil nil nil nil nil nil nil) *NumeroFichas* 0)