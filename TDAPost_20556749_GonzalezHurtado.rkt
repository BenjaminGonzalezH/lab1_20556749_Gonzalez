;Se le da a entender al interprete el uso del lenguaje scheme.
#lang scheme

; DESCRIPCIÓN GENERAL
; Este archivo describe la subestructura del socialnetwork
; '(post), desde sus elementos hasta sus funciones propias.

; BLOQUE DE IMPORTACIÓN.  
(require "TDA_Fecha.rkt")
(require "SubTDA_User.rkt")

; La subestructura post posee los siguientes elementos.

(define post '("user" ID date "content" likes '(mencion) '(share) '(comments)))

; Esta conformada por el nombre del autor (string), la ID del post (entero)
; la fecha de la publicación (date),el contenido (string),
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


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; SELECTORES.
; Se definen funciones que otorgan partes de
; las estructura Post.
;DOMINIO: post.

;RECORRIDO: string.
(define (UserPost Post)
  (car Post)
  )

(define (ContentPost Post)
  (car (cdddr Post))
  )

;RECORRIDO: date.
(define (DatePost Post)
  (car (cddr Post))
  )

;RECORRIDO: integer.
(define (IDPost Post)
  (car (cdr Post))
  )

(define (LikesPost Post)
  (car (cddddr Post))
  )

;RECORRIDO: lista.
(define (MentionPost Post)
  (car (cddr (reverse Post)))
  )

(define (SharePost Post)
  (car (cdr (reverse Post)))
  )

(define (CommentPost Post)
  (car (reverse Post))
  )

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; CAMBIO DE LISTA DE PUBLICACIONES.
; ChangePost
; Se define función que cambia el elemento
; de una lista de post por otro modificado.
;DOMINIO: List.
;RECORRIDO: List.
;RECURSIÓN: natural.

(define (ChangePost listofpost post newlist)
  ;Lista vacia o ultimo elemento.
  (if (= (length listofpost) 0)
      (append newlist)

      ;se ve elemento
      (if (= (list-ref (car listofpost) 1) (list-ref post 1))
          ;Caso verdadero reemplazo.
          (ChangePost (cdr listofpost) post (append newlist (list post)))

          ;Caso falso continua.
          (ChangePost (cdr listofpost) post (append newlist (list (car listofpost))))
          )
      )
  )
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; CAMBIO DE TIPO DE DATOS.
; post->string.
; Se define función que transforma un TDA post.
; A un string.
;DOMINIO: Post.
;RECORRIDO: String.

(define (post->string post)
  ;Se produce transdormación del dato post
  (string-append (string-append "Autor: " (UserPost post) "\n")
                 (string-append "ID: " (number->string (IDPost post)) "\n")
                 (string-append "Fecha: " (NumberString (DatePost post) "") "\n")
                 (string-append "Likes: " (number->string (LikesPost post)) "\n")
                 (string-append "Mentions: " (WerString (MentionPost post) "") "\n")
                 (string-append "Share: " (WerString (SharePost post) "") "\n\n")
                 ))
                 

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; BLOQUE DE EXPORTACIÓN.
; En esta sección se especifican las funciones las cuales se
; exportan a otros archivos.
(provide CreatePost)
(provide NewShare)
(provide Liked)
(provide NewComment)
(provide UserPost)
(provide IDPost)
(provide DatePost)
(provide ContentPost)
(provide LikesPost)
(provide MentionPost)
(provide SharePost)
(provide CommentPost)
(provide ChangePost)
(provide post->string)