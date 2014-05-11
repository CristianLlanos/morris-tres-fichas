

(defun iniciar-juego ()
  (if (y-or-n-p "¿Le gustaria comenzar el juego? ")
                 (movimiento-oponente (inicializar-juego))
                 (movimiento-pc (inicializar-juego)))
)


(defun convertir-a-numeros (v)
	(cond ((equal v 'o ) 1)
              ((equal v 'x ) 10)
              ((equal v nil) 0)
              )
)

(defun convertir-tablero ()
	(mapcar #'convertir-a-numeros *tablero* )
)


(setf *tripletas* '((0 1 2) (3 4 5) (6 7 8) 	 (0 3 6) (1 4 7) (2 5 8)          (0 4 9) (2 4 6))
) 

(defun suma-de-tripleta (tablero tripleta)
  (+ (nth (car tripleta) tablero)
       (nth (cadr tripleta) tablero)
       (nth (caddr tripleta) tablero))
)

(defun calcula-sumas (tablero)
  (mapcar #'(lambda (tripleta) (suma-de-tripleta tablero tripleta)) *tripletas*)
)

(defun efectuar-movimiento (jugador pos tablero)
  (setf (nth pos tablero) jugador)
  tablero
)


(defun gen-mov (tablero jugador)
	(mapcar #'(lambda (m) 
				(if (= 0 (nth m tablero))
								(list (efectuar-movimiento jugador m tablero))
								nil))

	'(0 1 2 3 4 5 6 7 8))
)



;Funcion de evaluacion... f(p)= abiertasX-abiertasO
(defun funcion-eval(tablero)

	(cond ((ganador-pc tablero) 1000)
			((ganador-oponente tablero) -1000)
			(t (lineas-abiertas tablero))

	)
)

(defun lineas-abiertas (posicion)
	(let ((sumas (calcula-sumas posicion))
		   (abiertasX 0)
		   (abiertasO 0)
		   )

		(dolist (s sumas)
			(cond ((equal 0 s) (setf abiertasX (+ abiertasX 1)) 
							   (setf abiertasO (+ abiertasO 1)))
				  ((equal 1 s) (setf abiertasO (+ abiertasO 1)))
				  ((equal 2 s) (setf abiertasO (+ abiertasO 1)))
				  ((equal 10 s) (setf abiertasO (+ abiertasO 1)))
				  ((equal 20 s) (setf abiertasO (+ abiertasO 1)))
			)
		)

		(setf res (- abiertasX abiertasO))

	)
)


(defun sucesores-con-evaluacion (tablero sucesores)
	(mapcar #'(lambda (n) (list n (funcion-eval tablero)))
			sucesores
		)

)


(defun seleccion-primero-el-mejor (tablero jugador)
	(let* ( 
			(sucesores (gen-mov tablero jugador))
		    (sucesores-peso (sucesores-con-evaluacion tablero sucesores)))
			(sort sucesores-peso #'(lambda (x y) 
										(>= (second x) (second y))))
			
		   (do ((i 1 (+ i 1)))
		   		((/= (nth i tablero) (nth i (caar sucesores-peso)))
		   			i
		   	    )
  		    )
    )
)







(defun ganador-pc (tablero)
	(let ((sumas (calcula-sumas tablero)))
		(member 30 sumas)
	)
)

(defun ganador-humano (tablero)
	(let ((sumas (calcula-sumas tablero)))
		(member 3 sumas)
	)
)




defun movimiento-oponente (tablero)
  (let* ((pos (validar-movimiento tablero))
         (nuevo-tablero (efectuar-movimiento *oponente* pos tablero)))
  	(imprimir-tablero nuevo-tablero)
 	(cond ((ganador-p nuevo-tablero) (format t  "~&Ud. gano!"))
              ((tablero-total-p nuevo-tablero) (format t "~&Empate."))
              (t (movimiento-pc nuevo-tablero))
        )
  )
)

(defun movimiento-pc (tablero)
  (let* ((mejor-movimiento (escoger-estrategia-pc tablero))
         (pos (first mejor-movimiento))
         (estrategia (second mejor-movimiento))
         (nuevo-tablero (efectuar-movimiento *pc* pos tablero)))
    (format t "~&Mi movimiento: ~S" pos)
    (format t "~&Mi estrategia: ~A~%" estrategia)
    (imprimir-tablero nuevo-tablero)
    (cond ((ganador-p nuevo-tablero) (format t "~&Yo gano!"))
           ((tablero-total-p nuevo-tablero)(format t "~&Juego empatado."))
           (t (movimiento-oponente nuevo-tablero))
    )
  )
)