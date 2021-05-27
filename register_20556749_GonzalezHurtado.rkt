; Se le da a entender al interprete el uso de lenguaje scheme.
#lang scheme

; DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función register.

; BLOQUE DE IMPORTACIONES.
(require "TDAFecha_20556749_GonzalezHurtado.rkt")
(require "TDAUser_20556749_GonzalezHurtado.rkt")
(require "TDASocialnetwork_20556749_GonzalezHurtado.rkt")
(require "socialnetwork_20556749_GonzalezHurtado.rkt")

; Register.
; Función que registra un nuevo usuario en el TDA socialnetwork.
;DOMINIO: socialnetwork x date x user x string.
;RECORRIDO: socialnetwork.

(define (register socialn date User password)
  ; Se comprueban si los elementos de entrada ingresados
  ; son correctos, para modificar el socialnetwork.
  (if (and (IsSocialnetwork socialn) (IsDate date)
           (string? User) (string? password))
      ;Caso verdadero
      ;Se aplica función recursiva que
      ;asiste a register para comprobar existencia
      ;de usuario con igual nombre.
      (if (ExistBefore (list-ref socialn 4) User)
          ;Caso verdadero.
          ;Se crea otra estructura con el nuevo usuario creado.
          (list (NameSocial socialn) (DateSocial socialn) (EncrySocial socialn) (DecrySocial socialn) ;Elementos copiados
                (append (UserSocial socialn) (list(Create_User User password date '() '() '()))) ;dato modificado
                (PostSocial socialn)) ;Dato copiado

          ;Caso falso
          ;se entrega socialnetwork de entrada.
          socialn
          )
      ;Caso falso
      ;Se entrega socialnetwork de entrada.
      socialn
      )
  )

; BLOQUE DE EXPORTACION.
; En este bloque se especifican las funciones las cuales se van a
; exportar a otros archivos.
(provide register)