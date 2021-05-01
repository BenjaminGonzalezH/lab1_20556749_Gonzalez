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