; Exercise 47.
; Design a world program that maintains and displays a “happiness gauge.” Let’s
; call it gauge-prog, and let’s agree that the program consumes the maximum
; level of happiness. The gauge display starts with the maximum score, and with
; each clock tick, happiness decreases by -0.1; it never falls below 0, the
; minimum happiness score. Every time the down arrow key is pressed, happiness
; increases by 1/5; every time the up arrow is pressed, happiness jumps by 1/3.

; To show the level of happiness, we use a scene with a solid, red rectangle
; with a black frame. For a happiness level of 0, the red bar should be gone;
; for the maximum happiness level of 100, the bar should go all the way across
; the scene.

; Note When you know enough, we will explain how to combine the gauge program
; with the solution of exercise 45. Then we will be able to help the cat
; because as long as you ignore it, it becomes less happy. If you pet the cat,
; it becomes happier. If you feed the cat, it becomes much, much happier. So
; you can see why you want to know a lot more about designing world programs
; than these first three chapters can tell you.

#lang racket

(require 2htdp/image)
(require 2htdp/universe)

; Physical constants

; distance of the world that the happiness bar may grow to
(define WIDTH-OF-WORLD 400)

; distance from the sky to the ground
(define HEIGHT-OF-WORLD 200)

; the maximum happiness value
(define HAPPINESS-MAXIMUM 100)

; the minimum happiness value
(define HAPPINESS-MINIMUM 0)

; the increment of happiness value when pet
(define HAPPINESS-INCREMENT-WHEN-PET (/ 1 5))

; the increment of happiness value when feed
(define HAPPINESS-INCREMENT-WHEN-FEED (/ 1 3))

; the decrement of happiness value when tick
(define HAPPINESS-DECREMENT-WHEN-TICK 0.1)

; Graphical constants

; The image of the world background
(define BACKGROUND
  (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))

; the height of the happiness bar in pixels
(define HAPPINESS-BAR-THICKNESS 20)

; Functions

; Number -> Number
; Clamp the number n to the range [min, max]
(define (clamp n mi ma)
  (min (max mi n) ma))

; Number -> Number
; Clamp the happiness h to the range
; [HAPPINESS-MINIMUM, HAPPINESS-MAXIMUM]
(define (clamp-happiness h)
  (clamp h HAPPINESS-MINIMUM HAPPINESS-MAXIMUM))

; WorldState -> Number
; length of the happiness bar
(define (length-happiness-bar h)
  (* WIDTH-OF-WORLD (/ h HAPPINESS-MAXIMUM)))

; WorldState -> Image
; image of the happiness bar
(define (image-happiness-bar h)
  (frame
    (rectangle
      (length-happiness-bar h) HAPPINESS-BAR-THICKNESS
      "solid" "red")))

; WorldState -> Image
; places the image of the happiness bar from the top left margin of the
; BACKGROUND image
(define (render h)
  (place-image/align
    (image-happiness-bar h)
    0 0
    "left" "top"
    BACKGROUND))

; WorldState -> WorldState
; neglect will decrease the happiness
(define (neglect h)
  (clamp-happiness (- h HAPPINESS-DECREMENT-WHEN-TICK)))

; WorldState -> WorldState
; pet to increase the happiness
(define (pet h)
  (clamp-happiness (+ h HAPPINESS-INCREMENT-WHEN-PET)))

; WorldState -> WorldState
; feed to increase the happiness
(define (feed h)
  (clamp-happiness (+ h HAPPINESS-INCREMENT-WHEN-FEED)))

; WorldState -> WorldState
; care to increase the happiness
(define (care h a-key)
  (cond
    [(key=? a-key "up") (feed h)]
    [(key=? a-key "down") (pet h)]
    [else h]))

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
            [on-tick neglect]
            [on-key care]
            [to-draw render]))
