;Programa principal
;Estructura del proyecto

; Librería gráfica LTK
;(load "ltk")
; Es necesario esto
;(in-package :ltk)


;---------------------------------------------------
; Estos son datos de prueba que debes ser eliminados
(setq q '(0 0))
(setq w '(1 0))
(setq e '(2 0))
; Hasta aquí son datos de prueba
;---------------------------------------------------

;---------------------------------------------------
; Definición del juego

(load "Estado.lisp")
	; Aquí van las variables globales.
(load "EstadoInicial.lisp")
(load "EstadosMeta.lisp")
(load "Reglas.lisp")

;---------------------------------------------------

;---------------------------------------------------
; Construcción del juego

; (load "InicializarArbolDeEstados.lisp")
; (load "InicializarPrimeroElMejor.lisp")

; (load "InicializarTablero.lisp") ; Tablero
	; Funciones:
	; (InicializarTablero)
; (load "InicializarFichas.lisp") ; Colores
; (load "InicializarHumano.lisp")
	; Funciones:
	; (InicializarHumano) - Variables cero
	; (HumanoJugar x y) - Poner ficha en (x,y)
	; (HumanoMover x y w z) - Posición ficha (x,y) hacia el destino (w,z)
; (load "InicializarOrdenador.lisp")
	; Funciones:
	; (InicializarOrdenador) - Variables cero
	; (OrdenadorJugar x y) - Poner ficha en (x,y)
	; (OrdenadoMover x y w z) - Posición ficha (x,y) hacia el destino (w,z)

;---------------------------------------------------

(defun morris()
	; Iniciar el juego (tablero y jugadores)
	;(InicializarTablero)
	;(InicializarHumano)
	;(InicializarOrdenador)
)