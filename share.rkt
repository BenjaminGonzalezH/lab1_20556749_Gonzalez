; Se le da a entender al interprete el uso de lenguaje
; scheme.
#lang scheme

; DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función share.

; BLOQUE DE IMPORTACION.
(require "TDA_Fecha.rkt")
(require "SubTDA_Post.rkt")
(require "TDA_Socialnetwork.rkt")
(require "Constructor_socialnetwork.rkt")

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
                                                           (ChangePost (list-ref socialn 5)
                                                                       (NewShare (list-ref (list-ref socialn 5) ID)
                                                                                 (filter (AreFriends (list-ref user 4))  Userlist)) '()))

                                                     ;Caso falso.
                                                     ;Se entrega socialnetwork sin cambios.
                                                     (append socialn)
                                                     )
                                                 )
                                  )
                )
  )

; BLOQUE DE EXPORTACIÓN.
(provide share)