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
; con sus elementos. No requiere de comprobación en otros elementos por
; implementación bajo currificación.

; Se define entrada.
(define (Create_User Nickname password followers followings IDpublications)
  ;Se estabñece condiciones de datos.
  (if (and (string? Nickname) (string? password))
     ;Caso verdadero.
      ;De los elementos de entrada se crea una lista.
      (list Nickname password followers followings IDpublications)
     ;Caso falso
      ;Se imprime mensaje de error.
      (display "Error: Input fail")
  ))

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

; NewID
; Función que agrega una nueva ID de publicación del usuario.

;Se definen entradas.
(define (NewID User ID)
  ;Se comprueba si el dato es un numero.
  (if (exact? ID)
      ;Caso verdadero.
      ;Se agrega ID a la lista de IDs
      (Create_User  (list-ref User 0) (list-ref User 1) (list-ref User 2) (list-ref User 3) (append (list-ref User 4) '(ID)))

      ;Caso falso
      (display "Error: Input fail")
      ))

; NewFollower.
; Función que recibe un nuevo usuario como seguidor.

;Se definen entradas.
(define (NewFollower User Follower)
  ;Se establece condición para ver si
  ;follower es un string.
  (if (string? Follower)
      ;Caso verdadero
      ;Se agrega seguidor a lista de seguidores.
      (Create_User  (list-ref User 0) (list-ref User 1) (append (list-ref User 2) '(Followers)) (list-ref User 3) (list-ref User 4))

      ;Caso falso.
      ;Se imprime mensaje de error.
      (display "Error: Input fail")
      ))

; NewFollowing.
; Función que agrega a otra persona que el usuario
; sigue
(define (NewFollowing User Following)
  ;Se establece condición para ver si
  ;following es un string.
  (if (string? Following)
      ;Caso verdadero
      ;Se agrega seguidor a lista de seguidores.
       (Create_User  (list-ref User 0) (list-ref User 1) (list-ref User 2) (append (list-ref User 3) '(Following)) (list-ref User 4))

      ;Caso falso.
      ;Se imprime mensaje de error.
      (display "Error: Input fail")
      ))