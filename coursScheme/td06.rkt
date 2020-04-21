;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname td6) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;-------------------------------------TD 6-------------------------------------

;;----------------------------EX0 1--------------------------------

;(define (tri-ins L)
;  (if (empty? L) L
;      (insertion (first L) (tri-ins (rest L)))))


(define (tri-ins L rel?) 
  (if (empty? L)
      L
      (insertion (first L) (tri-ins (rest L) rel?) rel?)))


(define (insertion x LT rel?)        ; rel? est une relation d'ordre
  (cond ((empty? LT) (list x))
        ((rel? x (first LT)) (cons x LT))
        (else (cons (first LT) (insertion x (rest LT) rel?)))))


;;----------------------------EX0 2--------------------------------


(define ($range start end step)
  (if (>= start end)
      (list)
      (cons start (rest ($range start (- end step) step)))))

($range 10 20 2)