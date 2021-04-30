; DESCRIPCION GENERAL. 
; Este archivo guarda el TDA socialnetwork y sus funciones relacionadas,
; el proposito de esto es documentar la estructura interna del tipo de dato
; abstracto pensado para la implementación del lab y las funciones de
; encriptado de información.

; Se le da a entender al interprete el uso del lenguaje scheme.
#lang scheme

; El TDA socialnetwork es una estructura que representa a la red social
; que el usuario maneja y esta se maneja como una lista heterogenea con
; los siguientes elementos.

(define socialnetwork '("facebook" (10 07 2000) '(User) '(Post)))

; Esta estructura esta conformada por el nombre de la red social (string), su fecha de creación de 
; la red social (lista de enteros), las listas de ususarios y la listas de posts.

; La subestructura user posee el siguiente orden.

(define user '("name" "password" '(followers) '(following) '(IDpublications)))

; Esta es conformada por el nombre de usuario y la contraseña como strings,
; un entero que da el numero de seguidores que uno tiene, las listas de
; seguidores y siguiendo que actuaran como contactos y la lista de IDs de sus
; publicaciones.

; La subestructura post posee el siguiente orden.

(define post '("user" ID "content" likes '(mencion) '(share) '(comments)))

; Esta es conformada por el nombre del autor(string), la ID de la publicacion
; el contenido (strings),un entero de numero de likes, y las listas de usuarios
; a quienes se compartio, los comentarios y usuarios a los que se dirigio la
; publicación.

; Cabe recalcar que socialnetwork para protección de información cuenta con
; funciones de encriptado y desencriptado, las cuales solo manejan tipo de
; dato string y devuelven un string modificado.

; FUNCIONES.

; Encryptation.
; Función Asistente de EncryptFuntion que realiza
; el proceso de encriptado. Recibe el string de la función
; a la que asiste y realiza el proceso de encriptado por
; ella.

(define (Encryptation H) ;Se establece entrada.
  ;Se crea un nuevo string usando el de entrada
  ;agregado a 5 veces su caracter inicial
  ;separados por un caracter de control.
  (string-append H (string-append "җ" (make-string 5 (string-ref H 0)))))

; Función EncryptFuntion.
; Función que recibe un String y lo modifica en un proceso de
; encriptado (realizado por una función asistente), para posteriormente
; devolver ese string encriptado.

(define (EncryptFuntion S) ;Se establece entrada.
  (if (string? S) ;Se comprueba que sea un string.
  ;En el caso verdadero se modifica el string.
  ;con la función Encryptation.
  (Encryptation S) 

  ;En el caso falso se imprime mensage de error.
  (display "Error: no string input")
  ))

; Decryptation.
; Función asistente de DecryptFunction que realiza
; el proceso de decriptación.

(define (Decryptation H) ;Se establece entrada.
  ;Se una la función substring para dividir el string
  ;inicial del modificado.
  (substring H 0 (- (string-length H) 6)))

; DecryptFunction
; Función que recibe un string y lo modifica para
; deshacer los cambios de EncryptFuntion.

(define (DecryptFunction S) ;Se establece entrada.
  (if (string? S) ;Se comprueba que sea un string.
  ;Caso verdadero: se realiza el proceso de desencriptado.
  (Decryptation S)

  ;En el caso falso se imprimer mensage de error.
  (display "Error: no string input")
  ))

; Date
; Funcion que toma 3 enteros y realiza una lista de ellos.
(define (Date a b c) (list a b c))