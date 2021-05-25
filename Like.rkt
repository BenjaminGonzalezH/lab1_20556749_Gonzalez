; DESCRIPCIÓN GENERAL.
; Archivo que guarda la función like.

; Se le da a entender al interprete el uso de
; lenguaje scheme.
#lang scheme

; BLOQUE DE IMPORTACIONES.
(require "SubTDA_Post.rkt")
(require "Register.rkt")
(require "TDA_Socialnetwork.rkt")
(require "Constructor_socialnetwork.rkt")
(require "post.rkt")
(require "share.rkt")

; Like
; Función que da like a una publicación y guardarla en
; socialnetwork.
(define Like (lambda (socialn) (lambda (date ID)
                                 ;Se ve si los datos de la función son
                                 ;correctos.
                                 (if (and (IsDate date) (number? ID))
                                     ;Caso verdadero.
                                     ;Se crea nuevo socialnetwork
                                     ;con la publicación con like.
                                     (list (list-ref socialn 0) (list-ref socialn 1)
                                           (list-ref socialn 2) (list-ref socialn 3)
                                           (list-ref socialn 4)
                                           (ChangePost (list-ref socialn 5) (Liked (list-ref (list-ref socialn 5) ID)) '()))

                                     ;Caso falso
                                     ;Se entrega el socialnetwork sin cambios.
                                     socialn
                                     )
                                 )
               )
  )
