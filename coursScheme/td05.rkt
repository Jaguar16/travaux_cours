;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname td5) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;-------------td 5---------------------



;;--------------Exo 1--------------------

;a) le quotient de a par b : (/ a b) ou (quotient a b) qui rends la partie entière de (/ a b)
;   le reste de la division de a par b : (modulo a b)
;
;b) Pour obtenir le chiffre des unités d'un entier n en base 10 : (modulo n 10)
;   Pour obtenir le nombre n en supprimant le chiffre des unités de n : (quotient n 10)

;c)
(define (nb-chiffres n)
  (if (= n 0)
      0
      (+ 1 (nb-chiffres (quotient n 10)))))


;;(check-expect (nb-chiffres 897548652130214759632014569785624) 33)

;;--------------Exo 2--------------------!!!!!

;Soient d et n deux entiers ≥ 1. On dit que d est un « diviseur strict » de n si d divise n et si d < n
;Par exemple les diviseurs stricts de 6 sont 1, 2, et 3. Un nombre entier n ≥ 2 est dit « parfait » s’il est égal à la somme de ses
;diviseurs stricts. Par exemple, 6 est parfait (6 = 1+2+3) mais 8 ne l’est pas (8 ≠ 1+2+4). 

(define (parfait? n)
  (and (>= n 2) (= n (somdiv n 1)))) 

(define (somdiv n k)        ; la somme des diviseurs stricts de n dans [k,n-1]
  (cond ((= k n) 0)
        ((zero? (modulo n k)) (+ k (somdiv n (+ k 1))))   ; k est diviseur !
        (else (somdiv n (+ k 1)))))

(check-expect (parfait? 6) #t)
(check-expect (parfait? 8) #f)

(define (nb-parfaits n)     ; nombre d'entiers parfaits dans [1,n]
  (cond ((< n 6) 0)         ; 6 est le plus petit parfait...
        ((parfait? n) (+ 1 (nb-parfaits (- n 1))))
        (else (nb-parfaits (- n 1)))))

(printf "Jusqu'a 1000, il y a ~a nombres parfaits.\n" (nb-parfaits 1000))

; Pour calculer ces nombres parfaits, il suffit de savoir calculer le plus petit
; nombre parfait superieur à n :

(define (parfait-suivant n)    ; le plus petit parfait > n
  (if (parfait? (+ n 1))
      (+ n 1)
      (parfait-suivant (+ n 1))))

(define p1 (parfait-suivant 1))
(define p2 (parfait-suivant p1))
(define p3 (parfait-suivant p2))    ; au-dela, ca commence a etre lent...
(printf "Ce sont ~a, ~a et ~a\n" p1 p2 p3)
; https://fr.wikipedia.org/wiki/Nombre_parfait


;;--------------Exo 3--------------------

(define (sierpinsky n)
  (local [(define sier (triangle 20 "solid" "red"))]
    (if (= n 0)
        (above sier (beside sier sier))
        (above (sierpinsky (- n 1)) (beside (sierpinsky (- n 1)) (sierpinsky (- n 1)))))))



;;--------------Exo 4-------------------- 


(define (partitions n m)
  (cond ((< n 0) 0)
        ((= n 0) 1)
        ((= m 0) 0)
        (else (+ (partitions (- n m) m) (partitions n (- m 1))))))

(show (partitions 7 3))


