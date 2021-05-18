; Descripción General.
; Este archivo describe la subestructura del socialnetwork
; '(post), desde sus elementos hasta sus funciones propias.

;Se le da a entender al interprete el uso del lenguaje scheme.
#lang scheme


; La subestructura post posee los siguientes elementos.

(define post '("user" ID "content" likes '(mencion) '(share) '(comments)))

; Esta conformada por el nombre del autor (string), la ID del post (entero)
; el contenido (string), los likes quue recibe la publicación, las menciones
; a quienes se compartió y los comentarios (listas de string y otra subestructura).

; FUNCIONES PROPIAS.

; CreatePost.
; Se define función que crea un post. Por corrificación en
; implementación no se establecen condiciones.

;Se define entrada.
(define (CreatePost User ID Content likes Mencion share comments)
  ;Se construye lista de elementos.
  (list User ID Content likes Mencion share comments))

; Liked.
; Función que agrega un like al post.

;Se definen entradas.
(define (Liked post)
  ;Se agrega like al post.
  (CreatePost (list-ref post 0) (list-ref post 1) (list-ref post 2) (+ (list-ref post 3) 1)
              (list-ref post 4) (list-ref post 5) (list-ref post 6))
  )

; NewShare
; Función que añade un nuevo usuario compartido.

;Se definen entradas.
(define (NewShare post username)
  ;Se agrega like al post.
  (CreatePost (list-ref post 0) (list-ref post 1) (list-ref post 2) (list-ref post 3)
              (list-ref post 4) (append (list-ref post 5) (list username)) (list-ref post 6))
  )

; Shared.
; Función que entrega las veces que se compartio
; un post.

;Se define entrada.
(define (Shared post)
  ;Se entrega el numero de veces
  ;compartido como largo de lista share.
  (length (list-ref post 5))
  )

; BLOQUE DE EXPORTACIÓN.
; En esta sección se especifican las funciones las cuales se
; exportan a otros archivos.
(provide CreatePost)