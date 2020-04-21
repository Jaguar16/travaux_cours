;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tp8) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;-----------------------------------------------TP 8----------------------------------------------------


;;----------------------------------------------EXO 1-----------------------------------------------------------

(define (len&som L)
  (local [(define (iter L acc_len acc_sum)
            (if (empty? L)
                (list acc_len acc_sum)
                (iter (rest L) (add1 acc_len) (+ (first L) acc_sum))))]
    (iter L 0 0)))


;;----------------------------------------------EXO 2-----------------------------------------------------------

; Calcul de la racine carrée approchée de r > 0, 
; h gouverne la précision, et a est l'approximation initiale,
; n est le nombre de boucle que va faire la fonction iter.
(define (rac2 r a h)
  (local [
          (define 
            (iter a n)
            (if (assez-bonne? a n)
                (list a n)
                (iter (ameliore a n) (add1 n))))
          (define 
            (assez-bonne? a n)
            (< (abs (- (sqr a) r)) h))
          (define 
            (ameliore a n)
            (* #i0.5 (+ a (/ r a))))
          ]
    (iter a 0)))

;;----------------------------------------------EXO 3-----------------------------------------------------------

; Calcul d'une racine d'une fonction dérivable
; h gouverne la précision, et a est l'approximation initiale,
(define (une-racine f a h)
  (local [
          (define 
            (iter a)
            (if (assez-bonne? a)
                a
                (iter (ameliore a))))
          (define 
            (assez-bonne? a)
            (< (abs (f a)) h))
          (define 
            (ameliore a)                                 ; si x est une approximation de f(x) = 0 alors
            (- a (/ (f a) (/ (- (f (+ a h)) (f a)) h)))) ; x - (f(x)/f'(x)) est une meilleure approximation
          ]
    (iter a)))



;;b) Pour obtenir une approximation de pi : Quelle est la fonction telle que f(pi) = 0 ?  ---> la fonction sin
(printf "\nune approximation de pi : (une-racine sin 3 1e-8) = ~a" (une-racine sin 3 #i1e-8))

; f(1**1/2)==0 ? ------> f(x) = x**2 - 2. [(- (sqr x) 2)]

(printf "\nune approximation de racine carré de 2 : ~a" (une-racine (lambda (x) (- (sqr x) 2)) 1 #i1e-8))
(printf "\nune approximation de la racine 3ème de 2 : ~a" (une-racine (lambda (x) (- (expt x 3) 2)) 1 #i1e-8))

;; point fixe du cos, solution de cos(x) = x
;;  ==> cos(x) - x = 0 
(printf "\nLe point fixe du cosinus, solution de cos(x) = x : ~a\n" (une-racine (lambda (x) (- (cos x) x)) 1 #i1e-8))


;;----------------------------------------------EXO 4-----------------------------------------------------------


(define (miro n)
  (local [(define FOND (empty-scene 200 200 'black))
          
          (define (couleur_random)      ;; prends une couleur aleatoire
            (random 256))
          (define (position-aleatoire)
            (random 201))
          
          (define (cercle) (ellipse 20 20 'solid (make-color (couleur_random) (couleur_random) (couleur_random))))

          (define (iter i acc)
            (if (= i 0)
                acc
                (iter (- i 1) (place-image (cercle) (position-aleatoire) (position-aleatoire) acc))))]

    (iter n FOND)))


;;----------------------------------------------EXO 5-----------------------------------------------------------


(define (ppdiv>= n k)      ; le plus petit diviseur de n qui soit >= k
  (if (zero? (modulo n k)) 
      k
      (ppdiv>= n (+ k 1))))

(define (premier? n)
  (and (>= n 2) (= (ppdiv>= n 2) n)))


(define p
  (lambda (x) (+ (sqr x) x 41)))


(define (poly-premier f)  ; calcul le plus petit entier n > 0 tel que f(n) ne soit pas premier
  (local [
          (define (iter n)
            (if (not (premier? (f n)))
                n
                (iter (add1 n))))]
    (iter 0)))



(printf "\nExo 5:\nLe plus petit n tel que p(n) ne soit pas premier est : ~a .\nEn effet p(~a) = ~a , qui n'est pas premier"
        (poly-premier p)
        (poly-premier p)
        (p (poly-premier p)))
