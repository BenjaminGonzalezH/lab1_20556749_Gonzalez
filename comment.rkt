; DESCRIPCION GENERAL.
; Se establece archivo que guarda función comment.

; Se le da a entender al interprete el uso de lenguaje
; scheme.
#lang scheme

; BLOQUE DE IMPORTACIONES.
(require "SubTDA_Post.rkt")
(require "Register.rkt")
(require "TDA_Socialnetwork.rkt")
(require "Constructor_socialnetwork.rkt")
(require "post.rkt")
(require "share.rkt")


; Comment
; Función que agrega un comentario a una publicación.
(define comment (lambda (socialn) (lambda (date ID coment)
                                    ;Se establece comprobación de
                                    ;ingresión de datos
                                    (if (and (IsDate date) (number? ID)
                                             (string? coment))
                                        ;Caso verdadero.
                                        ;Se crea nueva estructura socialnetwork.
                                        (list (list-ref socialn 0) (list-ref socialn 1)
                                              (list-ref socialn 2) (list-ref socialn 3)
                                              (list-ref socialn 4)
                                              (ChangePost (list-ref socialn 5)
                                                          (NewComment (list-ref (list-ref socialn 5) ID) date "ella" coment)
                                                          '())
                                              )

                                        ;Caso falso.
                                        ;Se entrega socialnetwork sin cambios
                                        socialn
                                              )
                                    )
                  )
  )