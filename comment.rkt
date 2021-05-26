; DESCRIPCION GENERAL.
; Se establece archivo que guarda función comment.

; Se le da a entender al interprete el uso de lenguaje
; scheme.
#lang scheme

; BLOQUE DE IMPORTACIONES.
(require "SubTDA_Post.rkt")
(require "SubTDA_User.rkt")
(require "TDA_Fecha.rkt")
(require "TDA_Socialnetwork.rkt")



; Comment
; Función que agrega un comentario a una publicación.
(define comment (lambda (socialn) (lambda (user) (lambda (date) (lambda (ID) (lambda (coment)
                                    ;Se establece comprobación de
                                    ;ingresión de datos
                                    (if (and (IsDate date) (number? ID)
                                             (string? coment)
                                             ((AreFriends (WingUser user)) (car (list-ref (PostSocial socialn) ID))))
                                        ;Caso verdadero.
                                        ;Se crea nueva estructura socialnetwork.
                                        (list (NameSocial socialn) (DateSocial socialn)
                                              (EncrySocial socialn) (DecrySocial socialn)
                                              (UserSocial socialn)
                                              (ChangePost (PostSocial socialn)
                                                          (NewComment (list-ref (PostSocial socialn) ID) date (NameUser user) coment)
                                                          '())
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