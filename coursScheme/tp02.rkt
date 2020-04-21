;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tp2) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;; ----------------------------------TP 2 -----------------------------------------------


;;-------------------------Exo 1------------------------------------------------------------

(define c
  300000)

(define (einstein u v)
  (/ (+ u v) (+ 1 (/ (* u v) (sqr c)))))

(show (einstein 27E4 25E4))

(show (exact->inexact (einstein 27E4 25E4)))

;;-------------------------Exo 2----------------------------------------------------------

(define (stirling n)
  (* (sqrt (* 2 n pi)) (expt (/ n e) n)))

(show (stirling 5))
(show (stirling 150))

;;---------------------------Exo 3----------------------------------------
;;a)
(define (rand-impair)
  (local [(define n-alea (random 101))]
    (cond ((= n-alea 100) 99)
          ((= n-alea 0) 1)
          ((= (modulo n-alea 2) 1) n-alea)
          (else (+ n-alea 1)))))

;;(show (rand-impair))
;;(show (rand-impair))
(show (rand-impair))


;;b)
(show (+ (random) (random 15 40)))

;;c)
(show (inexact->exact (+ (random) (random 10 20))))

;;d)

(define (cannes)
  (local [(define n-alea (random 2))]
    (if (= n-alea 0)
        3
        5)))

;;(show (cannes))
(show (cannes))

;;e)

(define (monte-carlo)
  (local [(define n-alea (random 3))]
    (cond ((= n-alea 0) 2)
          ((= n-alea 1) 3)
          (else 5))))

;;(show (monte-carlo))
;;(show (monte-carlo))
(show (monte-carlo))

;;f)

(define (las-vegas)
  (local [(define n-alea (random 7))]
    (cond ((= n-alea 0) 3)
          ((>= n-alea 5) 2)
          (else 5))))

;;(show (las-vegas))
;;(show (las-vegas))
(show (las-vegas))

;;-------------------------------Exo 4----------------------------------------

(define (derivee f x)
  (/ (- (f (+ x #i0.0001)) (f x)) #i0.0001))


(show (derivee log 2))

;;c)

(define (deriv f)
  (lambda (x) (derivee f x)))

(show ((deriv log) 2))
(show ((deriv (deriv log)) 2))

;;--------------------------------Exo 5----------------------------------------


(define (bar n)
  (lambda () (* n 2)))

(define (bar-easy n)
  (lambda () 10))

(show ((bar 5)))
(show ((bar-easy 5)))
(show ((bar-easy 17)))


;;--------------------------------Exo 6----------------------------------------



(define (lissage f h)
  (lambda (x) (/ (+ (f (- x h)) (f x) (f (+ x h))) 3)))

(printf " Pour h = 0.001 la version lissée de la valeur absolue en x = 0 est : ~a\n" ((lissage abs 0.001) 0))
(show ((lissage abs 0.001) 0))


;;--------------------------------Exo 7----------------------------------------


(define (u n)
  (if (= n 0)
      1
      (* 1/2 (+ (u (- n 1)) (/ 2 (u (- n 1)))))))

;(printf "(u 8 = ~a\n" (u 8))
;(show (sqrt 2))


;;b) non 


;;--------------------------------Exo 8----------------------------------------


;(define (couple a b)
 ; (lambda (c)
  ;  (if c a b)))

;(define (proj1 t)
  ;(t #t))

;(define (proj2 t)
  ;(t #f))



(define t (couple 2 3))
(show (proj1 t))
(show (proj2 t))








