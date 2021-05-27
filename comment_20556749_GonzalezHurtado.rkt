; Se le da a entender al interprete el uso de lenguaje
; scheme.
#lang scheme

; BLOQUE DE IMPORTACIONES.
(require "TDAPost_20556749_GonzalezHurtado.rkt")
(require "TDAUser_20556749_GonzalezHurtado.rkt")
(require "TDAFecha_20556749_GonzalezHurtado.rkt")
(require "TDASocialnetwork_20556749_GonzalezHurtado.rkt")

; Comment
; Función que agrega un comentario a una publicación.
;DOMINIO: socialnetwork.
;RECORRIDO: user x date x integer x string.
;RECORRIDO FINAL: socialnetwork.

(define comment (lambda (socialn) (lambda (user) (lambda (date) (lambda (ID) (lambda (coment)
                                    ;Se establece comprobación de
                                    ;ingresión de datos
                                    (if (and (IsDate date) (integer? ID)
                                             (string? coment)
                                             ((AreFriends (WingUser user)) (car (list-ref (PostSocial socialn) ID))))
                                        ;Caso verdadero.
                                        ;Se crea nueva estructura socialnetwork.
                                        (list (NameSocial socialn) (DateSocial socialn)
                                              (EncrySocial socialn) (DecrySocial socialn)
                                              (UserSocial socialn)
                                              (ChangePost (PostSocial socialn)
                                                          (NewComment (list-ref (PostSocial socialn) ID) date (NameUser user)
                                                                      ((EncrySocial socialn) coment)) '())
                                              )

                                        ;Caso falso.
                                        ;Se entrega socialnetwork sin cambios
                                        (append socialn)
                                              )
                                    )
                  )
  ))))

; BLOQUE DE EXPORTACIÓN.
(provide comment)