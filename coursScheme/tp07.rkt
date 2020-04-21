;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tp7) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;---------------------------------TP 7 ------------------------------------------


;;------------------------------EXO 1----------------------------------------



(define (scission L)
  (cond ((empty? L) (list empty empty))
        ((empty? (rest L)) (list L empty))
        (else (local [(define HR (scission (rest (rest L))))]
                (list (cons (first L) (first HR))
                      (cons (second L) (second HR)))))))



(define (fusion LT1 LT2)
  (cond ((empty? LT1) LT2)
        ((empty? LT2) LT1)
        ((<= (first LT1) (first LT2)) (cons (first LT1) (fusion (rest LT1) LT2)))
        (else (cons (first LT2) (fusion LT1 (rest LT2))))))


;; On peut reécrire fusion en Python avec le meme code.
;; on aura juste à definir les fonctions empty, first, rest et cons



(define (tri-fusion L)
  (if (<= (length L) 1)
      L
      (local [(define cut (scission L))
              (define L1 (first cut))
              (define L2 (second cut))
              ]

        (fusion (tri-fusion L1) (tri-fusion L2)))))


(define (L-random n)
  (build-list n (lambda (i) (random -100 100))))



(define (test-tri-fusion n)
  (time (void (tri-fusion (L-random n)))))


(define (intervalle a b)
  (build-list (+ (- b a) 1) (lambda (x) (+ x a))))

(define (suppr-mult k l)
  (if (empty? l)
      empty
      (if (= (modulo (first l) k) 0)
          (suppr-mult k (rest l))
          (cons (first l) (suppr-mult k (rest l))))))

(define (crible-liste l m)
  (if (or (empty? l) (> (sqr (first l)) m))
      l
      (cons (first l)
            (crible-liste (suppr-mult (first l) (rest l)) m))))

(define (crible-liste l m)
  (if (or (empty? l) (> (sqr (first l)) m))
      l
      (cons (first l)
            (crible-liste (suppr-mult (first l) (rest l)) m))))

(define (crible-era n)
  (crible-liste (intervalle 2 n) n))