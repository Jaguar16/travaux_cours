;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tp10) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;----------------------------------------TP 10--------------------------------
;; Schema :----->                      il faut déterminer ?? et fusion
;;                   (define (fr A)
;                        (if (feuille? A)
;                            ??
;                            (fusion (racine (fr (fg A) (fr (fd A))))))
;;---------------------------------------EXO 1----------------------------------

(define (compter A op)   ;; A est arbre , op un opérateur; La fonction compte le nbre d'apparition de l'opérateur op
  (if (feuille? A)
      0
      (if (equal? (racine A) op)
          (+ 1 (compter (fg A) op) (compter (fd A) op))
          (+ (compter (fg A) op) (compter (fd A) op)))))


(define (transformer A op1 op2) ;; A--> arbre ; change les op1 en op2 dans l'arbre A
  (if (feuille? A)
      A
      (if (equal? (racine A) op1)
          (arbre op2 (transformer (fg A) op1 op2) (transformer (fd A) op1 op2))
          (arbre (racine A) (transformer (fg A) op1 op2) (transformer (fd A) op1 op2)))))


;;---------------------------------------EXO 2----------------------------------

(define (valeur A)   
  (if (feuille? A)
      A
      (local [(define r (racine A))
              (define vg (valeur (fg A))) 
              (define vd (valeur (fd A)))]
        (cond ((equal? r '+) (+ vg vd))
              ((equal? r '-) (- vg vd))
              ((equal? r '*) (* vg vd))
              ((equal? r '/) (/ vg vd))
              (else (error "valeur : opérateur inconnu : " r
                           ))))))



(define (arbre->prefixe A)     ; Arbre --> Liste
  (if (feuille? A)
      (list A)
      (cons (racine A)
            (append (arbre->prefixe (fg A)) (arbre->prefixe (fd A))))))



(define (remplacer A AL)
  (if (and (symbol? A) (feuille? A))
      (if (equal? A (first (first AL)))
          (second (first AL))
          (remplacer A (rest AL)))

      (cond [(equal? (fg A) (first (first AL))) (arbre (racine A) (second (first AL)) (fd AL))]
            [(equal? (fd A) (first (first AL))) (arbre (racine A) (fg A) (second (first AL)))]
            [else (arbre (racine A) (remplacer (fg A) AL) (remplacer (fd A) AL))]
            )))

;(remplacer '(+ (* (- x 8) y) x) '((x 3) (y 2)))

;;---------------------------------EXO autres hors tp-------------------------------------------

(define (nb-feuilles A)
  (if (feuille? A)
      1
      (+ (nb-feuilles (fg A)) (nb-feuilles (fd A)))))


(define (nb-noeuds A)
  (if (feuille? A)
      1
      (+ 1 (nb-noeuds (fg A)) (nb-noeuds (fd A)))))

(define (hauteur A)
  (if (feuille? A)
      0
      (+ 1 (max (hauteur (fg A)) (hauteur (fd A))))))









