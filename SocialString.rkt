;Se le da a entender al interprete el uso de lenguaje scheme.
#lang scheme

; BLOQUE DE IMPORTACIONES.
(require "TDA_Fecha.rkt")
(require "SubTDA_Post.rkt")
(require "SubTDA_User.rkt")

; socialnework->string
; Se define función la cual entrega el socialnetwork en
; un string o los antecedentes del usuario, dependiendo de la
; entrada que se de.
;DOMINIO: socialnetwork.
;RECORRIDO1: User.
;RECORRIDO2: String.

(define socialnetwork->string (lambda (socialn) (lambda (. User)
                                                  ;Se establecen condicionales para
                                                  ;verificar que tipo de entrada se dio.
                                                  ;Entrada sin uso de login.
                                                  (if (= (length User) 0)
                                                      ;CV.
                                                      ;CF.
                                                      )
                                                  )
                                )
  )