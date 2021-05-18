; DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función login.

; Se le da a entender al interprete el uso de lenguaje shceme.
#lang scheme

; BLOQUE DE IMPORTACIONES.
; En este bloque se importan todas las funciones necesarias para el
; problema.
(require "SubTDA_User.rkt")
(require "TDA_Socialnetwork.rkt")
(require "Constructor_socialnetwork.rkt")
(require "Register.rkt")

; ValidUser
; Se define función que compruaba si un usuario existe en la
; red social. Esta función recibe como entrada la lista de usuarios
; de red social, el nombre de usuario, contraseña. Se da de salida
; un booleano.
(define (ValidUser list user pass)
  ;Se define caso base.
  (if (or (= (length list) 0) (equal? (car list) null))
      ;Caso verdadero.
      ;Si no se encontro ningún usuario existente
      ;entonces se retorna falso.
      (and #f)

      ;Caso falso.
      ;Se comprueba si el usuario y contraseña
      ;coinciden.
      (if (and (string=? (car (car list)) user)
               (string=? (car (cdr (car list))) pass))
          ;Caso verdadero.
          ;Se retorna una operación que da verdadero.
          (and #t)

          ;Caso falso.
          ;Se llama de nuevo a la función.
          (ValidUser (cdr list) user pass)
          )
      )
  )

; Login
; Se define la función login como aquella que comprueba el
; inicio de sesion del usuario y posteriormente entregara una función
; currificada a la que se hizo referencia como comando, en el
; caso de que la sesión "iniciada" no pertenesca a socialnetwork, esta solo
; entrega la función.

; Se define entrada de la función.
(define (login socialn user pass comand)
  ;Se comprueba si el usuario existe en
  ;la red social.
  (if (and (IsSocialnetwork socialn) (string? user)
       (string? pass) (procedure? comand)
       (ValidUser (list-ref socialn 4) user pass))
      ;Caso verdadero.
      ;Se devuelve función currificada.
      (pass)

      ;Caso falso.
      ;Se devuelve función sin modificación.
      (comand)
      )
  )
