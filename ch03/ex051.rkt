; Exercise 51.
; Design a big-bang program that simulates a traffic light for a given
; duration. The program renders the state of a traffic light as a solid circle
; of the appropriate color, and it changes state on every clock tick. What is
; the most appropriate initial state? Ask your engineering friends.

#lang racket

(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-tests)

; Physical constants

(define LIGHT-RADIUS 20)

; Graphical constants

(define LIGHT-DIM-ONLY
  (circle LIGHT-RADIUS "outline" "black"))

(define LIGHT-RED-ONLY
  (circle LIGHT-RADIUS "solid" "red"))

(define LIGHT-YELLOW-ONLY
  (circle LIGHT-RADIUS "solid" "yellow"))

(define LIGHT-GREEN-ONLY
  (circle LIGHT-RADIUS "solid" "green"))

(define LIGHT-RED
  (above
    LIGHT-RED-ONLY
    LIGHT-DIM-ONLY
    LIGHT-DIM-ONLY))

(define LIGHT-YELLOW
  (above
    LIGHT-DIM-ONLY
    LIGHT-YELLOW-ONLY
    LIGHT-DIM-ONLY))

(define LIGHT-GREEN
  (above
    LIGHT-DIM-ONLY
    LIGHT-DIM-ONLY
    LIGHT-GREEN-ONLY))

; Functions

; WorldState -> Image
; draw the traffic lights with color c
(define (render c)
  (cond
    [(string=? "red" c) LIGHT-RED]
    [(string=? "yellow" c)  LIGHT-YELLOW]
    [(string=? "green" c)  LIGHT-GREEN]))

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
            [on-tick traffic-light-next 1]
            [to-draw render]))

(test)
