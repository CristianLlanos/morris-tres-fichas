;Programa principal
;Estructura del proyecto

; Librería gráfica LTK
;(load "ltk")
; Es necesario esto
;(in-package :ltk)

(defun mostrar-tablero()
  (let
      ((tablero *tablero*))
    (format t "~&| ~s ~s ~s | ~&| ~s ~s ~s | ~&| ~s ~s ~s |"
	    (nth 0 tablero)
	    (nth 1 tablero)
	    (nth 2 tablero)
	    (nth 3 tablero)
	    (nth 4 tablero)
	    (nth 5 tablero)
	    (nth 6 tablero)
	    (nth 7 tablero)
	    (nth 8 tablero))))

;---------------------------------------------------
; Estos son datos de prueba que debes ser eliminados
; Considerar que estas variables son listas (x y)
; que hace referencia a un par ordenado (x,y)
; (fila, columna)

(setq q '(0 0))
(setq w '(1 0))
(setq e '(2 0))

;---------------------------------------------------

;---------------------------------------------------
; Definición del juego

(load "Estado.lisp")
	; Aquí van las variables globales.
(load "EstadoInicial.lisp")
(load "EstadosMeta.lisp")
(load "Reglas.lisp")
;(load "PrimeroElMejor.lisp")

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

;(setq *Tablero* '(x o nil o nil x nil x o))