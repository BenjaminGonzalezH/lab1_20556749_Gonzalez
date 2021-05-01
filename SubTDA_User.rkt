; DESCRIPCIÓN GENERAL.
; Este archivo describe la subestructura del socialnetwork
; '(User), desde sus elementos hasta sus funciones propias. 

; Se le da entender al interprete el uso de lenguaje scheme.
#lang scheme

; La subestructura user posee los siguientes elementos.

(define user '("name" "password" '(followers) '(following) '(IDpublications)))

; Esta es conformada por el nombre de usuario (String) y la contraseña
;(string), la lista de seguidores, lista de usuarios seguidos y las ID
; de las publicaciones realizadas por ese usuario.

;---------------------------------------------------------------------

;FUNCIONES PROPIAS.

; Create_User.
; Función que recibe los elementos para crear la estructura del usuario
; con sus elementos.

; Se define entrada.
(define (Create_User Nickname password followers followings IDpublications)
  ;De los elementos de entrada se crea una lista.
  (list Nickname password followers followings IDpublications)
  )

; AreSimilar
; Función que comprueba si 2 usuarios tienen el mismo nombre
; recibe como entrada 2 usuarios y entrega un true o false.

; Se define entradas
(define (AreSimilar User1 User2)
  ;Se establece condicion de nombres
  ;iguales usando la función de
  ;comparador de Strings.
  (if (string=? (list-ref User1 0)(list-ref User2 0))
      ;En caso de verdad se entrega un true.
      (#t)

      ;En caso de falsedad entrega un false.
      (#f)
  ))

; NumFollowers
; Función que entrega el numero de seguidores del
; usuario.

;Se define entradas.
(define (numFollowers User1)
  ;Se da numero de seguidores con la función
  ;length.
  (length (list-ref User1 2))
  )

