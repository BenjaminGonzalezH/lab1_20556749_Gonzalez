#lang scheme

;BLOQUE DE IMPORTACIÓN.
(require "TDAUser_20556749_GonzalezHurtado.rkt")
(require "TDAFecha_20556749_GonzalezHurtado.rkt")
(require "TDASocialnetwork_20556749_GonzalezHurtado.rkt")
(require "socialnetwork_20556749_GonzalezHurtado.rkt")
(require "register_20556749_GonzalezHurtado.rkt")
(require "post_20556749_GonzalezHurtado.rkt")
(require "follow_20556749_GonzalezHurtado.rkt")
(require "share_20556749_GonzalezHurtado.rkt")
(require "comment_20556749_GonzalezHurtado.rkt")
(require "like_20556749_GonzalezHurtado.rkt")
(require "SocialString_20556749_GonzalezHurtado.rkt")
(require "login_20556749_GonzalezHurtado.rkt")

; EJEMPLOS DE USO DE FUNCIONES.
; Se establecen llamados de funciones ejemplificados
; para su correcto uso y algunos casos de pregunta (ej no poner entrada correcta).

;socialnetwork.

(define emptyMB (socialnetwork "My Space" (date 25 10 2021) EncryptFunction DecryptFunction))
(define emptyYT (socialnetwork "Youtube" (date 25 10 2021) EncryptFunction DecryptFunction))
(define emptyTW (socialnetwork "Twitter" (date 25 10 2021) EncryptFunction DecryptFunction))

;register

; Grupal.
(define MB
(register
(register
(register emptyMB (date 25 10 2021) "Juan Granizo" "contraseña")
(date 25 10 2021) "Soy la Bomba" "AdSasdsdsa22") (date 25 10 2021) "UnicaYdetergente" "NadieMeEntiende"))

; Individual
(define YT (register emptyMB (date 25 10 2021) "Goku888" "VegetaEsInferiorAMi"))
(define TW1 (register emptyTW (date 25 10 2021) "PostingMemes" "post"))
(define TW2 (register TW1 (date 25 10 2021) "NoloEntendióTodo" "ofensivo"))

;login +

; follow

(define MB1 (((login MB "UnicaYdetergente" "NadieMeEntiende" follow) (date 27 10 2021)) "Soy la Bomba"))
(define MB2 (((login MB1 "Soy la Bomba" "AdSasdsdsa22"  follow) (date 27 10 2021)) "UnicaYdetergente"))
(define MB3 (((login MB2 "Juan Granizo" "contraseña" follow) (date 27 10 2021)) "UnicaYdetergente"))

; post 

; Sin mención.
(define YT1 (((login YT "Goku888" "VegetaEsInferiorAMi" post) (date 28 10 2021)) "Metahistorias. El SIGNIFICADO OCULTO detrás de las Crisis DC")) 
; Con Mención y siguiendo a usuario.
(define MB4 (((login MB3 "UnicaYdetergente" "NadieMeEntiende" post) (date 28 10 2021)) "Los odio a todos" "Soy la Bomba"))
; Con mención pero sin seguir a la persona.
(define TW3 (((login TW2 "NoloEntendióTodo" "ofensivo" post) (date 28 10 2021)) "Por una nueva constitución" "PostingMemes"))

; share

; Usuario existente
(define MB5 (((login MB4 "UnicaYdetergente" "NadieMeEntiende" share) (date 29 10 2021)) 0 "Soy la Bomba"))
; Usuario existente pero no en lista de contactos.
(define TW4 (((login TW3 "NoloEntendióTodo" "ofensivo" share) (date 29 10 2021)) 0 "PostingMemes"))
; Publicación no existente.
(define YT2 (((login YT1 "Goku888" "VegetaEsInferiorAMi" share) (date 29 10 2021)) 1 "PostingMemes"))

; comment.

; Comentario normal.
(define MB6 ((((login MB5 "Soy la Bomba" "AdSasdsdsa22" comment) (date 29 10 2021)) 0) "Bueno, que este bien"))
(define MB7 ((((login MB6 "Juan Granizo" "contraseña" comment) (date 29 10 2021)) 0) "Bueno, que este bien"))
; Comentario, publicación no existente.
(define YT3 ((((login YT2 "Goku888" "VegetaEsInferiorAMi" comment) (date 29 10 2021)) 1) "Primero"))

; like

(define MB8 (((login MB7 "Juan Granizo" "contraseña" like) (date 29 10 2021)) 0))
(define YT4 (((login YT3 "Goku888" "VegetaEsInferiorAMi" like) (date 29 10 2021)) 0))
(define YT5 (((login YT4 "Goku888" "VegetaEsInferiorAMi" like) (date 29 10 2021)) 1))

; socialnetwork->string

; Usuario.
(define MB9 (login MB8 "UnicaYdetergente" "NadieMeEntiende" socialnetwork->string))
(define MB10 (login MB9 "UnicaYdetergent" "NadieMeEntiende" socialnetwork->string))

; socialnetwork.
(define YT6 ((socialnetwork->string YT5)))