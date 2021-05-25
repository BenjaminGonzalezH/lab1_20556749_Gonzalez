;Se le da a entender al interprete el uso del lenguaje scheme.
#lang scheme

; DESCRIPCIÓN GENERAL
; Este archivo describe la subestructura del socialnetwork
; '(post), desde sus elementos hasta sus funciones propias.

; BLOQUE DE IMPORTACIÓN.  
(require "TDA_Socialnetwork.rkt")
(require "TDA_Fecha.rkt")

; La subestructura post posee los siguientes elementos.

(define post '("user" ID "type" "content" likes '(mencion) '(share) '(comments)))

; Esta conformada por el nombre del autor (string), la ID del post (entero)
; el tipo de dato de la publicación (video),el contenido (string),
; los likes que recibe la publicación, las menciones (list de strings), a quienes se compartió
; y los comentarios (listas de string y otra subestructura).

;---------------------------------------------------------------------

; FUNCIONES PROPIAS.

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; CONSTRUCTOR.
; CreatePost.
; Se define función que crea un post.
;DOMINIO: String x integer x string x string x integer x list x list x list

(define (CreatePost User ID type Content likes Mencion share comments)
  ;Se construye lista de elementos.
  (list User ID type Content likes Mencion share comments))
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;MODIFICADORES.
; Liked.
; Función que agrega un like al post.
;DOMINIO: Post.
;RECORRIDO: Post.

(define (Liked post)
  ;Se agrega like al post.
  (CreatePost (list-ref post 0) (list-ref post 1) (list-ref post 2) (list-ref post 3)
              (+ (list-ref post 4) 1) (list-ref post 5) (list-ref post 6) (list-ref post 7))
  )

; NewShare
; Función que añade un nuevo usuario compartido.
;DOMINIO: Post.
;RECORRIDO: Post.

(define (NewShare post username)
  ;Se agregan nombres de usuarios a quienes se les compartio el post.
  (CreatePost (list-ref post 0) (list-ref post 1) (list-ref post 2) (list-ref post 3)
              (list-ref post 4) (list-ref post 5)
              (append (list-ref post 6) username) (list-ref post 7))
  )

; NewComment
; Se define función que agrega un nuevo comentario a la publicación.
;DOMINIO: Post.
;RECORRIDO: Post.

(define (NewComment post date user comment)
  ;Se comprueban elementos de entrada.
  (if (and (IsDate date) (string? user) (string? comment))
      ;Caso verdadero.
      ;Se agrega comentario a la publcación.
      (CreatePost (list-ref post 0) (list-ref post 1) (list-ref post 2) (list-ref post 3)
              (list-ref post 4) (list-ref post 5)
              (list-ref post 6) (append (list-ref post 7) (list (list date user comment)))
              )
      ;Caso falso.
      ;Se da post sin modificar.
      post
      )
  )
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

; BLOQUE DE EXPORTACIÓN.
; En esta sección se especifican las funciones las cuales se
; exportan a otros archivos.
(provide CreatePost)
(provide NewShare)
(provide Liked)
(provide NewComment)