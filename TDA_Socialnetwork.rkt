; DESCRIPCION GENERAL.
; Este archivo guarda el TDA socialnetwork y sus funciones relacionadas.
; El proposito de esto es documentar la estructura interna del tipo de dato
; abstracto pensado para la implementación del laboratorio, las funciones de
; propias del TDA y encriptado de información.

; Se le da a entender al interprete el uso del lenguaje scheme.
#lang scheme

; El TDA socialnetwork es una estructura que representa a la red social
; que el usuario maneja y esta se representa como una lista heterogenea.

(define socialnetwork '("facebook" (10 07 2000) procedureEncriptado procedureDesencriptado '(User) '(Post)))

; Esta lista esta conformada por el nombre de la red social como un string,
; la fecha de su creación armada por la función Date que termina entregando una
; lista de enteros, los procesos de encriptado y desencriptado de información
; (funciones o procesos) y dos listas de 2 subestructuras del TDA que tendrán
; su propia organización interna.

;---------------------------------------------------------------------------------------------------------------

; FUNCIONES PROPIAS.

; Este tipo de dato posee funciones propias para la manipulación y manejo
; de elementos que esta posee. Ya sea llamar a sus elementos o
; funciones incluidas o busqueda de elementos en concreto.

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; ENCRIPTACIÓN.
; Las funciones del proceso de encriptación son:

; Encryptation.
; Función Asistente de EncryptFuntion que realiza
; el proceso de encriptado.
;DOMINIO: String.
;RECORRIDO: String.

(define (Encryptation H)
  ;Se crea un nuevo string usando la entrada
  ;agregado a 5 veces su caracter inicial
  ;separados por un caracter de control "җ".
  (string-append H (string-append "җ" (make-string 5 (string-ref H 0)))))

; Función EncryptFuntion.
; Función que recibe un String y lo modifica en un proceso de
; encriptado (realizado por una función asistente), para posteriormente
; devolver ese string encriptado.
;DOMINIO: String.
;RECORRIDO: String.

(define (EncryptFunction S)
  ;Se comprueba que sea un string el elemento de la entrada.
  (if (string? S) 
      ;En el caso verdadero se modifica el string.
      ;con la función Encryptation.
      (Encryptation S) 

      ;En el caso falso se entrega un string de espacio vacio.
      (string #\u0020)
      ))


; DESENCRIPTACIÓN.
; Las funciones del proceso de desencriptación son:

; Decryptation.
; Función asistente de DecryptFunction que realiza
; el proceso de decriptación.
;DOMINIO: String.
;RECORRIDO: String.

(define (Decryptation H)
  ;Se usa la función substring para dividir el string
  ;inicial del modificado, esto bajo la idea de que el
  ;encriptado solo agrego 6 caracteres más.
  (substring H 0 (- (string-length H) 6)))

; DecryptFunction
; Función que recibe un string y lo modifica para
; deshacer los cambios de EncryptFuntion, esto bajo
; su respectiva función asistente.
;DOMINIO: String.
;RECORRIDO: String.

(define (DecryptFunction S)
  ;Se comprueba que sea un string el elemento de entrada.
  (if (string? S) 
      ;Caso verdadero: se realiza el proceso de desencriptado.
      (Decryptation S)

      ;En el caso falso se entrega un string vacio.
      (string #\u0020)
      ))
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; FECHA:

; ValidDate.
; Función que comprueba si los elementos de date
; son validos para una fecha.
;DOMINIO: Integer x Integer x Integer.
;RECORRIDO: Bool.

(define (ValidDate a b c)
  ;Se define condicional para ver si date
  ;tiene valores pertenecientes a una fecha.
  (and (< a 32) (< b 13) (> c 1930))
  )

; Date
; Funcion que recibe de entrada 3 enteros
; y devuelve una lista de ellos, lo que
; representa la fecha.
;DOMINIO: Integer x Integer x Integer.
;RECORRIDO: List.

(define (date a b c)
  ;Se establece condicionales para comprobar
  ;entradas de numeros enteros
  (if (and (integer? a) (integer? b) (integer? c) (ValidDate a b c))
      ;Caso verdadero se crea lista
      ;representativa de fecha.
      (list a b c)

      ;Caso falso.
      ;Se devuelve lista vacia.
      (append '())
      ))

; IsDate.
; Función que comprueba si una lista es
; una lista date.
;DOMINIO: List.
;RECORRIDO: Bool.

(define (IsDate lista)
  ;Se establece condicional para ver si
  ;la lista cumple condiciones de una
  ;lista date.
  (and (= 3 (length lista)) ;Tamaño de lista
       (map integer? lista) ;lista homogenea de nuemeros enteros.
       (ValidDate (list-ref lista 0) (list-ref lista 1) (list-ref lista 2)) ;Fecha valida
       ))
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; PERTENENCIA:
; IsSocialnetwork.
; Función que comprueba si un elemento entregado
; es un socialnetwork.
;DOMINIO: List
;RECORRIDO: Bool.

(define (IsSocialnetwork elemento)
  ;Se establece condicionales para saber si
  ;cumple con la estructura socialnetwork.
  (if (list? elemento) ;Es una lista.
      ;Caso verdadero.
      ;Se comprueban elementos internos.
      (and (string? (list-ref elemento 0)) ;Nombre de red social.
           (IsDate (list-ref elemento 1))  ;Fecha de creación.
           (string=? ((list-ref elemento 2) "a") "aҗaaaaa") ;Función encrypt.
           (string=? ((list-ref elemento 3) "aҗaaaaa") "a") ;Función decrypt.
           (list? (list-ref elemento 4)) ;Lista de usuarios.
           (list? (list-ref elemento 5)) ;Lista de publicaciones.
           )

      ;Caso falso.
      ;Se entrega falso con la función and.
      (and #f)
      ))
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

; BLOQUE DE EXPORTACIÓN.
; En este bloque se especifican las funciones las cuales se van a
; exportar a otros archivos.
(provide Encryptation)
(provide EncryptFunction)
(provide Decryptation)
(provide DecryptFunction)
(provide date)
(provide ValidDate)
(provide IsDate)
(provide IsSocialnetwork)