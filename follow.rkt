;DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función follow
; del socialnetwork.

;Se da a entender al interprete el uso de lenguaje shceme.
#lang scheme

; Bloque de importaciones.
(require "SubTDA_User.rkt")
(require "TDA_Socialnetwork.rkt")
(require "Constructor_socialnetwork.rkt")
(require "SubTDA_Post.rkt")
(require "Register.rkt")
(require "post.rkt")

; follow
; Función currificada que permite a un usuario seguir a una persona
; esto viendose reflejado en socialnetwork.
;DOMINIO: Socialnetwork.
;RECORRIDO1: User.
;RECORRIDO2: date.
;RECORRIDO3: string.
;RECORRIDO FINAL: Socialnetwork.
(define follow (lambda (socialn) (lambda (user) (lambda (date) (lambda (User)
                                                  ;se comprueban si los datos ingresados
                                                  ;son correctos y si el usuario existe a seguir
                                                  ;cumple que no sea el usuario mismo, que exista
                                                  ;en la lista de usuarios del socialnetwork y
                                                  ;no se haya seguido con anterioridad.
                                                  (if (and (IsDate date) (string? User)
                                                           (not(ExistBefore (list-ref socialn 4) User))
                                                           (not (string=? (car user) User))
                                                           (not ((AreFriends (list-ref user 4)) User)))
                                                      ;Caso verdadero
                                                      ;se crea otro socialnetwork con el nuevo follow.
                                                      (list (list-ref socialn 0) (list-ref socialn 1)
                                                            (list-ref socialn 2) (list-ref socialn 3)
                                                            (ModifiUser (list-ref socialn 4) (NewFollowing user User) '())
                                                            (list-ref socialn 5))
                                                            

                                                      ;Caso falso.
                                                      ;Se da socialnetwork sin cambios.
                                                      socialn
                                                      )
                                                  )
                                   )
                 )
  ))

; BLOQUE DE EXPORTANCIÓN.
; En este bloque se especifican las funciones las cuales se van a
; exportar a otros archivos.
(provide follow)