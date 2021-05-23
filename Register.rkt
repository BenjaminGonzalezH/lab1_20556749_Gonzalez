; DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función register.

; Se le da a entender al interprete el uso de lenguaje scheme.
#lang scheme

; Se pide información de las funciones del archivo "SubTDA_User.rkt",
; "TDA_Socialnetwork.rkt", "Constructor_socialnetwork.rkt".
(require "SubTDA_User.rkt")
(require "TDA_Socialnetwork.rkt")
(require "Constructor_socialnetwork.rkt")

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; ExistBefore.
; Función que comprueba si un usuario existe con
; anterioridad en una socialnetwork en base a nombres.
;DOMINIO: List of Users x String.
;RECORRIDO: Bool.
;RECURSIÓN: Natural.
;NOTA: el booleano entregado sigue la pregunta
;"¿El nombre dado por entrada no existe en ningún
;usuario de la lista?"

(define (ExistBefore lista nombre)
  ;Se establece caso base de recursión de la función.
  (if (= (length lista) 0)
      ;Caso verdadero.
      ;Si no se encontro ningun usuario
      ;igual al usuario que se desea ingresar se
      ;entrega un verdadero.
      (and #t)

      ;Caso falso.
      ;Se comprueba si el elemento actual es
      ;igual al nombre.
      (if (string=? (car (car lista)) nombre)
          ;Caso verdadero
          ;Se retorna una operación que da falso.
          (and #f)

          ;Caso falso.
          ;Se llama de nuevo a la función.
          (ExistBefore (cdr lista) nombre)
          )
      )
  )

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
          (list (list-ref socialn 0) (list-ref socialn 1) EncryptFunction DecryptFunction ;Elementos copiados
                (append (list-ref socialn 4) (list(Create_User User password date '() '() '()))) ;dato modificado
                (list-ref socialn 5)) ;Dato copiado

          ;Caso falso
          ;se entrega socialnetwork de error.
          (list "Error" '(14 5 1929) EncryptFunction DecryptFunction '() '())
          )
      ;Caso falso
      ;Se entrega un socialnetwork de error.
      (list "Error" '(14 5 1929) EncryptFunction DecryptFunction '() '())
      )
  )
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; BLOQUE DE EXPORTACION.
; En este bloque se especifican las funciones las cuales se van a
; exportar a otros archivos.
(provide ExistBefore)
(provide register)