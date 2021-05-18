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

; ExistBefore.
; Función que comprueba si un usuario existe con
; anterioridad en una socialnetwork. Su entrada consta
; de la lista de usuarios del socialnetwork y el nombre del
; usuario que quiere registrarse. Retorna booleanos.
(define (ExistBefore lista nombre)
  ;Se establece caso base de recursión
  (if (or (= (length lista) 0) (equal? (car lista) null))
      ;Caso verdadero.
      ;Si no se encontro ningun usuario
      ;igual al usuario que se desea ingresar se
      ;entrega un verdadero.
      (and #t)

      ;Caso falso.
      ;Se comprueba si el elemento actual es
      ;igual al nombre .
      (if (string=? (car (car lista)) nombre)
          ;Caso verdadero
          ;Se retorna una operación que da false.
          (and #f)

          ;Caso falso.
          ;Se llama de nuevo a la función.
          (ExistBefore (cdr lista) nombre)
          )
      )
  )

; Register.
; Función que registra un nuevo usuario en el TDA socialnetwork.
; Esta función debe recibir el TDA socialnetwork , la fecha, nombre y contraseña.
; Debe de devolver el TDA socialnetwork.

(define (register socialn date User password)
  ; Se establecen condiciones para inicializar
  ; el trabajo de la función
  (if (and (IsSocialnetwork socialn) (IsDate date)
           (string? User) (string? password))
      ;Caso verdadero
      ;Se aplica función recursiva que
      ;asiste a register para comprobar existencia
      ;de usuario similar.
      (if (ExistBefore (list-ref socialn 4) User)
          ;Caso verdadero.
          ;Se guarda cambio en otra estructura.
          (list (list-ref socialn 0) (list-ref socialn 1) EncryptFunction DecryptFunction ;Elementos copiados
                (append (list-ref socialn 4) (list(Create_User User password date '() '() '()))) ;dato modificado
                (list-ref socialn 5)) ;Dato copiado

          ;Caso falso
          ;se entrega socialnetwork vacio.
          (socialnetwork "" '(1 3 1956) EncryptFunction EncryptFunction)
          )
      ;Caso falso
      ;Se entrega un socialnetwork vacio.
      (socialnetwork "" '(1 3 1956) EncryptFunction EncryptFunction)
      )
  )
