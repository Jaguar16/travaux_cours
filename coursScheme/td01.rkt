;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname td1) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;;----------------------------TD 1 ------------------------------------
;;;--------------- Exo 3--------------------

(define (k2 x)
  2)

(printf "(k2 4) = ~a\n" (k2 4))
;;
;;

(define (id x)
  x)

(printf "(id 12) = ~a\n" (id 12))
;;
;;

(define (somme_carre x y)
  (if (and (integer? x) (integer? y))
       (+ (* x x) (* y y))
       #f))

(printf "(somme_carre 2 2) = ~a\n" (somme_carre 2 2))
;;
;;

(define (multiple? n d)
  (if (= (modulo n d) 0)
      #t
      #f))

(printf "(multiple? 16 4) ==> ~a\n" (multiple? 16 4))
;;
;;

(define (naturel? x)
  (if (and (integer? x) (>= x 0))
      #t
      #f))

(printf "(naturel? 12) ==> ~a\n" (naturel? 12))
(printf "(naturel? 'non') ==> ~a\n" (naturel? "non"))
;;
;;

(define (sphere_volume R)
  (* 4 pi 1/3 R R R))

(printf "(sphere_volume 1) = ~a\n" (sphere_volume 1))
;;
;;

(define (signe x)
  (cond ((> x 0) 1)
        ((= x 0) 0)
        (else -1)))

(printf "(signe -3) = ~a\n" (signe -3))
(printf "(signe 0) = ~a\n" (signe 0))
(printf "(signe 3) = ~a\n" (signe 3))
;;
;;

(define (f x)
  (local [(define x2 (* x x))]
    (/ (sin x2) x2)))

(printf "(f 2) = ~a\n" (f 2))
;;
;;

(define (g x)
  (local [(define x2 (* x x))
          (define sinx2 (sin x2))]
    (/ sinx2 (+ x2 sinx2))))

(printf "(g 2) = ~a\n" (g 2))