;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tp4) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;----------------------------TP 4-------------------------------

;;---------------------------EXO 1------------------------------------

(define (horloge-numerique T)
  (local [(define L 300)

          (define H 200)
          (define FOND (empty-scene L H "white"))

          (define (suivant t)
            (+ t 1))

          (define (dessine t)
            (place-image (text (number->string t) 150 "blue") (/ L 2) (/ H 2) FOND))

          (define (final? t)
            (> t T))]


    (big-bang 0
      (on-tick suivant 1)
      (on-draw dessine)
      (stop-when final?))))

;;---------------------------EXO 2------------------------------------cor



(define (brownien N)              ; N pas aleatoires d'une particule
  (local [(define SIZE 200)       ; taille de la scene carree
          (define BALLE (circle 6 'solid "red"))
          ; Le monde est le quadruplet (x,y,img,n) ou x,y est la position, img l'image
          ; deja obtenue et n le nombre de pas deja faits.
          (define-struct monde (x y img n))
          (define INIT
            (make-monde (/ SIZE 2) (/ SIZE 2) (rectangle SIZE SIZE 'solid "yellow") 0))
          (define (suivant m)      ; Monde --> Monde
            (local [(match-define (monde x y img n) m)      ; with structs, match-define is your friend
                    (define xs (+ x (- (random 11) 5)))     ; position suivante de la particule
                    (define ys (+ y (- (random 11) 5)))]
              (make-monde xs ys (scene+line img x y xs ys "black") (add1 n))))
          (define (dessiner m)     ; Monde --> Scene
            (local [(match-define (monde x y img n) m)]
              (place-image (text (number->string n) 18 "black")
                           180 20 (place-image BALLE x y img))))
          (define (final? m)
            (> (monde-n m) N))]
    (big-bang INIT
              (on-tick suivant)
              (on-draw dessiner) 
              (stop-when final?)
              (name "Brownian motion"))))



;;-----------------------------EXO 3------------------------------------

;(define L 300)
;
;(define H 300)
;
;(define SCENE (underlay
;               (empty-scene L H "white")
;               (circle (/ L 2) "outline" "red")))
;
;(define (suivant alpha)
;  (+ alpha 6))
;
;(define (dessine alpha)
;  (scene+line SCENE (/ L 2) (/ H 2) (+ (/ L 2) (cos alpha)) (+ (/ H 2) (sin alpha)) "black"))
;
;
;(big-bang 0
;      (on-tick suivant 1)
;      (on-draw dessine))

;;-----------------------------EXO 3------------------------------------cor



(define (horloge-analogique)     ; qui ne stoppe jamais !    
  (local [(define SIZE 200)
          (define C (/ SIZE 2))
          (define MONTRE
            (frame (place-image  (underlay (circle C 'solid "black")
                                           (circle (- C 5) 'solid "white")
                                           (circle 10 'solid "black"))
                                 C C
                                 (rectangle SIZE SIZE 'solid "lightgray"))))
          (define AIGUILLE
            (above (line 1 (- C 20) (make-pen "red" 3 'solid 'round 'round))  ; l'aiguille verticale visible,
                   (line 1 (- C 20) (make-color 0 0 0 0))))                   ; et une autre transparente.
          ; Le Monde est l'angle a de l'aiguille par-rapport a la verticale, en degres
          (define INIT 0)
          (define da (* (/ pi 30) (/ 180 pi)))        ; 1 seconde de temps <==> da degres 
          (define (suivant a)
            (- a da))                      ; attention au sens direct en programmation !
          (define (dessiner a)
            (local [(define t (inexact->exact (round (- (/ a da)))))]   ; le nombre de secondes depuis le debut
              (above (place-image (rotate a AIGUILLE) C C MONTRE)
                     (text (number->string t 2) 32 "blue"))))]
    (big-bang INIT
              (on-tick suivant 1)
              (on-draw dessiner)
              (name "Geek's clock"))))

(printf "Stoppez l'horloge manuellement ! <---------------------------------------\n")
(show (horloge-analogique))

