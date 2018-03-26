; Exercise 45.
; Design a “virtual cat” world program that continuously moves the cat from
; left to right. Let’s call it cat-prog and let’s assume it consumes the
; starting position of the cat. Furthermore, make the cat move three pixels per
; clock tick. Whenever the cat disappears on the right, it reappears on the
; left. You may wish to read up on the modulo function.

#lang racket

(require 2htdp/image)
(require 2htdp/universe)

; Physical constants

; distance of the world that the cat may travel
(define WIDTH-OF-WORLD 400)

; distance from the sky to the ground
(define HEIGHT-OF-WORLD 200)

; Graphical constants

; The image of the world background
(define BACKGROUND
  (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))

; image of cat1
(define CAT1 (bitmap/file "../icons/cat1.png"))

; Functions

; WorldState -> Image
; places the image of the cat x pixels from the left margin of the BACKGROUND
; image
(define (render x)
  (place-image/align
    CAT1
    x (- HEIGHT-OF-WORLD 10)
    "left" "bottom"
    BACKGROUND))

; WorldState -> WorldState
; moves the cat by 3 pixels for every clock tick
(define (tock ws)
  (modulo (+ ws 3) WIDTH-OF-WORLD))

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]))
