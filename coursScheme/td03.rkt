;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname td3) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;------------------------------TD 3-------------------------


;;----------------Exercice 1-----------------------------

(define IMG
  (frame
   (underlay
    (circle 25 "solid" "red")
    (line 50 50 "black")
    (line 50 -50 "black"))))


;;----------------Exercice 2-----------------------------


(define PANNEAU
  (local [(define Diametre (line 100 0 "red"))]
    (above (underlay
            (circle 50 "outline" "blue")
            (circle 50 "solid" "yellow")
            (rotate 45 Diametre)
            (rotate -45 Diametre))
           (rectangle 15 100 "solid" "black"))))


;;----------------Exercice 3-----------------------------





(define (mediane xA yA xB yB xC yC)
  (local [
          (define FOND
             (underlay
              (rectangle 300 300 "solid" "black")
              (rectangle 300 300 "outline" "white")))
          
          (define (moyenne a b)
            (/ (+ a b) 2))

           (define A
             (couple xA yA))

           (define B
             (couple xB yB))

           (define C
             (couple xC yC))

           (define I                          ; milieu du segment AB
             (couple
              (moyenne (proj1 A) (proj1 B))
              (moyenne (proj2 A) (proj2 B))))

           (define J                          ; milieu du segment AC
             (couple
              (moyenne (proj1 A) (proj1 C))
              (moyenne (proj2 A) (proj2 C))))

           (define K                          ; milieu du segment BC
             (couple
              (moyenne (proj1 B) (proj1 C))
              (moyenne (proj2 B) (proj2 C))))


           (define Triangle
             (add-line
              (add-line
               (add-line
                FOND (proj1 A) (proj2 A) (proj1 B) (proj2 B) "yellow")
               (proj1 A) (proj2 A) (proj1 C) (proj2 C) "yellow")
              (proj1 B) (proj2 B) (proj1 C) (proj2 C) "yellow"))



           (define Triangle1
             (add-line
              (add-line
               (add-line
                Triangle (proj1 C) (proj2 C) (proj1 I) (proj2 I) "red")
               (proj1 B) (proj2 B) (proj1 J) (proj2 J) "red")
              (proj1 A) (proj2 A) (proj1 K) (proj2 K) "red"))

           (define Triangle2
             (underlay/xy
              (underlay/xy
               (underlay/xy
                Triangle1
                (+ -4 (proj1 A))
                (proj2 A)
                (text "A" 18 "white"))
               (+ -4 (proj1 B))
               (proj2 B)
               (text "B" 18 "white"))
              (+ -4 (proj1 C))
              (+ -20 (proj2 C))
              (text "C" 18 "white")))

           (define Triangle3
             (underlay/xy
              Triangle2
              (+ -3 (/ (+ (proj1 A) (proj1 B) (proj1 C)) 3))
              (+ -3 (/ (+ (proj2 A) (proj2 B) (proj2 C)) 3))
              (circle 3 "solid" "white")))]
    Triangle3))



 (above
  (beside (mediane 280 110 30 230 60 110) (mediane 114 39 274 101 92 89)) (beside (mediane 80 230 250 230 100 70) (mediane 35 130 185 220 100 70)))














