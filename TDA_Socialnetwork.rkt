; DESCRIPCION GENERAL.
; Este archivo guarda el TDA socialnetwork y sus funciones relacionadas,
; el proposito de esto es documentar la estructura interna del tipo de dato
; abstracto pensado para la implementación del lab.

; Se le da a entender al interprete el uso del lenguaje scheme.
#lang scheme

; El TDA socialnetwork es una estructura que representa a la red social
; que el usuario maneja y esta se maneja como una lista heterogenea con
; los siguientes elementos.

(define socialnetwork '("facebook" (10 07 2000) "encriptado" "codificado" '("User") '("Post")))

; Esta estructura esta conformada por el nombre de la red social (string), su fecha de creación de 
; la red social (lista de enteros), strings de codigos de encriptado y codificado, por ultimo
; 2 listas, una con la subestructura de lista de usurios y otra de los post.

; La subestructura user posee el siguiente orden.

(define user '("name" "password" followers '(following)))

; Esta es conformada por el nombre de usuario, la contraseña como strings,
; un entero que da el numero de seguidores que uno tiene y la lista de
; seguidos que actuaran como contactos.

; La subestructura post posee el siguiente orden.

(define post '("user" "content" likes '(mencion) '(share) '(comments)))

; Esta es conformada por el nombre del autor, el contenido (strings),
; un entero de numero de likes, y las listas de usuarios compartidos
; comentarios y usuarios demencion.