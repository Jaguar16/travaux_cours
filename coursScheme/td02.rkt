;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname td2) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;-----------------------------------TD 2---------------------------

;;----Ex0 1 ---

((lambda (x y) (+ x (sqrt (- y 1)))) 1 0.6)
(define (h)
  (lambda (x y) (+ x (sqrt (- y 1)))))

(show ((h) 1 0.6))

(define (h2 x y)
  (+ x (sqrt (- y 1))))

(show (h2 1 0.6))

;; les parametres sont les variables[muettes] au moment où on les définit. Par exemple x et y dans (define (h2 x y )) plus haut.
;; les arguments sont les expressions qui vont être évaluées au moment de l'appel de la fonction [elles deviendront les valeurs des parametres]
;; Par exemple 1 et 0.6 sont les arguments de la fonction h2 dans (h2 1 0.6) .

;;----Exo 2 3 4 5 6 triviaux

(define-struct balle (p dx dy))
(define p
  (make-posn 5 8))

;; Racket vient de définir automatiquement 5 fonctions :
;; ---> make-balle ; balle? ; balle-p ; balle-dx ; balle-dy

(define B
 (make-balle p 0.5 4))


















