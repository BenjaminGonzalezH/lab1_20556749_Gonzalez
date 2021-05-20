; DESCRIPCIÓN GENERAL.
; Este archivo describe la subestructura del socialnetwork
; '(User), desde sus elementos hasta sus funciones propias. 

; Se le da entender al interprete el uso de lenguaje scheme.
#lang scheme

; La subestructura user posee los siguientes elementos.

(define user '("name" "password" '(date) '(followers) '(following) '(IDpublications)))

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
(define (Create_User Nickname password date followers followings IDpublications)
  ;Se estabñece condiciones de datos.
  (if (and (string? Nickname) (string? password))
     ;Caso verdadero.
      ;De los elementos de entrada se crea una lista.
      (list Nickname password date followers followings IDpublications)
     ;Caso falso
      ;Se entrega lista de lista vacia.
      (list '())
  ))

; AreSimilar
; Función que comprueba si 2 usuarios tienen el mismo nombre
; recibe como entrada 2 usuarios y entrega un true o false.

; Se define entradas
(define (AreSimilar User1 User2)
  ;Se comprueba si los nombres son
  ;iguales usando la función de
  ;comparador de Strings.
  (string=? (list-ref User1 0)(list-ref User2 0))
  )

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
  (if (integer? ID)
      ;Caso verdadero.
      ;Se crea nuevo user con la ID agregada.
      (Create_User  (list-ref User 0) (list-ref User 1) (list-ref User 2) (list-ref User 3) (list-ref User 4) (append (list-ref User 5) (list ID)))

      ;Caso falso}
      ;Se entrega una lista de lista vacia.
      (list '())
      ))

; NewFollower.
; Función que recibe un nuevo usuario como seguidor.

;Se definen entradas.
(define (NewFollower User Follower)
  ;Se establece condición para ver si
  ;follower es un string.
  (if (string? Follower)
      ;Caso verdadero
      ;Se crea nueva estructura con el seguidor nuevo
      (Create_User  (list-ref User 0) (list-ref User 1) (list-ref User 2) (append (list-ref User 3) (list Follower)) (list-ref User 4) (list-ref User 5))

      ;Caso falso}
      ;Se entrega una lista de lista vacia.
      (list '())
      ))

; NewFollowing.
; Función que agrega a otra persona que el usuario
; sigue
(define (NewFollowing User Following)
  ;Se establece condición para ver si
  ;following es un string.
  (if (string? Following)
      ;Caso verdadero
      ;Se crea nueva estructura con el seguidor agregado.
       (Create_User  (list-ref User 0) (list-ref User 1) (list-ref User 2) (append (list-ref User 3) (list Following)) (list-ref User 4))

      ;Caso falso}
      ;Se entrega una lista de lista vacia.
      (list '())
      ))

; BLOQUE DE EXPORTANCIÓN.
; En este bloque se especifican las funciones las cuales se van a
; exportar a otros archivos.
(provide Create_User)
(provide AreSimilar)
(provide numFollowers)
(provide NewID)
(provide NewFollower)
(provide NewFollowing)