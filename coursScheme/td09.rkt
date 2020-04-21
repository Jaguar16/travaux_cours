;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname td9) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;-------------------------------------------TD 9--------------------------------------


;;------------------------------------EXO 1-------------------------------
;;--------------vecteurs de R2 ---> avec une structure :
(define-struct Vect2d (x y))

(define (vec2d x y) ;; retourne le vecteurs (x, y)
  (make-Vect2d x y))

(define (xcor v)  ;; retourne l'abscisse de v 
  (if (Vect2d? v)
      (Vect2d-x v)
      (error (format "~a n'est pas un vecteur" v))))

(define (ycor v)  ;; retourne l'ordonnée de v 
  (if (Vect2d? v)
      (Vect2d-y v)
      (error (format "~a n'est pas un vecteur" v))))

(define (vec2d? obj)  ;; obj est-il un vecteur ??
  (Vect2d? obj))
;;-----------


(define (vec2d->string v) ;; affiche le vecteurs v (x, y) comme ceci : (x, y)
  (if (vec2d? v)
      (printf "(~a, ~a)" (xcor v) (ycor v))
      (error (format "~a n'est pas un vecteur" v))))

(define (vec+ v1 v2) ;; addition vectorielle
  (vec2d (+ (xcor v1) (xcor v2)) (+ (ycor v1) (ycor v2))))

(define (ext* k v) ;; multiplication par un réel
  (vec2d (* k (xcor v)) (* k (ycor v))))

(define (prodscal v1 v2) ; produit scalaire
  (+ (* (xcor v1) (xcor v2)) (* (ycor v1) (ycor v2))))

(define (norme v)  ; norme du vecteur v
  (sqrt (+ (sqr (xcor v)) (sqr (ycor v)))))

(define (unitaire v)  ; le vecteur unitaire de même sens et direction que le vecteur v
  (ext* (/ 1 (norme v)) v))




;;------------------------------------EXO 2-------------------------------



(define (sigma4 a f s fini?)
  (if 
   (fini? a)
   0
   (+ (f a) (sigma4 (s a) f s fini?))))


(define (sigma5 a f s fini?)
  (local [(define (iter-sigma i acc)
            (if (fini? i)
                acc
                (iter-sigma (s i) (+ (f i) acc))))]
    (iter-sigma a 0)))

;;---c'est cool -->
(define (accumulation a f s fini? op) ; fait l'accumulation par l'opérateur op pour (f a) jusqu'à la fin de a (fini? a)
  (local [(define (iter-sigma i acc)  ;                                                   avec un pas de (s a) .
            (if (fini? i)
                acc
                (iter-sigma (s i) (op (f i) acc))))]
    (iter-sigma (s a) a)))


;(accumulation 10 identity (lambda (x) (add1 x)) (lambda (x) (> x 20)) list)

