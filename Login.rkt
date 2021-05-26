; Se le da a entender al interprete el uso de lenguaje shceme.
#lang scheme

; DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función login.

; BLOQUE DE IMPORTACIONES.
; En este bloque se importan todas las funciones para el correcto
; funcionamiento de la función a continuación.
(require "SubTDA_User.rkt")
(require "TDA_Fecha.rkt")
(require "TDA_Socialnetwork.rkt")
(require "Constructor_socialnetwork.rkt")
(require "Register.rkt")
(require "post.rkt")
(require "follow.rkt")
(require "share.rkt")
(require "comment.rkt")
(require "Like.rkt")

; Login
; Se define la función login como aquella que comprueba el
; inicio de sesion del usuario y posteriormente entregara una función
; currificada a la que se hizo referencia en la entrada.
;DOMINIO: socialnetwork x string x string x procedure.
;RECORRIDO: procedure.

(define (login socialn user pass comand)
  ;Se comprueba si los elementos de entrada son
  ;correctos y si el usuario con contraseña son
  ;validos en la red social.
  (if (and (IsSocialnetwork socialn) (string? user)
       (string? pass) (procedure? comand)
       (ValidUser (UserSocial socialn) user pass))
      ;Caso verdadero.
      ;Se devuelve función currificada evaluada con
      ;el socialnetwork y su respectivo usuario.
      ((comand socialn) (SearchUser (UserSocial socialn) user))

      ;Caso falso.
      ;Se devuelve map.
      map
      )
  )