;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tp5) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;----------------------------TP 5------------------------------------------------------
;;-------------------Exo 1-------------------------------

(define (somme-carres-pas_de_2 n)
  (if (<= n 1)
      1
      (+ (somme-carres-pas_de_2 (- n 2)) (sqr n))))

(define (somme-entier a b)  ;; somme des entiers de a à b avec b > a
  (if (> a b)
      0
      (+ (somme-entier a (- b 1)) b)))




       
;;-------------------Exo 2-----------------------------


(define (interfac a b)
  (local [(define s-a b)
           (define s-b a)]
    (cond ((= a b) a)
          ((> a b) (* s-b (interfac s-a (- s-b 1))))
          (else (* b (interfac a (- b 1)))))))
          

(define (fac_2 n)
  (interfac 1 n))

;;cela represente le nombre d'arrangement de 52 éléments pris 13 à 13 .

(printf "\nil y a ~a mains de 13 cartes dans un jeu de 52 cartes\n" (/ (fac 52) (fac (+ 52 -13))))



(define (combinaison p n)
  (/ (fac n) (* (fac p) (fac (- n p)))))



(printf "\nZidane peu faire ~a équipes de 11 joueurs dans un effectif de 18 players\n" (* (combinaison 5 10) (combinaison 5 8)))


;;-------------------Exo 3-----------------------------


(define (integrale f a b h)
  (if (> a b)
      0
      (+ (* h (f a)) (integrale f (+ a h) b h))))






;;-------------------Exo 4-----------------------------

(define (somme-chiffres n)
  (if (< n 10)
      n
      (+ (modulo n 10) (somme-chiffres (quotient n 10)))))


(show (somme-chiffres 9876))


(define (somme-chiffres-b n b) ;; somme des chiffres de n en base b
  (if (< n b)
      n
      (+ (modulo n b) (somme-chiffres-b (quotient n b) b))))


(show (somme-chiffres-b 9876 2))


(define (nb1 n)
  (somme-chiffres-b n 2))


(define (nb-zero n)
  (if (not (= 0 (modulo n 10)))
      0
      (+ 1 (nb-zero (quotient n 10)))))





