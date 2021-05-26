;Se da a entender al interprete el uso de lenguaje shceme.
#lang scheme

;DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función follow
; del socialnetwork.

; Bloque de importaciones.
(require "SubTDA_User.rkt")
(require "TDA_Socialnetwork.rkt")
(require "Constructor_socialnetwork.rkt")
(require "TDA_Fecha.rkt")

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
                                                           (not(ExistBefore (UserSocial socialn) User))
                                                           (not (string=? (NameUser user) User))
                                                           (not ((AreFriends (WingUser user)) User)))
                                                      ;Caso verdadero
                                                      ;se crea otro socialnetwork con el nuevo follow.
                                                      (list (NameSocial socialn) (DateSocial socialn)
                                                            (EncrySocial socialn) (DecrySocial socialn)
                                                            (ModifiUser
                                                             (ModifiUser (UserSocial socialn) (NewFollowing user User) '())
                                                             (NewFollower (SearchUser (UserSocial socialn) User) (NameUser user)) '())
                                                            (PostSocial socialn))
                                                            

                                                      ;Caso falso.
                                                      ;Se da socialnetwork sin cambios.
                                                      (append socialn)
                                                      )
                                                  )
                                   )
                 )
  ))

; BLOQUE DE EXPORTANCIÓN.
; En este bloque se especifican las funciones las cuales se van a
; exportar a otros archivos.
(provide follow)