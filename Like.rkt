; DESCRIPCIÓN GENERAL.
; Archivo que guarda la función like.

; Se le da a entender al interprete el uso de
; lenguaje scheme.
#lang scheme

; BLOQUE DE IMPORTACIONES.
(require "SubTDA_Post.rkt")
(require "Register.rkt")
(require "TDA_Socialnetwork.rkt")
(require "TDA_Fecha.rkt")
(require "Constructor_socialnetwork.rkt")


; Like
; Función que da like a una publicación y guardarla en
; socialnetwork.
;DOMINIO: socialnetwork.
;RECORRIDO: user x date x integer.
;RECORRIDO FINAL: socialnetwork.

(define like (lambda (socialn) (lambda (user) (lambda (date) (lambda (ID)
                                 ;Se ve si los datos de la función son
                                 ;correctos.
                                 (if (and (IsDate date) (integer? ID))
                                     ;Caso verdadero.
                                     ;Se crea nuevo socialnetwork
                                     ;con la publicación con like.
                                     (list (NameSocial socialn) (DateSocial socialn)
                                           (EncrySocial socialn) (DecrySocial socialn)
                                           (UserSocial socialn)
                                           (ChangePost (PostSocial socialn) (Liked (list-ref (PostSocial socialn) ID)) '()))

                                     ;Caso falso
                                     ;Se entrega el socialnetwork sin cambios.
                                     (append socialn)
                                     )
                                 )
               )
  )))

; BLOQUE DE EXPORTACIONES.
(provide like)