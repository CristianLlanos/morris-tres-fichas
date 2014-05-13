(load "ltk")
(in-package :ltk)

(defun canvastest()
	(with-ltk ()
		(let* (
			(sc (make-instance 'canvas :height 410 :width 410))
			(lienzo (canvas sc))
			(ovalo1 (create-oval lienzo 10 10 100 100))
			(ovalo2 (create-oval lienzo 150 10 250 100))
			(ovalo3 (create-oval lienzo 300 10 400 100))
 			(ovalo4 (create-oval lienzo 10 150 100 250))
			(ovalo5 (create-oval lienzo 150 150 250 250))
			(ovalo6 (create-oval lienzo 300 150 400 250))
			(ovalo7 (create-oval lienzo 10 300 100 400))
			(ovalo8 (create-oval lienzo 150 300 250 400))
			(ovalo9 (create-oval lienzo 300 300 400 400))
			 )
		(pack sc :expand 1 :fill :both)
		(wm-title *tk* "Morris de tres fichas")
		(itemconfigure lienzo ovalo1 :fill "blue")
		(itemconfigure lienzo ovalo1 :width 5)
		(itemconfigure lienzo ovalo2 :fill "red")
		(itemconfigure lienzo ovalo2 :width 5)
		 ) ) )
(canvastest)


#| (defun canvastest()
	(with-ltk ()
		(let* (
			(sc (make-instance 'canvas :height 400 :width 400))
			(c (canvas sc))
			(line (create-line c (list 100 100 400 50 700 150)))
			(polygon (create-polygon c (list 50 150 250 160 250 300 50 330 )))
			(text (create-text c 260 250 "Canvas test")) )
		(pack sc :expand 1 :fill :both)
		(scrollregion c 0 0 800 800) ) ) )
(canvastest)
 |#

#| (defun dibujo()
  (with-ltk ()
		(let* (
			(lienzo (make-instance 'canvas :height 400 :width 400))
			(c (canvas lienzo))
			(ovalo (create-text c 5 10 "holi" )) )
	  		(pack canvas)

			(pack ovalo)

	  		;(pack b)
	  		 ) ) )
(dibujo) |#

#| (defun hello-2()
	(with-ltk ()
		(let* (
			(f (make-instance 'frame))
			(b1 (make-instance 'button
					:master f
					:text "Button 1"
					:command (lambda () (format t "Button1~&")) ))
			(b2 (make-instance 'button
					:master f
					:text "Button 2"
					:command (lambda () (format t "Button2~&")) ) ) )
		(pack f)
		(pack b1 :side :left)
		(pack b2 :side :left)
		(configure f :borderwidth 3)
		(configure f :relief :sunken) ) ) )
(hello-2) |#

#| (defun hello-1()
  (with-ltk ()
		(let (
				(b 	(make-instance 'button
							:master nil
							:text "Holi"
							:command (lambda ()
									   (format t "Holi :P~&") ) )) )
	  		(pack b) ) ) )

;(hello-1)
|#

#| (defun count-down (n)
  (with-ltk ()
    (let* ((cvs (make-instance 'canvas :height 400 :width 400))
           (text (create-text cvs 100 100 "Count down: ")) )
      (pack cvs)
      (force-focus cvs)
      (bind cvs "<q>"
            (lambda (evt)
              (declare (ignore evt))
              (return-from count-down) ))
      (loop for i from n downto 0
      	do (progn
            (itemconfigure cvs text
                           :text (format nil "Count down: ~A" i) )
            ;; We must explicitly process events since the event loop isn't
            ;; running yet (not until after the body of WITH-LTK)
            (process-events)
            (sleep 1) )))))

;(loop for i from 3 downto 1 do (progn (print i) (print 'holi)))

;(count-down 100)
|#

#| (defun button-on? (button)
  "Tell me if the button is 'on' or not."
  (equal (text button) "X") )
 
(defun toggle-button (b)
  "Toggle one button from an X to a Space or a Space to an X."
  (if (button-on? b)
      ;; To change a widget's text, ltk doesn't use CONFIGURE, but
      ;; instead you just SETF the text
      (setf (text b) " ")
      (setf (text b) "X") ))
 
(defun toggle-block (buttons i j n m)
  "Change the button, and the buttons neighboring it \(if they are in
bounds)."
  (toggle-button (aref buttons i j))
  (when (< (1+ i) n) (toggle-button (aref buttons (1+ i) j)))
  (when (< (1+ j) m) (toggle-button (aref buttons i (1+ j))))
  (when (>= (1- i) 0) (toggle-button (aref buttons (1- i) j)))
  (when (>= (1- j) 0) (toggle-button (aref buttons i (1- j)))) )
 
(defun lights-out (n m)
  "Create an N by M lights out game."
  (with-ltk ()
    (let* ( ;; Create button widgets and store them for later
           (buttons
            (coerce
             (loop for i below (* n m)
                   (collect (make-instance 'button
                                           :text " " )))
             'vector ))
           ;; Displace the button vector into a 2D array representing
           ;; the n by m grid.  With this we can reference buttons by
           ;; a pair of indicies, i and j.
           (b-array
            (let ((array (make-array (list n m) :displaced-to buttons)))
              ;; Some iteration stuff to build a random (yet solvable)
              ;; selection of `X's and spaces.
              (loop for i below n
                    (loop for j below m
                          (when (= 1 (random 2))
                            (toggle-block array i j n m) )))
              array )))
      (loop
        ;; Iterate over buttons
        for b in-vector buttons
        ;; Keep a numerical index of what button we are on.
        for tot below (* n m)
        ;; Calculate the indicies, i and j, on the grid
        for i = (mod tot m) for j = (floor tot m)
        ;; Bind a button press on one of the buttons to flip its `X'
        ;; to a space (or vice verse) and toggle its neighbors as well.
        (bind b "<Button-1>"
              (let ((i i)
                    (j j) )
                (lambda (evt)
                  (declare (ignore evt))
                  (toggle-block b-array j i n m)
                  ;; Check if you have solved the problem
                  (when (loop for button in-vector buttons
                              (never (button-on? button)) )
                    (do-msg "You have won!!!" "You a winner") ))))
        ;; Here, we will use the GRID geometry manager.  This makes
        ;; sense, we are building a grid...
        (grid b i j) ))))
;(lights-out 4 4)
|#