;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname td7) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;-------------------------------------TD 7--------------------------------------

;;----------------------------------EXO 1----------------------------------------

          ;; la liste (a (b c) (d ()) e) :
(define L                                    ;; uniquement evec cons        
  (cons "a"
        (cons (cons "b" (cons "c" empty))
              (cons (cons "d" (cons empty empty))
                    (cons "e" empty)))))

(define L1                                  ;; uniquement avec list
  (list "a"
        (list "b" "c")
        (list "d" empty)
        "e"))

(define L2
  '(a (b c) (d ()) e))
