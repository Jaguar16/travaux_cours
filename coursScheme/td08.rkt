;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname td8) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;------------------------------TD 8----------------------------------


;;------------------------------EXO 1-----------------------------------------------


(define (odd-numbers L)
  (local [(define (iter L2 acc)
            (if (empty? L2)
                acc
                (if (odd? (first L2))
                    (iter (rest L2) (cons (first L2) acc))
                    (iter (rest L2) acc))))]
    (reverse (iter L empty))))

;;------------------------------EXO 2-----------------------------------------------

(define (len&som L)
  (local [(define (iter L2 acc_len acc_sum)
            (if (empty? L2)
                (list acc_len acc_sum)
                (iter (rest L2) (add1 acc_len) (+ (first L2) acc_sum))))]
    (iter L 0 0)))

(define (moyenne L)
  (local [(define l&s (len&som L))]
    (/ (second l&s) (first l&s))))