; DESCRIPCIÓN GENERAL
; En este archivo se guarda la función  register
; la cual construye los usuarios para el TDA socialnetwork.

; Se le da a entender al interprete el uso de lenguaje scheme.
#lang scheme

; Se pide información de las funciones del archivo "SubTDA_User.rkt",
; "TDA_Socialnetwork.rkt", "Constructor_socialnetwork.rkt".
(require "SubTDA_User.rkt")
(require "TDA_Socialnetwork.rkt")
(require "Constructor_socialnetwork.rkt")

; Register.
; Función que registra un nuevo usuario en el TDA socialnetwork.
; Esta función debe recibir el TDA socialnetwork, nombre, contraseña solamente y debe
; de devolver el TDA socialnetwor.

(define (register User password ))
