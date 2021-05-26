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
(provide post)