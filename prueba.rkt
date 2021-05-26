; DESCRIPCIÓN GENERAL.
; En este archivo se guardan la funcion influencers.

; Se le da a entender al interprete el uso de lenguaje scheme.
#lang scheme

; BLOQUE DE IMPORTACIONES

; Influencers.
; Se define función influencers como aquella
; que rankea a los usuarios con una función
; secundarias de rankeo.

(definen (Influencers socialn rankingfun integer)
  ;Se comprueba el ingreso de datos.
  (if (and (IsSocialnetwork socialn) (procedure? rankingfun)
      (integer? integer))
      ;Caso verdadero.
      ;Se realiza proceso de flitrado en
      ;la lista de usuarios.
      (rankingfun integer (list-ref socialn 4))

      ;Caso falso
      ;Se entrega lista vacia
      ('())
      )
  )