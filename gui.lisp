(load "ltk")
(in-package :ltk)

;---------------------------------------------------

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
;EVALUACIONES PARA CADA CIRCULO
(defun val-circulo (posx posy)
    (sqrt (+ (expt (- posx 60 ) 2 ) (expt (- posy 60) 2) ) )
  )
(defun val-circulo2 (posx posy)
    (sqrt (+ (expt (- posx 210 ) 2 ) (expt (- posy 60) 2) ) )
  )
(defun val-circulo3 (posx posy)
    (sqrt (+ (expt (- posx 360 ) 2 ) (expt (- posy 60) 2) ) )
  )
(defun val-circulo4 (posx posy)
    (sqrt (+ (expt (- posx 60 ) 2 ) (expt (- posy 210) 2) ) )
  )
(defun val-circulo5 (posx posy)
    (sqrt (+ (expt (- posx 210 ) 2 ) (expt (- posy 210) 2) ) )
  )
(defun val-circulo6 (posx posy)
    (sqrt (+ (expt (- posx 360 ) 2 ) (expt (- posy 210) 2) ) )
  )
(defun val-circulo7 (posx posy)
    (sqrt (+ (expt (- posx 60 ) 2 ) (expt (- posy 360) 2) ) )
  )
(defun val-circulo8 (posx posy)
    (sqrt (+ (expt (- posx 210 ) 2 ) (expt (- posy 360) 2) ) )
  )
(defun val-circulo9 (posx posy)
    (sqrt (+ (expt (- posx 360 ) 2 ) (expt (- posy 360) 2) ) )
  )

;---------------------------------------------------

(inicializar-juego)

;---------------------------------------------------

(defvar *Posiciones*)
(defvar *colorFicha*)
(defvar *colorHumano*)
(defvar *colorOrdenador*)
(defvar *jugada*)
(defvar *turno*)

(setq *Posiciones* '(
  ( (10 10) (110 110) ) ; 1
  ( (160 10) (260 110) ) ; 2
  ( (310 10) (410 110) ) ; 3
  ( (10 160) (110 260) ) ; 4
  ( (160 160) (260 260) ) ; 5
  ( (310 160) (410 260) ) ; 6
  ( (10 310) (110 410) ) ; 7
  ( (160 310) (260 410) ) ; 8
  ( (310 310) (410 410) ) ; 9
  )
  *colorFicha* '"#394034"
  *colorHumano* '"#ff2f70"
  *colorOrdenador* '"#0083e8" )

(defun acerca-de ()
    (with-ltk()
      (let*
	  ((copyleft (make-instance 'label))
	   (boton-ok (make-instance 'button :text "Aceptar" :command (lambda() (setf *exit-mainloop* t)))))

	(setf (text copyleft) "Morris de tres fichas - 2014")
	
	(minsize *tk* 400 100)
	(maxsize *tk* 400 100)
	(wm-title *tk* "Acerca de...")

	(place copyleft 15 15)
	(place boton-ok 160 50))))

(defun mensaje-ganador(Ganador)
    (with-ltk()
      (let*
	  ((copyleft (make-instance 'label))
	   (boton-ok (make-instance 'button :text "Aceptar" :command (lambda() (setf *exit-mainloop* t)))))
	(if (equal Ganador *Humano*)
		(setf (text copyleft) "Felicidades, has ganado.")
		(setf (text copyleft) "Has perdido.") )
	(minsize *tk* 400 100)
	(maxsize *tk* 400 100)
	(wm-title *tk* "Fin del juego")

	(place copyleft 15 15)
	(place boton-ok 160 50))))

(defun donde-estoy(evento)
  
  (let ((indice NIL) )
     
     (if( < (val-circulo (event-x evento) (event-y evento) ) 50 )
                  (setq indice 0)
                  ;circulo 2
                  (if( < (val-circulo2 (event-x evento) (event-y evento) ) 50 )
                      (setq indice 1)
                     ;circulo 3
                     (if( < (val-circulo3 (event-x evento) (event-y evento) ) 50 )
                         (setq indice 2)
                        ;circulo 4
                        (if( < (val-circulo4 (event-x evento) (event-y evento) ) 50 )
                            (setq indice 3)
                           ;circulo 5
                           (if( < (val-circulo5 (event-x evento) (event-y evento) ) 50 )
                               (setq indice 4)
                              ;circulo 6
                              (if( < (val-circulo6 (event-x evento) (event-y evento) ) 50 )
                                  (setq indice 5)
                                 ;circulo 7 
                                 (if( < (val-circulo7 (event-x evento) (event-y evento) ) 50 )
                                     (setq indice 6)
                                    ;circulo 8
                                    (if( < (val-circulo8 (event-x evento) (event-y evento) ) 50 )
                                        (setq indice 7)
                                       ;circulo 9
                                       (if( < (val-circulo9 (event-x evento) (event-y evento) ) 50 )
                                           (setq indice 8)
                                           (setq indice nil)
                                       )  
                                    ) 
                                 ) 
                              ) 
                           ) 
                        ) 
                     ) 
                  )
                )

     indice
     ) 


 )

(defun tablero()
	(with-ltk ()
		(let* (
			(sc (make-instance 'canvas :height 420 :width 420))
			(lienzo (canvas sc))
			; Caminos por el tablero
			(linea1 (create-line lienzo (list 60 60 360 60)))
			(linea2 (create-line lienzo (list 60 60 60 360)))
			(linea3 (create-line lienzo (list 60 60 360 360)))
			(linea4 (create-line lienzo (list 60 360 360 360)))
			(linea5 (create-line lienzo (list 60 360 360 60)))
			(linea6 (create-line lienzo (list 360 60 360 360)))
			(linea7 (create-line lienzo (list 210 60 210 360)))
			(linea8 (create-line lienzo (list 60 210 360 210)))
			; Posiciones de las fichas
			(ovalo1 (create-oval lienzo 10 10 110 110))
			(ovalo2 (create-oval lienzo 160 10 260 110))
			(ovalo3 (create-oval lienzo 310 10 410 110));
 			(ovalo4 (create-oval lienzo 10 160 110 260))
			(ovalo5 (create-oval lienzo 160 160 260 260))
			(ovalo6 (create-oval lienzo 310 160 410 260));
			(ovalo7 (create-oval lienzo 10 310 110 410))
			(ovalo8 (create-oval lienzo 160 310 260 410))
			(ovalo9 (create-oval lienzo 310 310 410 410))
			(indiceFicha NIL)
    		(movimiento-humano NIL)
    		(movimiento-ordenador NIL) )
		(pack sc :expand 1 :fill :both)
		(wm-title *tk* "Morris de tres fichas")
		(bind lienzo "<ButtonPress-1>" (lambda(evento)
	      (setq indiceFicha (donde-estoy evento))
	       (print indiceFicha);----
	      (if (and (es-primera-fase-p) (numberp indiceFicha))
	      	(progn
		      	(print 'pintar-ficha);----
		      	(print indiceFicha);----
		        (print 'ya-pinto);----
		      	 (print (coordenada-tablero indiceFicha));----
			    (poner (coordenada-tablero indiceFicha) *Humano*)
		      	(pintar-ficha indiceFicha *colorHumano*)
		      	(format t "~%Tu jugada:")
		      	(mostrar-tablero);----
		      	; Buscando ganador
			    (estado-del-juego)
			    (if *hayGanador* (progn (mensaje-ganador *Humano*) (setf *exit-mainloop* t)))
			    (pintar-ficha (indice (obtener-primero-mejor)) *colorOrdenador*)
			    (format t "~%~%Juego del ordenador:")
			    (mostrar-tablero);----
			    (format t "~%")
			    ; Buscando ganador
			    (estado-del-juego)
			    (if *hayGanador* (progn (mensaje-ganador *Ordenador*) (setf *exit-mainloop* t)))
			     )
	      	(progn
	      		(push (coordenada-tablero indiceFicha) movimiento-humano)
	      		(if (= (length movimiento-humano) 2)
	      		 	(progn
	      		 		; (print 'ahora-lo-lendo);----
	      		 		; (print movimiento-humano);----
	      		 		(mover-ficha *FichaH* (cadr movimiento-humano) (car movimiento-humano))
	      		 		(pintar-ficha (indice (cadr movimiento-humano)) *colorFicha*)
	      		 		(pintar-ficha (indice (car movimiento-humano)) *colorHumano*)
	      		 		(cambiar-turno)
	      		 		(format t "~%Tu jugada:")
				      	(mostrar-tablero);----
				      	; Buscando ganador
				      	(estado-del-juego)
			    		(if *hayGanador* (progn (mensaje-ganador *Humano*) (setf *exit-mainloop* t)))
			    		(setq movimiento-ordenador (obtener-primero-mejor))
					    (pintar-ficha (indice (car movimiento-ordenador)) *colorFicha*)
					    (pintar-ficha (indice (cadr movimiento-ordenador)) *colorOrdenador*)
					    (format t "~%~%Juego del ordenador:")
					    (mostrar-tablero);----
					    (format t "~%")
					    ; Buscando ganador
					    (estado-del-juego)
					    (if *hayGanador* (progn (mensaje-ganador *Ordenador*) (setf *exit-mainloop* t)))
	      		 		(setq movimiento-humano ()) ) ) ) )
	       ) )
		; Grosor de los caminos
		(itemconfigure lienzo linea1 :width 30)
		(itemconfigure lienzo linea2 :width 30)
		(itemconfigure lienzo linea3 :width 30)
		(itemconfigure lienzo linea4 :width 30)
		(itemconfigure lienzo linea5 :width 30)
		(itemconfigure lienzo linea6 :width 30)
		(itemconfigure lienzo linea7 :width 30)
		(itemconfigure lienzo linea8 :width 30)
		; Color y grosor de círuclos
		(itemconfigure lienzo ovalo1 :fill *colorFicha*)
		(itemconfigure lienzo ovalo1 :width 5)
		(itemconfigure lienzo ovalo2 :fill *colorFicha*)
		(itemconfigure lienzo ovalo2 :width 5)
		(itemconfigure lienzo ovalo3 :fill *colorFicha*)
		(itemconfigure lienzo ovalo3 :width 5)
		(itemconfigure lienzo ovalo4 :fill *colorFicha*)
		(itemconfigure lienzo ovalo4 :width 5)
		(itemconfigure lienzo ovalo5 :fill *colorFicha*)
		(itemconfigure lienzo ovalo5 :width 5)
		(itemconfigure lienzo ovalo6 :fill *colorFicha*)
		(itemconfigure lienzo ovalo6 :width 5)
		(itemconfigure lienzo ovalo7 :fill *colorFicha*)
		(itemconfigure lienzo ovalo7 :width 5)
		(itemconfigure lienzo ovalo8 :fill *colorFicha*)
		(itemconfigure lienzo ovalo8 :width 5)
		(itemconfigure lienzo ovalo9 :fill *colorFicha*)
		(itemconfigure lienzo ovalo9 :width 5)

		(defun pintar-ficha(posicion Color)
			(cond
				( (= posicion 0) (itemconfigure lienzo ovalo1 :fill Color) )
				( (= posicion 1) (itemconfigure lienzo ovalo2 :fill Color) )
				( (= posicion 2) (itemconfigure lienzo ovalo3 :fill Color) )
				( (= posicion 3) (itemconfigure lienzo ovalo4 :fill Color) )
				( (= posicion 4) (itemconfigure lienzo ovalo5 :fill Color) )
				( (= posicion 5) (itemconfigure lienzo ovalo6 :fill Color) )
				( (= posicion 6) (itemconfigure lienzo ovalo7 :fill Color) )
				( (= posicion 7) (itemconfigure lienzo ovalo8 :fill Color) )
				( (= posicion 8) (itemconfigure lienzo ovalo9 :fill Color) ) ) )

		 ) ) )

(tablero)