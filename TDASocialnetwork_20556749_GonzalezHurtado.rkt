; Se le da a entender al interprete el uso del lenguaje scheme.
#lang scheme

; DESCRIPCION GENERAL.
; Este archivo guarda el TDA socialnetwork y sus funciones relacionadas.
; El proposito de esto es documentar la estructura interna del tipo de dato
; abstracto pensado para la implementación del laboratorio, las funciones de
; propias del TDA y encriptado de información.

; El TDA socialnetwork es una estructura que representa a la red social
; que el usuario maneja y esta se representa como una lista heterogenea.

(define socialnetwork '("facebook" (10 07 2000) procedureEncriptado procedureDesencriptado '(User) '(Post)))

; Esta lista esta conformada por el nombre de la red social como un string,
; la fecha de su creación armada por la función Date que termina entregando una
; lista de enteros, los procesos de encriptado y desencriptado de información
; (funciones o procesos) y dos listas de 2 subestructuras del TDA que tendrán
; su propia organización interna.

; BLOQUE DE IMPORTACIÓN.
; Se piden funciones del TDA fecha.
(require "TDAFecha_20556749_GonzalezHurtado.rkt")
(require "TDAUser_20556749_GonzalezHurtado.rkt")

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

(define (encryptFunction S)
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

(define (decryptFunction S)
  ;Se comprueba que sea un string el elemento de entrada.
  (if (string? S) 
      ;Caso verdadero: se realiza el proceso de desencriptado.
      (Decryptation S)

      ;En el caso falso se entrega un string vacio.
      (string #\u0020)
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
;SELECTORES.

; NameSocial.
; Se define función otorga el nombre de socialnetwork.
;DOMINIO: Socialnetwork.
;RECORRIDO: String.

(define (NameSocial socialn)
  ;Se comprueba si se recibe un socialnetwork.
  (if (IsSocialnetwork socialn)
      ;Caso verdadero.
      ;Se entrega nombre de red social.
      (car socialn)

      ;Caso falso.
      ;Se entrega string de error.
      "No es socialnetwork"
      )
  )

; DateSocial.
; Se define función otorga decha de creación de socialnetwork.
;DOMINIO: Socialnetwork.
;RECORRIDO: Date.

(define (DateSocial socialn)
  ;Se comprueba si se recibe un socialnetwork.
  (if (IsSocialnetwork socialn)
      ;Caso verdadero.
      ;Se entrega fecha de creación de red social.
      (car (cdr socialn))

      ;Caso falso.
      ;Se entrega un date de error.
      (date 2 1 1930)
      )
  )

; EncrySocial.
; Se define función otorga función de encriptado de socialnetwork.
;DOMINIO: Socialnetwork.
;RECORRIDO: procedure.

(define (EncrySocial socialn)
  ;Se comprueba si se recibe un socialnetwork.
  (if (IsSocialnetwork socialn)
      ;Caso verdadero.
      ;Se entrega función de encriptado.
      (car (cddr socialn))

      ;Caso falso.
      ;Se entrega función map.
      map
      )
  )

; DecrySocial.
; Se define función otorga función de desencriptado de socialnetwork.
;DOMINIO: Socialnetwork.
;RECORRIDO: procedure.

(define (DecrySocial socialn)
  ;Se comprueba si se recibe un socialnetwork.
  (if (IsSocialnetwork socialn)
      ;Caso verdadero.
      ;Se entrega función de desencriptado.
      (car (cdddr socialn))

      ;Caso falso.
      ;Se entrega función map.
      map
      )
  )

; UserSocial.
; Se define función otorga lista de usuarios de socialnetwork.
;DOMINIO: Socialnetwork.
;RECORRIDO: list.

(define (UserSocial socialn)
  ;Se comprueba si se recibe un socialnetwork.
  (if (IsSocialnetwork socialn)
      ;Caso verdadero.
      ;Se entrega lista de usuarios.
      (car (cddddr socialn))

      ;Caso falso.
      ;Se entrega lista vacia.
      '()
      )
  )

; PostSocial.
; Se define función otorga lista de publicaciones de socialnetwork.
;DOMINIO: Socialnetwork.
;RECORRIDO: list.

(define (PostSocial socialn)
  ;Se comprueba si se recibe un socialnetwork.
  (if (IsSocialnetwork socialn)
      ;Caso verdadero.
      ;Se entrega lista de post.
      (car (reverse socialn))

      ;Caso falso.
      ;Se entrega lista vacia.
      '()
      )
  )
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; BUSQUEDA.
; ExistBefore.
; Función que comprueba si un usuario existe con
; anterioridad en una socialnetwork en base a nombres.
;DOMINIO: List of Users x String.
;RECORRIDO: Bool.
;RECURSIÓN: Natural.
;NOTA: el booleano entregado sigue la pregunta
;"¿El nombre dado por entrada no existe en ningún
;usuario de la lista?"

(define (ExistBefore lista nombre)
  ;Se establece caso base de recursión de la función.
  (if (= (length lista) 0)
      ;Caso verdadero.
      ;Si no se encontro ningun usuario
      ;igual al usuario que se desea ingresar se
      ;entrega un verdadero.
      (and #t)

      ;Caso falso.
      ;Se comprueba si el elemento actual es
      ;igual al nombre.
      (if (string=? (NameUser (car lista)) nombre)
          ;Caso verdadero
          ;Se retorna una operación que da falso.
          (and #f)

          ;Caso falso.
          ;Se llama de nuevo a la función.
          (ExistBefore (cdr lista) nombre)
          )
      )
  )

; ValidUser
; Se define función que comprueba si un usuario existe en la
; red social y la contraseña relacionada a el es correcta.
;DOMINIO: List of User x String x String.
;RECORRIDO: Bool.
;RECURSIÓN: Natural.

(define (ValidUser list user pass)
  ;Se define caso base para recursión.
  (if (= (length list) 0)
      ;Caso verdadero.
      ;Si no se encontro ningún usuario existente
      ;entonces se retorna falso.
      (and #f)

      ;Caso falso.
      ;Se comprueba si el usuario y contraseña
      ;coinciden con el elemento actual de lista
      ;evaluado.
      (if (and (string=? (NameUser (car list)) user)
               (string=? (PassUser (car list)) pass))
          ;Caso verdadero.
          ;Se retorna verdadero.
          (and #t)

          ;Caso falso.
          ;Se llama de nuevo a la función con la lista
          ;acortada.
          (ValidUser (cdr list) user pass)
          )
      )
  )

; SearchUser
; Se define función que busca un usuario y lo
; entrega para su manipulación.
;DOMINIO: list x name.
;RECORRIDO: User.
;RECURSIÓN: Natural.

(define (SearchUser ListUsers name)
  ;Se establece caso base.
  ;Fin de la lista.
  (if (= (length ListUsers) 0)
      ;Caso verdadero.
      ;Se entrega un usuario estandar de error.
      (Create_User "MalaEntrada" "EntradaIncorrecta" (date 1 1 1931) '() '() '())

      ;Caso falso.
      ;Se comprueba si el ususario actual en evaluación
      ;es el que se esta buscando.
      (if (string=? (NameUser (car ListUsers)) name)
          ;Caso verdadero.
          ;Se entrega ese usuario.
          (car ListUsers)

          ;Caso Falso.
          ;Se llama otra vez a la función.
          (SearchUser (cdr ListUsers) name)
          )
      )
  )

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; BLOQUE DE EXPORTACIÓN.
; En este bloque se especifican las funciones las cuales se van a
; exportar a otros archivos.
(provide Encryptation)
(provide encryptFunction)
(provide Decryptation)
(provide decryptFunction)
(provide IsSocialnetwork)
(provide NameSocial)
(provide DateSocial)
(provide EncrySocial)
(provide DecrySocial)
(provide UserSocial)
(provide PostSocial)
(provide ExistBefore)
(provide ValidUser)
(provide SearchUser)