(load "ltk")
(in-package :ltk)

(defun hello-1()
  (with-ltk ()
		(let (
				(b 	(make-instance 'button
							:master nil
							:text "Holi"
							:command (lambda ()
									   (format t "Holi :P~&")
							)
					)
				)
			)
	  		(pack b)
	  )
	)
)



(hello-1)