; Exercise 39.
; Good programmers ensure that an image such as CAR can be enlarged or reduced
; via a single change to a constant definition. Good programmers establish a
; single point of control for all aspects of their programs, not just the
; graphical constants. Several chapters deal with this issue. We started the
; development of our car image with a single plain definition:

; (define WHEEL-RADIUS 5)

; The definition of WHEEL-DISTANCE is based on the wheel’s radius. Hence,
; changing WHEEL-RADIUS from 5 to 10 doubles the size of the car image. This
; kind of program organization is dubbed single point of control, and good
; design employs this idea as much as possible.

; Develop your favorite image of an automobile so that WHEEL-RADIUS remains the
; single point of control.

#lang racket

(require 2htdp/image)
(require lang/posn)

; Physical constants

; The radius of the wheel
(define WHEEL-RADIUS 5)

; The distance between the center of front and back wheels
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

; The distance from the front to the back of the automobile
(define BODY-LENGTH (* WHEEL-RADIUS 10))

; The distance from the top to the bottom of the automobile excluding wheels
(define BODY-HEIGHT (* WHEEL-RADIUS 3))

; Graphical constants

; The image of a single wheel
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

; The image of the front and back wheels combined
(define BOTH-WHEELS
  (overlay/offset WHEEL
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
  (underlay/offset BODY
                   0 (* BODY-HEIGHT 0.5)
                   BOTH-WHEELS))

AUTOMOBILE
