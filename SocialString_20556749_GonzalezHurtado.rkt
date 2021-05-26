;Se le da a entender al interprete el uso de lenguaje scheme.
#lang scheme

; BLOQUE DE IMPORTACIONES.
(require "TDA_Fecha.rkt")
(require "TDA_Socialnetwork.rkt")
(require "SubTDA_Post.rkt")
(require "SubTDA_User.rkt")

; AllPost
; Se define función que genera un string de varios
; tipos de datos post de un socialnetwork.
;DOMINIO: socialnetwork x list x string.
;RECORRIDO: string.
;RECURSIÓN: Natural.

(define (AllPost socialn IDposts string)
  ;Caso Base.
  ;lista vacia.
  (if (= (length IDposts) 0)
      ;Caso verdadero.
      ;Se entrega string de todas las publicaciones en string.
      (string-append string "\n")

      ;Caso falso.
      ;Se llama de nuevo a la función con la lista acortada y
      ;con el string agregando el string de publicación.
      (AllPost socialn (cdr IDposts) (string-append string (post->string (list-ref (PostSocial socialn) (car IDposts)))))
      )
  )

; AllUsers
; Se define función que entrega un string de todos
; los usuarios del TDA socialnetwork.
;DOMINIO: socialnetwork x list x string.
;RECORRIDO: string.
;RECURSIÓN: Natural.

(define (AllUsers socialn ListofUsers string)
  ;Caso base
  ;Lista vacia.
  (if (= (length ListofUsers) 0)
      ;Caso verdadero.
      ;Se entrega el string completo.
      (string-append string "\n")

      ;Caso falso.
      ;Se establece un nuevo llamado a la función.
      (AllUsers socialn (cdr ListofUsers) (string-append string (user->string (car ListofUsers)) (AllPost socialn (IDsUser (car ListofUsers)) "")))
      )
  )

; socialnework->string
; Se define función la cual entrega el socialnetwork en
; un string o los antecedentes del usuario, dependiendo de la
; entrada que se de.
;DOMINIO: socialnetwork.
;RECORRIDO1: User.
;RECORRIDO2: String.

(define socialnetwork->string (lambda (socialn) (lambda ([User "Usuario"])
                                                  ;Se establecen condicionales para ver
                                                  ;que tipo de entrada se realizó.
                                                  ;Entrada sin uso de login.
                                                  (if (string? User)
                                                      ;Caso verdadero.
                                                      ;Se entrega toda la información publica de socialnetwork.
                                                      (string-append (string-append "Nombre de red: " (NameSocial socialn) "\n")
                                                                     (string-append "Fecha de creación: "
                                                                                    (NumberString (DateSocial socialn) "") "\n\n\n")
                                                                     (AllUsers socialn (UserSocial socialn) "")
                                                                     )

                                                      ;Caso Falso.
                                                      ;Entrada usando login.
                                                      ;Se entrega información del usuario.
                                                      (string-append (user->string User)
                                                                     (AllPost socialn (IDsUser User) "")
                                                                     )
                                                      )
                                                  )
                                )
  )

;BLOQUE DE EXPORTACIONES.
(provide socialnetwork->string)