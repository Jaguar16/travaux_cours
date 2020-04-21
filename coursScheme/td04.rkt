;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname td4) (read-case-sensitive #t) (teachpacks ((lib "valrose.rkt" "installed-teachpacks"))) (htdp-settings #(#t write mixed-fraction #f #t none #f ((lib "valrose.rkt" "installed-teachpacks")) #f)))
;;--------------------------------------TD 4------------------------------------------

;;-------------------------------------Exo 1------------------------------------------

;; Les coordonnées de M(x,y), sur le cercle de rayon 30, en fonction de son angle polaire t sont:
;; x = 30*cos(t) et y = 30*sin(t) // (* 30 (cos t)) et (* 30 (sin t))


(define (anime-balle)
  (local [(define balle
            (circle 8 "solid" "red"))

          (define scene
            (underlay
             (empty-scene 100 100)
             (circle 30 "outline" "black")))

          (define-struct monde (t dt running?))        ;;Inspiré du coorigé
          (define INIT (make-monde 0 #i0.05 #t))

          (define (suivant m)
            (local [(match-define (monde t dt running?) m)]
              (make-monde (+ t dt) dt running?)))

          (define (dessine m)
            (local [(define t (monde-t m))]
              (place-image balle (+ 50 (* 30 (cos t))) (+ 50 (* 30 (sin t))) scene)))
    
          (define (fin_du_monde m)
            (local [(define t (monde-t m))]
              (>= t (* 6 pi))))
    
          (define (clavier m k)
            (local [(match-define (monde t dt running?) m)]
              (if (key=? k " ")
                  (make-monde t (- dt) running?)
                  m)))]

          (big-bang INIT
            (on-tick suivant)
            (on-draw dessine)
            (on-key clavier)
            (stop-when fin_du_monde)
            (name "Tourne Tourne"))))


;; si on voulait que la trajectoire soit un ellipse au lieu d'un cercle il faut changer les coordonnées du point M
;; ses coordonnées paramétriques deviennent  : x = a*cos(t) avec a : largeur de l'ellipse. (* a (cos t))
;;                                             y = b*sin(t) avec b : hauteur de l'ellipse. (* b (sin t))


;;-------------------------------------Exo 3------------------------------------------

(define cercle-color
  (local [
          (define-struct monde (r g b))
          (define INIT (make-monde 0 255 0))
          (define FOND
            (underlay (circle 20 "solid" (make-color (monde-r INIT) (monde-g INIT) (monde-b INIT)))
                      (rectangle 100 100 'solid 'yellow)))

          (define (clavier m k)
            (local [(match-define (monde r g b) m)]
              (cond ((key=? k "up") (make-monde (+ r 3) g b))
                    ((key=? k "down") (make-monde r (+ 3 g) b))
                    (else m))))

          (define (dessine m)
            (local [(match-define (monde r g b) m)]
              (underlay (circle 20 "solid" (make-color (monde-r m) (monde-g m) (monde-b m)))
                        FOND)))

          ]
    (big-bang INIT
            (on-draw dessine)
            (on-key clavier)
            (name "Couleur cercle"))))





