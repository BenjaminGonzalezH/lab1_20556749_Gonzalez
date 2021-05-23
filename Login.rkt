; DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función login.

; Se le da a entender al interprete el uso de lenguaje shceme.
#lang scheme

; BLOQUE DE IMPORTACIONES.
; En este bloque se importan todas las funciones para el correcto
; funcionamiento de la función a continuación.
(require "SubTDA_User.rkt")
(require "TDA_Socialnetwork.rkt")
(require "Constructor_socialnetwork.rkt")
(require "Register.rkt")
(require "follow.rkt")

; ValidUser
; Se define función que comprueba si un usuario existe en la
; red social y la contraseña relacionada a el es correcta.
;DOMINIO: List of User x String x String.
;RECORRIDO: Bool.
;RECURSIÓN: Natural.

(define (ValidUser list user pass)
  ;Se define caso base para recursión.
  (if (= (length list) 0)
      ;Caso verdadero.
      ;Si no se encontro ningún usuario existente
      ;entonces se retorna falso.
      (and #f)

      ;Caso falso.
      ;Se comprueba si el usuario y contraseña
      ;coinciden con el elemento actual de lista
      ;evaluado.
      (if (and (string=? (car (car list)) user)
               (string=? (car (cdr (car list))) pass))
          ;Caso verdadero.
          ;Se retorna verdadero.
          (and #t)

          ;Caso falso.
          ;Se llama de nuevo a la función con la lista
          ;acortada.
          (ValidUser (cdr list) user pass)
          )
      )
  )

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
       (ValidUser (list-ref socialn 4) user pass))
      ;Caso verdadero.
      ;Se devuelve función currificada evaluada con
      ;el socialnetwork.
      (comand socialn)

      ;Caso falso.
      ;Se devuelve map.
      map
      )
  )
