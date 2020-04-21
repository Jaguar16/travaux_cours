;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tp3) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;----------------------------TP 3--------------------------------------

;;-----------------------Exo 1&2&3----------------------------------------

(define (SMILEY content?)
  (local [
          (define TETE
            (underlay
             (frame (rectangle 200 200 "solid" "white"))
             (circle 100 "solid" "yellow")
             (circle 100 "outline" "black")))
          
          (define OEIL
            (ellipse 25 35 "solid" "black"))
          
          (define Smiley1
            (underlay/xy
             TETE
             (+ (/ (image-width TETE) 3) (- (/ (image-width OEIL) 2)))       ;; On centre l'oeil dans le 1/3 en x
             (+ (/ (image-height TETE) 3) (- (/ (image-height OEIL) 2)))     ;; et 1/3 en y de notre font; ici TETE
             OEIL))

          (define Smiley2
            (underlay/xy
             Smiley1
             (+ (* (/ (image-width TETE) 3) 2) (- (/ (image-width OEIL) 2))) ;; On centre l'oeil dans le 2/3 en x
             (+ (/ (image-height TETE) 3) (- (/ (image-height OEIL) 2)))     ;; et 1/3 en y de notre font; ici Smiley1 (tête avec l'oeil droit)
             OEIL))

          (define BOUCHE
            (underlay
             (rectangle 65 35 "solid" "yellow")
             (ellipse 60 30 "outline" (pen "black" 5 "solid" "round" "round"))))

          (define Smiley-content
            (underlay/xy
             Smiley2
             (+ (/ (image-width TETE) 2) (- (/ (image-width BOUCHE) 2)))         ;; On centre la bouche dans le 1/2 en x
             (+ (* (/ (image-height TETE) 4) 3) (- (/ (image-height BOUCHE) 2))) ;; On centre la bouche dans le 3/4 en y  sur Smiley2
             (crop 0 (/ (image-height BOUCHE) 2) (image-width BOUCHE) (/ (image-height BOUCHE) 2) BOUCHE)))
          
          (define Smiley-pas-content
            (underlay/xy
             Smiley2
             (+ (/ (image-width TETE) 2) (- (/ (image-width BOUCHE) 2)))         ;; On centre la bouche dans le 1/2 en x
             (+ (* (/ (image-height TETE) 4) 3) (- (/ (image-height BOUCHE) 2))) ;; On centre la bouche dans le 3/4 en y  sur Smiley2
             (crop 0 0 (image-width BOUCHE) (/ (image-height BOUCHE) 2) BOUCHE)))]

    
    (if content? Smiley-content Smiley-pas-content)))







(define (z-medianes zA zB zC)
  (local [
          (define FOND
             (underlay
              (rectangle 300 300 "solid" "black")
              (rectangle 300 300 "outline" "white")))
          
          (define (moyenne a b)
            (/ (+ a b) 2))

           (define A
             (couple (real-part zA) (imag-part zA)))

           (define B
             (couple(real-part zB) (imag-part zB)))

           (define C
             (couple (real-part zC) (imag-part zC)))

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


;(z-medianes 21+65i 7+147i 145+97i)
