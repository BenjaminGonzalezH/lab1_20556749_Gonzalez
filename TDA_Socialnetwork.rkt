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

(define socialnetwork '("facebook" (10 07 2000) procedureEncriptado procedureDesencriptado '(User) '(Post)))

; Esta lista esta conformada por el nombre de la red social como un string,
; la fecha de su creación armada por la función Date que termina entregando una
; lista de enteros, los procesos de encriptado y desencriptado de información
; (funciones o procesos) y dos listas de 2 subestructuras del TDA que tendrán
; su propia estructura interna.

;---------------------------------------------------------------------------------------------------------------

; FUNCIONES PROPIAS.

; Este tipo de dato posee funciones propias para su manipulación y manejo
; de elementos que esta posee, como para llamar a sus elementos,
; a sus funciones incluidas o busqueda de elementos en concreto.


; ENCRIPTACIÓN.
; Las funciones del proceso de encriptación son:

; Encryptation.
; Función Asistente de EncryptFuntion que realiza
; el proceso de encriptado. Recibe el string de la función
; a la que asiste y realiza el proceso de encriptado por
; ella.

;Se establece entrada.
(define (Encryptation H)
  ;Se crea un nuevo string usando el de la entrada
  ;agregado a 5 veces su caracter inicial
  ;separados por un caracter de control "җ".
  (string-append H (string-append "җ" (make-string 5 (string-ref H 0)))))

; Función EncryptFuntion.
; Función que recibe un String y lo modifica en un proceso de
; encriptado (realizado por una función asistente), para posteriormente
; devolver ese string encriptado.

;Se establece entrada.
(define (EncryptFunction S)
  ;Se comprueba que sea un string el elemento de la entrada.
  (if (string? S) 
      ;En el caso verdadero se modifica el string.
      ;con la función Encryptation.
      (Encryptation S) 

      ;En el caso falso se imprime mensage de error.
      (display "Error: no string input")
      ))


; DESENCRIPTACIÓN.
; Las funciones del proceso de desencriptación son:


; Decryptation.
; Función asistente de DecryptFunction que realiza
; el proceso de decriptación.

;Se establece entrada.
(define (Decryptation H)
  ;Se una la función substring para dividir el string
  ;inicial del modificado, esto bajo la idea de que el
  ;encriptado solo agrego 6 caracteres más..
  (substring H 0 (- (string-length H) 6)))

; DecryptFunction
; Función que recibe un string y lo modifica para
; deshacer los cambios de EncryptFuntion.

;Se establece entrada.
(define (DecryptFunction S)
  ;Se comprueba que sea un string.
  (if (string? S) 
      ;Caso verdadero: se realiza el proceso de desencriptado.
      (Decryptation S)

      ;En el caso falso se imprimer mensage de error.
      (display "Error: no string input")
      ))

; FECHA
; Date
; Funcion que recibe de entrada numeros 3 enteros
; y devuelve una lista de ellos.

; Se establece entrada.
(define (Date a b c)
  ;Se establece condicionales para comprobar
  ;entradas de numeros exactos
  (if (and (exact? a) (exact? b) (exact? c))
      ;Caso verdadero se crea lista.
      (list a b c)

      ;Caso falso se da mensaje de error.
      (display "Input Error: no exact number")
      ))


; BLOQUE DE EXPORTACIÓN.
; En este bloque se especifican las funciones las cuales se van a
; exportar a otros archivos.
(provide Encryptation)
(provide EncryptFunction)
(provide Decryptation)
(provide DecryptFunction)
(provide Date)
