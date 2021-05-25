; Se da a entender uso del lenguaje scheme al interprete.
#lang scheme

; DESCRIPCION GENERAL.
; En este archivo se guarda la función constructor
; del TDA socialnetwork.

; Se pide información de funciones del archivo "TDA_socialnetwork.rkt"
(require "TDA_socialnetwork.rkt")
(require "TDA_Fecha.rkt")

; socialnetwork
; Función que crea la representación del TDA socialnetwork
; en su estado inicial, es decir, sin usuarios o publicaciones
; creadas.
;DOMINIO: String x Date x Procedure x Procedure.
;RECORRIDO: Socialnetwork. 

(define (socialnetwork name fecha EncryptFun DecryptFun)
  ;Se comprueban si los elementos ingresados son correctos
  ;para crear socialnetwork.
  (if (and (string? name) (IsDate fecha) (procedure? EncryptFun) (procedure? DecryptFun))
      ;Caso verdadero.
      ;Se crea TDA socialnetwork con los elementos
      ;de la entrada.
      (list name fecha EncryptFun DecryptFun '() '())

      ;Caso falso.
      ;Se crea un TDA socialnetwork de error,
      ;la cual posee fecha del año 1929
      ;(fecha no valida para un socialnetwork).
      (list "Error" '(14 5 1929) EncryptFunction DecryptFunction '() '())
      ))

; BLOQUE DE EXPORTACIONES
; En este bloque se especifican las funciones las cuales se van a
; exportar a otros archivos.
(provide socialnetwork)