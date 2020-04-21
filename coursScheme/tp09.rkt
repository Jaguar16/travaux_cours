;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tp9) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #t #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))

;;-------------------------------------------TP 9-------------------------------------

(define ($fac n)
  (apply * (build-list n add1)))

(define (accumulation a f s fini? op) ; fait l'accumulation par l'opérateur op pour (f a) jusqu'à la fin de a (fini? a)
  (local [(define (iter-sigma i acc)  ;                                                   avec un pas de (s a) .
            (if (fini? i)
                acc
                (iter-sigma (s i) (op (f i) acc))))]
    (iter-sigma (s a) a)))


;;-------------------------------------------EXO 1--------------------------------------


(printf "\nune approximation de e par une série de taylor : ~a"
        (apply + (map (lambda (k) (/ (expt 1 k) (fac k))) (build-list 16 (lambda (x) x)))))



(define (gregory n)
  (apply + (build-list n (lambda (n) (/ (* 4 (expt (- 1) n)) (+ (* 2 n) 1))))))

;(printf "\nune approximation de pi par la formule de leibniz-gregory : ~a"
;        (gregory 100))

(define (integrale f a b n) ;; (b-a)/n * somme pour k=0 à n-1 f( a + ((b-a)/n)*k  !!
  (* (/ (- b a) n) (apply + (build-list n (lambda (k) (f (+ a (* (/ (- b a) n) k))))))))

;;-------------------------------------------EXO 2--------------------------------------


;;On represente les vecteurs de Rn par une liste de n éléments
(define ($vec+ v1 v2)
  (map (lambda (x1 x2) (+ x1 x2)) v1 v2))

(define ($vec2+ v1 v2)
  (map + v1 v2))


  
(define ($ext* k v)
  (map (lambda (x) (* k x)) v))


(define ($prodscal v1 v2)
  (apply + (map (lambda (x1 x2) (* x1 x2)) v1 v2)))

(define ($prodscal2 v1 v2)
  (apply + (map * v1 v2)))

;;-------------------------------------------EXO 3--------------------------------------

;; filter --> récursive enveloppée

(define ($filter pred? L)
  (if (empty? L)
      '()
      (if (pred? (first L))
          (cons (first L) ($filter pred? (rest L)))
          ($filter pred? (rest L)))))

;; filter --> itérative

(define ($filter-i pred? L)
  (local [(define (filter-iter L L-filtré)
            (if (empty? L)
                L-filtré
                (if (pred? (first L))
                    (filter-iter (rest L) (cons (first L) L-filtré))
                    (filter-iter (rest L) L-filtré))))]
    
    (reverse(filter-iter L null))))

;;-------------------------------------------EXO 4--------------------------------------

(define (maxListe L)
  (apply max L))

;;-------------------------------------------EXO 5--------------------------------------

(define ($andmap pred? L)
  (if (empty? L)
      #t
      (if (pred? (first L))
          ($andmap pred? (rest L))
          #f)))
      
(define ($ormap pred? L)
  (if (empty? L)
      #f
      (if (pred? (first L))
          #t
          ($ormap pred? (rest L)))))