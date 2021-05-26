; Se le da entender al interprete el uso de lenguaje scheme.
#lang scheme

; DESCRIPCIÓN GENERAL.
; Este archivo describe la subestructura del socialnetwork
; '(User), desde sus elementos hasta sus funciones propias. 

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
; BUSQUEDA
; AreFriends
; Se crea función recursiva si ve que si un usuario
; esta en la lista de seguidores de otro.
;DOMINIO: list of strings x string.
;RECORRIDO: Bool.
;RECURSIÓN: Natural.

(define AreFriends (lambda (listfriends) (lambda (friend)
                                           ;Caso Base
                                           ;No se encuantra ninguna coincidencia
                                           (if (= (length listfriends) 0)
                                               ;Caso verdadero
                                               ;Se entrega falso.
                                               (and #f)

                                               ;Caso falso
                                               ;Se verifica si coinciden los nombres con el elemento
                                               ;en lista de amigos.
                                               (if (string=? friend (car listfriends))
                                                   ;Caso verdadero
                                                   ;se entrega true.
                                                   (and #t)

                                                   ;Caso falso
                                                   ;se llama otra vez a la función.
                                                   ((AreFriends (cdr listfriends)) friend)
                                                   )
                                               )
                                           )
                     )
  )

; MODIFICACIÓN DE LISTA.
; ModifiUser
; Se define función crea una lista de usuarios
; cambiando uno de sus elementos.
;DOMINIO: List of Users x User x list.
;RECORRIDO: List of Users.
;RECURSIÓN: Natural.

(define (ModifiUser listofUsers User newlist)
  ;lista vacia o ultimo elemento. (caso base)
  (if (= (length listofUsers) 0)
      ;Caso verdadero.
      ;Se entrega lista nueva.
      newlist

      ;Caso falso.
      ;Se ve si el nombre de usuario ingresado, existe dentro del
      ;elemento evaluado para reemplazarlo en la lista.
      (if (string=? (NameUser (car listofUsers)) (NameUser User))
          ;Caso verdadero.
          ;Se crea lista con nuevo elemento (reemplazo).
          (ModifiUser (cdr listofUsers) User (append newlist (list User)))

          ;Caso falso.
          ;Se crea lista con el elemento correspondiente con anterioridad (no hay reemplazo).
          (ModifiUser (cdr listofUsers) User (append newlist (list (car listofUsers))))
          )
      )
  )
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; WerString.
; Se establece función que asiste a user->string
; generando un string de lista de nombres de usuarios.
;DOMINIO: list x string.
;RECORRIDO: string.
;RECURSION: natural.

(define (WerString list string)
  ;Caso base.
  ;Fin de lista.
  (if (= (length list) 0)
      ;Caso verdadero.
      ;Se da string generado.
      string

      ;Caso Falso.
      ;Se establece otro llamado recursivo, reduciendo la lista
      ;y agregando nombre al string de nombres.
      (WerString (cdr list) (string-append string " " (car list)))
      )
  )

; NumberString.
; Se define función que crea un string de
; lista de numeros.
;DOMINIO: list x string.
;RECORRIDO: string.
;RECURSION: natural.

(define (NumberString list string)
  ;Caso base.
  ;Fin de lista.
  (if (= (length list) 0)
      ;Caso verdadero.
      ;Se da string generado.      
      string

      ;Caso Falso.
      ;Se establece otro llamado recursivo, reduciendo la lista
      ;y agregando numero al string de numeros.
      (NumberString (cdr list) (string-append string " " (number->string (car list))))
      )
  )

; CAMBIO DE TIPO DE DATOS.
; user->string.
; Se define función la cual hace que un usuario se represente
; como un string.
;DOMINIO: user.
;RECORRIDO: 

(define (user->string User)
  ;Se establece string del usuario.
  (string-append (string-append "Nombre de Usuario: " (NameUser User) "\n")
          (string-append "Fecha de Creación: "
                         (number->string (car (DateUser User))) " "
                         (number->string (car (cdr (DateUser User)))) " "
                         (number->string (car (cddr (DateUser User)))) "\n")
          (string-append "Seguidores: " (WerString (WersUser User) "") "\n")
          (string-append "Seguidos: " (WerString (WingUser User) "") "\n")
          (string-append "ID's publicaciones: " (NumberString (IDsUser User) "") "\n\n")
          )
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
(provide AreFriends)
(provide ModifiUser)