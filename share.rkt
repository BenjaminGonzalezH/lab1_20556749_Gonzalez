; DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función share.

; Se le da a entender al interprete el uso de lenguaje
; scheme.
#lang scheme

; BLOQUE DE IMPORTACION.
(require "SubTDA_Post.rkt")
(require "Register.rkt")
(require "TDA_Socialnetwork.rkt")
(require "Constructor_socialnetwork.rkt")
(require "post.rkt")

; ChangePost
; Se define función que cambia el elemento
; de una lista de post por otro modificado.
(define (ChangePost listofpost post newlist)
  ;Lista vacia o ultimo elemento.
  (if (= (length listofpost) 0)
      (append newlist)

      ;se ve elemento
      (if (= (list-ref (car listofpost) 1) (list-ref post 1))
          ;Caso verdadero reemplazo.
          (ChangePost (cdr listofpost) post (append newlist (list post)))

          ;Caso falso continua.
          (ChangePost (cdr listofpost) post (append newlist (list (car listofpost))))
          )
      )
  )


; Share.
; Función que comparte publicación a los usuarios designados
; por este.
(define share (lambda (socialn) (lambda (user) (lambda (date ID . Userlist)
                                                 ;Se comprueban si los datos imgresados son correctos
                                                 ;para ingresar información a la lista.
                                                 (if (and (IsDate date) (number? ID)
                                                          (> (length Userlist) 0))
                                                     ;Caso verdadero.
                                                     ;Se crea nuevo socialnetwork con
                                                     ;elemento cambiado.
                                                     (list (list-ref socialn 0) (list-ref socialn 1)
                                                           (list-ref socialn 2) (list-ref socialn 3)
                                                           (list-ref socialn 4)
                                                           (ChangePost (list-ref socialn 5) (NewShare (list-ref (list-ref socialn 5) ID) Userlist) '()))

                                                     ;Caso falso.
                                                     ;Se entrega socialnetwork sin cambios.
                                                     socialn
                                                     )
                                                 )
                                  )
                )
  )

; BLOQUE DE EXPORTACIÓN.
(provide ChangePost)