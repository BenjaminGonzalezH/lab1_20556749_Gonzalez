; DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función post.

; Se le da a entender al interprete del uso del
; lenguaje scheme.
#lang scheme

; BLOQUE DE IMPORTACIÓN.
; En este bloque se especifican los archivos donde
; se requieren funciones.
(require "SubTDA_Post.rkt")
(require "SubTDA_User.rkt")
(require "Register.rkt")
(require "TDA_Socialnetwork.rkt")
(require "Constructor_socialnetwork.rkt")

; AreFriends
; Se crea función recursiva si ve que si un usuario
; esta en la lista de seguidores de otro.
(define (AreFriends listfriends friend)
  ;Caso Base
  ;No se encuantra ninguna coincidencia
  (if (or (= (car listfriends) null) (= (length listfriends) 0))
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
          (AreFriends (cdr listfriends) friend)
          )
      )
  )

; MentionDefinitive.
; Se establece función la cual genera una lista de usuarios
; si estos son amigos del usuario en cuestion.

; ModifiUser
; Se crea lista que modifica la lista de usuarios
; cambiando uno de sus elementos.
(define (ModifiUser listofUsers User newlist)
  ;lista vacia o ultimo elemento
  (if (or (= (length listofUsers) 0) (equal? (car listofUsers) '()))
      (newlist)

      ;se ve elemento
      (if (string=? (car (car listofUsers)) (car User))
          ;Se crea lista con nuevo elemento.
          (ModifiUser (cdr listofUsers) User (append newlist (list User)))
          ;Se crea lista con el elemento puesto
          (ModifiUser (cdr listofUsers) User (append newlist (list (car listofUsers))))
          )
      )
  )

; Post
; Función currificada comando de la función login la cual
; crea un post con su propio ID, y asigna ese post al usuario el cual
; pertenece.

;Se define entrada.
(define post (lambda (socialn) (lambda (user) (lambda (date content . UserList)
                                 ;Se comprueba si los datos ingresados son
                                 ;correctos.
                                 (if (and (IsDate date) (string? content))
                                     ;Caso verdadero.
                                     ;Se genera nueva estructura socialnetwork
                                     ;con los datos registrados del usuario.
                                     (list (list-ref socialn 0) (list-ref socialn 1)
                                           (list-ref socialn 2) (list-ref socialn 3)
                                           (ModifiUser (list-ref socialn 4) (NewID user (length (list-ref socialn 5))) '())
                                           (list (append (list-ref socialn 5)
                                                   (CreatePost (car user) (length (list-ref socialn 5)) ((list-ref socialn 2) content) 0
                                                               (map (list-ref socialn 2) UserList) '() '()))))
                                     ;Caso falso.
                                     ;Se entrega socialnetwork sin modificaciones.
                                     (socialn)
                                     )
                                                )
                                 )
               )
  )

; BLOQUE DE EXPORTACIONES.
(provide Arefriends)