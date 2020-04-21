;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tp1) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;------------------------------------TP 1------------------------------------


;;----------------exo 2----------------------------

(define (s t)
  (cond ((< t -3) 0)
        ((< t -1) 1)
        ((< t 2) 0)
        ((< t 4) 2)
        (else 0)))

(show (s -5))
(show (s -2))
(show (s 0))
(show (s 3))
(show (s 5))

;(cond ((> 2 3) 4)          apparement un else est nécessaire dans un cond
;      ((> 3 4) 5))


;;----------------exo 3----------------------------

(define (distance x1 y1 x2 y2)
  (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1))))
  )

(show (distance 1 1 4 4))


(define (point-interieur? x y a b r)
  (if (< (distance x y a b) r)
      #t
      #f))


(show (point-interieur? (/ (sqrt 3) 2) 0.5  0 0 1))
(show (point-interieur? (/ (sqrt 3) 2) 0.55  0 0 1))


;;----------------exo 4----------------------------

(define (aire-triangle a b c)
  (local [(define p (/ (+ a b c) 2))]
    (sqrt (* p (- p a) (- p b) (- p c)))))

(show (aire-triangle 3 5 6))
(show (aire-triangle 1 2 3))
(show (aire-triangle 2 5 8))
;;
;;
(define (triangle? a b c)
  (if (real? (aire-triangle a b c))
      #t
      #f))

(show (triangle? 2 5 8))
;;
;;

(define (tranche s b h p)
  (cond ((<= s b) 0)
        ((<= s h) (/ (* p (- s b)) 100))
        (else (/ (* p (- s h)) 100))))

(show (tranche 2500 2000 3000 10))
(show (tranche 4000 2000 3000 10))

;;
;;

(define (impot s)
  (cond ((<= s 8000) 0)
        ((<= s 25000) (tranche s 8000 25000 10))
        (else (+ (tranche s 8000 25000 20) 1700))))

(show (impot 400))
(show (impot 10000))
(show (impot 40000))
;;
;;

(define (sommes-carrés-max a b c)
  (local [(define m-ab (max a b))
          ;(define m-ac (max a c))
          (define m-bc (max b c))]
    (+ (sqr m-ab) (sqr m-bc))))

(show (sommes-carrés-max 4 1 3))
(show (sommes-carrés-max 4 7 9))   
;;
;;

(define (somme n)
  (if (= n 0)
      0
      (+ (somme (- n 1)) n)))

(show (somme 10))
(printf "check (somme 20) : \n")
(check-expect (somme 20) (/ (* 20 (+ 20 1)) 2))








