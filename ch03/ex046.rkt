; Exercise 46.
; Improve the cat animation with a slightly different image:

; (define cat2 )

; Adjust the rendering function from exercise 45 so that it uses one cat image
; or the other based on whether the x-coordinate is odd. Read up on odd? in the
; HelpDesk, and use a cond expression to select cat images.

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

; image of cat2
(define CAT2 (bitmap/file "../icons/cat2.png"))

; Functions

; WorldState -> Image
; Return cat1 for odd x, or cat2 for even x
(define (cat x)
  (cond
    [(odd? x) CAT1]
    [else CAT2]))

; WorldState -> Image
; places the image of the cat x pixels from the left margin of the BACKGROUND
; image
(define (render x)
  (place-image/align
    (cat x)
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
