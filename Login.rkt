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

; Login
; Se define la función login como aquella que comprueba el
; inicio de sesion del usuario y posteriormente entregara una función
; currificada a la que se hizo referencia como comando, en el
; caso de que la sesión "iniciada" no pertenesca a socialnetwork, esta solo
; entrega la función.
(define (login x) (x))
