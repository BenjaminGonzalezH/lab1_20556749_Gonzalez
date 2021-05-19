; DESCRIPCIÓN GENERAL.
; En este archivo se guarda la función post.

; Se le da a entender al interprete del uso del
; lenguaje scheme.
#lang scheme

; BLOQUE DE IMPORTACIÓN.
; En este bloque se especifican los archivos donde
; se requieren funciones.
(require "SubTDA_Post.rkt")

; Post
; Función currificada comando de la función login la cual
; crea un post con su propio ID, y asigna ese post al usuario el cual
; pertenece.
(define (post x) (x))