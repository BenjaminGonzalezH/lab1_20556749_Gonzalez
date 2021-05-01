; DESCRIPCION GENERAL. 
; En este archivo se guarda la función constructor
; del TDA socialnetwork.

; Se da a entender uso del lenguaje scheme al interprete.
#lang scheme

; Se pide información del archivo "TDA_socialnetwork.rkt"
(require "TDA_socialnetwork.rkt")

; Socialnetwork
; Función que crea a la red social con el uso del nombre de la
; red social, la fecha de creación y el uso de las funciones de
; encriptado. La función debe devolver el TDA red social.

(define (socialnetwork name date EncryptFuntion DecryptFunction) (list name date EncryptFuntion DecryptFunction))