;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tp6) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;;--------------------------------------TP 6------------------------------------
;
;
;;(define (f L)
;;  (if (empty? l)
;;      ??
;;      (fusion (first L) (f (rest L))))))
;;
;;il faudra trouvé fusion et ??
;;
;;
;
;
;
;;;---------------------EXO 1----------------------------

(define (somme L)
  (if (empty? L)
      0
      (+ (first L) (somme (rest L)))))


(somme '(1 2 3 4 5 6 7 8 9 10))


(define (moyenne L)
  (/ (somme L) (length L)))

(moyenne '(1 2 3 4 5 6 7 8 9 10))



(define (longueur L)
  (if (empty? L)
      0
      (+ 1 (somme (longueur L)))))


(define (somme-longueur L)
  (if (empty? L)
      (list 0 0)
      (local [(define REC (somme-longueur (rest L)))]
        (list (+ (first L) (first REC))
              (+ 1 (second REC))))))


(define (average L)
  (if (empty? L)
      0
      (local [(define SL (somme-longueur L))]
        (/ (first SL) (second SL)))))



---------------------EXO 2----------------------------

(define (entiers n)
  (build-list (+ n 1) (lambda (x) x)))


(entiers 12)


(define (intervalle a b)
  (build-list (+ (- b a) 1) (lambda (x) (+ x a))))

(intervalle 12 37)

(define (Lrandom n max)
  (build-list n (lambda (x) (random max))))

(show (Lrandom 5 100))



(define (insertion x LT)
  (cond ((empty? LT) (list x)) ; (list x) ⬄ (cons x empty)
        ((< x (first LT)) (cons x LT))
        (else (cons (first LT) (insertion x (rest LT))))))



(define (tri-ins L)
  (if (empty? L)
      L
      (insertion (first L) (tri-ins (rest L)))))




(define (test-tri-ins n)
  (time (void (tri-ins (Lrandom n 100)))))




(define (test-sort n)
  (time (void (sort (Lrandom n 100) <))))








