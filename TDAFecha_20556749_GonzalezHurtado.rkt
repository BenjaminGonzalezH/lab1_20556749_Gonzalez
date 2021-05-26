;Se le da a entender al interprete el uso de lenguaje scheme 
#lang scheme

; DESCRIPCION GENERAL.
; Este archivo guarda el TDA fecha, el cual esta presente en todas
; las estructuras TDA, junto con sus funciones de construcción y otras
; acciones.

; Date.
; El TDA date es solo una estructura formada por una lista de enteros que posee.
; el dia mes y año.

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; CONSTRUCTOR.
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
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; PERTENENCIA.
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
; BLOQUE DE EXPORTACIÓN.
; En este bloque se especifican las funciones las cuales se van a
; exportar a otros archivos.
(provide ValidDate)
(provide date)
(provide IsDate)