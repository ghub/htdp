; Exercise 43.
; Let’s work through the same problem statement with a time-based data
; definition:

; An AnimationState is a Number.
; interpretation the number of clock ticks since the animation started

; Like the original data definition, this one also equates the states of the
; world with the class of numbers. Its interpretation, however, explains that
; the number means something entirely different.  Design the functions tock and
; render. Then develop a big-bang expression so that once again you get an
; animation of a car traveling from left to right across the world’s canvas.

; How do you think this program relates to animate from Prologue: How to Program?

; Use the data definition to design a program that moves the car according to a
; sine wave. (Don’t try to drive like that.)

#lang racket

(require 2htdp/image)
(require 2htdp/universe)
(require lang/posn)

; Physical constants

; Distance of the world that the automobile may travel
(define WIDTH-OF-WORLD 400)

; Distance from the sky to the ground
(define HEIGHT-OF-WORLD 50)

; The distance from the left edge of the world to the left of the tree
(define X-TREE (* WIDTH-OF-WORLD 0.7))

; The radius of the wheel
(define WHEEL-RADIUS 5)

; The distance between the center of front and back wheels
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

; The distance from the front to the back of the automobile
(define BODY-LENGTH (* WHEEL-RADIUS 10))

; The distance from the top to the bottom of the automobile excluding wheels
(define BODY-HEIGHT (* WHEEL-RADIUS 3))

; Graphical constants

; The image of the world background
(define BACKGROUND
  (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))

; The image of a tree
(define TREE
  (underlay/xy
    (circle 10 "solid" "green")
    9 15
    (rectangle 2 20 "solid" "brown")))

; The image of the world scene
(define SCENE
  (underlay/align/offset
    "left" "bottom"
    BACKGROUND
    X-TREE 0
    TREE))

; The image of a single wheel
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

; The image of the front and back wheels combined
(define BOTH-WHEELS
  (overlay/offset
    WHEEL
    WHEEL-DISTANCE 0
    WHEEL))

; The image of the automobile excluding wheels
(define BODY
  (polygon (list (make-posn 0 BODY-HEIGHT)
                 (make-posn 0 (* BODY-HEIGHT 0.5))
                 (make-posn (* BODY-LENGTH 0.25) (* BODY-HEIGHT 0.5))
                 (make-posn (* BODY-LENGTH 0.25) 0)
                 (make-posn (* BODY-LENGTH 0.75) 0)
                 (make-posn (* BODY-LENGTH 0.75) (* BODY-HEIGHT 0.5))
                 (make-posn BODY-LENGTH (* BODY-HEIGHT 0.5))
                 (make-posn BODY-LENGTH BODY-HEIGHT))
           "solid" "red"))

; The image of the automobile including body and wheels
(define AUTOMOBILE
  (underlay/align/offset
    "middle" "bottom"
    BODY
    0 WHEEL-RADIUS
    BOTH-WHEELS))

; Functions

; WorldState -> Number
; horizontal position of the car at time t
(define (x-automobile t)
  (* 3 t))

; WorldState -> Number
; vertical position of the car at time t
(define (y-automobile t)
  (* 10 (add1 (sin (* t 0.2)))))

; WorldState -> Image
; places the image of the car x pixels from the left margin of the SCENE image
(define (render t)
  (place-image/align
    AUTOMOBILE
    (x-automobile t) (- HEIGHT-OF-WORLD (y-automobile t))
    "left" "bottom"
    SCENE))

; WorldState -> WorldState
; Increase the tick by 1 for every clock tick
(define (tock t)
  (add1 t))

; WorldState -> Boolean
; stops the animation when the car has disappeared on the right side
(define (end? t)
  (> (x-automobile t) WIDTH-OF-WORLD))

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]
            [stop-when end?]))
