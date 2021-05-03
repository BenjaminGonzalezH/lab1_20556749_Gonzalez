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

;Se define entrada.
(define (socialnetwork name date EncryptFuntion DecryptFunction)
  ;Se establecen condicionales para generar el socialnetwork.
  (if (and (string? name) (list? date))
      ;Caso verdadero.
      ;Se crea la función.
      (list name date EncryptFuntion DecryptFunction)

      ;Caso falso.
      (display "Input Error")
      )) 