; Se le da a entender al interprete del uso del
; lenguaje scheme.
#lang scheme

; DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función post.

; BLOQUE DE IMPORTACIÓN.
; En este bloque se especifican los archivos donde
; se requieren funciones.
(require "SubTDA_Post.rkt")
(require "SubTDA_User.rkt")
(require "TDA_Fecha.rkt")
(require "TDA_Socialnetwork.rkt")

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

; Post
; Función currificada comando de la función login la cual crea un post que
; sera guardado en el socialnetwork y posteriormente escribe la ID de ese
; post a ese usuario.
;DOMINIO: Socialnetwork.
;RECORRIDO1: User
;RECORRIDO2: date
;RECORRIDO3: content x list of strings.
;RECORRIDO FINAL: Socialnetwork.

(define post (lambda (socialn) (lambda (user) (lambda (date) (lambda (type content . UserList)
                                 ;Se comprueba si los datos ingresados son
                                 ;correctos.
                                 (if (and (IsDate date) (string? content) (string? type))
                                     ;Caso verdadero.
                                     ;Se genera nueva estructura socialnetwork
                                     ;con los el nuevo post y el usuario con la
                                     ;ID de publicación registrada.
                                     (list (NameSocial socialn) (DateSocial socialn)
                                           (EncrySocial socialn) (DecrySocial socialn)
                                           (ModifiUser (UserSocial socialn) (NewID user (length (PostSocial socialn))) '())
                                           (append (PostSocial socialn)
                                                   (list (CreatePost (NameUser user) (length (PostSocial socialn)) type ((EncrySocial socialn) content) 0
                                                                (filter (AreFriends (WingUser user))  UserList) '() '()))))
                                     ;Caso falso.
                                     ;Se entrega socialnetwork sin modificaciones.
                                     socialn
                                     )
                                                )
                                 )
               )
  ))

; BLOQUE DE EXPORTACIONES.
; En este bloque se especifican las funciones las cuales se van a
; exportar a otros archivos.
(provide AreFriends)
(provide ModifiUser)
(provide post)