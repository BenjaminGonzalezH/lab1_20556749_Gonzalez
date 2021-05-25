; Se le da entender al interprete el uso de lenguaje scheme.
#lang scheme

; DESCRIPCIÓN GENERAL.
; Este archivo describe la subestructura del socialnetwork
; '(User), desde sus elementos hasta sus funciones propias. 

; Se pide información de funciones del archivo "TDA_socialnetwork.rkt"
(require "TDA_socialnetwork.rkt")

; La subestructura user posee los siguientes elementos.

(define user '("name" "password" '(date) '(followers) '(following) '(IDpublications)))

; Esta es conformada por el nombre de usuario (String) y la contraseña
;(string), la lista de seguidores, lista de usuarios seguidos y las ID
; de las publicaciones realizadas por ese usuario.

; BLOQUE DE IMPORTACIÓN.
; Se piden funciones del TDA fecha.
(require "TDA_Fecha.rkt")

;---------------------------------------------------------------------

;FUNCIONES PROPIAS.

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; CONSTRUCTOR.
; Create_User.
; Función que crea el TDA user.
;DOMINIO: String x String x Date.
;RECORRIDO: User.

(define (Create_User Nickname password date followers followings IDs)
  ;Se comprueban que los datos entregados sean correctos
  ;para crear TDA user.
  (if (and (string? Nickname) (string? password) (IsDate date))
     ;Caso verdadero.
      ;Se crea usuario.
      (list Nickname password date followers followings IDs)
     ;Caso falso
      ;Se entrega TDA user de error
      ;el cual tendra un ID de publicación
      ;3000.
      (list "Error" "alohawaii" '(14 5 1930) '() '() '(3000))
  ))
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; CALCULO DE NUMEROS.
; NumFollowers
; Función que entrega el numero de seguidores del
; usuario.
;DOMINIO: User.
;RECORRIDO: Integer.

;Se define entradas.
(define (numFollowers User1)
  ;Se da numero de seguidores con la función
  ;length.
  (length (list-ref User1 2))
  )
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; MODIFICADORAS.
; NewID
; Función que agrega una nueva ID de publicación a la
; lista de ID's del usuario.
;DOMINIO: User x Integer.
;RECORRIDO: User.

(define (NewID User ID)
  ;Se comprueba si el dato ID es un numero.
  (if (integer? ID)
      ;Caso verdadero.
      ;Se crea nuevo user con la ID agregada.
      (Create_User  (list-ref User 0) (list-ref User 1)
                    (list-ref User 2) (list-ref User 3)
                    (list-ref User 4) (append (list-ref User 5) (list ID))
                    )

      ;Caso falso}
      ;Se entrega un User sin cambios.
      (append User)
      ))

; NewFollower.
; Función que recibe un nuevo usuario y los
; registra como seguidor del usuario.
;DOMINIO: User x String.
;RECORRIDO: User.

(define (NewFollower User Follower)
  ;Se establece condición para ver si
  ;follower es un string.
  (if (string? Follower)
      ;Caso verdadero
      ;Se crea nueva estructura con el seguidor nuevo.
      (Create_User  (list-ref User 0) (list-ref User 1) (list-ref User 2)
                    (append (list-ref User 3) (list Follower))
                    (list-ref User 4) (list-ref User 5)
                    )

      ;Caso falso}
      ;Se entrega un User sin cambios.
      (append User)
      ))

; NewFollowing.
; Función que agrega nuevo ente seguido por
; el usuario.
;DOMINIO: User x String.
;RECORRIDO: User.

(define (NewFollowing User Following)
  ;Se establece condición para ver si
  ;following es un string.
  (if (string? Following)
      ;Caso verdadero
      ;Se crea nueva estructura con el seguidor agregado.
       (Create_User  (list-ref User 0) (list-ref User 1) (list-ref User 2)
                     (list-ref User 3) (append (list-ref User 4) (list Following))
                     (list-ref User 5)
                     )

      ;Caso falso}
      ;Se entrega un User sin cambios.
      (append User)
      ))
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; SELECTORES.

; NameUser.
; Se define función que otorga el nombre de usuario.
;DOMINIO: User.
;RECORRIDO: String.

(define (NameUser User)
  ;Se entrega nombre de usuario.
  (car User)
  )

; PassUser.
; Se define función que otorga la contraseña de usuario.
;DOMINIO: User.
;RECORRIDO: String.

(define (PassUser User)
  ;Se entrega contraseña.
  (car (cdr User))
  )

; DateUser.
; Se define función que otorga la fecha de creación de usuario.
;DOMINIO: User.
;RECORRIDO: Date.

(define (DateUser User)
  ;Se entrega fecha de creación.
  (car (cddr User))
  )

; WersUser.
; Se define función que otorga lista de seguidores de usuario.
;DOMINIO: User.
;RECORRIDO: list.

(define (WersUser User)
  ;Se entrega lista de seguidores.
  (car (cdddr User))
  )

; WingUser.
; Se define función que otorga lista de seguidos de usuario.
;DOMINIO: User.
;RECORRIDO: list.

(define (WingUser User)
  ;Se entrega lista de seguidos.
  (car (cddddr User))
  )

; IDsUser.
; Se define función que otorga lista de ID's de publicaciones de usuario.
;DOMINIO: User.
;RECORRIDO: list.

(define (IDsUser User)
  ;Se entrega lista de ID's.
  (car (reverse User))
  )
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; BLOQUE DE EXPORTANCIÓN.
; En este bloque se especifican las funciones las cuales se van a
; exportar a otros archivos.
(provide Create_User)
(provide numFollowers)
(provide NewID)
(provide NewFollower)
(provide NewFollowing)
(provide NameUser)
(provide PassUser)
(provide DateUser)
(provide WersUser)
(provide WingUser)
(provide IDsUser)