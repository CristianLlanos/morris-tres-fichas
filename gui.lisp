(load "ltk")
(in-package :ltk)

(defvar *Posiciones*)
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
  ) )

(defun donde-estoy(evento)
  (let (
    (x-lienzo (event-x evento))
    (y-lienzo (event-y evento))
    (x1 NIL)
    (y1 NIL)
    (x2 NIL)
    (y2 NIL) )
     (progn
      (loop
        for posicion in *Posiciones*
        for i from 0 to (length *Posiciones*)
        do(progn
          (setq x1 (caar posicion))
          (setq y1 (cadar posicion))
          (setq x2 (caadr posicion))
          (setq y2 (cadadr posicion))
          (cond 
            ( (and
                (> x-lienzo x1)
                (< x-lienzo x2)
                (> y-lienzo y1)
                (< y-lienzo y2) ) (format t "Estoy en la ficha ~a~%" i) ) ) ) ) ) ) )

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
			 )
		(pack sc :expand 1 :fill :both)
		(wm-title *tk* "Morris de tres fichas")
		(bind lienzo "<ButtonPress-1>" (lambda(evento)
	      (donde-estoy evento) ) )
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
		(itemconfigure lienzo ovalo1 :fill "#394034")
		(itemconfigure lienzo ovalo1 :width 5)
		(itemconfigure lienzo ovalo2 :fill "black")
		(itemconfigure lienzo ovalo2 :width 5)
		(itemconfigure lienzo ovalo3 :fill "black")
		(itemconfigure lienzo ovalo3 :width 5)
		(itemconfigure lienzo ovalo4 :fill "black")
		(itemconfigure lienzo ovalo4 :width 5)
		(itemconfigure lienzo ovalo5 :fill "black")
		(itemconfigure lienzo ovalo5 :width 5)
		(itemconfigure lienzo ovalo6 :fill "black")
		(itemconfigure lienzo ovalo6 :width 5)
		(itemconfigure lienzo ovalo7 :fill "black")
		(itemconfigure lienzo ovalo7 :width 5)
		(itemconfigure lienzo ovalo8 :fill "black")
		(itemconfigure lienzo ovalo8 :width 5)
		(itemconfigure lienzo ovalo9 :fill "black")
		(itemconfigure lienzo ovalo9 :width 5)
		 ) ) )
(tablero)