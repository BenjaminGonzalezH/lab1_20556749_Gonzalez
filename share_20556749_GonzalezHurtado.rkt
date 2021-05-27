; Se le da a entender al interprete el uso de lenguaje
; scheme.
#lang scheme

; DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función share.

; BLOQUE DE IMPORTACION.
(require "TDAFecha_20556749_GonzalezHurtado.rkt")
(require "TDAPost_20556749_GonzalezHurtado.rkt")
(require "TDAUser_20556749_GonzalezHurtado.rkt")
(require "TDASocialnetwork_20556749_GonzalezHurtado.rkt")
(require "socialnetwork_20556749_GonzalezHurtado.rkt")

; Share.
; Función que comparte publicación a los usuarios designados
; por este.
(define share (lambda (socialn) (lambda (user) (lambda (date) (lambda(ID . Userlist)
                                                 ;Se comprueban si los datos imgresados son correctos
                                                 ;para ingresar información a la lista.
                                                 (if (and (IsDate date) (integer? ID)
                                                          (> (length Userlist) 0))
                                                     ;Caso verdadero.
                                                     ;Se crea nuevo socialnetwork con
                                                     ;elemento cambiado.
                                                     (list (NameSocial socialn) (DateSocial socialn)
                                                           (EncrySocial socialn) (DecrySocial socialn)
                                                           (UserSocial socialn)
                                                           (ChangePost (PostSocial socialn)
                                                                       (NewShare (list-ref (PostSocial socialn) ID)
                                                                                 (filter (AreFriends (WingUser user))  Userlist)) '()))

                                                     ;Caso falso.
                                                     ;Se entrega socialnetwork sin cambios.
                                                     (append socialn)
                                                     )
                                                 )
                                  )
                )
  )
  )

; BLOQUE DE EXPORTACIÓN.
(provide share)